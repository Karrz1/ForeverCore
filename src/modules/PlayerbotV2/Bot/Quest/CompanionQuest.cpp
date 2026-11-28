// CompanionQuest - see CompanionQuest.h.

#include "Bot/Quest/CompanionQuest.h"
#include "Bot/BotSnapshot.h"
#include "Bot/BotAI.h"
#include "Bot/QuestDoable.h"
#include "Bot/QuestObjectiveLocations.h"
#include "Services.h"
#include "Fleet/OwnerRegistry.h"
#include "Util/ConfigReader.h"
#include "Player.h"
#include "GameObject.h"
#include "Map.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "QuestDef.h"
#include "GameTime.h"
#include "World.h"
#include "Log.h"

#include <array>
#include <cmath>
#include <mutex>
#include <unordered_map>
#include <unordered_set>

namespace Playerbot {
namespace CompanionQuest {

namespace {

// Owner standing this close to a quest giver / ender counts as "at" it.
constexpr float kOwnerAtGiverYd   = 25.0f;
// The bot only walks to a giver / ender / object within this reach of itself.
constexpr float kBotReachYd       = 40.0f;
// Quest objects: near the owner, without a long detour for the bot.
constexpr float kObjectOwnerYd    = 25.0f;
constexpr float kObjectBotYd      = 30.0f;
// Owner within this of a quest object that goes away when used and that he still needs: he is about to click it himself, leave it
// to him.
constexpr float kObjectOwnerAtYd  = 6.0f;
constexpr size_t kMaxPerList      = 6;

struct LatchTable
{
    std::mutex mtx;
    std::unordered_map<uint64, std::array<uint32, 2>> until;   // bot guid low -> until_ms per Latch (0 = off)
};
LatchTable& Latches()
{
    static LatchTable t;
    return t;
}

float Dist2d(float ax, float ay, float bx, float by)
{
    float const dx = ax - bx, dy = ay - by;
    return std::sqrt(dx * dx + dy * dy);
}

// Position of a nearby giver / ender (creature in nearby_friends, GO in nearby_objects).
bool FindGiverPos(BotSnapshot const& snap, ObjectGuid guid, float& x, float& y)
{
    for (auto const& u : snap.combat.nearby_friends)
        if (u.guid == guid) { x = u.x; y = u.y; return true; }
    for (auto const& o : snap.world_objects.nearby_objects)
        if (o.guid == guid) { x = o.x; y = o.y; return true; }
    return false;
}

// "[cq]" line, at most every 15 s per bot: what the companion quest help saw (or why it stopped) for a bot that has quests and a
// quest partner. Without it a companion that never accepts, hands in or clicks leaves no trace of which gate held it.
void Trace(Player const* bot, CompanionQuestState const& cq, char const* why)
{
    static std::mutex mtx;
    static std::unordered_map<uint64, uint32> last;
    uint32 const now = GameTime::GetGameTimeMS();
    {
        std::lock_guard lk(mtx);
        if (last.size() > 4096) last.clear();
        uint32& at = last[bot->GetGUID().GetCounter()];
        if (at != 0 && now - at < 15000u) return;
        at = now;
    }
    TC_LOG_INFO("playerbot.v2", "[cq] {} {}: accept {} turn_in {} share {} objects {}, bot in combat {}", bot->GetName(), why,
        cq.accept.size(), cq.turn_in.size(), cq.share.size(), cq.objects.size(), bot->IsInCombat() ? 1 : 0);
}

bool ListHas(std::vector<CompanionQuestAction> const& v, ObjectGuid giver, uint32 quest_id)
{
    for (auto const& a : v)
        if (a.quest_id == quest_id && a.giver == giver) return true;
    return false;
}

bool ObjectiveOpen(QuestObjectiveEntry const& o)
{
    if (o.amount <= 0 || o.progress >= o.amount) return false;
    return !(o.flags & (QUEST_OBJECTIVE_FLAG_HIDDEN | QUEST_OBJECTIVE_FLAG_OPTIONAL));
}

// Is the bot's open objective served by this game object? GAMEOBJECT objectives name the entry; ITEM
// objectives are served by a chest / node / prop whose loot (or gameobject_questitem row) yields the item.
bool ObjectServesObjective(QuestObjectiveEntry const& o, NearbyObject const& go)
{
    if (!ObjectiveOpen(o)) return false;
    if (o.type == QUEST_OBJECTIVE_GAMEOBJECT)
        return uint32(o.object_id) == go.entry;
    if (o.type == QUEST_OBJECTIVE_ITEM)
        return o.object_id > 0 && QuestItemDropsFromGameObject(uint32(o.object_id), go.entry);
    return false;
}

// The open objective of `q` this object serves, or nullptr. Beside the objectives above: an object that is there for this
// quest (its template names the quest: a goober, a prop, a chest only a holder of the quest can use) serves the quest's first
// open objective of any other kind. Those are the "use the X" objectives that a script or the object's spell credits as a
// kill or an event (a summoned alt stood beside such objects and never used them, row 240).
QuestObjectiveEntry const* ServedObjective(QuestEntry const& q, NearbyObject const& go, GameObjectTemplate const* tmpl)
{
    for (auto const& o : q.objectives)
        if (ObjectServesObjective(o, go))
            return &o;
    if (!tmpl || tmpl->GetQuestID() != q.quest_id)
        return nullptr;
    for (auto const& o : q.objectives)
        if (ObjectiveOpen(o) && o.type != QUEST_OBJECTIVE_GAMEOBJECT && o.type != QUEST_OBJECTIVE_ITEM)
            return &o;
    return nullptr;
}

} // namespace

void ArmLatch(uint64 bot_low, Latch which, uint32 now_ms, uint32 window_ms)
{
    auto& t = Latches();
    std::lock_guard lk(t.mtx);
    t.until[bot_low][size_t(which)] = now_ms + window_ms;
}

bool LatchActive(uint64 bot_low, Latch which, uint32 now_ms)
{
    auto& t = Latches();
    std::lock_guard lk(t.mtx);
    auto it = t.until.find(bot_low);
    if (it == t.until.end()) return false;
    uint32 const until = it->second[size_t(which)];
    return until != 0 && now_ms < until;
}

void ClearLatch(uint64 bot_low, Latch which)
{
    auto& t = Latches();
    std::lock_guard lk(t.mtx);
    auto it = t.until.find(bot_low);
    if (it != t.until.end())
        it->second[size_t(which)] = 0;
}

std::string QuestLabel(uint32 quest_id)
{
    if (Quest const* q = sObjectMgr->GetQuestTemplate(quest_id))
        if (!q->GetLogTitle().empty())
            return q->GetLogTitle();
    return "quest " + std::to_string(quest_id);
}

bool QuestStartedByItemOnly(uint32 quest_id)
{
    static std::unordered_set<uint32> item_only;
    static std::once_flag built;
    std::call_once(built, []
    {
        std::unordered_set<uint32> given;   // quests a creature or game object hands out
        for (auto const& [giver, q] : *sObjectMgr->GetCreatureQuestRelationMapHACK())
            given.insert(q);
        for (auto const& [giver, q] : *sObjectMgr->GetGOQuestRelationMapHACK())
            given.insert(q);
        for (auto const& [entry, tmpl] : sObjectMgr->GetItemTemplateStore())
            if (uint32 const q = tmpl.GetStartQuest())
                if (!given.contains(q))
                    item_only.insert(q);
    });
    return item_only.contains(quest_id);
}

bool BotCanTake(Player* bot, uint32 quest_id)
{
    return bot && bot->SatisfyQuestLog(false) && BotCanStillTakeQuestForHub(bot, quest_id);
}

void BuildState(Player* bot, BotAI* ai, BotSnapshot& snap)
{
    CompanionQuestState& cq = snap.companion_quest;
    cq.reset();
    // The quest partner is the owner, or, for a world bot a player invited (no owner), the player who leads the group: he gets the same
    // accept / turn-in / share / quest-object help (a grouped world bot used to leave a finished quest unrewarded).
    ObjectGuid const partner = snap.owner_in_group ? snap.owner_guid : (snap.led_by_player ? snap.controller_guid : ObjectGuid::Empty);
    if (!bot || partner.IsEmpty())
        return;
    bool const trace = !snap.quest_log.quests.empty() && Services::Owners().OwnerCharacter(bot->GetGUID().GetCounter()) != 0;
    if (!bot->IsAlive())
    {
        if (trace) Trace(bot, cq, "dead");
        return;
    }
    if (bot->InBattleground() || bot->InArena())
        return;
    ConfigReader const& cfg = Services::Config();
    bool const want_accept = cfg.behavior_quest_accept();
    bool const want_share  = cfg.behavior_quest_share();
    bool const want_turnin = cfg.behavior_quest_turn_in();
    bool const want_loot   = cfg.behavior_quest_loot();
    if (!want_accept && !want_share && !want_turnin && !want_loot)
        return;

    Player* owner = ObjectAccessor::FindConnectedPlayer(partner);
    if (!owner || !owner->IsInWorld() || owner->GetMapId() != bot->GetMapId() || owner == bot)
    {
        if (trace) Trace(bot, cq, owner == bot ? "partner is the bot itself" : "partner offline or on another map");
        return;
    }
    cq.owner_here = true;
    cq.owner_x = owner->GetPositionX();
    cq.owner_y = owner->GetPositionY();
    cq.owner_z = owner->GetPositionZ();

    uint32 const now_ms = GameTime::GetGameTimeMS();
    uint64 const bot_low = bot->GetGUID().GetCounter();
    float const bx = bot->GetPositionX(), by = bot->GetPositionY();

    // ---- accept: the owner holds a quest the giver beside us offers --------------------------------------------
    if (want_accept && bot->SatisfyQuestLog(false))
    {
        bool const accept_all = LatchActive(bot_low, Latch::AcceptAll, now_ms);
        auto consider = [&](ObjectGuid giver, float gx, float gy, QuestRelationResult const& rel)
        {
            if (Dist2d(bx, by, gx, gy) > kBotReachYd) return;
            bool const owner_at = Dist2d(cq.owner_x, cq.owner_y, gx, gy) <= kOwnerAtGiverYd;
            if (!owner_at && !accept_all) return;
            for (uint32 qid : rel)
            {
                if (cq.accept.size() >= kMaxPerList) return;
                if (ListHas(cq.accept, giver, qid)) continue;
                if (bot->GetQuestStatus(qid) != QUEST_STATUS_NONE) continue;
                QuestStatus const os = owner->GetQuestStatus(qid);
                // Complete counts: a quest with nothing to do but hand it in (a note found at a camp, quest 79008) is complete
                // the moment the owner takes it, and the companion never followed him into it.
                bool const owner_holds = os == QUEST_STATUS_INCOMPLETE || os == QUEST_STATUS_COMPLETE;
                if (!owner_holds && !accept_all) continue;
                // The player holds the quest: the companion takes it too, whatever other bots elsewhere gave up on.
                if (ai && ai->quest_blacklisted(qid, now_ms, /*fleet_memory*/ !owner_holds)) continue;
                if (!BotCanTake(bot, qid)) continue;
                CompanionQuestAction a;
                a.giver = giver;
                a.quest_id = qid;
                a.via_order = !owner_holds;
                cq.accept.push_back(a);
            }
        };
        for (auto const& u : snap.combat.nearby_friends)
        {
            if (!(u.npc_flags & uint32(UNIT_NPC_FLAG_QUESTGIVER))) continue;
            consider(u.guid, u.x, u.y, sObjectMgr->GetCreatureQuestRelations(u.entry));
        }
        for (auto const& o : snap.world_objects.nearby_objects)
        {
            if (o.go_type != GAMEOBJECT_TYPE_QUESTGIVER) continue;
            consider(o.guid, o.x, o.y, sObjectMgr->GetGOQuestRelations(o.entry));
        }
        // A quest an item starts (a crest from a dungeon boss, a note): no giver to walk to, and the one item went to the owner.
        // On his "accept" the companion takes it from him like a shared quest (row 240: Crest of Lordaeron 95189).
        if (accept_all && Dist2d(bx, by, cq.owner_x, cq.owner_y) <= kBotReachYd)
        {
            for (uint16 slot = 0; slot < MAX_QUEST_LOG_SIZE && cq.accept.size() < kMaxPerList; ++slot)
            {
                uint32 const qid = owner->GetQuestSlotQuestId(slot);
                if (qid == 0 || !QuestStartedByItemOnly(qid)) continue;
                QuestStatus const os = owner->GetQuestStatus(qid);
                if (os != QUEST_STATUS_INCOMPLETE && os != QUEST_STATUS_COMPLETE) continue;
                if (bot->GetQuestStatus(qid) != QUEST_STATUS_NONE) continue;
                if (ListHas(cq.accept, owner->GetGUID(), qid)) continue;
                if (ai && ai->quest_blacklisted(qid, now_ms, /*fleet_memory*/ false)) continue;
                if (!BotCanTake(bot, qid)) continue;
                CompanionQuestAction a;
                a.giver = owner->GetGUID();
                a.quest_id = qid;
                a.via_order = true;
                cq.accept.push_back(a);
            }
        }
    }

    // ---- turn in: the bot's quest is complete and the owner is at the ender ----------------------------------
    if (want_turnin)
    {
        bool const turn_all = LatchActive(bot_low, Latch::TurnInAll, now_ms);
        for (auto const& tin : snap.quest_discovery.quest_turnins)
        {
            if (cq.turn_in.size() >= kMaxPerList) break;
            float gx = 0.f, gy = 0.f;
            if (!FindGiverPos(snap, tin.giver, gx, gy)) continue;
            if (Dist2d(bx, by, gx, gy) > kBotReachYd) continue;
            bool const owner_at = Dist2d(cq.owner_x, cq.owner_y, gx, gy) <= kOwnerAtGiverYd;
            if (!owner_at && !turn_all) continue;
            if (ListHas(cq.turn_in, tin.giver, tin.quest_id)) continue;
            CompanionQuestAction a;
            a.giver = tin.giver;
            a.quest_id = tin.quest_id;
            a.via_order = !owner_at;
            cq.turn_in.push_back(a);
        }
    }

    // ---- copy the leader: he handed a quest in that the bot still holds open (a collect quest: grouped bots never loot) ---------------
    if (want_turnin)
    {
        for (auto const& q : snap.quest_log.quests)
        {
            if (cq.turn_in.size() >= kMaxPerList) break;
            if (bot->GetQuestStatus(q.quest_id) != QUEST_STATUS_INCOMPLETE || !owner->GetQuestRewardStatus(q.quest_id))
                continue;
            for (auto const& u : snap.combat.nearby_friends)
            {
                if (!(u.npc_flags & uint32(UNIT_NPC_FLAG_QUESTGIVER))) continue;
                if (Dist2d(bx, by, u.x, u.y) > kBotReachYd || Dist2d(cq.owner_x, cq.owner_y, u.x, u.y) > kOwnerAtGiverYd) continue;
                QuestRelationResult const rel = sObjectMgr->GetCreatureQuestInvolvedRelations(u.entry);
                if (std::find(rel.begin(), rel.end(), q.quest_id) == rel.end() || ListHas(cq.turn_in, u.guid, q.quest_id)) continue;
                CompanionQuestAction a;
                a.giver = u.guid;
                a.quest_id = q.quest_id;
                a.copy_leader = true;
                cq.turn_in.push_back(a);
                break;
            }
            // An ender that is a game object (a quest board, a chest of orders) is the same.
            bool queued = false;
            for (auto const& t : cq.turn_in)
                if (t.quest_id == q.quest_id) { queued = true; break; }
            if (queued) continue;
            for (auto const& o : snap.world_objects.nearby_objects)
            {
                if (o.go_type != GAMEOBJECT_TYPE_QUESTGIVER) continue;
                if (Dist2d(bx, by, o.x, o.y) > kBotReachYd || Dist2d(cq.owner_x, cq.owner_y, o.x, o.y) > kOwnerAtGiverYd) continue;
                QuestRelationResult const rel = sObjectMgr->GetGOQuestInvolvedRelations(o.entry);
                if (std::find(rel.begin(), rel.end(), q.quest_id) == rel.end() || ListHas(cq.turn_in, o.guid, q.quest_id)) continue;
                CompanionQuestAction a;
                a.giver = o.guid;
                a.quest_id = q.quest_id;
                a.copy_leader = true;
                cq.turn_in.push_back(a);
                break;
            }
        }
    }

    // ---- share: our open quests the owner could take --------------------------------------------------------
    if (want_share && !bot->GetMap()->IsDungeon() && owner->IsAlive() &&
        Dist2d(bx, by, cq.owner_x, cq.owner_y) <= 60.0f && owner->SatisfyQuestLog(false))
    {
        for (auto const& q : snap.quest_log.quests)
        {
            if (cq.share.size() >= 3) break;
            if (q.state == 1) continue;                                     // complete: nothing left to do together
            if (q.flags & (0x01 | 0x08 | 0x10)) continue;                    // repeatable / dungeon / raid
            if (q.unachievable || q.unturnable) continue;
            Quest const* tmpl = sObjectMgr->GetQuestTemplate(q.quest_id);
            if (!tmpl) continue;
            if (!bot->CanShareQuest(q.quest_id)) continue;
            if (owner->GetQuestStatus(q.quest_id) != QUEST_STATUS_NONE) continue;   // has it, did it, or is on it
            if (!owner->CanTakeQuest(tmpl, false)) continue;
            // Not a quest that is grey for the owner (a level 60 owner offered a level 20 quest by a leveling bot, WSG test
            // 2026-10-08): the same limit the "!" over a quest giver uses (Quests.LowLevelHideDiff).
            if (int32(owner->GetLevel()) > owner->GetQuestLevel(tmpl) + int32(sWorld->getIntConfig(CONFIG_QUEST_LOW_LEVEL_HIDE_DIFF))) continue;
            cq.share.push_back(q.quest_id);
        }
    }

    // ---- objects: quest chests / props / nodes our open objectives need, near the owner --------------------
    if (want_loot && !snap.quest_log.quests.empty() && !bot->IsMounted())
    {
        for (auto const& go : snap.world_objects.nearby_objects)
        {
            if (cq.objects.size() >= kMaxPerList) break;
            if (go.go_type != GAMEOBJECT_TYPE_CHEST && go.go_type != GAMEOBJECT_TYPE_GOOBER &&
                go.go_type != GAMEOBJECT_TYPE_GATHERING_NODE && go.go_type != GAMEOBJECT_TYPE_GENERIC &&
                go.go_type != GAMEOBJECT_TYPE_BUTTON)
                continue;
            if (Dist2d(bx, by, go.x, go.y) > kObjectBotYd) continue;
            float const od = Dist2d(cq.owner_x, cq.owner_y, go.x, go.y);
            if (od > kObjectOwnerYd) continue;
            GameObjectTemplate const* tmpl = sObjectMgr->GetGameObjectTemplate(go.entry);
            for (auto const& q : snap.quest_log.quests)
            {
                if (q.state == 1) continue;
                QuestObjectiveEntry const* served = ServedObjective(q, go, tmpl);
                if (!served) continue;
                // The owner is standing at an object that goes away when used and still needs it for the same objective: he
                // clicks it first; the bot takes it once he steps away or has his credit. An object every holder of the quest
                // can use (most quest props and goobers) is used at once: an owner who clicked it and then waited beside it for
                // his summoned alt held the alt back for good (row 240).
                if (od <= kObjectOwnerAtYd && tmpl && tmpl->IsDespawnAtAction() &&
                    owner->GetQuestStatus(q.quest_id) == QUEST_STATUS_INCOMPLETE &&
                    !owner->IsQuestObjectiveComplete(q.quest_id, served->id))
                    continue;
                CompanionQuestObject co;
                co.go = go.guid;
                co.entry = go.entry;
                co.quest_id = q.quest_id;
                cq.objects.push_back(co);
                break;
            }
        }
    }
    if (trace)
        Trace(bot, cq, owner->IsInCombat() ? "built, partner in combat" : "built");
}

} // namespace CompanionQuest
} // namespace Playerbot
