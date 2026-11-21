# Notice and credits: WoW Forever Bots (this repository)

"WoW Forever Bots" by Karrz is the name of this bot system. Every upstream credit and license below stays in force.

This module is part of a TrinityCore-based tree and is distributed under the GNU General
Public License version 2 (`COPYING`), the same terms as TrinityCore.

- **PlayerbotV2** was written by agatho (https://github.com/agatho/TrinityCore, branch
  `playerbot-v2`), whose README states "GPL-2.0, same as TrinityCore". The core API, the
  module layout and most of the bot brain, travel and fleet code come from there.
- **Classic (1.12) adaptation, raid, battleground, world-population and auction house work**
  was added for WoW Forever by Karrz (Karrz1).
- **ike3 / cmangos playerbots** (ike3's mangosbot, https://github.com/ike3/mangosbot-bots, for cMaNGOS; GPL-2.0): several behaviours
  (raid brain, speech lines, rpg, battleground paths and objectives, travel) were ported from a
  VMaNGOS-based bot tree that derives from ike3 bots, VMaNGOS and cMaNGOS (all GPL-2.0).
  Source comments name the routines they follow.
- **mod-playerbots** (AzerothCore, AGPL-3.0) was read as a reference for behaviour ideas
  (for example dungeon dispersal and fleeing rules). Its code was not copied; the logic was
  re-written here. Comments mark where an idea came from.
- **Vanilla encounter data and scripts** follow VMaNGOS (GPL-2.0), as do the Classic ports
  already in `src/server/scripts/Custom/Classic`.
- **SimulationCraft (simc)** (GPL-3.0) action lists and talent loadouts were used as
  reference for the retail-era rotations and `sql/playerbot_v2/0004_simc_seed.sql`.

## Licence of each part

**Our own work in the bot module (by Karrz / Karrz1) is licensed GPL-2.0-or-later.** Code that came
from others keeps its original licence, as listed here:

- **From agatho's PlayerbotV2 (GPL-2.0, "same as TrinityCore"):** in `src/modules/PlayerbotV2/`,
  the bot API files `Api/PlayerbotAPI`, `Api/PlayerbotMovement` and `Api/BotItemScorer` (moved here
  from agatho's `src/server/game/Playerbot/`), most of `Threading/`,
  `Persistence/`, `World/`, `Group/`, `Session/`, the module's own `sql/`, and the original files of
  `Bot/`, `Combat/`, `Fleet/`, `Travel/` and `Diagnostics/`, plus the first 18 files of
  `sql/playerbot_v2/`. A file that existed in agatho's `playerbot-v2` branch stays under agatho's
  terms, even where we have changed it since.
- **Ported from ike3 / cMaNGOS playerbots, by way of the VMaNGOS-based bot tree (GPL-2.0):** the
  Classic raid brain in `Bot/Raid/`, battleground paths and objectives in `Bot/Battleground/`,
  rpg and idle states in `Bot/States/`, the Classic class rotations in `Combat/Apl/Apl_Classic_*`,
  bot speech lines (`Bot/BotTextMgr`), and parts of travel (`Travel/PortalIndex`,
  `Travel/TownNpcIndex`, `Travel/UnifiedTravelGraph`). Source comments name the routine each one
  follows.
- **By SIN (GPL-2.0, `COPYING` in its folder):** the add-on `Addon/ForeverCombatNameplates`.
- **Ours from the start:** the add-ons `Addon/ForeverBots` and `Addon/ForeverDots`, `Commands/`,
  the rest of `Api/`, and every file not named above that was added for WoW Forever.

Keep these notices, and the copyright and licence headers that individual files carry, when
redistributing. Source files of the module do not carry per-file headers; this notice and
`COPYING` apply to all of them.

## This repository

- This branch is advocaite's TrinityCore `forever` tree (https://github.com/advocaite/TrinityCore, GPL-2.0, copyright the TrinityCore
  project and contributors) plus WoW Forever Bots. The files that were changed are derived from TrinityCore and stay under its GPL-2.0.
- The 1.12 numbers (spell values, creature stats, ...) are read from the VMaNGOS database dump by `tools/classic_spell_values/`. The dump is
  not part of this repository; it belongs to its authors.
- Libraries under `dep/` keep their own licenses (see each folder).
- mod-playerbots (AzerothCore) is AGPL-3.0: used only as a reference for ideas, no code copied. SimulationCraft is GPL-3.0: data used as reference.
- World of Warcraft data, names and client files belong to Blizzard Entertainment and are not included.
- Some live WoW Forever world data (quest texts and objective counts, object templates, vendor items, trainer levels and prices) in
  `sql/custom/world/2026_11_11_10_world_forever_eg_link_live_data.sql` and `2026_11_11_11_world_forever_eg_link_trainer_prices.sql`:
  Data from [Efficient Games](https://efficient.games) (https://github.com/JIVESCORP/eg-link-output-wowf), licensed under
  [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Changed: only the records we lacked or had different were picked and
  converted to our database tables.
- Live WoW Forever quest data (quest order, givers and turn-ins) in `sql/custom/world/2026_11_12_15_*.sql`, `2026_11_13_86_*.sql`,
  `2026_11_13_87_*.sql`, `2026_11_14_97_*.sql`, `2026_11_16_96_*.sql` and `2026_11_18_97_*.sql`: from [Questie](https://github.com/Questie/QuestieDB) (Questie team, GPL-3.0), its Forever corrections and
  play traces. Changed: converted to our database tables, only where ours lacked it.
- Live WoW Forever world data (quest records, object templates, vendor items, trainer levels) in
  `sql/custom/world/2026_11_12_14_*.sql`, `2026_11_13_88_*.sql`, `2026_11_13_90_*.sql`, `2026_11_14_96_*.sql`, `2026_11_15_96_*.sql`, `2026_11_17_81_*.sql`,
  `2026_11_17_96_*.sql` and `2026_11_18_96_*.sql`: Data from
  [Efficient Games](https://efficient.games) (https://github.com/JIVESCORP/eg-link-output-wowf), licensed under
  [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Changed: only the records we lacked or had different were picked and
  converted to our database tables.
- French quest text in `sql/custom/world/2026_11_15_98_world_forever_quest_locale_frFR_wowhead.sql`: from Wowhead's WoW Forever
  database (www.wowhead.com/forever), French pages, collected and shared by Ashendris (Mizuka). Changed: compared with our world and
  only the fields we lacked or that differ from live were written.
- Quest givers, drops and vendor items in `sql/custom/world/2026_11_13_91_world_forever_everlake_data.sql` and
  `2026_11_15_97_world_forever_everlake_data_1115.sql`, `2026_11_16_97_world_forever_everlake_data_1116.sql` and
  `2026_11_17_97_world_forever_everlake_data_1117.sql`: from Everlake's world data
  ([buildthehomelab/wow-everlake-world-data](https://github.com/buildthehomelab/wow-everlake-world-data), GPL-3.0), which in turn
  credits EG Link (CC BY 4.0), Polestar forever-db, QuestieDB, ForeverDB.net (GPL-3.0), NorgannonDB by zmarotrix (GPL-3.0), Icy Veins'
  WoW Forever database (db.icy-veins.com/wow-forever) and Wowhead's WoW Forever database (www.wowhead.com/forever). Changed: compared with our world and only rows we lacked were written as ours.
- Ideas from the Everlake core (https://github.com/buildthehomelab/wow-trinitycore-everlake, GPL-2.0, a fork of this core), written
  as our own code: the hunter pet's food type taken from the client's Item table (`ObjectMgr::LoadItemTemplates`), and the hunter
  pet's wild attack speed through the client's Faster / Slower Attack passives (`ClassicPetAttackSpeed.h`).
- From the Everlake core (https://github.com/buildthehomelab/wow-trinitycore-everlake, GPL, a fork of this core), written as our
  own code: ranged weapons and wands take the ranged stat budget column (`GetRandomPropertyPoints`, ItemEnchantmentMgr.cpp).
- From the Everlake core (https://github.com/buildthehomelab/wow-trinitycore-everlake, GPL-2.0, a fork of this core), taken as
  given: a TACT key we don't hold is answered "not public" (`HotfixHandler.cpp`, Everlake 973f193b), and worldserver.conf.d files
  keep their keys with no `[section]` header or with several (`ConfigMgr::LoadAdditionalFile` and its test, Everlake db11c6d9 and
  03481268).
- Weapon chance-on-hit rates in `sql/custom/world/2026_11_06_41_world_classic_weapon_proc_every_hit.sql` and
  `2026_11_16_80_world_forever_item_proc_ppm_measured.sql`: from [wowsims/forever](https://github.com/wowsims/forever)
  (`tools/database/overrides/weapon_procs.go`), MIT licence, copyright the wowsims contributors. Only the rates were taken.
- Forever Combat Nameplates (`src/modules/PlayerbotV2/Addon/ForeverCombatNameplates` and the combat nameplate filter in `Player.cpp`,
  `ChatHandler.cpp`, `WorldSession.cpp` and `ViewerDependentValues.h`): by SIN, GPL-2.0 (COPYING in the add-on folder).
- The Hallow's End link for the Southshore Stink Bomb Counter in `sql/custom/world/2026_11_16_97_*.sql` was checked against
  [cmangos classic-db](https://github.com/cmangos/classic-db) (GPL-2.0).

## Licence of Karrz's own work

Karrz's own work in the bot module is licensed GPL-2.0-or-later, while files derived from agatho's PlayerbotV2, ike3/cmangos playerbots or VMaNGOS keep those projects' GPL-2.0 terms.

### Files that are Karrz's own work (please correct)

Best guess from source comments and tests; please move, add or remove files freely.

```
src/modules/PlayerbotV2/Bot/Dungeon/TankStill.h
src/modules/PlayerbotV2/Bot/Gear/RaidEnchants.cpp
src/modules/PlayerbotV2/Bot/Gear/RaidEnchants.h
src/modules/PlayerbotV2/Bot/Gear/RaidLoadout.cpp
src/modules/PlayerbotV2/Bot/Gear/RaidLoadout.h
src/modules/PlayerbotV2/Bot/PlayerCraftOrder.h
src/modules/PlayerbotV2/Bot/Raid/BossWarnings.cpp
src/modules/PlayerbotV2/Bot/Raid/BossWarnings.h
src/modules/PlayerbotV2/Bot/Raid/DispelWorth.h
src/modules/PlayerbotV2/Bot/Raid/RaidEncounterData_AQ20.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidEncounterData_AQ40.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidEncounterData_NAXX.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidEncounterData_ZG.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidFightScript.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidFightScript.h
src/modules/PlayerbotV2/Bot/Raid/RaidHealGroups.h
src/modules/PlayerbotV2/Bot/Raid/RaidHealSlots.h
src/modules/PlayerbotV2/Bot/Raid/RaidManaLedger.h
src/modules/PlayerbotV2/Bot/Raid/RaidMechanics_AQ40.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidMechanics_Naxx.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidMechanics_ZG.cpp
src/modules/PlayerbotV2/Bot/Raid/RaidReadiness.h
src/modules/PlayerbotV2/Bot/Raid/RaidRoster.h
src/modules/PlayerbotV2/Bot/Raid/ZgHakkar.h
src/modules/PlayerbotV2/Bot/World/SpreadSpot.h
src/modules/PlayerbotV2/Combat/Apl/AplPetThrottle.h
src/modules/PlayerbotV2/Combat/LazyLock.h
src/modules/PlayerbotV2/Fleet/AreaCap.h
src/modules/PlayerbotV2/Fleet/BotSize.h
src/modules/PlayerbotV2/Fleet/DayRhythm.h
src/modules/PlayerbotV2/Fleet/InstanceGroupCap.h
src/modules/PlayerbotV2/Fleet/OwnerCatchUp.h
src/modules/PlayerbotV2/Fleet/OwnerTrail.h
src/modules/PlayerbotV2/Fleet/PetSnap.h
src/modules/PlayerbotV2/Fleet/PickupGroups.h
src/modules/PlayerbotV2/Fleet/PlayerCraftOrders.cpp
src/modules/PlayerbotV2/Fleet/PlayerCraftOrders.h
src/modules/PlayerbotV2/Fleet/PlayerWorkAreas.h
src/modules/PlayerbotV2/Fleet/QuestSiteShare.h
src/modules/PlayerbotV2/Fleet/RaidSubgroupPlan.h
src/modules/PlayerbotV2/Fleet/SoakAnchors.h
src/modules/PlayerbotV2/Fleet/StrandedWatch.h
src/modules/PlayerbotV2/Fleet/StrangerBoard.h
src/modules/PlayerbotV2/Fleet/TownGather.h
src/modules/PlayerbotV2/Fleet/TownGatherSource.h
src/modules/PlayerbotV2/Fleet/WorldLeash.h
src/modules/PlayerbotV2/Fleet/WorldPvp.h
src/modules/PlayerbotV2/Session/LazyLock.cpp
src/modules/PlayerbotV2/Session/LazyLock.h
src/server/game/Groups/BotGroupRules.h
tests/game/ClassicAreaCap.cpp
tests/game/ClassicBossWarnings.cpp
tests/game/ClassicBotGroupRules.cpp
tests/game/ClassicBotSize.cpp
tests/game/ClassicDayRhythm.cpp
tests/game/ClassicLazyLock.cpp
tests/game/ClassicOwnerCatchUp.cpp
tests/game/ClassicOwnerTrail.cpp
tests/game/ClassicPetAttackSpeed.cpp
tests/game/ClassicPetFollowSpeed.cpp
tests/game/ClassicPetSnap.cpp
tests/game/ClassicPlayerCraftOrder.cpp
tests/game/ClassicPlayerWorkAreas.cpp
tests/game/ClassicQuestSiteShare.cpp
tests/game/ClassicRaidConsumables.cpp
tests/game/ClassicRaidDispel.cpp
tests/game/ClassicRaidFightScript.cpp
tests/game/ClassicRaidHealGroups.cpp
tests/game/ClassicRaidHealSlots.cpp
tests/game/ClassicRaidLoadout.cpp
tests/game/ClassicRaidResistPotions.cpp
tests/game/ClassicRaidRoster.cpp
tests/game/ClassicRaidSubgroupPlan.cpp
tests/game/ClassicSoakAnchors.cpp
tests/game/ClassicSpreadSpot.cpp
tests/game/ClassicStrandedWatch.cpp
tests/game/ClassicStrangerBoard.cpp
tests/game/ClassicTankStill.cpp
tests/game/ClassicTownGather.cpp
tests/game/ClassicWorldPvp.cpp
tests/game/PetStayCommand.cpp
```

### Files to classify

Not clear from the source whether these are Karrz's own, agatho's, or derived from ike3/VMaNGOS.

```
src/modules/PlayerbotV2/Bot/Dungeon/PrePullCc.h
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTactics.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTactics.h
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_bfd.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_brd.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_deadmines.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_gnomer.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_mc.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_rfc.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_rfd.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_rfk.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_sfk.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_sm.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_stockade.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_uldaman.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_wc.cpp
src/modules/PlayerbotV2/Bot/Dungeon/Tactics/DungeonTacticsData_zf.cpp
src/modules/PlayerbotV2/Bot/Gear/BisPools.cpp
src/modules/PlayerbotV2/Bot/Gear/BisPools.h
src/modules/PlayerbotV2/Bot/Quest/CompanionQuest.cpp
src/modules/PlayerbotV2/Bot/Quest/CompanionQuest.h
src/modules/PlayerbotV2/Bot/Quest/QuestOrders.cpp
src/modules/PlayerbotV2/Bot/Quest/QuestOrders.h
src/modules/PlayerbotV2/Bot/Raid/BossWarningData_MC.h
src/modules/PlayerbotV2/Bot/States/Rules/BankRules.cpp
src/modules/PlayerbotV2/Bot/States/Rules/CraftOrderRules.cpp
src/modules/PlayerbotV2/Bot/States/Rules/GuildRules.cpp
src/modules/PlayerbotV2/Bot/States/Rules/HunterPetRules.cpp
src/modules/PlayerbotV2/Bot/States/Rules/MailRules.cpp
src/modules/PlayerbotV2/Bot/World/CapitalsTable.cpp
src/modules/PlayerbotV2/Bot/World/CapitalsTable.h
src/modules/PlayerbotV2/Bot/World/HunterPetsByRace.cpp
src/modules/PlayerbotV2/Bot/World/HunterPetsByRace.h
src/modules/PlayerbotV2/Combat/Apl/HealClaimStore.h
src/modules/PlayerbotV2/Diagnostics/DamageParity.cpp
src/modules/PlayerbotV2/Diagnostics/DamageParity.h
src/modules/PlayerbotV2/Diagnostics/ScenarioDefs.h
src/modules/PlayerbotV2/Diagnostics/ScenarioRunner.cpp
src/modules/PlayerbotV2/Diagnostics/ScenarioRunner.h
src/modules/PlayerbotV2/Diagnostics/SpellCheckExpected.h
src/modules/PlayerbotV2/Diagnostics/SpellCheckExpected.inc
src/modules/PlayerbotV2/Fleet/BotAccountMgr.cpp
src/modules/PlayerbotV2/Fleet/BotAccountMgr.h
src/modules/PlayerbotV2/Fleet/BotGuildCharter.cpp
src/modules/PlayerbotV2/Fleet/BotGuildCharter.h
src/modules/PlayerbotV2/Fleet/BotGuildEvent.h
src/modules/PlayerbotV2/Fleet/BotGuildEventScheduler.cpp
src/modules/PlayerbotV2/Fleet/BotGuildEventScheduler.h
src/modules/PlayerbotV2/Fleet/BotGuildMgr.cpp
src/modules/PlayerbotV2/Fleet/BotGuildMgr.h
src/modules/PlayerbotV2/Fleet/BotGuildNamePool.cpp
src/modules/PlayerbotV2/Fleet/BotGuildNamePool.h
src/modules/PlayerbotV2/Fleet/BotPool.cpp
src/modules/PlayerbotV2/Fleet/BotPool.h
src/modules/PlayerbotV2/Fleet/BotPopulationManager.cpp
src/modules/PlayerbotV2/Fleet/BotPopulationManager.h
src/modules/PlayerbotV2/Fleet/BotQueueFiller.cpp
src/modules/PlayerbotV2/Fleet/BotQueueFiller.h
src/modules/PlayerbotV2/Fleet/CraftOrderBoard.cpp
src/modules/PlayerbotV2/Fleet/CraftOrderBoard.h
src/modules/PlayerbotV2/Fleet/StarterQuestAutocomplete.cpp
src/modules/PlayerbotV2/Fleet/StarterQuestAutocomplete.h
src/modules/PlayerbotV2/Fleet/WorldBotSpawner.cpp
src/modules/PlayerbotV2/Fleet/WorldBotSpawner.h
src/modules/PlayerbotV2/LfgBotFill.cpp
src/modules/PlayerbotV2/LfgBotFill.h
src/modules/PlayerbotV2/Session/BotSession.cpp
src/modules/PlayerbotV2/Session/BotSession.h
src/modules/PlayerbotV2/Session/BotSessionMgr.cpp
src/modules/PlayerbotV2/Session/BotSessionMgr.h
```
