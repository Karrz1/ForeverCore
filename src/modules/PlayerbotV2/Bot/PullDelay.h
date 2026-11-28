// PullDelay - the damage dealers' short wait after their tank's pull (PlayerbotV2.Threat.PartyPullDelayMs).
//
// VempirE, Discord 2026-11-22: "dps bots wait a few seconds after the tank pulls". In a group led by a player, with a tank bot
// in it and outside the raid rules, a damage dealer starts its first attack of a fight only once the wait has run, whatever
// threat the tank has built (at low level one hit is the whole opening lead, and the DPS opened with it).
//
// The wait sits in BotIntentEmitter::start_attack, the one call every engage path goes through: the dev run of af76 had the
// rogue open 0.1 s after the tank by a path that never asked the combat state's threat hold. State_InCombat asks it as well,
// so a bot already swinging stops, and its group-fight pick does not start the attack it would stop on the next tick.
//
// One wait per fight and bot, not per mob: the clock starts at the bot's first held start and restarts when the bot has not
// been held for kPullDelayGapMs. Never held: a mob on this bot, on another member or on a member's pet (self-defence), a mob
// of someone outside the group, the leader's Attack or /focus on that mob, tanks and healers.

#pragma once

#include "BotAI.h"
#include "BotSnapshot.h"
#include "BotSnapshotView.h"
#include "../Services.h"
#include "Util/ConfigReader.h"
#include "Log.h"
#include <mutex>
#include <unordered_map>

namespace Playerbot {

constexpr uint32 kPullDelayGapMs = 8000;

inline bool PartyPullDelayHolds(BotAI const& ai, BotSnapshotView const& s, ObjectGuid target)
{
    uint32 const delay = Services::Config().threat_party_pull_delay_ms();
    if (!delay || target.IsEmpty() || !target.IsCreatureOrVehicle()) return false;
    if (!s.is_led_by_player() || s.raid_rules() || s.in_battleground()) return false;
    ObjectGuid const tank = s.group_tank();
    if (tank.IsEmpty() || tank == s.guid()) return false;
    Role const role = ai.effective_role(s);
    if (role == Role::Tank || role == Role::Healer) return false;
    if (NearbyUnit const* u = s.hostile_unit(target))
    {
        if (u->hp <= 0) return false;
        switch (ThreatVictim(u->victim_kind))
        {
            case ThreatVictim::Me:
            case ThreatVictim::Member:
            case ThreatVictim::MemberPet:
            case ThreatVictim::Other:
                return false;
            default:
                break;
        }
    }
    uint32 const now = s.published_at_ms();
    if (ai.focus_target() == target ||
        (ai.is_manual_mode(now) && ai.owner_command() == BotAI::OwnerCommand::Engage && ai.owner_target() == target))
        return false;

    struct Clock { uint32 first_ms; uint32 last_ms; };
    static std::mutex mu;
    static std::unordered_map<uint64, Clock> clocks;
    uint64 const key = s.guid().GetCounter();
    std::lock_guard<std::mutex> lock(mu);
    if (clocks.size() > 2048)
        for (auto it = clocks.begin(); it != clocks.end();)
            it = (now - it->second.last_ms > 60'000u) ? clocks.erase(it) : std::next(it);
    auto [it, inserted] = clocks.try_emplace(key, Clock{ now, now });
    if (!inserted)
    {
        if (now - it->second.last_ms > kPullDelayGapMs)
        {
            it->second.first_ms = now;
            inserted = true;
        }
        it->second.last_ms = now;
    }
    bool const holds = now - it->second.first_ms < delay;
    if (inserted)
        TC_LOG_INFO("playerbot.v2", "[pull_delay] {} waits {} ms after the tank's pull before attacking {}", s.name(), delay,
            target.ToString());
    return holds;
}

} // namespace Playerbot
