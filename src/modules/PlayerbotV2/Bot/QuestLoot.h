// A quest drop this bot is allowed to take. A bot a player leads loots nothing else: the player takes the rest, but each member with the
// quest has to loot its own quest items.
#pragma once

#include "Diagnostics/ScenarioHuman.h"
#include "Group.h"
#include "Loot.h"
#include "Player.h"

namespace Playerbot
{

// A quest drop there is one of for the whole group (not ITEM_FLAG_MULTI_DROP: the first member to loot it takes it from the others) that
// a player of the group may loot from this corpse and still needs. It is his: the bot leaves it, as a member who also has the quest leaves
// a group's single quest drop to the player (Discord 2026-11-22, Guard: "my bots grab quest items before me, I don't even get to loot").
// A drop each member gets for himself (multi-drop), a player who has enough, or one who is not on this corpse's looter list (personal
// loot, out of range at the kill) does not hold it.
[[nodiscard]] inline bool QuestLootIsAPlayers(Player const* bot, Loot const* loot, LootItem const& it)
{
    if (it.freeforall || !loot)
        return false;
    Group const* g = bot->GetGroup();
    if (!g)
        return false;
    for (GroupReference const& ref : g->GetMembers())
    {
        Player const* m = ref.GetSource();
        if (!m || m == bot || !Scenario::PlaysAsHuman(m) || !m->IsInWorld())
            continue;
        if (it.HasAllowedLooter(m->GetGUID()) && m->HasQuestForItem(it.itemid))
            return true;
    }
    return false;
}

// The first quest drop on this loot that would be the bot's but is left for a player (QuestLootIsAPlayers), 0 when none.
[[nodiscard]] inline uint32 QuestLootLeftForPlayer(Player const* p, Loot const* loot)
{
    if (!loot)
        return 0;
    for (LootItem const& it : loot->items)
        if (it.needs_quest && !it.is_looted && !it.is_blocked && it.HasAllowedLooter(p->GetGUID()) && QuestLootIsAPlayers(p, loot, it))
            return it.itemid;
    return 0;
}

[[nodiscard]] inline bool IsPendingQuestLoot(Player* p, Loot* loot, uint8 slot)
{
    NotNormalLootItem* ffa = nullptr;
    LootItem* it = loot->LootItemInSlot(slot, p, &ffa);
    return it && it->needs_quest && !it->is_looted && !it->is_blocked && !(ffa && ffa->is_looted) && it->HasAllowedLooter(p->GetGUID()) &&
           !QuestLootIsAPlayers(p, loot, *it);
}

} // namespace Playerbot
