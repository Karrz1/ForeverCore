// One-button rotation for every class but the warlock: gathers the facts for LazyKey::Pick (Combat/LazyKey.h) from the live Player and
// casts the answer through the bot API (highest known rank, range / facing / stun / silence gates). World thread only (the command and
// add-on handlers run there).
//
// A spell the server refuses (no mana, no proc, wrong stance or weapon) is taken out of the choice for a few seconds and the press picks
// again, so a missing proc or resource never holds the rotation back. A cast that costs no global cooldown (Heroic Strike, Maul, trinket-like
// cooldowns, Auto Shot) is followed by the next pick in the same press. Melee classes start their swing and the pet joins the fight.

#include "LazyKey.h"

#include "Api/ClassicSpec.h"
#include "Bot/ClassTables.h"
#include "Combat/LazyKey.h"
#include "Creature.h"
#include "DB2Stores.h"
#include "GameTime.h"
#include "Group.h"
#include "Item.h"
#include "ItemTemplate.h"
#include "Log.h"
#include "Map.h"
#include "Pet.h"
#include "PlayerbotAPI.h"
#include "Player.h"
#include "SharedDefines.h"
#include "Spell.h"
#include "SpellAuraDefines.h"
#include "SpellInfo.h"
#include "SpellMgr.h"
#include "World.h"

#include <unordered_map>

namespace Playerbot {

namespace {

constexpr float  kSpellRange  = 30.0f;
constexpr float  kShotRange   = 35.0f;   // Auto Shot / Hunter shots
constexpr float  kHealRange   = 40.0f;
constexpr float  kCloseRange  = 8.0f;    // an enemy this near is on the player
constexpr uint32 kBlockMs     = 3000;    // how long a refused spell stays out of the choice
constexpr int    kMaxPicks    = 6;

int32 Pct(int64 value, int64 max) { return max > 0 ? int32(value * 100 / max) : 100; }

// Power in the units the client shows (TC keeps rage x10): the rules compare against "15 rage".
int32 DisplayPower(Player const* p, Powers power)
{
    int32 raw = p->GetPower(power);
    if (PowerTypeEntry const* pt = sDB2Manager.GetPowerTypeEntry(power))
        if (pt->DisplayModifier > 1)
            raw /= pt->DisplayModifier;
    return raw;
}

// Per player: spell id -> game time (ms) until which the spell is left out.
std::unordered_map<uint64, std::unordered_map<uint32, uint32>> s_blocked;

char const* SpellText(uint32 id)
{
    SpellInfo const* info = sSpellMgr->GetSpellInfo(id, DIFFICULTY_NONE);
    char const* name = info && info->SpellName ? (*info->SpellName)[sWorld->GetDefaultDbcLocale()] : nullptr;
    return name && *name ? name : "spell";
}

LazyKey::Form FormOf(Player const* p)
{
    using LazyKey::Form;
    switch (p->GetShapeshiftForm())
    {
        case FORM_BEAR_FORM:
        case FORM_DIRE_BEAR_FORM:     return Form::Bear;
        case FORM_CAT_FORM:           return Form::Cat;
        case FORM_MOONKIN_FORM:       return Form::Moonkin;
        case FORM_BATTLE_STANCE:      return Form::Battle;
        case FORM_DEFENSIVE_STANCE:   return Form::Defensive;
        case FORM_BERSERKER_STANCE:   return Form::Berserker;
        case FORM_SHADOWFORM:         return Form::Shadow;
        case FORM_STEALTH:            return Form::Stealth;
        default:                      return Form::None;
    }
}

LazyKey::Role RoleOf(Player const* p, std::string const& arg, uint32 spec)
{
    using LazyKey::Role;
    if (arg == "tank")
        return Role::Tank;
    if (arg == "heal" || arg == "healer")
        return Role::Heal;
    if (arg == "dps" || arg == "damage")
        return Role::Dps;
    uint8 const cls = p->GetClass();
    if (IsTankSpec(cls, uint16(spec)))
        return Role::Tank;
    if (IsHealerSpec(cls, uint16(spec)))
        return Role::Heal;
    return Role::Dps;
}

bool HasWand(Player const* p)
{
    Item const* ranged = p->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_RANGED);
    ItemTemplate const* tmpl = ranged ? ranged->GetTemplate() : nullptr;
    return tmpl && tmpl->GetClass() == ITEM_CLASS_WEAPON && tmpl->GetSubClass() == ITEM_SUBCLASS_WEAPON_WAND;
}

bool MainHandImbued(Player const* p)
{
    Item const* mh = p->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
    return mh && mh->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT) != 0;
}

} // namespace

