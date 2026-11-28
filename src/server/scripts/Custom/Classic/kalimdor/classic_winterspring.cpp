/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// Classic 1.60 port of VMaNGOS src/scripts/kalimdor/winterspring/winterspring.cpp (ScriptDev2 / Nostalrius lineage, GPL-2)
// Ported: npc_artorius (Artorius the Amiable -> Artorius the Doombringer, Stave of the Ancients)
// Also here: Mount Hyjal (reached from Winterspring), the Lonely Lantern event that calls Ta'shkal (WoW Forever).

#include "ScriptMgr.h"
#include "GameTime.h"
#include "MotionMaster.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "SpellInfo.h"
#include "TemporarySummon.h"
#include "ThreatManager.h"
#include "World.h"
#include "classic_script_text.h"
#include <list>

namespace
{
// VMaNGOS World.h: dynamic respawn scaling ("DRSS") reference population
// TODO(classic): value taken from VMaNGOS World.h (not in the VMaNGOS files available here) - verify.
constexpr uint32 BLIZZLIKE_REALM_POPULATION = 2500;
}

/*######
## npc_artorius (the Amiable / the Doombringer)
######*/

enum Artorius
{
    SPELL_DEMONIC_FRENZY            = 23257,
    SPELL_DEMONIC_DOOM              = 23298,
    SPELL_STINGING_TRAUMA           = 23299,
    SPELL_SERPENT_STING_RANK_8      = 13555,
    SPELL_SERPENT_STING_RANK_9      = 25295,

    EMOTE_POISON                    = 9786,

    NPC_ARTORIUS_THE_AMIABLE        = 14531,
    NPC_ARTORIUS_THE_DOOMBRINGER    = 14535,
    NPC_THE_CLEANER                 = 14503
};

Position const ArtoriusHomePos = { 7909.71f, -4598.67f, 710.008f, 0.606013f };

struct classic_npc_artorius : public ScriptedAI
{
    classic_npc_artorius(Creature* creature) : ScriptedAI(creature)
    {
        _transform = false;
        _despawnTimer = 0;
        _transformTimer = 10000;
        _transformEmoteTimer = 5000;
        _demonicDoomTimer = 7500;
        _demonicFrenzyTimer = 5000;
    }

