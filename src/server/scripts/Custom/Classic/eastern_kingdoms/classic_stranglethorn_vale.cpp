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

// Classic 1.60 port of VMaNGOS src/scripts/eastern_kingdoms/stranglethorn_vale/stranglethorn_vale.cpp (ScriptDev2 lineage, GPL-2)
// Quest support: 592 (Saving Yenniku), 349 (Stranglethorn Fever), Transpolyporter (Goblin Transponder)
// Not ported here (not requested): mob_assistant_kryll (disabled in VMaNGOS), npc_pats_hellfire_guy.

#include "ScriptMgr.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "Log.h"
#include "Player.h"
#include "QuestDef.h"
#include "Random.h"
#include "ScriptedCreature.h"
#include "SpellInfo.h"
#include "TemporarySummon.h"
#include "ThreatManager.h"

/*######
## mob_yenniku
######*/

enum YennikuData
{
    QUEST_SAVING_YENNIKU    = 592,
    SPELL_YENNIKUS_RELEASE  = 3607,
    CLASSIC_FACTION_HORDE_GENERIC   = 83,
    CLASSIC_FACTION_TROLL_BLOODSCALP = 28
};

// Yenniku's Release (3607, the Soul Gem) stuns him and makes him friendly to the Horde for 60 s, so Filling the Soul Gem (593)
// can be handed in to him. The port cleared only the timer in Reset(), not the released state, so the evade that follows the
// CombatStop (UpdateVictim with no victim) reset him and the next update ended the release at once: faction 28 again and
// attacking within a second. The release now ends only on its own timer; an evade while released only drops combat, and he
// is passive while released so nothing pulls him back in. The scripts.classic lines are for the dev check of this fix.
struct classic_mob_yenniku : public ScriptedAI
{
    classic_mob_yenniku(Creature* creature) : ScriptedAI(creature), _releaseTimer(0), _released(false) { }

    void Reset() override
    {
        TC_LOG_INFO("scripts.classic", "Yenniku {}: Reset (released {}, {} ms left)", me->GetGUID().ToString(), _released, _releaseTimer);
        if (_released)
            return;                                         // a reset does not end the release, only its timer does

        me->SetEmoteState(EMOTE_STATE_NONE);
    }

    void EnterEvadeMode(EvadeReason why) override
    {
        TC_LOG_INFO("scripts.classic", "Yenniku {}: evade (reason {}, released {})", me->GetGUID().ToString(), uint32(why), _released);
        if (_released)
        {
            // stunned in place and friendly: nothing to walk back to, only leave combat
            me->CombatStop(true);
            me->GetThreatManager().ClearAllThreat();
            return;
        }

        ScriptedAI::EnterEvadeMode(why);
    }

    void SpellHit(WorldObject* caster, SpellInfo const* spellInfo) override
    {
        if (spellInfo->Id != SPELL_YENNIKUS_RELEASE)
            return;

        Player* player = caster ? caster->ToPlayer() : nullptr;
        TC_LOG_INFO("scripts.classic", "Yenniku {}: hit by Yenniku's Release from {} (quest 592 status {}, released {})", me->GetGUID().ToString(),
            player ? player->GetName() : std::string("no player"), player ? uint32(player->GetQuestStatus(QUEST_SAVING_YENNIKU)) : 0u, _released);
        if (!player || _released || player->GetQuestStatus(QUEST_SAVING_YENNIKU) != QUEST_STATUS_INCOMPLETE)
            return;

        _released = true;
        _releaseTimer = 60000;

        me->SetReactState(REACT_PASSIVE);
        me->CombatStop(true);
        me->GetThreatManager().ClearAllThreat();
        me->StopMoving();
        me->SetEmoteState(EMOTE_STATE_STUN);
        me->SetFaction(CLASSIC_FACTION_HORDE_GENERIC);      // horde generic: 593 can be handed in to him
        TC_LOG_INFO("scripts.classic", "Yenniku {}: released for 60 s (faction {})", me->GetGUID().ToString(), me->GetFaction());
    }

    void JustEngagedWith(Unit* /*who*/) override { }

    void UpdateAI(uint32 diff) override
    {
        if (_released)
        {
            if (_releaseTimer > diff)
            {
                _releaseTimer -= diff;
                return;
            }

            _released = false;
            _releaseTimer = 0;
            me->SetFaction(CLASSIC_FACTION_TROLL_BLOODSCALP);  // troll, bloodscalp
            me->SetReactState(REACT_AGGRESSIVE);
            TC_LOG_INFO("scripts.classic", "Yenniku {}: release over (faction {})", me->GetGUID().ToString(), me->GetFaction());
            EnterEvadeMode(EvadeReason::Other);
            return;
        }

        UpdateVictim();
    }

private:
    uint32 _releaseTimer;
    bool _released;
};

/*######
## go_transpolyporter
######*/

enum TranspolyporterData
{
    ITEM_GOBLIN_TRANSPONDER = 9173
};

// TODO(classic): in VMaNGOS this AI overrides GameObjectAI::OnUse(Unit*), which the VMaNGOS core never calls, so the
// script has no effect there. Ported with its evident intent through TC's OnGossipHello (called from GameObject::Use):
// only players carrying a Goblin Transponder can use the Transpolyporter. Remove the check if that is not wanted.
struct classic_go_transpolyporter : public GameObjectAI
{
    classic_go_transpolyporter(GameObject* go) : GameObjectAI(go) { }