std::string LazyKeyPress(Player* p, std::string const& roleArg)
{
    if (!p || !p->IsAlive() || !p->GetMap())
        return {};
    uint8 const cls = p->GetClass();
    std::vector<uint32> const& spells = LazyKey::Spells(cls);
    if (spells.empty())
        return "Lazy key: there is no rotation for your class.";

    API api(p);

    Unit* target = p->GetSelectedUnit();
    bool const valid_target = target && target->IsAlive() && p->IsValidAttackTarget(target);

    uint32 const spec = ::Playerbot::Classic::EffectiveSpecId(p);
    LazyKey::Input in;
    in.cls  = cls;
    in.role = RoleOf(p, roleArg, spec);
    in.form = FormOf(p);
    in.tree = LazyKey::TreeOfSpec(cls, spec);

    // The heal target: the most hurt friendly player in reach, the player included.
    Player const* healee = nullptr;
    int32 lowest = 101;
    auto consider = [&](Player const* m)
    {
        if (!m || !m->IsAlive() || m->GetMap() != p->GetMap())
            return;
        if (m != p && (p->GetDistance(m) > kHealRange || !p->IsWithinLOSInMap(m) || !p->IsValidAssistTarget(m)))
            return;
        int32 const pct = Pct(m->GetHealth(), m->GetMaxHealth());
        if (pct < 75)
            ++in.hurt_count;
        if (pct < lowest)
        {
            lowest = pct;
            healee = m;
        }
    };
    consider(p);
    if (Group const* g = p->GetGroup())
        for (GroupReference const& ref : g->GetMembers())
            if (Player const* m = ref.GetSource(); m && m != p)
                consider(m);

    for (uint32 id : spells)
    {
        uint32 const rank = api.highest_known_rank(id);
        if (p->HasSpell(rank))
            in.known.push_back(id);
        if (api.cast_ready_in_ms(id) == 0)
            in.ready.push_back(id);
        if (p->HasAura(rank))
            in.on_self.push_back(id);
        if (valid_target && target->HasAura(rank, p->GetGUID()))
            in.on_target.push_back(id);
        if (healee && healee->HasAura(rank, p->GetGUID()))
            in.on_healee.push_back(id);
    }
    if (p->HasAura(LazyKey::Id::WeakenedSoul))
        in.on_self.push_back(LazyKey::Id::WeakenedSoul);
    if (healee && healee->HasAura(LazyKey::Id::WeakenedSoul))
        in.on_healee.push_back(LazyKey::Id::WeakenedSoul);

    in.has_healee     = healee != nullptr;
    in.healee_is_self = healee == p;
    in.healee_hp_pct  = healee ? lowest : 100;

    in.casting        = p->IsNonMeleeSpellCast(false, false, true);
    in.in_combat      = p->IsInCombat();
    in.has_target     = valid_target;
    in.stealthed      = p->HasStealthAura();
    in.auto_shooting  = p->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL) != nullptr;
    in.wand           = HasWand(p);
    in.has_pet        = p->GetPet() && p->GetPet()->IsAlive();
    in.weapon_imbued  = MainHandImbued(p);
    in.level          = int32(p->GetLevel());
    in.hp_pct         = Pct(p->GetHealth(), p->GetMaxHealth());
    in.mana_pct       = Pct(p->GetPower(POWER_MANA), p->GetMaxPower(POWER_MANA));
    in.rage           = DisplayPower(p, POWER_RAGE);
    in.energy         = DisplayPower(p, POWER_ENERGY);
    in.combo          = p->GetPower(POWER_COMBO_POINTS);

    if (valid_target)
    {
        Creature const* c = target->ToCreature();
        float const dist = p->GetDistance(target);
        in.target_in_melee        = p->IsWithinMeleeRange(target);
        in.target_in_range        = dist <= (cls == CLASS_HUNTER ? kShotRange : kSpellRange);
        in.target_behind          = target->isInBackInMap(p, kCloseRange);
        in.target_casting         = target->IsNonMeleeSpellCast(false, false, true);
        in.target_boss            = (c && (c->IsDungeonBoss() || c->isWorldBoss())) || target->GetMaxHealth() >= 100000;
        in.target_player          = target->IsPlayer();
        in.target_on_me           = target->GetVictim() == p;
        in.target_attacking       = target->GetVictim() != nullptr;
        in.target_undead_or_demon = (target->GetCreatureTypeMask() & CREATURE_TYPEMASK_DEMON_OR_UNDEAD) != 0;
        in.target_hp_pct          = Pct(target->GetHealth(), target->GetMaxHealth());
        for (Unit const* attacker : p->getAttackers())
            if (attacker->IsAlive() && p->GetDistance(attacker) <= kCloseRange)
                ++in.attackers_close;

        // Melee swing and the pet join the fight; neither costs a global cooldown.
        if (LazyKey::WantsAutoAttack(in) && in.target_in_melee && p->GetVictim() != target)
            api.start_attack(target->GetGUID());
        Pet* pet = p->GetPet();
        if (pet && pet->IsAlive() && p->IsInCombat() && pet->GetVictim() != target)
            api.pet_attack(target->GetGUID());
    }
    else
    {
        for (Unit const* attacker : p->getAttackers())
            if (attacker->IsAlive() && p->GetDistance(attacker) <= kCloseRange)
                ++in.attackers_close;
    }

    uint32 const now = GameTime::GetGameTimeMS();
    std::unordered_map<uint32, uint32>& blocked_until = s_blocked[p->GetGUID().GetCounter()];

    std::string refused;
    for (int attempt = 0; attempt < kMaxPicks; ++attempt)
    {
        in.blocked.clear();
        for (auto const& [id, until] : blocked_until)
            if (until > now)
                in.blocked.push_back(id);

        LazyKey::Choice const pick = LazyKey::Pick(in);
        if (pick.cancel_form)
        {
            // A druid healing out of a form: leave it (no global cooldown) and pick the heal.
            p->RemoveAurasByType(SPELL_AURA_MOD_SHAPESHIFT);
            in.form = LazyKey::Form::None;
            continue;
        }
        if (!pick.spell)
        {
            TC_LOG_DEBUG("playerbot.v2", "[lazykey] {}: nothing ({}) hp={} mana={} rage={} energy={} combo={} target_hp={}", p->GetName(), pick.why,
                         in.hp_pct, in.mana_pct, in.rage, in.energy, in.combo, in.target_hp_pct);
            return refused;
        }

        ObjectGuid cast_at;
        switch (pick.at)
        {
            case LazyKey::At::Target:
                cast_at = valid_target ? target->GetGUID() : ObjectGuid::Empty;
                break;
            case LazyKey::At::Healee:
                cast_at = healee ? healee->GetGUID() : p->GetGUID();
                break;
            case LazyKey::At::Self:
            {
                // A spell that needs a unit (a heal, a shield) goes on the player; the rest (stances, auras, area spells) takes none.
                SpellInfo const* info = sSpellMgr->GetSpellInfo(pick.spell, DIFFICULTY_NONE);
                cast_at = info && info->NeedsExplicitUnitTarget() ? p->GetGUID() : ObjectGuid::Empty;
                break;
            }
        }
        Result const r = api.cast_spell(pick.spell, cast_at);
        TC_LOG_INFO("playerbot.v2", "[lazykey] {}: {} ({}) -> {} role={} tree={} hp={} mana={} rage={} energy={} combo={} target_hp={} healee_hp={}",
                    p->GetName(), SpellText(api.highest_known_rank(pick.spell)), pick.why, uint32(r), uint32(in.role), in.tree, in.hp_pct,
                    in.mana_pct, in.rage, in.energy, in.combo, in.target_hp_pct, in.healee_hp_pct);
        if (r == Result::Ok && LazyKey::OffGlobalCooldown(pick.spell))
        {
            // No global cooldown spent: the same press goes on to the next spell.
            in.ready.erase(std::remove(in.ready.begin(), in.ready.end(), pick.spell), in.ready.end());
            continue;
        }
        switch (r)
        {
            case Result::Ok:
            case Result::NotReady:
            case Result::Locked:
            case Result::OutOfRange:
                return refused;
            default:
                // Refused (no mana, no proc, wrong stance or weapon...): leave it out for a few seconds and pick the next step.
                blocked_until[pick.spell] = now + kBlockMs;
                if (r == Result::NotEnoughResource && cls != CLASS_WARRIOR && cls != CLASS_ROGUE
                    && in.form != LazyKey::Form::Bear && in.form != LazyKey::Form::Cat)
                    refused = "Lazy key: out of mana or reagents for " + std::string(SpellText(api.highest_known_rank(pick.spell))) + ", skipping it.";
                break;
        }
    }
    return refused;
}

} // namespace Playerbot
