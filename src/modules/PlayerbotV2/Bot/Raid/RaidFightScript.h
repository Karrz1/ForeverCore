// RaidFightScript - a boss script that owns the DPS side of one fight.
//
// Not a second rule engine: the raid rule tables, the tank assignment (PveGroupCoordinator::PlanRaidTanks) and the healing stay
// exactly as they are. A fight script only decides two things for the DPS bots of its boss, and switches off the rules that would
// decide them a second time:
//   1. WHICH enemy every DPS bot attacks: the kill order, one enemy at a time, the same one for everybody.
//   2. WHEN the DPS start: a fixed wait after the fight begins, then no threat holds at all.
// The owner's skull (else cross) always wins over the script's pick.
// Pure functions only (no world access), so tests/game/ClassicRaidFightScript.cpp covers them.

#pragma once

#include "../ThreatLimits.h"

#include <cstddef>
#include <cstdint>

namespace Playerbot::Raid::Script {

constexpr size_t kKillOrderMax = 8;

struct Fight
{
    uint32_t map;
    uint32_t boss;                 // creature entry that names the fight
    uint32_t killOrder[kKillOrderMax];   // creature entries, first dies first, 0 ends the list
    uint32_t startWaitMs;          // DPS wait this long from the first engaged enemy, then attack
    char const* name;              // log only
    bool skullOnly = false;        // the owner's skull is the only enemy the DPS hit; no skull, no damage (the kill order is not used)
    uint8_t sameRank = 0;          // the first <sameRank> entries of the kill order share the first rank (adds of one wave, any colour)
    bool heldFirst = false;        // inside a rank, an enemy a tank holds comes before a loose one
    uint32_t preferEntry = 0;      // inside a rank (after heldFirst), this entry comes before the others
    bool schoolAware = false;      // a DPS bot that cannot hurt an enemy (every school it deals resisted or immune) does not count it
    uint32_t freeAura = 0;         // a DPS bot carrying this aura is left to the generic rules (Delusions of Jin'do: only it sees the Shades)
    float campX = 0.f, campY = 0.f; // campReach > 0: the raid fights from one camp (Nefarian); an enemy counts for a DPS bot only within campReach
    float campReach = 0.f;         // of it and in the bot's line of sight, while any enemy of the fight is (else every enemy counts again)
    float meleeFirstReach = 0.f;   // > 0: the first rank counts for a melee DPS bot only within this many yards of it (Kel'Thuzad's Soldiers)
    bool campHold = false;         // campReach > 0: a DPS bot with only a first-rank enemy, out of its sight and spell reach, holds at its post
    bool heldOnly = false;         // the kill order after its first rank counts only while a tank holds it (the boss excepted)
    uint8_t firstRankSquad = 0;    // > 0: only this many ranged DPS bots (the first by guid) take the first rank; the rest skip it
    uint32_t meleeOff = 0;         // a creature entry no melee DPS bot attacks (off limits for it, the generic rules included)
    uint32_t untanked = 0;         // heldOnly: this entry counts though no tank holds it (nobody tanks it)
    float meleeCampReach = 0.f;    // campReach > 0: an enemy farther than this from the camp is off limits for a melee DPS bot (Kel'Thuzad)
    uint8_t squadPerEnemy = 0;     // firstRankSquad: > 0, the squad splits over the first rank, this many bots on each enemy (Kel'Thuzad)
    bool meleeHeldOnly = false;    // a later-rank enemy no tank holds is off limits for a melee DPS bot, its own rules too (Kel'Thuzad)
};

// Lucifron (MC 409): the two Flamewaker Protectors first, then Lucifron. The start wait is the raid's one boss opening wait (Playerbot::kRaidBossOpenWaitMs, 8 s: the main tank takes a while to run in); there is no threat cap after
// that (a bot that pulls a Protector is taunted back by the loose-mob rule).
// Majordomo Executus (MC 409): the owner's skull is the only thing the DPS hit (skullOnly). The owner sheeps with his icons, so nothing else is
// attacked, marked or not; with no skull the DPS stand. He is never the focus (he cannot be killed, he yields when the eight are dead).
// Golemagg (MC 409): Golemagg only. The Core Ragers are not on the list: they stay off every DPS bot's target (Priority -1) and the off tank keeps them.
// Sulfuron Harbinger (MC 409): the four Flamewaker Priests one at a time, then Sulfuron. The priests are immune to every crowd control, so the script
// dropping CC on its own enemies changes nothing here.
// Shazzrah (MC 409): one boss. After his Gate he stands on a non-tank for a moment; the DPS stay on him and the retaunt rule gives him back.
// Baron Geddon (MC 409): one boss, no adds. The script's worth here is the one start wait in place of the threat hold (four DPS were held for 20 s).
// Garr (MC 409): Garr only. The Firesworn are not on the list, so the warlocks' Banish jobs on them stay, and the Spare rule (RaidEncounters.h)
// keeps them alive until he falls; once he is dead the generic rules finish them.
// Nefarian (BWL 469): phase 1 is Lord Victor Nefarius (10162, immune behind his barrier, never the focus) sending two drakonids every 6-7 s
// and a Chromatic pair every 35 s (classic_boss_victor_nefarius.cpp); Nefarian lands when 40 are dead. Every colour is one rank: the DPS
// all hit one drakonid a tank holds, the most hurt first, and stay on it until it dies, then Nefarian. bwl_nefarian 2026-11-08 (three
// sweeps): each DPS bot picked its own drakonid and a fresh threat hold on each new one (raid:threat_hold / raid:switch_target every
// second), 2,200-3,100 raid damage a second against the ~6,100 health a second the waves bring (15.3k a drakonid, 24.4k a Chromatic);
// the tanks ended up holding 5-9 each and died at 100-120 s, before 30 of the 40 were dead.
// The focus is one of the drakonids on the tanks' arc round the camp (campReach) that the bot can see. bwl_nefarian 1109w/1109z (six wipes):
// the focus was often a drakonid still at its door, 35-46 y from the camp or behind the rise in the middle of the room, so the casters
// stepped in or round for sight ("[raid_range] steps in", "[raid_los]"), their camp post walked them back ("move(role position)", 900-2,000
// a pull) and they cast little: 450-1,170 casts a pull failed on line of sight, 100 damage a second a DPS bot (Hakkar's raid: 400-500).
// Among the held ones a Black Drakonid (14265) goes first: Brood Power: Black 22560 is 1,250 fire to everyone within 15 yards of it every
// 4-6 s (100%: VMaNGOS smart_scripts), the others 20 s at 70%. bwl_nefarian 1108e (with the focus): 11 of 15 deaths were Black Brood Power on
// the melee and hunters in one pile, within 3 s, and the first tank died to Black melee. A DPS bot that cannot hurt the focus (every
// school it deals is resisted: a warlock on a Black, 400 fire and shadow) takes its own pick instead (RaidFightScript.cpp).
// Zul'Gurub (309, 20 raiders). The same two decisions as Molten Core: one start wait in place of the threat holds, and one enemy for every DPS
// bot. zg_venoxis 2026-10-20 (build 124, the last ZG run with a raid log): at t=9-21 s ten of the twelve DPS bots had no target ("no target
// 10, on the focus 2") while the tanks held Venoxis and the cobras; 1,200-1,400 raid damage a second for the whole pull. The rule rows of
// RaidEncounterData_ZG.cpp (spread, dispels, kicks, kill-together) stay as they are; kicks and dispels are cast orders and run before the
// script's target.
// Jeklik: the Bloodseeker Bats (11368, six at 40 s and every 65 s) and in her second half the Frenzied Bats (14965) die first, any of them
//   (one rank), then Jeklik. Great Heal 23954 is kicked by the kick election as before.
// Venoxis: a Parasitic Serpent (14884, on a random raider every 10 s in snake form) first, then the four Razzashi Cobras, then Venoxis.
// Mar'li: the Spawns of Mar'li (15041) grow while they live (Enlarge 24109): first, then Mar'li.
// Bloodlord Mandokir: the Vilebranch Speaker (11391, his death starts the fight), Ohgan (14988), then Mandokir (see RaidEncounterData_ZG.cpp
//   for why Ohgan goes early). Threatening Gaze (hold_rotation) still stops the watched bot: that check runs before the script's target.
// Jin'do: the Powerful Healing Ward (14987) and the Brain Wash Totem (15112) first (one rank), then Jin'do. A bot carrying Delusions of
//   Jin'do (24306) is left to the generic rules: only it sees the Shades of Jin'do (14986) and only it can kill them.
// Arlokk: Arlokk while she can be hit; while she is vanished (out of the fight) the Zulian Prowlers (15101).
// Gahz'ranka, Hakkar: one boss (Hakkar's Sons of Hakkar have their own rules, RaidEncounterData_ZG.cpp).
// Edge of Madness: Hazza'rah's Nightmare Illusions (15163, 457 hp) before him; Gri'lek, Renataki and Wushoolay are one boss each.
// Not scripted: Thekal (the three must fall within 10 s of each other: the killTogether rule spreads the damage, one focus would break it).
// Fankriss the Unyielding (AQ40 531): a Spawn of Fankriss (15630) first, then the Vekniss Hatchlings (15962, one rank), then Fankriss. A
// Spawn enrages 10 s after it engages (classic_boss_fankriss.cpp, Enrage 26662) and then hits for 9-28k. aq40_fankriss af52 sweep (1120):
// with no script the Priority rows only steered a DPS bot with no target, so the bots already on Fankriss or a Hatchling stayed there
// ("on the focus 0", 13-21 of 24 on one other enemy); the Spawns lived 12-25 s, each at 93-95% 6-8 s in, and from 215 s the enraged
// ones killed 39 of the 40. Fankriss himself has no enrage: his tank keeps him while the adds die.
// Kel'Thuzad (Naxxramas 533): phase 1 is Kel'Thuzad immune on his dais sending adds from the seven alcoves at random raiders
// (classic_boss_kelthuzad.cpp): a Soldier of the Frozen Wastes (16427, 2,000 health) every 3.75 s down to 2 s, which blows up on arrival
// (Dark Blast 28457, 1,750 to the whole room), Unstoppable Abominations (16428, 90,000, Mortal Wound on the tank) and Soul Weavers
// (16429, 70,000, Wail of Souls in front of them). The raid fights from one camp in the middle of the room (RaidEncounterData_NAXX.cpp),
// the tanks hold the Abominations and Weavers on an arc round it. The order: a Soldier that has come in to the camp first (one dies to a
// single volley), then an Abomination a tank holds, then a Weaver, then Kel'Thuzad himself (phases 2 and 3; the Guardians of Icecrown are
// shackled and not on the list). No start wait: the first Soldier is on its way at the pull. A melee DPS bot leaves a Soldier further than
// 8 y from it to the ranged (meleeFirstReach): sent at a random raider it can be anywhere in the camp, and the melee walked from the tanks
// to it and back. naxx_kelthuzad kt67a / kt67b (1124), no script: each DPS bot took its own pick by the generic rows, the raid stood spread
// over the whole room between the alcove keep-outs and the Weavers' cones (768-792 of 1,028-1,132 forced moves a run were that ping-pong),
// and 16 and 25 raiders died to Wail of Souls.
// campReach is 36 y, the whole floor inside the alcove keep-outs: a bot at the camp (7 y round it) then takes a Soldier as soon as it is in
// its 30 y spell reach. At 28 y (kt69a, 1124) a Soldier counted only 2-3 s before it reached the tanks' arc and blew up there: 20 of the 42
// dead were Dark Blast.
// campHold: a DPS bot with no enemy in its 30 y sight and spell reach waits at its post. Without it every enemy counted again, the pick was a
// Soldier just sent from an alcove 35-42 y off, and the ranged walked out after it (kt69b, 1124: "[hunter_chase] ... dist 40-42", a
// "role position" walk back every 1-2 s, 364 "leave hazard" at the keep-out rims); the raid drifted north, and 23 raiders 3-30 y from a
// Soul Weaver at 3702,-5079 (31 y from the camp) died to its Wail of Souls in 8 s.
// firstRankSquad: eight ranged DPS bots shoot the Soldiers, the others stay on the held Abomination. kt69i (1124), every DPS bot on the
// squadPerEnemy: the squad splits two to a Soldier, nearest the camp first. The whole squad on one Soldier (2,000 health) put most of its
// casts into one already dead: kt73a (1125), 7-13 bots on the top target in the samples from 218 s, loose mobs 14 -> 24 in 40 s, and
// Soldiers reaching the camp together killed 8 with Dark Blast at 258-261 s, 27 of the 43 dead in all.
// first rank: 45 of the 63 focus changes went to a Soldier, 232 of 290 script attacks were on one (each dies to the first hits and
// a new one comes every 2-3.75 s, so the casters spent the pull starting casts on the next), the focus was an Abomination 4 times,
// raid damage was 1,528/s, and the Abominations killed all four tanks with Mortal Wound.
// meleeOff: no melee DPS bot attacks a Soul Weaver (it has no melee of its own; the ranged and its tank kill it), and the encounter keeps them
// 8 y from one (RaidEncounterData_NAXX.cpp). A Weaver whose victim is out of its melee reach turns to the nearest raider in it
// (classic_soul_weaver_ai), so the melee beside it took it from its tank: kt69p (1124), a Weaver was on a tank in 4 of 94 [raid_fight]
// samples and on a raider in 73, most often a warrior or rogue (Mcwarra, Mcwarrb, Mcwarrc, Mcrogued, Mcreta), and 29 died to Wail of Souls.
// AzerothCore-style variant (script17ac): the Weavers are not tanked (RaidEncounterData_NAXX.cpp). The order is Soldier, Weaver, Abomination,
// Kel'Thuzad: the eight squad bots take the Soldiers, the other ranged the Weaver nearest the camp's 36 y, the melee (meleeOff) the held
// Abomination; untanked lets a Weaver count under heldOnly.
// heldOnly: an Abomination or Weaver counts only while a tank holds it. A Soul Weaver turns on whoever is nearest in its melee reach when its
// victim is not (classic_soul_weaver_ai), so DPS bots that ran out to a loose one at the alcove rim could hold it there, facing the camp
// (kt69c, 1124: 28 dead to Wail of Souls from a Weaver at 3697-3701,-5079, 31 y from the camp; the camp reach of 36 y counts it).
// meleeHeldOnly: heldOnly steers the script's focus only; a melee DPS bot's own rules still went for a loose Abomination walking in, met it
// 13-23 y from the camp (the row's tanks fetch one only within 22 y of it, and 15 y of themselves), took it off the raider it was sent at
// and died to its Mortal Wound: naxx_kelthuzad kt80a-c (1125), 11 of the 21 deaths to an Abomination before 200 s were melee DPS bots on
// a fresh one (97-100%) sent at another raider, no tank on it.
inline constexpr Fight kFights[] = {
    { 409, 12118, { 12119, 12118, 0, 0 }, kRaidBossOpenWaitMs, "Lucifron" },
    { 409, 12057, { 12057, 0, 0, 0 }, kRaidBossOpenWaitMs, "Garr" },
    { 409, 12056, { 12056, 0, 0, 0 }, kRaidBossOpenWaitMs, "Baron Geddon" },
    { 409, 12264, { 12264, 0, 0, 0 }, kRaidBossOpenWaitMs, "Shazzrah" },
    { 409, 12098, { 11662, 12098, 0, 0 }, kRaidBossOpenWaitMs, "Sulfuron Harbinger" },
    { 409, 11988, { 11988, 0, 0, 0 }, kRaidBossOpenWaitMs, "Golemagg" },
    { 409, 12018, { 11663, 11664, 0, 0 }, kRaidBossOpenWaitMs, "Majordomo Executus", true },
    { 469, 10162, { 14261, 14262, 14263, 14264, 14265, 14302, 11583, 0 }, kRaidBossOpenWaitMs, "Nefarian", false, 6, true, 14265, true, 0,
      -7552.0f, -1236.0f, 28.0f },
    { 309, 14517, { 11368, 14965, 14517, 0 }, kRaidBossOpenWaitMs, "High Priestess Jeklik", false, 2 },
    { 309, 14507, { 14884, 11373, 14507, 0 }, kRaidBossOpenWaitMs, "High Priest Venoxis" },
    { 309, 14510, { 15041, 14510, 0, 0 }, kRaidBossOpenWaitMs, "High Priestess Mar'li" },
    { 309, 11382, { 11391, 14988, 11382, 0 }, kRaidBossOpenWaitMs, "Bloodlord Mandokir" },
    { 309, 11380, { 14987, 15112, 11380, 0 }, kRaidBossOpenWaitMs, "Jin'do the Hexxer", false, 2, false, 0, false, 24306 },
    { 309, 14515, { 14515, 15101, 0, 0 }, kRaidBossOpenWaitMs, "High Priestess Arlokk" },
    { 309, 15114, { 15114, 0, 0, 0 }, kRaidBossOpenWaitMs, "Gahz'ranka" },
    { 309, 14834, { 14834, 0, 0, 0 }, kRaidBossOpenWaitMs, "Hakkar" },
    { 309, 15082, { 15082, 0, 0, 0 }, kRaidBossOpenWaitMs, "Gri'lek" },
    { 309, 15083, { 15163, 15083, 0, 0 }, kRaidBossOpenWaitMs, "Hazza'rah" },
    { 309, 15084, { 15084, 0, 0, 0 }, kRaidBossOpenWaitMs, "Renataki" },
    { 309, 15085, { 15085, 0, 0, 0 }, kRaidBossOpenWaitMs, "Wushoolay" },
    { 531, 15510, { 15630, 15962, 15510, 0 }, kRaidBossOpenWaitMs, "Fankriss the Unyielding" },
    { 533, 15990, { 16427, 16429, 16428, 15990, 0 }, 0, "Kel'Thuzad", false, 0, true, 0, false, 0, 3716.0f, -5106.0f, 36.0f, 8.0f, true, true, 8, 16429,
      16429, 26.0f, 2, true },
};

// The fight an engaged enemy belongs to on this map (nullptr: none).
inline Fight const* FightFor(uint32_t map, uint32_t entry)
{
    for (Fight const& f : kFights)
    {
        if (f.map != map)
            continue;
        if (f.boss == entry)
            return &f;
        for (uint32_t e : f.killOrder)
            if (e && e == entry)
                return &f;
    }
    return nullptr;
}

// Where an entry stands in the kill order (0 = first); a large number when it is not on the list.
inline size_t RankOf(Fight const& f, uint32_t entry)
{
    for (size_t i = 0; i < kKillOrderMax; ++i)
        if (f.killOrder[i] && f.killOrder[i] == entry)
            return i < f.sameRank ? 0 : i - (f.sameRank ? f.sameRank - 1 : 0);
    return 99;
}

struct Enemy
{
    uint64_t guid = 0;
    uint32_t entry = 0;
    float hpPct = 100.f;
    bool eligible = false;     // alive, engaged, not crowd-controlled or reflecting, not forbidden for this bot
    bool held = false;         // a tank of the raid is its victim (Fight::heldFirst)
};

// The enemy every DPS bot attacks now, 0 = none (the generic rules pick).
//   ownerMark: the owner's skull or cross, when it is an eligible enemy it wins.
//   previous : last pick, kept while it is still eligible and still the best rank (no flip-flop between two equal Protectors).
// Lowest rank first; inside a rank (Fight::heldFirst) one a tank holds, then (Fight::preferEntry) that entry, then the most hurt one (finish what was started), then the lowest guid.
inline uint64_t PickFocus(Fight const& f, Enemy const* enemies, size_t n, uint64_t ownerMark, uint64_t previous)
{
    if (f.skullOnly)
    {
        for (size_t i = 0; i < n; ++i)
            if (ownerMark && enemies[i].eligible && enemies[i].guid == ownerMark)
                return ownerMark;
        return 0;
    }
    if (ownerMark)
        for (size_t i = 0; i < n; ++i)
            if (enemies[i].eligible && enemies[i].guid == ownerMark)
                return ownerMark;
    size_t bestRank = 99;
    for (size_t i = 0; i < n; ++i)
        if (enemies[i].eligible)
            bestRank = bestRank < RankOf(f, enemies[i].entry) ? bestRank : RankOf(f, enemies[i].entry);
    if (bestRank == 99)
        return 0;
    if (previous)
        for (size_t i = 0; i < n; ++i)
            if (enemies[i].eligible && enemies[i].guid == previous && RankOf(f, enemies[i].entry) == bestRank)
                return previous;
    Enemy const* best = nullptr;
    for (size_t i = 0; i < n; ++i)
    {
        Enemy const& e = enemies[i];
        if (!e.eligible || RankOf(f, e.entry) != bestRank)
            continue;
        if (best && f.heldFirst && e.held != best->held)
        {
            if (e.held)
                best = &e;
            continue;
        }
        if (best && f.preferEntry && (e.entry == f.preferEntry) != (best->entry == f.preferEntry))
        {
            if (e.entry == f.preferEntry)
                best = &e;
            continue;
        }
        if (!best || e.hpPct < best->hpPct || (e.hpPct == best->hpPct && e.guid < best->guid))
            best = &e;
    }
    return best ? best->guid : 0;
}

// True while the DPS still wait for the tank to get in: from the first engaged enemy (sinceMs, 0 = none yet) for waitMs.
inline bool StartWait(uint32_t sinceMs, uint32_t nowMs, uint32_t waitMs)
{
    return sinceMs != 0 && nowMs >= sinceMs && nowMs - sinceMs < waitMs;
}

} // namespace Playerbot::Raid::Script