    bool OnGossipHello(Player* player) override
    {
        if (player->HasItemCount(ITEM_GOBLIN_TRANSPONDER, 1, false))
            return false;   // continue with the normal use

        return true;        // block the use
    }
};

/*
 * Witch Doctor Unbagwa
 */

enum WitchDoctorUnbagwaData
{
    NPC_ENRAGED_SILVERBACK_GORILLA  = 1511,
    NPC_KONDA                       = 1516,
    NPC_MOKK_THE_SAVAGE             = 1514,

    QUEST_STRANHLETHORN_FEVER       = 349,

    FACTION_ESCORT_N_NEUTRAL_PASSIVE = 113,

    MAX_WAVE_COUNT                  = 3
};

float const ApesSummon[4] =
{
    -13773.6231f, -3.8856f, 41.5641f, 5.7f
};

struct classic_npc_witch_doctor_unbagwa : public ScriptedAI
{
    classic_npc_witch_doctor_unbagwa(Creature* creature) : ScriptedAI(creature), m_uiWaveCount(1), m_uiAttackersCount(0),
        m_uiMobWaveTimer(10000), m_bStartEvent(false), m_bResetEvent(false) { }

    uint8 m_uiWaveCount;
    uint8 m_uiAttackersCount;
    uint32 m_uiMobWaveTimer;
    bool m_bStartEvent;
    bool m_bResetEvent;

    void Reset() override { }

    void ResetCreature()
    {
        m_bStartEvent = false;
        m_bResetEvent = false;
        m_uiWaveCount = 1;
        m_uiAttackersCount = 0;
        m_uiMobWaveTimer = 10000;
        me->SetNpcFlag(UNIT_NPC_FLAG_QUESTGIVER);
        me->RestoreFaction();   // VMaNGOS ClearTemporaryFaction()
    }

    // VMaNGOS constructor / JustRespawned -> ResetCreature()
    void JustAppeared() override
    {
        ScriptedAI::JustAppeared();
        ResetCreature();
    }

    void SummonedCreatureDespawn(Creature* creature) override
    {
        if (!m_bStartEvent || !creature->IsAlive())
            return;

        m_bResetEvent = true;

        if (m_uiAttackersCount > 0)
            --m_uiAttackersCount;

        if (!m_uiAttackersCount)
            ResetCreature();
    }

    void SummonedCreatureDies(Creature* /*creature*/, Unit* /*killer*/) override
    {
        if (!m_bStartEvent)
            return;

        if (m_uiAttackersCount > 0)
            --m_uiAttackersCount;

        if (!m_uiAttackersCount && (m_bResetEvent || m_uiWaveCount > MAX_WAVE_COUNT))
            ResetCreature();
    }

    void JustSummoned(Creature* summoned) override
    {
        if (!m_bStartEvent)
            return;

        AddThreat(summoned, 5.0f);
        if (summoned->AI())
            summoned->AI()->AttackStart(me);
    }

    void StartEvent()
    {
        me->RemoveNpcFlag(UNIT_NPC_FLAG_QUESTGIVER);
        me->SetFaction(FACTION_ESCORT_N_NEUTRAL_PASSIVE); // VMaNGOS SetFactionTemporary(..., TEMPFACTION_NONE)
        m_bStartEvent = true;
        m_bResetEvent = false;
    }

    void UpdateAI(uint32 diff) override
    {
        if (m_bStartEvent)
        {
            if (!m_uiAttackersCount)
            {
                if (m_uiMobWaveTimer < diff)
                {
                    switch (m_uiWaveCount)
                    {
                        case 1: m_uiAttackersCount = 3; break;
                        case 2: m_uiAttackersCount = 5; break;
                        case 3: m_uiAttackersCount = 6; break;
                    }

                    uint32 attackersEntry = NPC_ENRAGED_SILVERBACK_GORILLA;
                    uint8 const attackersCount = m_uiAttackersCount;
                    for (uint8 i = 0; i < attackersCount; ++i)
                    {
                        if (m_uiWaveCount > 1 && i == attackersCount - 1)
                        {
                            switch (m_uiWaveCount)
                            {
                                case 2: attackersEntry = NPC_KONDA; break;
                                case 3: attackersEntry = NPC_MOKK_THE_SAVAGE; break;
                            }
                        }
                        me->SummonCreature(attackersEntry,
                            ApesSummon[0] + frand(-3, 3),
                            ApesSummon[1] + frand(-3, 3),
                            ApesSummon[2],
                            ApesSummon[3],
                            TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 3min);
                    }

                    m_uiMobWaveTimer = 10000;
                    ++m_uiWaveCount;
                }
                else
                    m_uiMobWaveTimer -= diff;
            }
        }

        UpdateVictim();
    }

    void OnQuestReward(Player* /*player*/, Quest const* quest, LootItemType /*type*/, uint32 /*opt*/) override
    {
        if (quest->GetQuestId() == QUEST_STRANHLETHORN_FEVER)
            StartEvent();
    }
};

void AddSC_classic_stranglethorn_vale()
{
    RegisterCreatureAI(classic_mob_yenniku);
    RegisterGameObjectAI(classic_go_transpolyporter);
    RegisterCreatureAI(classic_npc_witch_doctor_unbagwa);
}
