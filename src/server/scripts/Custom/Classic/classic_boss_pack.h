/*
 * Classic raid boss packs: a boss that resets alive (wipe, evade) brings back the adds the raid killed during the failed
 * attempt. Instance.PersistRaidTrash otherwise keeps every killed spawn dead until the lockout resets, and
 * creature_formations is empty in this DB, so nothing links an add to its boss. Packs are plain spawns, found by entry
 * within 80 y of the boss's home position.
 */
#ifndef CLASSIC_BOSS_PACK_H
#define CLASSIC_BOSS_PACK_H

#include "Creature.h"
#include "Map.h"
#include "classic_respawn.h"
#include <vector>

inline void ClassicRespawnBossPack(Map* map, uint32 bossEntry, std::vector<uint32> const& adds)
{
    if (!map || adds.empty())
        return;

    Creature* boss = nullptr;
    for (auto const& pair : map->GetCreatureBySpawnIdStore())
        if (pair.second->GetEntry() == bossEntry && pair.second->IsAlive())
        {
            boss = pair.second;
            break;
        }
    if (!boss)
        return;
    Position const home = boss->GetHomePosition();
    ClassicRespawnDeadSpawns(map, adds, &home, 80.0f);
}

#endif
