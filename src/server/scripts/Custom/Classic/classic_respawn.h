/*
 * Classic script respawns by spawn, not by object.
 *
 * VMaNGOS keeps a dead creature on its map until it respawns, so its scripts reset an event by looking the dead creature up
 * (stored guid, grid search) and calling Respawn() on it. TC (dynamic spawns) removes a dead creature from the map once its
 * corpse decays (elite 300 s, looted sooner) and keeps only a respawn entry; the lookup then finds nothing and the creature
 * stayed dead. These helpers respawn the spawns themselves: a corpse still on the map and a spawn already waiting as a
 * respawn entry both come back.
 */
#ifndef CLASSIC_RESPAWN_H
#define CLASSIC_RESPAWN_H

#include "Creature.h"
#include "CreatureData.h"
#include "IteratorPair.h"
#include "Map.h"
#include "ObjectMgr.h"
#include "SpawnData.h"
#include <algorithm>
#include <vector>

// Respawns one spawn unless it has a living creature: a corpse still on the map comes back (Creature::Respawn removes the corpse
// first), a spawn whose corpse already left the map comes back from its respawn entry. Returns false when it was alive or
// has neither a corpse nor a respawn entry on this map.
inline bool ClassicRespawnSpawnIfDead(Map* map, ObjectGuid::LowType spawnId)
{
    if (!map || !spawnId)
        return false;

    Creature* corpse = nullptr;
    for (auto const& pair : Trinity::Containers::MapEqualRange(map->GetCreatureBySpawnIdStore(), spawnId))
    {
        if (pair.second->IsAlive())
            return false;
        if (!pair.second->IsDestroyedObject())
            corpse = pair.second;
    }

    if (corpse)
        corpse->Respawn();
    else if (map->GetCreatureRespawnTime(spawnId))
        map->Respawn(SPAWN_TYPE_CREATURE, spawnId);
    else
        return false;
    return true;
}

// Respawns every dead spawn of one of `entries`. With `center`, only spawns whose spawn point lies within `radius` (2D) of it.
// Living creatures are left alone; summons are not spawns and are skipped. Returns how many spawns were brought back.
inline uint32 ClassicRespawnDeadSpawns(Map* map, std::vector<uint32> const& entries, Position const* center = nullptr, float radius = 0.0f)
{
    if (!map || entries.empty())
        return 0;

    auto const wanted = [&](uint32 entry, Position const& spawnPoint)
    {
        if (std::find(entries.begin(), entries.end(), entry) == entries.end())
            return false;
        return !center || spawnPoint.GetExactDist2d(*center) <= radius;
    };

    std::vector<ObjectGuid::LowType> due;

    // corpses still on the map
    for (auto const& pair : map->GetCreatureBySpawnIdStore())
    {
        Creature const* c = pair.second;
        if (c->IsAlive() || c->IsSummon())
            continue;
        if (CreatureData const* data = c->GetCreatureData())
            if (wanted(c->GetEntry(), Position(data->spawnPoint)))
                due.push_back(pair.first);
    }

    // spawns whose corpse already left the map wait as respawn entries
    std::vector<RespawnInfo const*> pending;
    map->GetRespawnInfo(pending, SPAWN_TYPEMASK_CREATURE);
    for (RespawnInfo const* ri : pending)
        if (CreatureData const* data = sObjectMgr->GetCreatureData(ri->spawnId))
            if (wanted(ri->entry, Position(data->spawnPoint)))
                due.push_back(ri->spawnId);

    std::sort(due.begin(), due.end());
    due.erase(std::unique(due.begin(), due.end()), due.end());

    uint32 count = 0;
    for (ObjectGuid::LowType spawnId : due)
        if (ClassicRespawnSpawnIfDead(map, spawnId))
            ++count;
    return count;
}

inline uint32 ClassicRespawnDeadSpawns(Map* map, uint32 entry, Position const* center = nullptr, float radius = 0.0f)
{
    return ClassicRespawnDeadSpawns(map, std::vector<uint32>{ entry }, center, radius);
}

#endif