    void Reset() override
    {
        switch (me->GetEntry())
        {
            case NPC_ARTORIUS_THE_AMIABLE:
                me->SetRespawnDelay(35 * MINUTE);
                me->SetRespawnTime(35 * MINUTE);
                me->SetHomePosition(ArtoriusHomePos);
                if (me->GetDistance(ArtoriusHomePos) > 1.0f)   // VMaNGOS always teleports; skip when already there (initial spawn)
                    me->NearTeleportTo(ArtoriusHomePos);
                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != WAYPOINT_MOTION_TYPE)
                {
                    me->SetDefaultMovementType(WAYPOINT_MOTION_TYPE);
                    me->GetMotionMaster()->Initialize();
                }

                me->ReplaceAllNpcFlags(UNIT_NPC_FLAG_GOSSIP);

                _transformTimer      = 10000;
                _transformEmoteTimer = 5000;
                _transform           = false;
                _despawnTimer        = 0;
                break;
            case NPC_ARTORIUS_THE_DOOMBRINGER:
                if (!_despawnTimer)
                    _despawnTimer = 20 * MINUTE * IN_MILLISECONDS;

                _hunterGuid.Clear();
                _demonicDoomTimer   = 7500;
                _demonicFrenzyTimer = urand(5000, 8000);
                break;
        }
    }

    /** Artorius the Amiable */
    void Transform()
    {
        me->UpdateEntry(NPC_ARTORIUS_THE_DOOMBRINGER);
        me->SetHomePosition(me->GetPosition());
        me->SetDefaultMovementType(IDLE_MOTION_TYPE);
        me->GetMotionMaster()->Initialize();
        Reset();
    }

    void BeginEvent(ObjectGuid playerGuid)
    {
        _hunterGuid = playerGuid;
        me->GetMotionMaster()->Clear();
        me->GetMotionMaster()->MoveIdle();
        me->ReplaceAllNpcFlags(UNIT_NPC_FLAG_NONE);
        _transform = true;
    }

    // VMaNGOS starts the event with a DB gossip script (SCRIPT_COMMAND_SEND_SCRIPT_EVENT -> OnScriptEventHappened).
    // TODO(classic): TC has no script-event command; the event is started from the gossip option instead
    // (any option of Artorius' menu), or by SetGUID(playerGuid, 0) from another script.
    bool OnGossipSelect(Player* player, uint32 /*menuId*/, uint32 /*gossipListId*/) override
    {
        if (me->GetEntry() != NPC_ARTORIUS_THE_AMIABLE || _transform)
            return false;

        CloseGossipMenuFor(player);
        BeginEvent(player->GetGUID());
        return true;
    }

    void SetGUID(ObjectGuid const& guid, int32 /*id*/) override
    {
        if (guid.IsPlayer() && me->GetEntry() == NPC_ARTORIUS_THE_AMIABLE && !_transform)
            BeginEvent(guid);
    }

    /** Artorius the Doombringer */
    void JustEngagedWith(Unit* who) override
    {
        if (who->GetClass() == CLASS_HUNTER && (_hunterGuid.IsEmpty() || _hunterGuid == who->GetGUID()))
            _hunterGuid = who->GetGUID();
        else
            DemonDespawn();
    }

    void JustDied(Unit* /*killer*/) override
    {
        me->SetHomePosition(ArtoriusHomePos);

        // DRSS
        uint32 respawnDelay = 3 * HOUR;
        uint32 sessions = sWorld->GetActiveSessionCount();
        if (sessions > BLIZZLIKE_REALM_POPULATION)
            respawnDelay = uint32(respawnDelay * (float(BLIZZLIKE_REALM_POPULATION) / float(sessions)));

        me->SetRespawnDelay(respawnDelay);
        me->SetRespawnTime(respawnDelay);
        me->SaveRespawnTime();
    }

    void DemonDespawn(bool triggered = true)
    {
        me->SetHomePosition(ArtoriusHomePos);
        me->SetRespawnDelay(15 * MINUTE);
        me->SetRespawnTime(15 * MINUTE);
        me->SaveRespawnTime();

        if (triggered)
        {
            if (Creature* cleaner = me->SummonCreature(NPC_THE_CLEANER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, Milliseconds(20 * MINUTE * IN_MILLISECONDS)))
            {
                std::list<Unit*> targets;
                for (ThreatReference const* ref : me->GetThreatManager().GetUnsortedThreatList())
                    if (Unit* target = ref->GetVictim())
                        targets.push_back(target);

                for (Unit* target : targets)
                {
                    if (target->IsAlive())
                    {
                        cleaner->EngageWithTarget(target);
                        cleaner->AI()->AttackStart(target);
                    }
                }
            }
        }

        me->DespawnOrUnsummon(0s, Seconds(15 * MINUTE));
    }

    void SpellHit(WorldObject* /*caster*/, SpellInfo const* spellInfo) override
    {
        if (spellInfo->Id == SPELL_SERPENT_STING_RANK_8 || spellInfo->Id == SPELL_SERPENT_STING_RANK_9)
        {
            if (DoCastSelf(SPELL_STINGING_TRAUMA, true) == SPELL_CAST_OK)
                ClassicScriptText(EMOTE_POISON, me);
        }
    }

    void UpdateAI(uint32 diff) override
    {
        /** Artorius the Amiable */
        if (_transform)
        {
            if (_transformEmoteTimer)
            {
                if (_transformEmoteTimer <= diff)
                {
                    me->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
                    _transformEmoteTimer = 0;
                }
                else
                    _transformEmoteTimer -= diff;
            }

            if (_transformTimer < diff)
            {
                _transform = false;
                Transform();
            }
            else
                _transformTimer -= diff;
        }

        /** Artorius the Doombringer */
        if (_despawnTimer)
        {
            if (_despawnTimer <= diff)
            {
                if (me->IsAlive() && !me->IsInCombat())
                {
                    DemonDespawn(false);
                    return;
                }
            }
            else
                _despawnTimer -= diff;
        }

        if (!UpdateVictim())
            return;

        if (me->GetThreatManager().GetThreatListSize() > 1)
        {
            DemonDespawn();
            return;
        }

        if (_demonicFrenzyTimer < diff)
        {
            if (DoCastSelf(SPELL_DEMONIC_FRENZY) == SPELL_CAST_OK)
                _demonicFrenzyTimer = urand(15000, 20000);
        }
        else
            _demonicFrenzyTimer -= diff;

        if (_demonicDoomTimer < diff)
        {
            _demonicDoomTimer = 7500;
            // only attempt to cast this once every 7.5 seconds to give the hunter some leeway
            // LOWER max range for lag...
            if (me->IsWithinDistInMap(me->GetVictim(), 25.0f))
                DoCastVictim(SPELL_DEMONIC_DOOM);
        }
        else
            _demonicDoomTimer -= diff;
    }

private:
    uint32 _transformTimer;
    uint32 _transformEmoteTimer;
    bool _transform;

    ObjectGuid _hunterGuid;
    uint32 _demonicDoomTimer;
    uint32 _demonicFrenzyTimer;
    uint32 _despawnTimer;
};

/*######
## Mount Hyjal: the Lonely Lantern (660408) in Malorne's Retreat
######*/

// A hunter with a Corrupted Cat Figurine (276909, from the fel pools of the Felblood Scar) uses the Lonely Lantern: the player
// casts 1301234 (3 s, the figurine is its reagent), whose only effect sends event 104925. The client leaves the event to the
// server: it calls Ta'shkal <Escaped Experiment> (268231), the tameable 1.0 s cat, beside the lantern. One Ta'shkal at a time,
// and after a call the lantern rests for a while (live has a cooldown of unknown length; a figurine used during it is lost there too).
enum LonelyLantern
{
    EVENT_LONELY_LANTERN_TASHKAL    = 104925,
    NPC_TASHKAL                     = 268231
};

Position const TashkalCallPosition = { 4793.2f, -1849.1f, 1280.53f, 0.0f };     // ground beside the lantern, read on dev

constexpr Seconds TashkalCallCooldown = 5min;
constexpr Minutes TashkalStaysOutOfCombat = 5min;

class classic_event_lonely_lantern_tashkal : public EventScript
{
public:
    classic_event_lonely_lantern_tashkal() : EventScript("classic_event_lonely_lantern_tashkal") { }

    // object = the event's target (the casting player, the spell targets its caster), invoker = the caster
    void OnTrigger(WorldObject* object, WorldObject* invoker, uint32 /*eventId*/) override
    {
        Player* player = Object::ToPlayer(invoker);
        if (!player)
            player = Object::ToPlayer(object);
        if (!player)
            return;

        time_t const now = GameTime::GetGameTime();
        if (now < _nextCall)
            return;

        // still one about (not yet killed, tamed or gone)
        if (player->FindNearestCreature(NPC_TASHKAL, 200.0f, true))
            return;

        if (player->SummonCreature(NPC_TASHKAL, TashkalCallPosition, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, TashkalStaysOutOfCombat))
            _nextCall = now + TashkalCallCooldown.count();
    }

private:
    time_t _nextCall = 0;
};

void AddSC_classic_winterspring()
{
    RegisterCreatureAI(classic_npc_artorius);
    new classic_event_lonely_lantern_tashkal();
}
