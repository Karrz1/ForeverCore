-- WoW Forever world data from Everlake, 26 November (buildthehomelab/wow-everlake-world-data dd3a74f4..53ff03be, GPL-3.0,
-- used with credit and thanks). Their facts come from Icy Veins' WoW Forever database, Wowhead Forever, EG Link (CC BY) and
-- QuestieDB (GPL-3.0). Everything up to dd3a74f4 is already in our world (2026_11_26_70/71).
--   Cleanup: 266 + 44 + 33 vendor items the game does not have (spawned, holiday and Darkmoon vendors), 99 Wrath recipes on
--     Alard Schmied's trainer list, Lunar Festival elders' gossip from other expansions, 4 TBC quest objects that open to
--     nothing (21 spawns), the second Valennia Stormfist, Elder Primestone's transmogrifier greeting.
--   Quests: missing givers and takers (Classic, SoD, dungeons, Hyjal, Riverglades), quest credit for Experimental Method,
--     Saving Our Own, Ewe Wandered Off, The Dying Ancients (Sunderbark), Shen'dralar pylons, Test Your Theory, Crystalline
--     Elements, Digestible Research, State Secrets, Blasting Supplies, sign quests, Wennzut Togglespring, race masks.
--   Small fixes: writ drops in dungeons, Altar of the Deeps reset, free Journeyman Riding gossip, Perfect Yeti Hide on quest,
--     Paletusks no pickpocket, Nethergarde guards no loot, fishing rack lures, Abyssal Bubble no parry/block, Mathias Shaw's
--     Ravenholdt letter, Power Wash well trigger, Trevan's weapon notes gossip.
-- Left out: the Darkspear Islands battleground files (2026_11_26_70/80/82/94 there). Their guid blocks: 920019500+, 920019600+,
-- 920019800, 920027300-920027310, 920036600-920036649. Their row log table everlake_import_rows is a temporary table here, so
-- nothing of it stays in our world database. Each part only adds what is missing, so it is safe to run twice.


-- ===== Everlake 2026_11_26_10_world_everlake_horde_hunter_saving_the_best.sql =====
-- Horde hunter "Saving the Best for Last" (84204, Mokvar 230317 in Orgrimmar) can be completed.
-- 2026_11_26_10_world_everlake_horde_hunter_saving_the_best.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Blizzard's server-side note of 25 November 2026 (step 71139+1): "Hunter - The Horde version of "Saving the Best for
-- Last" can now be properly completed." The quest is 84204: Icy Veins' WoW Forever records and EG Link's 71139 quest
-- record give "Give Mokvar your Beaststalker's Cap and Beaststalker's Tunic.", zone Orgrimmar (1637), Horde races, and
-- Icy Veins' addon records Mokvar 230317 as its giver and ender. The realm never had it: 2026_11_21_101 held it back
-- because both records name the objective items 226720 and 226723, which exist nowhere (no item record on the server
-- or the client). That is the bug Blizzard fixed; the objective text names Beaststalker's Cap 16677 and Beaststalker's
-- Tunic 16674, the items the Alliance copy 84196 and the old Horde quest 9008 ask for, so the objectives here are
-- 16677 and 16674 (objective ids 452083/452084 from EG Link).
--
-- Rewards Beastmaster's Cap 226887 and Beastmaster's Tunic 226886 (Icy Veins and EG Link), XP difficulty 2 with
-- multiplier 1 (EG Link), level 60, min level 58. Progress text from Icy Veins' addon dialog record. Class (hunter) and
-- chain (after Back to the Beginning 8998) as the other Horde 841xx quests have (2026_11_21_101, INFERRED from 9008).
-- Left out: a choice reward (the Alliance copy has one, 227388; no record names one for 84204) and the reward text
-- (no record).
--
-- Every added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_10_world_everlake_horde_hunter_saving_the_best.sql';
SET @NOTE := 'Icy Veins + EG Link 71139 quest 84204; objectives from its text (16677/16674); note 71139+1 2026-11-25';
START TRANSACTION;

SET @MISSING := (SELECT COUNT(*) = 0 FROM `quest_template` WHERE `ID` = 84204);

INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestSortID`, `QuestInfoID`, `RewardXPDifficulty`, `RewardXPMultiplier`,
    `RewardMoneyMultiplier`, `RewardArtifactXPMultiplier`, `Flags`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`,
    `RewardFactionCapIn1`, `RewardFactionCapIn2`, `RewardFactionCapIn3`, `RewardFactionCapIn4`, `RewardFactionCapIn5`,
    `AcceptedSoundKitID`, `CompleteSoundKitID`, `AllowableRaces`, `Expansion`, `LogTitle`, `LogDescription`, `QuestDescription`,
    `AreaDescription`, `QuestCompletionLog`, `VerifiedBuild`)
SELECT 84204, 2, 1637, 81, 2, 1, 1, 1, 8, 226887, 1, 226886, 1, 7, 7, 7, 7, 7, 890, 878, 12261800583900083122, -2,
    'Saving the Best for Last', 'Give Mokvar your Beaststalker''s Cap and Beaststalker''s Tunic.',
    'A truly amazing story, $n! You have my thanks, and the heartfelt gratitude of all who were involved, I can assure you. Through your efforts we are delivered from the mistakes of our past.$B$BAs to your reward, I believe I have a few things that you have definitely earned and will truly enjoy.',
    '', '', 0
FROM DUAL WHERE @MISSING;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `file`, `note`) SELECT 'quest_template', 84204, @EVERLAKE_FILE, @NOTE FROM DUAL WHERE @MISSING;

INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Description`, `VerifiedBuild`)
SELECT 452083, 84204, 1, 0, 0, 16677, 1, 32, '', 0 FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `quest_objectives` WHERE `ID` = 452083)
UNION ALL
SELECT 452084, 84204, 1, 1, 1, 16674, 1, 32, '', 0 FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `quest_objectives` WHERE `ID` = 452084);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `file`, `note`)
SELECT 'quest_objectives', o.`ID`, @EVERLAKE_FILE, @NOTE FROM `quest_objectives` o WHERE @MISSING AND o.`QuestID` = 84204;

INSERT INTO `quest_classic_level` (`ID`, `QuestLevel`, `MinLevel`, `MaxLevel`)
SELECT 84204, 60, 58, 0 FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `quest_classic_level` WHERE `ID` = 84204);
INSERT INTO `quest_template_classic_level` (`ID`, `LevelType`, `QuestLevel`)
SELECT 84204, 2, 60 FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `quest_template_classic_level` WHERE `ID` = 84204);
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `NextQuestID`)
SELECT 84204, 4, 8998, 0 FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `quest_template_addon` WHERE `ID` = 84204);
INSERT INTO `quest_request_items` (`ID`, `CompletionText`, `VerifiedBuild`)
SELECT 84204, 'Are you ready to give me your Beaststalker''s pieces in exchange for your new Beastmaster''s Cap and Tunic?', 0
FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `quest_request_items` WHERE `ID` = 84204);
INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`)
SELECT 230317, 84204, 0 FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `creature_queststarter` WHERE `id` = 230317 AND `quest` = 84204);
INSERT INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`)
SELECT 230317, 84204, 0 FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `creature_questender` WHERE `id` = 230317 AND `quest` = 84204);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `file`, `note`)
SELECT 'quest_classic_level', 84204, 0, @EVERLAKE_FILE, @NOTE FROM DUAL WHERE @MISSING
UNION ALL
SELECT 'quest_template_classic_level', 84204, 2, @EVERLAKE_FILE, @NOTE FROM DUAL WHERE @MISSING
UNION ALL
SELECT 'quest_template_addon', 84204, 0, @EVERLAKE_FILE, 'INFERRED: hunter class and chain of the old Horde quest 9008' FROM DUAL WHERE @MISSING
UNION ALL
SELECT 'quest_request_items', 84204, 0, @EVERLAKE_FILE, 'Icy Veins addon dialog (progress)' FROM DUAL WHERE @MISSING
UNION ALL
SELECT 'creature_queststarter', 230317, 84204, @EVERLAKE_FILE, 'Icy Veins addon givers' FROM DUAL WHERE @MISSING
UNION ALL
SELECT 'creature_questender', 230317, 84204, @EVERLAKE_FILE, 'Icy Veins addon givers' FROM DUAL WHERE @MISSING;

COMMIT;


-- ===== Everlake 2026_11_26_11_world_everlake_writ_drops_dungeons.sql =====
-- Craftsman's Writs drop inside dungeons too.
-- 2026_11_26_11_world_everlake_writ_drops_dungeons.sql: written by hand (2026-11-26).
--
-- Blizzard's server-side note of 9 November 2026 (step 70862+1): "Fixed a bug that prevented Waylaid Crates and
-- Craftsman's Writs from dropping inside dungeons." Waylaid Crates already drop in dungeons (the core's 2026_11_20_41).
-- The writ drop lists of 2026_11_19_982 (reference loot 9500001-9500003, Journeyman / Expert / Artisan) went only on
-- open-world creatures (maps 0, 1, 2991). This gives the same lists, on the same INFERRED terms (tier by the creature's
-- highest level: 20-34, 35-51, 52-63; 0.5% per kill; creatures that have loot and are not critters), to creatures that
-- stand in a five-player dungeon. The dungeon maps are the tracker's dungeon list (kind 1, not seasonal): 33, 34, 36,
-- 43, 47, 48, 70, 90, 109, 129, 189, 209, 229, 230, 289, 329, 349, 389, 429, 2959, 2970, 2974, 2994, 2998, 2999, 3001,
-- 3039, 3065, 3109. Raids are left out (the note names dungeons only).
--
-- Only rows the world lacks are added; every row goes in the ledger. Never edit this file once it is deployed: a later
-- fix is a new file. Running it again changes nothing. Not tried in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS `everlake_writ_loot`;
CREATE TEMPORARY TABLE `everlake_writ_loot` (`Entry` int unsigned NOT NULL, `Item` int unsigned NOT NULL, `missing` tinyint NOT NULL DEFAULT 0, PRIMARY KEY (`Entry`, `Item`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT IGNORE INTO `everlake_writ_loot` (`Entry`, `Item`)
SELECT d.`LootID`, CASE WHEN l.`level_max` BETWEEN 20 AND 34 THEN 9500001 WHEN l.`level_max` BETWEEN 35 AND 51 THEN 9500002 ELSE 9500003 END
FROM `creature_template_difficulty` d
JOIN `creature_template` t ON t.`entry` = d.`Entry`
JOIN `creature_classic_level` l ON l.`entry` = d.`Entry`
WHERE d.`DifficultyID` = 0 AND d.`LootID` > 0 AND t.`type` <> 8 AND l.`level_max` BETWEEN 20 AND 63
  AND EXISTS (SELECT 1 FROM `creature` c WHERE c.`id` = d.`Entry` AND c.`map` IN (33, 34, 36, 43, 47, 48, 70, 90, 109, 129, 189, 209, 229, 230, 289, 329, 349, 389, 429, 2959, 2970, 2974, 2994, 2998, 2999, 3001, 3039, 3065, 3109));
UPDATE `everlake_writ_loot` s SET s.`missing` = 1
WHERE EXISTS (SELECT 1 FROM `reference_loot_template` r WHERE r.`Entry` = s.`Item`)
  AND NOT EXISTS (SELECT 1 FROM `creature_loot_template` t WHERE t.`Entry` = s.`Entry` AND t.`ItemType` = 1 AND t.`Item` = s.`Item`)
  AND NOT EXISTS (SELECT 1 FROM `everlake_import_rows` r WHERE r.`tbl` = 'creature_loot_template' AND r.`k1` = s.`Entry` AND r.`k2` = 1 AND r.`k3` = s.`Item`);
INSERT INTO `creature_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT s.`Entry`, 1, s.`Item`, 0.5, 0, 1, 0, 1, 1, 'Craftsman''s Writ dungeon drop (INFERRED)' FROM `everlake_writ_loot` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `file`, `note`)
SELECT 'creature_loot_template', s.`Entry`, 1, s.`Item`, '2026_11_26_11_world_everlake_writ_drops_dungeons.sql', 'note 70862+1 2026-11-09 (writs drop in dungeons); drop INFERRED as 2026_11_19_982' FROM `everlake_writ_loot` s WHERE s.`missing` = 1;
DROP TEMPORARY TABLE `everlake_writ_loot`;
COMMIT;


-- ===== Everlake 2026_11_26_12_world_everlake_altar_of_the_deeps_reset.sql =====
-- Blackfathom Deeps: the Altar of the Deeps (103016) can be used again 3 seconds after use.
-- 2026_11_26_12_world_everlake_altar_of_the_deeps_reset.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Blizzard's server-side note of 25 November 2026 (step 71139+1): "Blackfathom Deeps: The Altar of the Deeps should now
-- resume its interactability after 3 seconds and properly grant the Blessing of Blackfathom." The altar is a button
-- whose Data2 is its auto-close time in milliseconds; the realm has 65536 (over a minute). EG Link's object record of
-- the altar (client build 70338) gives 3000. Its linked trap, Shrine of Gelihast 94039, already casts Blessing of
-- Blackfathom 8733 (Data3), and the core's Blackfathom Deeps script only keeps the altar's guid, so nothing else changes.
--
-- Changes the row only while it still holds 65536. Never edit this file once it is deployed: a later fix is a new file.
-- Running it again changes nothing. Not checked in game.

UPDATE `gameobject_template` SET `Data2` = 3000
WHERE `entry` = 103016 AND `type` = 1 AND `Data2` = 65536 AND `Data3` = 94039;


-- ===== Everlake 2026_11_26_13_world_everlake_free_journeyman_riding_gossip.sql =====
-- Players who finished their class mount quest before it taught Journeyman Riding can learn it for free by gossip.
-- 2026_11_26_13_world_everlake_free_journeyman_riding_gossip.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Blizzard's server-side note of 25 November 2026 (step 71139+1): "Any player who has already completed these quests can
-- speak with the following NPCs to get a special gossip option to allow them to learn Journeyman Riding for free.":
-- Danitha Morr (Forsaken paladins), Lord Grayson Shadowbreaker (Alliance paladins), Zevrost and Ursula Deline
-- (warlocks). The same day's hotfix (the core's 2026_11_26_00 hotfix file) gave each quest's reward spell a second
-- effect that teaches Journeyman Riding 33391: 1296537 (Justice and Retribution 97185), 23215 (Judgment and Redemption
-- 7647) and 23160 (Dreadsteed of Xoroth 7631). So the option makes the player cast their quest's reward spell again
-- (SmartAI action 134, triggered: free), which teaches 33391 and the mount they already know.
--
--   Danitha Morr 246378, menu 39689, quest 97185, spell 1296537
--   Lord Grayson Shadowbreaker 928, menu 4471, quest 7647, spell 23215
--   Zevrost 3326, menu 2384, quest 7631, spell 23160
--   Ursula Deline 5495, menu 4505, quest 7631, spell 23160
--
-- The option shows only when the quest is rewarded and 33391 is not known. No source records live's option text, so
-- the text here is Everlake's own wording. GossipOptionID 98000000 + menu id (a new block); OptionID is the menu's next
-- free one; SmartAI ids 90/91 on each creature (928 already has SmartAI; the other three had no AI or script).
-- The core has no script for these four creatures (checked: no ScriptName, no C++ by entry).
--
-- Every added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS `everlake_gossip_add`;
CREATE TEMPORARY TABLE `everlake_gossip_add` (`GossipOptionID` int NOT NULL PRIMARY KEY, `CreatureID` int unsigned NOT NULL, `MenuID` int unsigned NOT NULL, `OptionID` int unsigned NOT NULL DEFAULT 0, `OptionText` text NOT NULL, `BroadcastTextID` int NOT NULL, `Quest` int unsigned NOT NULL, `Spell` int unsigned NOT NULL, `missing` tinyint NOT NULL DEFAULT 0) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `everlake_gossip_add` (`GossipOptionID`, `CreatureID`, `MenuID`, `OptionText`, `BroadcastTextID`, `Quest`, `Spell`) VALUES
(98039689, 246378, 39689, 'I have earned my mount. Please teach me Journeyman Riding.', 0, 97185, 1296537),
(98004471, 928, 4471, 'I have earned my mount. Please teach me Journeyman Riding.', 0, 7647, 23215),
(98002384, 3326, 2384, 'I have earned my mount. Please teach me Journeyman Riding.', 0, 7631, 23160),
(98004505, 5495, 4505, 'I have earned my mount. Please teach me Journeyman Riding.', 0, 7631, 23160);
-- only where the option is not there yet, the creature uses this menu and has no C++ script
UPDATE `everlake_gossip_add` s SET s.`missing` = 1
WHERE NOT EXISTS (SELECT 1 FROM `gossip_menu_option` o WHERE o.`GossipOptionID` = s.`GossipOptionID`)
  AND NOT EXISTS (SELECT 1 FROM `everlake_import_rows` r WHERE r.`tbl` = 'gossip_menu_option' AND r.`k1` = s.`MenuID` AND r.`k3` = s.`GossipOptionID`)
  AND EXISTS (SELECT 1 FROM `creature_template_gossip` g WHERE g.`CreatureID` = s.`CreatureID` AND g.`MenuID` = s.`MenuID`)
  AND EXISTS (SELECT 1 FROM `creature_template` t WHERE t.`entry` = s.`CreatureID` AND t.`ScriptName` = '' AND t.`AIName` IN ('', 'SmartAI'))
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` x WHERE x.`entryorguid` = s.`CreatureID` AND x.`source_type` = 0 AND x.`id` IN (90, 91));
UPDATE `everlake_gossip_add` s
SET s.`OptionID` = (SELECT COALESCE(MAX(o.`OptionID`) + 1, 0) FROM `gossip_menu_option` o WHERE o.`MenuID` = s.`MenuID`)
WHERE s.`missing` = 1;
INSERT INTO `gossip_menu_option` (`MenuID`, `GossipOptionID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `Language`, `Flags`,
    `ActionMenuID`, `ActionPoiID`, `GossipNpcOptionID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `SpellID`, `OverrideIconID`, `VerifiedBuild`)
SELECT s.`MenuID`, s.`GossipOptionID`, s.`OptionID`, 0, s.`OptionText`, s.`BroadcastTextID`, 0, 0, 0, 0, NULL, 0, 0, '', 0, NULL, NULL, 0
FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, s.`MenuID`, s.`OptionID`, 0, 0, 8, 0, s.`Quest`, 0, 0, '', 0, 0, 0, '', CONCAT('Journeyman Riding option - quest ', s.`Quest`, ' rewarded') FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, s.`MenuID`, s.`OptionID`, 0, 0, 25, 0, 33391, 0, 0, '', 1, 0, 0, '', 'Journeyman Riding option - Journeyman Riding 33391 not known' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 15, s.`MenuID`, s.`OptionID`, 8, '2026_11_26_13_world_everlake_free_journeyman_riding_gossip.sql', 'note 71139+1 2026-11-25 (free Journeyman Riding gossip); option text Everlake wording' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 15, s.`MenuID`, s.`OptionID`, 25, '2026_11_26_13_world_everlake_free_journeyman_riding_gossip.sql', 'note 71139+1 2026-11-25 (free Journeyman Riding gossip); option text Everlake wording' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
UPDATE `creature_template` t JOIN `everlake_gossip_add` s ON s.`CreatureID` = t.`entry`
SET t.`AIName` = 'SmartAI' WHERE s.`missing` = 1 AND t.`AIName` = '' AND t.`ScriptName` = '';
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT s.`CreatureID`, 0, 90, 91, '', 62, 0, 100, 0, s.`MenuID`, s.`OptionID`, 0, 0, 0, '', 72, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,
    CONCAT('On gossip option ', s.`MenuID`, '/', s.`OptionID`, ' (Journeyman Riding) - Close gossip') FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT s.`CreatureID`, 0, 91, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, '', 134, s.`Spell`, 2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,
    CONCAT('Linked - Invoker casts ', s.`Spell`, ' (quest ', s.`Quest`, ' reward spell, teaches Journeyman Riding 33391 since the 71139 hotfix)') FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `file`, `note`)
SELECT 'gossip_menu_option', s.`MenuID`, s.`OptionID`, s.`GossipOptionID`, '2026_11_26_13_world_everlake_free_journeyman_riding_gossip.sql', 'note 71139+1 2026-11-25 (free Journeyman Riding gossip); option text Everlake wording' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `file`, `note`)
SELECT 'smart_scripts', s.`CreatureID`, 0, 90, '2026_11_26_13_world_everlake_free_journeyman_riding_gossip.sql', 'note 71139+1 2026-11-25 (free Journeyman Riding gossip); option text Everlake wording' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `file`, `note`)
SELECT 'smart_scripts', s.`CreatureID`, 0, 91, '2026_11_26_13_world_everlake_free_journeyman_riding_gossip.sql', 'note 71139+1 2026-11-25 (free Journeyman Riding gossip); option text Everlake wording' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
DROP TEMPORARY TABLE `everlake_gossip_add`;
COMMIT;


-- ===== Everlake 2026_11_26_14_world_everlake_perfect_yeti_hide_on_quest.sql =====
-- Feralas: Perfect Yeti Hide (18972) no longer drops while you are on the quest it starts, "Perfect Yeti Hide" (7738).
-- 2026_11_26_14_world_everlake_perfect_yeti_hide_on_quest.sql: written by hand (2026-11-26).
--
-- Blizzard's server-side note of 20 November 2026 (step 71037+1): "Feralas - Fixed an issue where Perfect Yeti Hide
-- could drop again while you're already on the quest it starts, "Perfect Yeti Hide."" The item's client record starts
-- quest 7738 (StartQuestID). It drops from Rage Scar Yeti 5296, Elder Rage Scar 5297, Ferocious Rage Scar 5299 and
-- Lurking Feral Scar 7848 (VMaNGOS rates), each with a Horde-only condition. Each loot row gets a second condition in the
-- same group: the looter's quest 7738 is not taken or complete (CONDITION_QUESTSTATE 47, states incomplete 8 + complete
-- 2, negated).
--
-- Every added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS `everlake_yeti`;
CREATE TEMPORARY TABLE `everlake_yeti` (`Entry` int unsigned NOT NULL PRIMARY KEY, `missing` tinyint NOT NULL DEFAULT 0);
INSERT INTO `everlake_yeti` (`Entry`) VALUES (5296), (5297), (5299), (7848);
UPDATE `everlake_yeti` s SET s.`missing` = 1
WHERE EXISTS (SELECT 1 FROM `creature_loot_template` l WHERE l.`Entry` = s.`Entry` AND l.`ItemType` = 0 AND l.`Item` = 18972)
  AND NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 1 AND c.`SourceGroup` = s.`Entry` AND c.`SourceEntry` = 18972
                  AND c.`ConditionTypeOrReference` = 47 AND c.`ConditionValue1` = 7738);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`,
    `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 1, s.`Entry`, 18972, 0, 0, 47, 0, 7738, 10, 0, '', 1, 0, 0, '', 'Perfect Yeti Hide - not while quest 7738 is taken or complete (note 71037+1)'
FROM `everlake_yeti` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 1, s.`Entry`, 18972, 47, '2026_11_26_14_world_everlake_perfect_yeti_hide_on_quest.sql', 'note 71037+1 2026-11-20; quest 7738 from item 18972 StartQuestID' FROM `everlake_yeti` s WHERE s.`missing` = 1;
DROP TEMPORARY TABLE `everlake_yeti`;
COMMIT;


-- ===== Everlake 2026_11_26_15_world_everlake_mortar_reloaded_with_goblin_mortar.sql =====
-- Engineering: learning Goblin Mortar (12716) also teaches "The Mortar: Reloaded" (13240).
-- 2026_11_26_15_world_everlake_mortar_reloaded_with_goblin_mortar.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Blizzard's server-side note of 23 November 2026 (step 71037+1): "Engineering: Fixed a bug that prevented "The
-- Mortar: Reloaded" recipe from being learned upon learning the "Goblin Mortar" recipe." The tracker's recipe list has
-- Goblin Mortar as spell 12716 and The Mortar: Reloaded as spell 13240 (both create Goblin Mortar 10577). One
-- spell_learn_spell row: whoever learns 12716 learns 13240 with it; players who know 12716 already get 13240 when their
-- spells load at the next login.
--
-- The added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

START TRANSACTION;
SET @MISSING := (SELECT COUNT(*) = 0 FROM `spell_learn_spell` WHERE `entry` = 12716 AND `SpellID` = 13240);
INSERT INTO `spell_learn_spell` (`entry`, `SpellID`, `Active`) SELECT 12716, 13240, 1 FROM DUAL WHERE @MISSING;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `file`, `note`)
SELECT 'spell_learn_spell', 12716, 13240, '2026_11_26_15_world_everlake_mortar_reloaded_with_goblin_mortar.sql', 'note 71037+1 2026-11-23; recipe ids from the tracker' FROM DUAL WHERE @MISSING;
COMMIT;


-- ===== Everlake 2026_11_26_16_world_everlake_paletusks_no_pickpocket.sql =====
-- Paletusks can no longer be pickpocketed.
-- 2026_11_26_16_world_everlake_paletusks_no_pickpocket.sql: written by hand (2026-11-26).
--
-- Blizzard's server-side note of 17 November 2026 (step 70959+1): "Various Paletusks can no longer be pickpocketed".
-- Of the realm's Paletusks (beasts), Mature Paletusk 255851 and Young Paletusk 258331 still have a pickpocket loot id
-- (their own entry); Juvenile Paletusk 266862 already has none. Each changes only while it still holds its own id.
-- The pickpocketing_loot_template rows stay (nothing else uses them).
--
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing. Not checked in
-- game.

UPDATE `creature_template_difficulty` SET `PickPocketLootID` = 0
WHERE `Entry` IN (255851, 258331) AND `PickPocketLootID` = `Entry`;


-- ===== Everlake 2026_11_26_17_world_everlake_sumi_orcish_war_leggings_plans.sql =====
-- Blacksmithing: Sumi (3356) sells Plans: Orcish War Leggings (7994) to players who finished "The Old Ways" (2756).
-- 2026_11_26_17_world_everlake_sumi_orcish_war_leggings_plans.sql: written by hand (2026-11-26).
--
-- Blizzard's server-side note of 17 November 2026 (step 70959+1): "Blacksmithing: The quest "The Old Ways" now grants
-- the Orcish War Leggings recipe via an item. Players who did not receive their recipe, or lose it, can acquire a
-- replacement from Sumi inside the nearby blacksmithing hut once the quest is completed." The realm's quest already
-- rewards the plans (RewardItem1 7994), but Sumi did not sell them. One vendor row (next free slot, the item's own buy
-- price) shown only to players who have quest 2756 rewarded (vendor condition, source type 23). Icy Veins' record of
-- Sumi's wares (seven items) does not list it: players who have not done the quest do not see it.
--
-- Every added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

START TRANSACTION;
SET @MISSING := (SELECT COUNT(*) = 0 FROM `npc_vendor` WHERE `entry` = 3356 AND `item` = 7994 AND `type` = 1)
    AND (SELECT COUNT(*) FROM `creature_template` WHERE `entry` = 3356 AND (`npcflag` & 128) = 128) = 1;
SET @SLOT := (SELECT COALESCE(MAX(`slot`) + 1, 0) FROM `npc_vendor` WHERE `entry` = 3356);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`)
SELECT 3356, @SLOT, 7994, 0, 0, 0, 1, NULL, 0, 0, 0 FROM DUAL WHERE @MISSING;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`,
    `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 23, 3356, 7994, 0, 0, 8, 0, 2756, 0, 0, '', 0, 0, 0, '', 'Sumi - Plans: Orcish War Leggings only after The Old Ways (note 70959+1)'
FROM DUAL WHERE @MISSING AND NOT EXISTS (SELECT 1 FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 3356 AND `SourceEntry` = 7994 AND `ConditionTypeOrReference` = 8 AND `ConditionValue1` = 2756);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'npc_vendor', 3356, 7994, 1, 0, '2026_11_26_17_world_everlake_sumi_orcish_war_leggings_plans.sql', 'note 70959+1 2026-11-17 (Sumi sells the plans after the quest)' FROM DUAL WHERE @MISSING;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 23, 3356, 7994, 8, '2026_11_26_17_world_everlake_sumi_orcish_war_leggings_plans.sql', 'note 70959+1 2026-11-17 (Sumi sells the plans after the quest)' FROM DUAL WHERE @MISSING;
COMMIT;


-- ===== Everlake 2026_11_26_18_world_everlake_step_one_rock_piles_mining.sql =====
-- Riverglades: the Rock Piles of "Step One: Rock" (649094, quest 95183) are found with Find Minerals and only count as
-- quest objects.
-- 2026_11_26_18_world_everlake_step_one_rock_piles_mining.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Blizzard's server-side note of 17 November 2026 (step 70959+1): "Quest "Step One: Rock" rockpiles will now be
-- tracked via Find Minerals (was Find Treasure) while on the quest." EG Link's object records of Rock Pile 649094: lock
-- 57 at client build 70938, lock 43 from 70959 on (70959 and 71037), and from 70959 the record lists the quest item
-- 271892 (the quest's objective). The realm still has lock 57 and no gameobject_questitem row. Here:
--   - Data0 (the chest's lock) 57 -> 43, only while it is still 57;
--   - gameobject_questitem 649094 / 0 / 271892, so the core treats the pile as a quest object (it lights up only for
--     players who need the rock).
--
-- The added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

START TRANSACTION;
UPDATE `gameobject_template` SET `Data0` = 43 WHERE `entry` = 649094 AND `type` = 3 AND `Data0` = 57;
SET @MISSING := (SELECT COUNT(*) = 0 FROM `gameobject_questitem` WHERE `GameObjectEntry` = 649094)
    AND (SELECT COUNT(*) FROM `gameobject_template` WHERE `entry` = 649094) = 1;
INSERT INTO `gameobject_questitem` (`GameObjectEntry`, `Idx`, `ItemId`, `VerifiedBuild`) SELECT 649094, 0, 271892, 70959 FROM DUAL WHERE @MISSING;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `file`, `note`)
SELECT 'gameobject_questitem', 649094, 0, '2026_11_26_18_world_everlake_step_one_rock_piles_mining.sql', 'EG Link object record 70959/71037 (questItems); note 70959+1 2026-11-17' FROM DUAL WHERE @MISSING;
COMMIT;


-- ===== Everlake 2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql =====
-- Master Mathias Shaw (332, SI:7 in Stormwind) gives rogues the letter for "The Manor, Ravenholdt" (6681).
-- 2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql: written by hand (2026-11-26).
--
-- Blizzard's server-side note of 17 November 2026 (step 70959+1): "A bin of mail has been discovered in SI:7 quarters
-- and Mathias Shaw can now give rogues the letter that they've been expecting for "The Manor, Ravenholdt"." On the
-- realm the rogue trainers (Osborne the Night Man 918, Anishar 4215, Hulfdan Blackbeard 5165 and others) already offer
-- "<Take the letter>" (broadcast text 8548, VMaNGOS): shown to rogues of level 24 or more who have not taken quest 6681
-- and do not hold the Elegant Letter 17126; choosing it runs action list 950000320, which casts Conjure Elegant Letter
-- 21100 on the player. Mathias Shaw's menu 4941 had no options. This gives his menu the same option, conditions and
-- script. The bin of mail itself is not spawned (no source places it).
-- GossipOptionID 98004941; OptionID is the menu's next free one; SmartAI ids 90/91 (332 already has SmartAI, ids 0-4).
--
-- Every added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

START TRANSACTION;
DROP TEMPORARY TABLE IF EXISTS `everlake_gossip_add`;
CREATE TEMPORARY TABLE `everlake_gossip_add` (`GossipOptionID` int NOT NULL PRIMARY KEY, `CreatureID` int unsigned NOT NULL, `MenuID` int unsigned NOT NULL, `OptionID` int unsigned NOT NULL DEFAULT 0, `OptionText` text NOT NULL, `BroadcastTextID` int NOT NULL, `Quest` int unsigned NOT NULL, `Spell` int unsigned NOT NULL, `missing` tinyint NOT NULL DEFAULT 0) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `everlake_gossip_add` (`GossipOptionID`, `CreatureID`, `MenuID`, `OptionText`, `BroadcastTextID`, `Quest`, `Spell`) VALUES
(98004941, 332, 4941, '<Take the letter>', 8548, 6681, 21100);
-- only where the option is not there yet, the creature uses this menu and has no C++ script
UPDATE `everlake_gossip_add` s SET s.`missing` = 1
WHERE NOT EXISTS (SELECT 1 FROM `gossip_menu_option` o WHERE o.`GossipOptionID` = s.`GossipOptionID`)
  AND NOT EXISTS (SELECT 1 FROM `everlake_import_rows` r WHERE r.`tbl` = 'gossip_menu_option' AND r.`k1` = s.`MenuID` AND r.`k3` = s.`GossipOptionID`)
  AND EXISTS (SELECT 1 FROM `creature_template_gossip` g WHERE g.`CreatureID` = s.`CreatureID` AND g.`MenuID` = s.`MenuID`)
  AND EXISTS (SELECT 1 FROM `creature_template` t WHERE t.`entry` = s.`CreatureID` AND t.`ScriptName` = '' AND t.`AIName` IN ('', 'SmartAI'))
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` x WHERE x.`entryorguid` = s.`CreatureID` AND x.`source_type` = 0 AND x.`id` IN (90, 91))
  AND EXISTS (SELECT 1 FROM `smart_scripts` x WHERE x.`entryorguid` = 950000320 AND x.`source_type` = 9);
UPDATE `everlake_gossip_add` s
SET s.`OptionID` = (SELECT COALESCE(MAX(o.`OptionID`) + 1, 0) FROM `gossip_menu_option` o WHERE o.`MenuID` = s.`MenuID`)
WHERE s.`missing` = 1;
INSERT INTO `gossip_menu_option` (`MenuID`, `GossipOptionID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `Language`, `Flags`,
    `ActionMenuID`, `ActionPoiID`, `GossipNpcOptionID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `SpellID`, `OverrideIconID`, `VerifiedBuild`)
SELECT s.`MenuID`, s.`GossipOptionID`, s.`OptionID`, 0, s.`OptionText`, s.`BroadcastTextID`, 0, 0, 0, 0, NULL, 0, 0, '', 0, NULL, NULL, 0
FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, s.`MenuID`, s.`OptionID`, 0, 0, 2,0,17126,1,0,'',1, 0, 0, '', 'Mathias Shaw letter option - not holding Elegant Letter 17126' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, s.`MenuID`, s.`OptionID`, 0, 0, 14,0,6681,0,0,'',0, 0, 0, '', 'Mathias Shaw letter option - quest 6681 not taken' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, s.`MenuID`, s.`OptionID`, 0, 0, 15,0,8,0,0,'',0, 0, 0, '', 'Mathias Shaw letter option - rogue' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, s.`MenuID`, s.`OptionID`, 0, 0, 27,0,24,3,0,'',0, 0, 0, '', 'Mathias Shaw letter option - level 24 or higher' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 15, s.`MenuID`, s.`OptionID`, 2, '2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql', 'note 70959+1 2026-11-17 (Mathias Shaw gives the letter); copy of the rogue trainers option 4' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 15, s.`MenuID`, s.`OptionID`, 14, '2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql', 'note 70959+1 2026-11-17 (Mathias Shaw gives the letter); copy of the rogue trainers option 4' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 15, s.`MenuID`, s.`OptionID`, 15, '2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql', 'note 70959+1 2026-11-17 (Mathias Shaw gives the letter); copy of the rogue trainers option 4' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 15, s.`MenuID`, s.`OptionID`, 27, '2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql', 'note 70959+1 2026-11-17 (Mathias Shaw gives the letter); copy of the rogue trainers option 4' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
UPDATE `creature_template` t JOIN `everlake_gossip_add` s ON s.`CreatureID` = t.`entry`
SET t.`AIName` = 'SmartAI' WHERE s.`missing` = 1 AND t.`AIName` = '' AND t.`ScriptName` = '';
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT s.`CreatureID`, 0, 90, 91, '', 62, 0, 100, 0, s.`MenuID`, s.`OptionID`, 0, 0, 0, '', 72, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,
    CONCAT('On gossip option ', s.`MenuID`, '/', s.`OptionID`, ' (Take the letter) - Close gossip') FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT s.`CreatureID`, 0, 91, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, '', 80, 950000320, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    'Linked - Run action list 950000320 (Conjure Elegant Letter 21100 on the invoker, as the rogue trainers)' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `file`, `note`)
SELECT 'gossip_menu_option', s.`MenuID`, s.`OptionID`, s.`GossipOptionID`, '2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql', 'note 70959+1 2026-11-17 (Mathias Shaw gives the letter); copy of the rogue trainers option 4' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `file`, `note`)
SELECT 'smart_scripts', s.`CreatureID`, 0, 90, '2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql', 'note 70959+1 2026-11-17 (Mathias Shaw gives the letter); copy of the rogue trainers option 4' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
INSERT INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `file`, `note`)
SELECT 'smart_scripts', s.`CreatureID`, 0, 91, '2026_11_26_19_world_everlake_mathias_shaw_ravenholdt_letter.sql', 'note 70959+1 2026-11-17 (Mathias Shaw gives the letter); copy of the rogue trainers option 4' FROM `everlake_gossip_add` s WHERE s.`missing` = 1;
DROP TEMPORARY TABLE `everlake_gossip_add`;
COMMIT;


-- ===== Everlake 2026_11_26_20_world_everlake_nethergarde_guards_no_loot.sql =====
-- Blasted Lands: the Nethergarde Keep guards drop no loot and are flagged as guards.
-- 2026_11_26_20_world_everlake_nethergarde_guards_no_loot.sql: written by hand (2026-11-26).
--
-- Blizzard's server-side note of 13 November 2026 (step 70938+1): "Blasted Lands - Nethergarde Keep guards no longer
-- drop loot and should have behavior consistent with other guards." The guards are Nethergarde Soldier 5999, Nethergarde
-- Officer 6003 and Nethergarde Elite 7851 (the keep's other people, miners, engineers, foremen, clerics, analysts and
-- riftwatchers, are not guards and keep their loot). Each loses its loot id (its own entry) and gets the guard and
-- no-experience extra flags (0x8000 | 0x40 = 32832), as the Ironforge Mountaineer and Stormwind City Patroller have.
-- Their pickpocket loot (the Soldier's) stays. Their loot rows stay (nothing else uses them).
-- Each changes only while it still holds the old values.
--
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing. Not checked in
-- game.

UPDATE `creature_template_difficulty` SET `LootID` = 0
WHERE `Entry` IN (5999, 6003, 7851) AND `LootID` = `Entry`;
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 32832
WHERE `entry` IN (5999, 6003, 7851) AND `flags_extra` = 0;


-- ===== Everlake 2026_11_26_21_world_everlake_fishing_rack_lures_for_everyone.sql =====
-- Camping: the Fishing Rack (612090) gives each player who uses it their own loot.
-- 2026_11_26_21_world_everlake_fishing_rack_lures_for_everyone.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Blizzard's server-side note of 16 November 2026 (step 70938+1): "The Fishing Rack now provides lures for everyone."
-- EG Link's object records of the Fishing Rack: up to client build 70938 a shared chest (lock 93, loot 139206 in
-- Data1, restock 300000 ms, 3-3 restocks, condition 150698, chest flags 4104 = not in combat + one looter); from 70959
-- on (70959 and 71037) lock 1634, no shared loot, chest flags 2316 (leave loot, not in combat, damage immune OK,
-- personal loot security off) and the same loot 139206 as personal loot (Data30). The realm still has the old record.
-- This writes the 70959 record's values, only while the row still holds the old ones. The loot table itself (Camper's
-- Lure 291005) is unchanged.
--
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing. Not checked in
-- game.

UPDATE `gameobject_template`
SET `Data0` = 1634, `Data1` = 0, `Data2` = 0, `Data4` = 0, `Data5` = 0, `Data17` = 0, `Data20` = 2316, `Data30` = 139206
WHERE `entry` = 612090 AND `type` = 3 AND `Data0` = 93 AND `Data1` = 139206 AND `Data2` = 300000 AND `Data4` = 3 AND `Data5` = 3
  AND `Data17` = 150698 AND `Data20` = 4104 AND `Data30` = 0;


-- ===== Everlake 2026_11_26_22_world_everlake_abyssal_bubble_no_parry_block.sql =====
-- The Drowned City: Captain Dreadrise's Abyssal Bubble (260150) can no longer parry or block.
-- 2026_11_26_22_world_everlake_abyssal_bubble_no_parry_block.sql: written by hand (2026-11-26).
--
-- Blizzard's server-side note of 16 November 2026 (step 70938+1): "The Drowned City: The Abyssal Bubble summoned by
-- Captain Dreadrise can no longer block, dodge or parry." The bubble has no extra flags, AI or script on the realm.
-- It gets CREATURE_FLAG_EXTRA_NO_PARRY (0x4) and CREATURE_FLAG_EXTRA_NO_BLOCK (0x10), only while its flags are still 0.
-- Not here: dodge. The core has no flag for it (a creature's dodge chance is a flat 5% plus auras, Unit.cpp), so that
-- part needs a core change.
--
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing. Not checked in
-- game.

UPDATE `creature_template` SET `flags_extra` = 20
WHERE `entry` = 260150 AND `flags_extra` = 0;


-- ===== Everlake 2026_11_26_40_world_everlake_quest_races.sql =====
-- Quest race masks: Silvia's Sword back to the Horde shaman quest live gives, and 41 Alliance quests whose mask was
-- stored as a rounded number that leaves out Humans, Dwarves and Night Elves.
-- 2026_11_26_40_world_everlake_quest_races.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Silvia's Sword (79363). Wowhead's WoW Forever page (https://www.wowhead.com/forever/quest=79363) gives it to Orc,
-- Tauren and Troll Shamans, started by Bath'rah the Windwatcher (6176, Alterac Mountains) and ended by Sirra Von'Indi
-- (268, Darkshire) or Bath'rah. QuestieDB agrees (races 162, classes 64, starters npc 6176 and item 281145, finishers
-- 268 and 6176), and the tracker's live sightings have it taken by the Horde. 2026_11_25_13 had moved it to the Alliance
-- mask from Icy Veins' record alone; Wowhead ranks above Icy Veins, so this puts back 162, adds the Shaman class and
-- lets Bath'rah give and take it. The sword item (281145) still starts it too.
--
-- 41 quests (Paladin quests such as A Newly Discovered Purpose... 81944, Just Compensation, Anthion's Parting Words,
-- Saving the Best for Last, and others) hold AllowableRaces 6130900294268440000: the Alliance mask 6130900294268439629
-- after a trip through a floating-point number. Its low bits read Gnome, Troll and Goblin instead of Human, Dwarf and
-- Night Elf, so Humans and Dwarves cannot take these quests. Icy Veins' WoW Forever database
-- (https://db.icy-veins.com/wow-forever/) records 6130900294268439629 for every one of the 41.
--
-- Each change applies only while the row still holds the old value. Running it again changes nothing. Not checked in game.

START TRANSACTION;

UPDATE `quest_template` SET `AllowableRaces` = 162 WHERE `ID` = 79363 AND `AllowableRaces` = 6130900294268439629;
UPDATE `quest_template_addon` SET `AllowableClasses` = 64 WHERE `ID` = 79363 AND `AllowableClasses` = 0;
INSERT IGNORE INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES (6176, 79363, 0);
INSERT IGNORE INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`) VALUES (6176, 79363, 0);

UPDATE `quest_template` SET `AllowableRaces` = 6130900294268439629
WHERE `AllowableRaces` = 6130900294268440000 AND `ID` IN (78093, 81944, 82135, 84163, 84164, 84165, 84166, 84167, 84168,
  84169, 84170, 84179, 84180, 84181, 84182, 84183, 84184, 84186, 84195, 84196, 84200, 84202, 86611, 88757, 88813, 88884,
  88917, 89038, 89470, 94829, 94843, 94885, 94926, 94980, 95198, 96377, 96771, 97420, 97448, 97449, 97450);

COMMIT;


-- ===== Everlake 2026_11_26_41_world_everlake_quest_givers_classic.sql =====
-- Three quests nobody can take or finish on the test realm: Ever After, Greater Friend of the Library (Horde side) and
-- A Lost Brother.
-- 2026_11_26_41_world_everlake_quest_givers_classic.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- Ever After (82062, Blackrock Depths): only taken by the Rugged Traveler (222530), nobody gives it. A Wowhead WoW Forever
--   comment (quest=82062, 2026-11-23) says you jump down to the dwarf, watch a bit of dialog, and receive and finish the
--   quest there; Icy Veins' objective is "Speak with the Rugged Traveler.". The Traveler is spawned and already a quest
--   giver (npcflag 2), so he gives it here too. Inferred: live gives it after his dialog; that conversation is not
--   scripted here.
-- Greater Friend of the Library (84394): Wowhead's WoW Forever page lists two enders, Jennea Cannon (5497) for the
--   Alliance and Oran Snakewrithe (7825) for the Horde; the test realm has only Jennea. Oran gives and takes every other
--   library book quest Jennea does (84395-84402), so he gives and takes this one too (the giving is inferred from those).
-- A Lost Brother (79940, Paladin): its one objective, "Speak with Katherine and Learn More", is a credit for creature
--   11080 ("[PH[ Combat Tester", a placeholder) that nothing gives. Icy Veins' text has Katherine the Pure (5492) tell the
--   story in the quest text itself and her progress text is empty, so the credit is given when the quest is accepted
--   from her (SmartAI on quest accept). Inferred from the texts; live's exact trigger is not recorded.
--
-- Running it again changes nothing. Not checked in game.

START TRANSACTION;

INSERT IGNORE INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES (222530, 82062, 0);

INSERT IGNORE INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES (7825, 84394, 0);
INSERT IGNORE INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`) VALUES (7825, 84394, 0);

-- Katherine the Pure: SmartAI only while she has no other AI or script
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 5492 AND `AIName` = '' AND `ScriptName` = '';
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`,
  `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`,
  `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`,
  `action_param6`, `action_param7`, `action_param_string`, `target_type`, `target_param1`, `target_param2`, `target_param3`,
  `target_param4`, `target_param_string`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 5492, 0, 0, 0, '', 19, 0, 100, 0, 79940, 0, 0, 0, 0, '', 33, 11080, 0, 0, 0, 0, 0, 0, NULL, 7, 0, 0, 0, 0, NULL,
  0, 0, 0, 0, 'Katherine the Pure - On Quest ''A Lost Brother'' Accepted - Quest Credit ''Speak with Katherine'''
FROM DUAL
WHERE EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 5492 AND `AIName` = 'SmartAI')
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` WHERE `entryorguid` = 5492 AND `source_type` = 0);

COMMIT;


-- ===== Everlake 2026_11_26_42_world_everlake_blasting_supplies.sql =====
-- Blasting Supplies (403041) for Stalk With The Earthmother (76156): the Venture Co. mine in Mulgore has one cart on the
-- test realm, live has thirteen.
-- 2026_11_26_42_world_everlake_blasting_supplies.sql: written by hand from the tracker's kept facts (2026-11-26).
--
-- The quest asks for 5 Seaforium Mining Charges (206157). Each comes from using a Blasting Supplies cart (goober 403041,
-- quest 76156, spell 412278 Collect Blasting Supplies creates the charge), and the test realm spawns one cart
-- (guid 21202192, near the mine mouth). Wowhead's WoW Forever object page (https://www.wowhead.com/forever/object=403041)
-- pins 13 carts inside the mine (Mulgore, UiMap 1412); Icy Veins' WoW Forever record has the same template.
-- 12 of those pins are added here; the pin at 59.2, 43.8 is left out because no floor of the mine model lies near the
-- mine's own creatures there. Map points are turned into world positions with the client's UiMapAssignment rectangles,
-- as the tracker's locator does. Heights from the server's maps and vmaps (tools/height.py): the mine is a model with
-- two or three floors on every vertical line, so each cart takes the floor nearest the height of the closest spawned
-- mine creature (Venture Co. Laborers/Supervisors, within 15 yards for most points). Respawn 120 s, as the existing cart.
--
-- Own guid block 920019500-920019599 (this file uses 920019500-920019511). Every row is recorded in
-- everlake_import_rows. Never edit this file once it is deployed: a later fix is a new file. Running it again changes
-- nothing. Not checked in game.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added (docs/forever-import.md)';

SET @EVERLAKE_FILE := '2026_11_26_42_world_everlake_blasting_supplies.sql';
START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS `everlake_new_carts`;
CREATE TEMPORARY TABLE `everlake_new_carts` (`guid` bigint unsigned NOT NULL, `x` float NOT NULL, `y` float NOT NULL, `z` float NOT NULL, `note` varchar(255) NOT NULL, PRIMARY KEY (`guid`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `everlake_new_carts` (`guid`, `x`, `y`, `z`, `note`) VALUES
(920019500, -1735.15, -1053.32, 118.45, 'Wowhead Forever object=403041 pin 57.4, 48.8; height.py mine floor'),
(920019501, -1735.15, -1059.48, 118.56, 'Wowhead Forever object=403041 pin 57.5, 48.8; height.py mine floor'),
(920019502, -1612.09, -1071.79, 102.45, 'Wowhead Forever object=403041 pin 57.7, 45.8; height.py mine floor'),
(920019503, -1698.23, -1114.87, 121.52, 'Wowhead Forever object=403041 pin 58.4, 47.9; height.py mine floor'),
(920019504, -1579.27, -1121.02, 103.71, 'Wowhead Forever object=403041 pin 58.5, 45.0; height.py mine floor'),
(920019505, -1665.41, -1164.1, 113.35, 'Wowhead Forever object=403041 pin 59.2, 47.1; height.py mine floor'),
(920019506, -1751.56, -1176.41, 123.1, 'Wowhead Forever object=403041 pin 59.4, 49.2; height.py mine floor'),
(920019507, -1743.35, -1188.72, 123.16, 'Wowhead Forever object=403041 pin 59.6, 49.0; height.py mine floor'),
(920019508, -1624.39, -1207.18, 135.56, 'Wowhead Forever object=403041 pin 59.9, 46.1; height.py mine floor'),
(920019509, -1669.52, -1213.33, 129.03, 'Wowhead Forever object=403041 pin 60.0, 47.2; height.py mine floor'),
(920019510, -1784.38, -1219.49, 115.91, 'Wowhead Forever object=403041 pin 60.1, 50.0; height.py mine floor'),
(920019511, -1628.5, -1361.03, 132.49, 'Wowhead Forever object=403041 pin 62.4, 46.2; height.py mine floor');

INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT c.`guid`, 403041, 1, 0, 0, '0', 0, 0, 0, -1, c.`x`, c.`y`, c.`z`, 0, 0, 0, 0, 1, 120, 255, 1, '', NULL, 0
FROM `everlake_new_carts` c
WHERE EXISTS (SELECT 1 FROM `gameobject_template` WHERE `entry` = 403041)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` g WHERE g.`guid` = c.`guid`);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject', c.`guid`, 0, 0, 0, @EVERLAKE_FILE, c.`note`
FROM `everlake_new_carts` c JOIN `gameobject` g ON g.`guid` = c.`guid` AND g.`id` = 403041;
DROP TEMPORARY TABLE `everlake_new_carts`;

COMMIT;


-- ===== Everlake 2026_11_26_50_world_everlake_dungeon_quest_givers.sql =====
-- Givers and takers for live WoW Forever dungeon quests the realm had none for (tracker quest gaps, 2026-11-26).
-- 2026_11_26_50_world_everlake_dungeon_quest_givers.sql: written by hand, not tried in game.
--
--   96087 In Demand - Plague Records: Pix Xizzix (227853, Booty Bay) starts and ends it. Icy Veins' objective text
--     names him ("bring them to Pix Xizzix in Booty Bay"); its three siblings 96075, 96076 and 96088 ("In Demand - ...")
--     already start and end at 227853 on the realm. The three records already drop from Gandling, Rivendare and
--     Balnazzar on the realm.
--   96337 More Valuable Than Gold: Mason Connery (264770, inside Alcaz Prison) starts it. Its text is his ("I told you
--     that I'd make it worth your while to free me ... Take this"), Icy Veins and Wowhead say Mason's Note (274077) is
--     the provided item, and the quest's end, Connery's Trunk (611086), and the Loose Floorboard (653847) are already
--     spawned in Moonbrook. This makes the Document Box (274041) obtainable, so 96376, 96377 and 96379 (State Secrets,
--     which ask for it) can be done again.
--   95454 The Honor of the Kor'kron: Commander Folkar (260386, inside Alcaz Prison) starts it. Its text is his (Icy
--     Veins: "My good axe arm is broken ... I will wait for you here while you search for him."). INFERRED from that
--     text: no source lists a giver.
--   96369 Bad News for Folkar: Commander Folkar (260386) ends it. Objective "Report back to Commander Folkar." and Icy
--     Veins' completion text "So Wrynn is dead then..." name him.
--   98830 The Broken Glaive: the Shen'dralar Ancient (14358, Dire Maul) ends it: "Deliver Tortheldrin's Broken Glaive
--     to the Shen'dralar Ancient in Dire Maul." (Icy Veins, Wowhead). Who starts it is not in any source: its text is
--     read at Prince Tortheldrin's corpse, so it needs the core (not done here).
--
-- Not done here (no source has the object): 95262 and 95454 end at, and 95263 and 96369 start from, a note that live
-- puts on the ground when Blazeroar (255702, C++ script classic_boss_alcaz_prison) dies; its gameobject id is not in
-- any source the tracker has, nor on the realm.
--
-- Rows are only added where none exist, each recorded in everlake_import_rows. Never edit this file once it is
-- deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_50_world_everlake_dungeon_quest_givers.sql';

START TRANSACTION;

-- quest givers
DROP TEMPORARY TABLE IF EXISTS `everlake_qg_stage`;
CREATE TEMPORARY TABLE `everlake_qg_stage` (`n` int NOT NULL PRIMARY KEY, `id` int unsigned NOT NULL, `quest` int unsigned NOT NULL, `note` varchar(255) NOT NULL, `missing` tinyint NOT NULL DEFAULT 0);
INSERT INTO `everlake_qg_stage` (`n`, `id`, `quest`, `note`) VALUES
(1, 227853, 96087, 'Icy Veins objective text names Pix Xizzix; siblings 96075/96076/96088 start at 227853'),
(2, 264770, 96337, 'quest text is Mason Connery''s; Icy Veins + Wowhead: Mason''s Note 274077 provided'),
(3, 260386, 95454, 'INFERRED: Icy Veins quest text is Commander Folkar''s');
UPDATE `everlake_qg_stage` s SET s.`missing` = 1
WHERE NOT EXISTS (SELECT 1 FROM `creature_queststarter` t WHERE t.`id` = s.`id` AND t.`quest` = s.`quest`)
  AND NOT EXISTS (SELECT 1 FROM `everlake_import_rows` r WHERE r.`tbl` = 'creature_queststarter' AND r.`k1` = s.`id` AND r.`k2` = s.`quest`)
  AND EXISTS (SELECT 1 FROM `creature_template` c WHERE c.`entry` = s.`id`)
  AND EXISTS (SELECT 1 FROM `quest_template` q WHERE q.`ID` = s.`quest`);
INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) SELECT s.`id`, s.`quest`, 0 FROM `everlake_qg_stage` s WHERE s.`missing` = 1 ORDER BY s.`n`;
UPDATE `creature_template` c JOIN `everlake_qg_stage` s ON s.`id` = c.`entry` SET c.`npcflag` = c.`npcflag` | 2 WHERE s.`missing` = 1 AND (c.`npcflag` & 2) = 0;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_queststarter', s.`id`, s.`quest`, 0, 0, @EVERLAKE_FILE, s.`note` FROM `everlake_qg_stage` s WHERE s.`missing` = 1;
DROP TEMPORARY TABLE `everlake_qg_stage`;

-- quest takers
DROP TEMPORARY TABLE IF EXISTS `everlake_qe_stage`;
CREATE TEMPORARY TABLE `everlake_qe_stage` (`n` int NOT NULL PRIMARY KEY, `id` int unsigned NOT NULL, `quest` int unsigned NOT NULL, `note` varchar(255) NOT NULL, `missing` tinyint NOT NULL DEFAULT 0);
INSERT INTO `everlake_qe_stage` (`n`, `id`, `quest`, `note`) VALUES
(1, 227853, 96087, 'Icy Veins objective text names Pix Xizzix; siblings 96075/96076/96088 end at 227853'),
(2, 260386, 96369, 'objective "Report back to Commander Folkar."; Icy Veins completion text'),
(3, 14358, 98830, 'objective "Deliver ... to the Shen''dralar Ancient in Dire Maul." (Icy Veins, Wowhead)');
UPDATE `everlake_qe_stage` s SET s.`missing` = 1
WHERE NOT EXISTS (SELECT 1 FROM `creature_questender` t WHERE t.`id` = s.`id` AND t.`quest` = s.`quest`)
  AND NOT EXISTS (SELECT 1 FROM `everlake_import_rows` r WHERE r.`tbl` = 'creature_questender' AND r.`k1` = s.`id` AND r.`k2` = s.`quest`)
  AND EXISTS (SELECT 1 FROM `creature_template` c WHERE c.`entry` = s.`id`)
  AND EXISTS (SELECT 1 FROM `quest_template` q WHERE q.`ID` = s.`quest`);
INSERT INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`) SELECT s.`id`, s.`quest`, 0 FROM `everlake_qe_stage` s WHERE s.`missing` = 1 ORDER BY s.`n`;
UPDATE `creature_template` c JOIN `everlake_qe_stage` s ON s.`id` = c.`entry` SET c.`npcflag` = c.`npcflag` | 2 WHERE s.`missing` = 1 AND (c.`npcflag` & 2) = 0;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_questender', s.`id`, s.`quest`, 0, 0, @EVERLAKE_FILE, s.`note` FROM `everlake_qe_stage` s WHERE s.`missing` = 1;
DROP TEMPORARY TABLE `everlake_qe_stage`;

COMMIT;


-- ===== Everlake 2026_11_26_51_world_everlake_dungeon_quest_objects.sql =====
-- Quest objects in dungeons that the realm has templates and loot for but never spawned (tracker quest gaps, 2026-11-26).
-- 2026_11_26_51_world_everlake_dungeon_quest_objects.sql: written by hand, not tried in game.
--
-- No source the tracker has gives a position for these objects (Wowhead Forever shows them only as "in a dungeon",
-- Icy Veins and EG Link have no spawn points). Every spot below is INFERRED from the Wowhead Forever comments quoted,
-- placed next to the realm's own spawn of the boss the comment names, with the height of the server's maps and
-- vmaps (ForeverTracker tools/height.py). Orientation 0, rotation 0 and a 30 s respawn (60 s for the Root Caps, which
-- each player needs 10 of) are INFERRED. A look in game should move them where live has them.
--
--   660624 The Coldbringer's Eye (96773, 97196), Razorfen Downs (129): "on the left of the last boss. you click it to
--     pick it up" (Wowhead quest 96773). 5 yards to the left of Amnennar the Coldbringer (7358) as one faces him.
--   650929 The Lost Magic of the Runemasters (96800), Scarlet Monastery Library (189): "in the last boss room of
--     Arcanist Doan ... On a table on the right side. Red colour book." (Wowhead quest 96800). On the desk on the right
--     as one walks into Doan's room, beside the realm's Civil War in the Plaguelands book (175761), height of the desk top.
--   660652 Shard of Pure Light (96776, item An'she's Radiance), Maraudon (349): "its behind the Mountain Giant Boss"
--     (Wowhead item 277140), read as Landslide (12203): 8 yards behind his spawn.
--   612179 Earth Song Splash (93404, Vial of Earth Song Water), Maraudon (349): "Interactable object below a rock bridge
--     near the crocolisk boss ... the bridge to final boss (Princess). Once you kill the boss, you jump down and swim to
--     the cave opposite ... in the water." (Wowhead object 612179). On the water floor at Rotgrip's (13596) spawn.
--   570888 Totem of Ursol (92066), Blackmaw Hold (2974): "Located in the room of Elder Shaman Bloodmane, on the opposite
--     side on a pedestal." (Wowhead item 249693). 13 yards west of Elder Shaman Bloodmane (247209), across from his
--     Devotees.
--   570890 Totem of Ursoc (92066), Blackmaw Hold (2974): "outside the room of Blackmaw Behemoth and Clawbert" (Wowhead
--     item 249694). 12 yards in front of Blackmaw Behemoth (247207), the way it faces.
--   571511 Nordrassil Root Cap x14 (92343, 92344, 10 each), Blackmaw Hold (2974): "collected from the walls inside the
--     big cave ... after killing the first three bosses ... Level 3 and the levels below it" (Wowhead item 250773).
--     A few yards from the realm's creature groups below the first three bosses (z 145-231).
--   648579 Drained Crystal Fragment (95926), Shaper's Terrace (3001): "On the floor, next to the achromatic Crystal in
--     the Tar Pits" (Wowhead quest 95926); "The Achromatic Crystal is in the middle of the tar pit to the east of the
--     entrance towards Thunderhoof" (Wowhead quest 95925). Between Venomridge (261813) and the tar pit's Archival Panel.
--
-- Own guid block 920019600-920019799 (920019600-920019620 used). Each spawn is added only while its guid is free and
-- the object has no spawn yet, and recorded in everlake_import_rows. Never edit this file once it is deployed: a later
-- fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_51_world_everlake_dungeon_quest_objects.sql';

START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS `everlake_dqo_stage`;
CREATE TEMPORARY TABLE `everlake_dqo_stage` (
  `guid` bigint unsigned NOT NULL PRIMARY KEY, `id` int unsigned NOT NULL, `map` smallint unsigned NOT NULL,
  `diff` varchar(100) NOT NULL, `x` float NOT NULL, `y` float NOT NULL, `z` float NOT NULL, `respawn` int NOT NULL,
  `note` varchar(255) NOT NULL, `ok` tinyint NOT NULL DEFAULT 0);
INSERT INTO `everlake_dqo_stage` (`guid`, `id`, `map`, `diff`, `x`, `y`, `z`, `respawn`, `note`) VALUES
(920019600, 660624, 129, '1', 2407.0, 964.4, 55.24, 30, 'INFERRED: left of Amnennar (Wowhead quest 96773 comment); height.py'),
(920019601, 650929, 189, '1', 148.8, -412.2, 19.84, 30, 'INFERRED: table on the right in Doan''s room (Wowhead quest 96800 comments); height.py'),
(920019602, 660652, 349, '1', 364.3, -183.0, -59.90, 30, 'INFERRED: behind Landslide (Wowhead item 277140 comment); height.py'),
(920019603, 612179, 349, '1', 42.1, -66.0, -206.28, 30, 'INFERRED: in the water at Rotgrip (Wowhead object 612179 comment); height.py'),
(920019604, 570888, 2974, '1,201', 3482.0, 3168.0, 125.65, 30, 'INFERRED: Bloodmane''s room, opposite side (Wowhead item 249693 comment); height.py'),
(920019605, 570890, 2974, '1,201', 3659.1, 2915.4, 247.92, 30, 'INFERRED: outside Behemoth and Clawbert''s room (Wowhead item 249694 comment); height.py'),
(920019606, 571511, 2974, '1,201', 3554.0, 2981.0, 144.98, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019607, 571511, 2974, '1,201', 3496.0, 3036.0, 145.38, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019608, 571511, 2974, '1,201', 3469.0, 3056.0, 164.07, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019609, 571511, 2974, '1,201', 3556.0, 3116.0, 184.88, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019610, 571511, 2974, '1,201', 3309.0, 2926.0, 203.56, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019611, 571511, 2974, '1,201', 3436.0, 2854.0, 204.02, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019612, 571511, 2974, '1,201', 3414.0, 2836.0, 209.71, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019613, 571511, 2974, '1,201', 3331.0, 2881.0, 208.14, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019614, 571511, 2974, '1,201', 3404.0, 2889.0, 213.28, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019615, 571511, 2974, '1,201', 3524.0, 2829.0, 223.26, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019616, 571511, 2974, '1,201', 3349.0, 2981.0, 230.35, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019617, 571511, 2974, '1,201', 3686.0, 2941.0, 191.01, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019618, 571511, 2974, '1,201', 3589.0, 2946.0, 172.15, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019619, 571511, 2974, '1,201', 3651.0, 2874.0, 172.07, 60, 'INFERRED: big cave below the first three bosses (Wowhead item 250773 comment); height.py'),
(920019620, 648579, 3001, '1,201', -5921.0, -1217.0, 9.27, 30, 'INFERRED: by the Achromatic Crystal in the tar pit (Wowhead quests 95925/95926 comments); height.py');
-- a spawn goes in while its guid is free, the template exists and the object has no spawn but this file's own
UPDATE `everlake_dqo_stage` s SET s.`ok` = 1
WHERE EXISTS (SELECT 1 FROM `gameobject_template` t WHERE t.`entry` = s.`id`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` g WHERE g.`guid` = s.`guid`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` g WHERE g.`id` = s.`id` AND (g.`guid` < 920019600 OR g.`guid` > 920019799));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT s.`guid`, s.`id`, s.`map`, 0, 0, s.`diff`, 0, 0, 0, -1, s.`x`, s.`y`, s.`z`, 0, 0, 0, 0, 1, s.`respawn`, 255, 1, '', NULL, 0
FROM `everlake_dqo_stage` s WHERE s.`ok` = 1 ORDER BY s.`guid`;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject', s.`guid`, 0, 0, 0, @EVERLAKE_FILE, s.`note` FROM `everlake_dqo_stage` s WHERE s.`ok` = 1;
DROP TEMPORARY TABLE `everlake_dqo_stage`;

COMMIT;


-- ===== Everlake 2026_11_26_60_world_everlake_test_your_theory_skull.sql =====
-- 93045 Test Your Theory (Desolace): "dispel the necromantic curse present on the Accursed Skull". Its objective counts
-- credit 253754 "[DNT] Kill Credit: Dispel the Accursed Skull", which nothing on the realm gives.
-- 2026_11_26_60_world_everlake_test_your_theory_skull.sql: written by hand, not tried in game (2026-11-26).
--
-- How live does it (sources):
--   Wowhead Forever quest 93045, comment 6470595 (kept by the tracker): loot Uthek's Staff by the pond, combine it with
--     the crystal into Uthek's Draenethyst Staff (256061), "then use that staff on the pile with the skull on top (right
--     next to where you found Uthek's Staff)".
--   Client DB2: the staff's spell 1260031 Dispel Curse needs spell focus 2243 (SpellCastingRequirements), aims at a
--     spot (TARGET_DEST_DEST) and hits the world objects within 4 yards of it (TARGET_GAMEOBJECT_DEST_AREA, radius 26).
--     Spell 1259892 Kill Credit (DNT) holds the credit for 253754 (effect 90).
--   Icy Veins gameobject 587339 "Accursed Skull": type 8 (spell focus), focus 2243, size 3, model 114687, Data as
--     recorded below; Icy Veins 587341 "Bone Pile" (type 5, model 114714, size 0.5) is the pile under it. Neither had a
--     template or spawn on the realm. (587276, also named Accursed Skull, is the lootable skull of 93041 in the Valley of
--     Bones and is left alone.)
--
-- Rows:
--   1. Templates for 587339 and 587341, from the Icy Veins records.
--   2. One spawn of each beside the realm's only Uthek's Staff (587338, guid 974002113, -2011.00 2332.49 56.84), 3 yards
--      east of it: the comment puts the pile "right next to" the staff, no source gives its exact spot. Height from the
--      realm's maps (ForeverTracker tools/height.py, terrain 56.65). Orientation 0 and respawn 300 s (as the staff)
--      are INFERRED.
--   3. The skull gets a SmartGameObjectAI: when Dispel Curse (1260031) hits it, the caster gets the credit 253754.
--      A spell condition keeps the spell's object-area target to the skull, so no other object near the spot is hit.
--
-- Guids: objects 920019800-920019801 (this group's block 920019800-920020199).
-- Rows are only added where none exist. Each added row is recorded in everlake_import_rows. Never edit this file once
-- it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_60_world_everlake_test_your_theory_skull.sql';

START TRANSACTION;

-- 1. Templates (Icy Veins gameobject records; Data0-34 = their props).
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `Data33`, `Data34`, `ContentTuningId`, `RequiredLevel`, `AIName`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 587339, 8, 114687, 'Accursed Skull', '', '', '', 3, 2243, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5841, 0, '', '', NULL, 0
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `gameobject_template` g WHERE g.`entry` = 587339)
UNION ALL
SELECT 587341, 5, 114714, 'Bone Pile', '', '', '', 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5841, 0, '', '', NULL, 0
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `gameobject_template` g WHERE g.`entry` = 587341);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject_template', g.`entry`, 0, 0, 0, @EVERLAKE_FILE, CONCAT('Icy Veins gameobject=', g.`entry`)
FROM `gameobject_template` g
WHERE (g.`entry` = 587339 AND g.`type` = 8 AND g.`Data0` = 2243 OR g.`entry` = 587341 AND g.`type` = 5 AND g.`displayId` = 114714)
  AND g.`VerifiedBuild` = 0;

-- 2. Spawns beside Uthek's Staff.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT s.`guid`, s.`id`, 1, 0, 0, '0', 0, 0, 0, -1, -2008.00, 2332.49, 56.65, 0, 0, 0, 0, 1, 300, 255, 1, '', NULL, 0 FROM (
  SELECT 920019800 AS `guid`, 587341 AS `id`
  UNION ALL SELECT 920019801, 587339
) s
WHERE EXISTS (SELECT 1 FROM `gameobject_template` t WHERE t.`entry` = s.`id`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` g WHERE g.`guid` = s.`guid`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` g WHERE g.`id` = s.`id`);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject', g.`guid`, 0, 0, 0, @EVERLAKE_FILE, 'Wowhead comment 6470595: next to Uthek''s Staff; height.py; spot, orientation and respawn INFERRED'
FROM `gameobject` g WHERE g.`guid` IN (920019800, 920019801) AND g.`id` IN (587339, 587341);

-- 3. Dispel Curse on the skull gives the credit.
SET @EVERLAKE_AI := (SELECT COUNT(*) = 1 FROM `gameobject_template` WHERE `entry` = 587339 AND `AIName` = '' AND `ScriptName` = '')
  AND (SELECT COUNT(*) = 0 FROM `smart_scripts` WHERE `entryorguid` = 587339 AND `source_type` = 1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 587339, 1, 0, 0, '', 8, 0, 100, 0, 1260031, 0, 0, 0, 0, '', 33, 253754, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Accursed Skull - On spell hit Dispel Curse (1260031) - Quest credit 253754 (Test Your Theory 93045)'
FROM DUAL WHERE @EVERLAKE_AI = 1;
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI'
WHERE `entry` = 587339 AND `AIName` = '' AND `ScriptName` = '' AND @EVERLAKE_AI = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', 587339, 1, 0, 0, @EVERLAKE_FILE, 'client SpellEffect 1260031 + 1259892 (credit 253754); Wowhead comment 6470595'
FROM DUAL WHERE @EVERLAKE_AI = 1;

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 13, 1, 1260031, 0, 0, 31, 0, 5, 587339, 0, '', 0, 0, 0, '', 'Dispel Curse hits only the Accursed Skull (Test Your Theory 93045)'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 13 AND c.`SourceEntry` = 1260031);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 13, 1, 1260031, 0, @EVERLAKE_FILE, 'implicit target of Dispel Curse: Accursed Skull 587339'
FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 13 AND c.`SourceGroup` = 1 AND c.`SourceEntry` = 1260031 AND c.`ConditionValue2` = 587339;

COMMIT;


-- ===== Everlake 2026_11_26_61_world_everlake_shendralar_pylons_credit.sql =====
-- 96018 Powering the Pylons (Shen'dralas): "empower the pylons". Its objectives count credits 263435 "[DNT] Kill Credit:
-- Western pylon repaired" and 263436 "[DNT] Kill Credit: Eastern pylon repaired", which nothing on the realm gives.
-- 2026_11_26_61_world_everlake_shendralar_pylons_credit.sql: written by hand, not tried in game (2026-11-26).
--
-- How live does it (sources):
--   Client DB2: the Pile of Pylon Parts (271882) casts 1289727 Repair and Recharge Pylon: a dummy on a nearby world
--     object (TARGET_GAMEOBJECT_NEARBY_ENTRY), with two more dummies naming 263435 and 263436. The credit is given on
--     the server, so the realm needs to give it itself. The core has no script for the spell, the item or the objects.
--   EG Link item_uses + objectives (builds up to 71091, CC BY 4.0): players used the Pile at -2379.7 1133.4 (objective 2,
--     the western credit) and at -2215.6 522.9 (objective 3, the eastern credit).
--   The realm's Shen'dralar Pylons stand there: 577959 (two spawns, -2369.9 1129.6 and -2381.8 1128.3, the western one)
--     and 577960 (-2217.2 520.3, the eastern one); both from EG Link live data, both without AI.
--
-- Rows: each pylon gets a SmartGameObjectAI that gives the caster its credit when 1289727 hits it, and a spell condition
-- makes the spell's nearby-object target one of the two pylons (without one, the core takes any object near the caster).
-- Rows are only added where the pylons have no AI. Each added row is recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_61_world_everlake_shendralar_pylons_credit.sql';

START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS `everlake_pylon_stage`;
CREATE TEMPORARY TABLE `everlake_pylon_stage` (`entry` int unsigned NOT NULL, `credit` int unsigned NOT NULL, `comment` varchar(255) NOT NULL, `ok` tinyint NOT NULL DEFAULT '0', PRIMARY KEY (`entry`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `everlake_pylon_stage` (`entry`, `credit`, `comment`) VALUES
(577959, 263435, 'Shen''dralar Pylon (west) - On spell hit Repair and Recharge Pylon (1289727) - Quest credit 263435 (Powering the Pylons 96018)'),
(577960, 263436, 'Shen''dralar Pylon (east) - On spell hit Repair and Recharge Pylon (1289727) - Quest credit 263436 (Powering the Pylons 96018)');
UPDATE `everlake_pylon_stage` s
JOIN `gameobject_template` g ON g.`entry` = s.`entry` AND g.`AIName` = '' AND g.`ScriptName` = ''
SET s.`ok` = 1
WHERE NOT EXISTS (SELECT 1 FROM `smart_scripts` d WHERE d.`entryorguid` = s.`entry` AND d.`source_type` = 1);

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT s.`entry`, 1, 0, 0, '', 8, 0, 100, 0, 1289727, 0, 0, 0, 0, '', 33, s.`credit`, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, s.`comment`
FROM `everlake_pylon_stage` s WHERE s.`ok` = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', s.`entry`, 1, 0, 0, @EVERLAKE_FILE, 'client SpellEffect 1289727; EG Link item_uses + objectives positions'
FROM `everlake_pylon_stage` s WHERE s.`ok` = 1;
UPDATE `gameobject_template` g JOIN `everlake_pylon_stage` s ON s.`entry` = g.`entry`
SET g.`AIName` = 'SmartGameObjectAI'
WHERE s.`ok` = 1 AND g.`AIName` = '' AND g.`ScriptName` = '';

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 13, 1, 1289727, 0, t.`grp`, 31, 0, 5, t.`entry`, 0, '', 0, 0, 0, '', 'Repair and Recharge Pylon targets a Shen''dralar Pylon (Powering the Pylons 96018)'
FROM (SELECT 0 AS `grp`, 577959 AS `entry` UNION ALL SELECT 1, 577960) t
WHERE NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 13 AND c.`SourceEntry` = 1289727)
  AND EXISTS (SELECT 1 FROM `everlake_pylon_stage` s WHERE s.`ok` = 1);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 13, 1, 1289727, c.`ElseGroup`, @EVERLAKE_FILE, CONCAT('implicit target of 1289727: ', c.`ConditionValue2`)
FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 13 AND c.`SourceGroup` = 1 AND c.`SourceEntry` = 1289727 AND c.`ConditionTypeOrReference` = 31;

DROP TEMPORARY TABLE IF EXISTS `everlake_pylon_stage`;

COMMIT;


-- ===== Everlake 2026_11_26_62_world_everlake_sign_quests_givers.sql =====
-- Givers and takers for the crafting-sign quests at the Great Forge and in Orgrimmar (2026-11-26):
--   95817 Rotgath Stonebeard ("Meet Rotgath Stonebeard near the Great Forge in Ironforge"),
--   95818 A Quick Craft ("Bring the requested materials to Rotgath Stonebeard near the Great Forge in Ironforge"),
--   95821 A Quick Craft ("Bring the requested materials to Karolek in the Kodohide Leatherworkers shop in Orgrimmar").
-- 2026_11_26_62_world_everlake_sign_quests_givers.sql: written by hand, not tried in game.
--
-- Sources: the quests' own texts (Icy Veins / NorgannonDB objectives above) and the realm's quest chain on the PTR:
--   Alliance: 95816 Sign Me Up! is taken by Elaine Compton (256391, Contract Coordinator) and names 95817 as its
--     RewardNextQuest; 95817 names 95818 as its RewardNextQuest; quest_template_addon has 95817 after 95816 and 95818
--     after 95817.
--   Horde, the same chain: Jornah (256388) takes 95819 and gives 95820 (RewardNextQuest 95820), Karolek (3365) takes
--     95820 and 95821; 95820 names 95821 as its RewardNextQuest, but nobody gave 95821.
-- So, as the Horde chain already does, the NPC who takes a quest gives the next one:
--   Elaine Compton (256391) gives 95817; Rotgath Stonebeard (10276, Expert Blacksmith, Ironforge) takes 95817, gives
--   95818 and takes it; Karolek (3365) gives 95821. INFERRED from the chain: no source records the givers (Icy Veins
--   and Forever Changes have no giver rows for these quests). The core offers RewardNextQuest only from an NPC that
--   starts it, hence the starter rows. Rotgath gets the quest-giver flag.
-- Rows are only added where missing. Never edit this file once it is deployed: a later fix is a new file. Running it
-- again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_62_world_everlake_sign_quests_givers.sql';

START TRANSACTION;

INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`)
SELECT s.`id`, s.`quest`, 0 FROM (
  SELECT 256391 AS `id`, 95817 AS `quest`
  UNION ALL SELECT 10276, 95818
  UNION ALL SELECT 3365, 95821
) s
WHERE EXISTS (SELECT 1 FROM `creature_template` c WHERE c.`entry` = s.`id`)
  AND EXISTS (SELECT 1 FROM `quest_template` q WHERE q.`ID` = s.`quest`)
  AND NOT EXISTS (SELECT 1 FROM `creature_queststarter` x WHERE x.`quest` = s.`quest`);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_queststarter', x.`id`, x.`quest`, 0, 0, @EVERLAKE_FILE, 'INFERRED from RewardNextQuest chain 95816-95818 / 95819-95821'
FROM `creature_queststarter` x WHERE (x.`id`, x.`quest`) IN ((256391, 95817), (10276, 95818), (3365, 95821));

INSERT INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`)
SELECT s.`id`, s.`quest`, 0 FROM (
  SELECT 10276 AS `id`, 95817 AS `quest`
  UNION ALL SELECT 10276, 95818
) s
WHERE EXISTS (SELECT 1 FROM `creature_template` c WHERE c.`entry` = s.`id`)
  AND EXISTS (SELECT 1 FROM `quest_template` q WHERE q.`ID` = s.`quest`)
  AND NOT EXISTS (SELECT 1 FROM `creature_questender` x WHERE x.`quest` = s.`quest`);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_questender', x.`id`, x.`quest`, 0, 0, @EVERLAKE_FILE, 'quest text: Rotgath Stonebeard near the Great Forge'
FROM `creature_questender` x WHERE (x.`id`, x.`quest`) IN ((10276, 95817), (10276, 95818));

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2
WHERE `entry` = 10276 AND (`npcflag` & 2) = 0
  AND EXISTS (SELECT 1 FROM `creature_queststarter` x WHERE x.`id` = 10276);

COMMIT;


-- ===== Everlake 2026_11_26_63_world_everlake_wennzut_togglespring.sql =====
-- Wennzut Togglespring (249550), who gives 92094 Rocket Gnomes ("Wennzut Togglespring lost sight of his brother,
-- Fenwick, floating in his parachute into Hyjal"). The quest is taken by his brother Fenwick (249549) in Mount Hyjal, but
-- the realm had no Wennzut, so nobody gave it. 2026-11-26.
-- 2026_11_26_63_world_everlake_wennzut_togglespring.sql: written by hand from the tracker's kept facts, not tried in game.
--
-- Sources:
--   Wowhead Forever quest 92094, comment 6478099: the quest starts at Wennzut Togglespring (npc=249550), "in the
--     mountains between Winterspring and Felwood", reached by the old Dancing Troll Village path.
--   Icy Veins npc=249550: name, humanoid (type 7), unit class 2, health multiplier 1.05, display 146930 (scale 1),
--     level 57 (UiMap 1452), and two sightings on the Winterspring map (UiMap 1452) at 26.83 43.99 (1 player) and
--     27.63 44.11 (2 players).
--   Client CreatureDisplayInfo: display 146930 uses model 6837, the model of Fenwick's display 131979, so its
--     creature_model_info (bounding radius 0.306, reach 1.5) is copied from 131979.
-- One spawn at the sighting seen by two players: 27.63 44.11 -> map 1 6445.46 -2278.40, height 634.15 from the realm's
--   maps (ForeverTracker tools/height.py --zone 618, terrain). The other sighting is 57 yards off.
-- INFERRED, as for his brother Fenwick on the realm: faction 12, speeds, attack times, no subname, orientation 0,
--   respawn 300 s. No AI, no gossip text: he only gives the quest.
--
-- Guid: creature 920019810 (this group's block 920019800-920020199).
-- No template is added where the realm already has one; the spawn only while the template is this file's.
-- Each added row is recorded in everlake_import_rows. Never edit this file once it is deployed: a later fix is a new
-- file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_63_world_everlake_wennzut_togglespring.sql';

START TRANSACTION;

SET @EVERLAKE_M146930 := (SELECT COUNT(*) = 0 FROM `creature_model_info` WHERE `DisplayID` = 146930);
INSERT IGNORE INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`, `VerifiedBuild`)
SELECT 146930, 0.306, 1.5, 0, 0 FROM DUAL WHERE @EVERLAKE_M146930 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_model_info', 146930, 0, 0, 0, @EVERLAKE_FILE, 'copied from display 131979 (same model 6837)' FROM DUAL WHERE @EVERLAKE_M146930 = 1;

SET @EVERLAKE_NOTE := 'Icy Veins npc=249550 + Wowhead quest 92094 comment 6478099; faction/speeds as Fenwick 249549 (INFERRED)';
SET @EVERLAKE_C249550 := (SELECT COUNT(*) = 0 FROM `creature_template` WHERE `entry` = 249550)
  AND (SELECT COUNT(*) = 0 FROM `everlake_import_rows` WHERE `tbl` = 'creature_template' AND `k1` = 249550);
INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Classification`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `family`, `trainer_class`, `type`, `VehicleId`, `AIName`, `MovementType`, `ExperienceModifier`, `RacialLeader`, `movementId`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 249550, 0, 0, 'Wennzut Togglespring', NULL, NULL, NULL, NULL, 0, 0, 12, 2, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 2, 0, 2048, 0, 0, 0, 7, 0, '', 0, 1, 0, 0, 0, 0, 1, 0, 0, '', NULL, 0 FROM DUAL WHERE @EVERLAKE_C249550 = 1;
INSERT INTO `creature_template_difficulty` (`Entry`, `DifficultyID`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `ContentTuningID`, `HealthScalingExpansion`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `CreatureDifficultyID`, `TypeFlags`, `TypeFlags2`, `TypeFlags3`, `LootID`, `PickPocketLootID`, `SkinLootID`, `GoldMin`, `GoldMax`, `StaticFlags1`, `StaticFlags2`, `StaticFlags3`, `StaticFlags4`, `StaticFlags5`, `StaticFlags6`, `StaticFlags7`, `StaticFlags8`, `VerifiedBuild`)
SELECT 249550, 0, 0, 0, 0, 0, 1.05, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 FROM DUAL WHERE @EVERLAKE_C249550 = 1;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)
SELECT 249550, 0, 146930, 1, 1, 0 FROM DUAL WHERE @EVERLAKE_C249550 = 1;
INSERT INTO `creature_classic_level` (`entry`, `level_min`, `level_max`)
SELECT 249550, 57, 57 FROM DUAL
WHERE @EVERLAKE_C249550 = 1 AND NOT EXISTS (SELECT 1 FROM `creature_classic_level` WHERE `entry` = 249550);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template', 249550, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM DUAL WHERE @EVERLAKE_C249550 = 1 AND EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 249550);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template_difficulty', 249550, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM DUAL WHERE @EVERLAKE_C249550 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template_model', 249550, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM DUAL WHERE @EVERLAKE_C249550 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_classic_level', 249550, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM DUAL WHERE @EVERLAKE_C249550 = 1;

SET @EVERLAKE_CS249550 := (SELECT COUNT(*) = 1 FROM `everlake_import_rows` WHERE `tbl` = 'creature_template' AND `k1` = 249550 AND `file` = '2026_11_26_63_world_everlake_wennzut_togglespring.sql')
  AND (SELECT COUNT(*) = 1 FROM `creature_template` WHERE `entry` = 249550 AND `VerifiedBuild` = 0)
  AND (SELECT COUNT(*) = 0 FROM `creature` WHERE `id` = 249550);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`,
  `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`,
  `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`,
  `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 920019810, 249550, 1, 0, 0, '0', 0, 0, 0, -1, 0, 0, 6445.46, -2278.40, 634.15, 0, 300, 0, 0, 100, 0, NULL, NULL, NULL, NULL, '', NULL, 0
FROM DUAL WHERE @EVERLAKE_CS249550 = 1 AND NOT EXISTS (SELECT 1 FROM `creature` c WHERE c.`guid` = 920019810);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature', c.`guid`, 0, 0, 0, @EVERLAKE_FILE, 'Icy Veins sighting 27.63 44.11 (UiMap 1452); height.py' FROM `creature` c
WHERE @EVERLAKE_CS249550 = 1 AND c.`id` = 249550 AND c.`guid` = 920019810;

-- He gives Rocket Gnomes (Wowhead comment 6478099); Fenwick already takes it.
INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`)
SELECT 249550, 92094, 0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 249550)
  AND EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 92094)
  AND NOT EXISTS (SELECT 1 FROM `creature_queststarter` WHERE `quest` = 92094);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_queststarter', 249550, 92094, 0, 0, @EVERLAKE_FILE, 'Wowhead quest 92094 comment 6478099'
FROM `creature_queststarter` WHERE `id` = 249550 AND `quest` = 92094;

COMMIT;


-- ===== Everlake 2026_11_26_80_world_everlake_power_wash_well_trigger.sql =====
-- 96301 Power Wash (Marn Euhorn 264795, Mount Hyjal): "Enter the Well of Eternity and observe its effects on the
-- Venom-dripping Heart". Its objectives are server area trigger 42773 "Well of Eternity entered with the chimaera
-- heart" (type 19, area trigger enter) and the Vacant Heart 274163. The realm has no area trigger 42773, so neither
-- objective can be done.
-- 2026_11_26_80_world_everlake_power_wash_well_trigger.sql: written by hand, not tried in game (2026-11-26).
--
-- How live does it (sources):
--   Client DB2: Cleanse Heart (1293359) creates the Vacant Heart 274163 (SpellEffect 0, on the caster) and destroys
--     the Venom-dripping Heart 274162 (SpellEffect 1, effect 169), the quest's start item. Area trigger 42773 is not
--     in the client's AreaTrigger.db2: it is a server area trigger. The Eternity Cloth 274165 also uses Cleanse Heart
--     ("Dunk the venomous heart in the Well of Eternity"); nothing on the realm sells or makes that cloth.
--   EG Link objectives (build 71091, CC BY 4.0): objective 1 (event) was gained at map 1 5406.9 -3479.4 and the
--     Vacant Heart (objective 2) at 5405.4 -3480.0, the same moment: entering the well swaps the heart.
--   QuestieDB (foreverQuestTraces): triggerEnd "Well of Eternity entered with the chimaera heart" at Mount Hyjal
--     73.55 39.17, the same spot.
--   ForeverTracker tools/height.py at that point: water surface 1558.9, pool floor 1534.3.
--
-- Rows (the way 2026_11_19_987 placed 39304 and 33147): area trigger template 42773 (Blizzard's id, IsCustom 0, so the
-- objective names it), create properties 920020300 and a static spawn 920020300: a cylinder of radius 15 from z 1530 to
-- 1570 at EG Link's point, covering the water there (shape and size INFERRED: Blizzard's are not public).
-- Its action casts Cleanse Heart on the player who enters (a static trigger's caster is the player), which swaps the
-- heart; the core counts the area trigger objective first. Conditions (source 28): only players on 96301, not yet
-- complete, holding the heart 274162 enter it (INFERRED from the objective's text).
-- Rows are only added where missing. Each added row is recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_80_world_everlake_power_wash_well_trigger.sql';

START TRANSACTION;

-- area trigger 42773 (Blizzard's server id)
INSERT INTO `areatrigger_template` (`Id`, `IsCustom`, `Flags`, `ActionSetId`, `ActionSetFlags`, `VerifiedBuild`)
SELECT 42773, 0, 0, 0, 0, 0 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `areatrigger_template` t WHERE t.`Id` = 42773 AND t.`IsCustom` = 0);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'areatrigger_template', 42773, 0, 0, 0, @EVERLAKE_FILE, 'quest 96301 objective area trigger'
FROM `areatrigger_template` t WHERE t.`Id` = 42773 AND t.`IsCustom` = 0;

-- entering it casts Cleanse Heart (1293359) on the player: Venom-dripping Heart 274162 -> Vacant Heart 274163
INSERT INTO `areatrigger_template_actions` (`AreaTriggerId`, `IsCustom`, `ActionType`, `ActionParam`, `TargetType`)
SELECT 42773, 0, 0, 1293359, 0 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `areatrigger_template_actions` a WHERE a.`AreaTriggerId` = 42773 AND a.`IsCustom` = 0);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'areatrigger_template_actions', 42773, 0, 0, 0, @EVERLAKE_FILE, 'client SpellEffect 1293359; EG Link objectives 71091 (heart swapped on entry)'
FROM `areatrigger_template_actions` a WHERE a.`AreaTriggerId` = 42773 AND a.`IsCustom` = 0 AND a.`ActionParam` = 1293359;

-- only players on Power Wash (incomplete) who hold the Venom-dripping Heart enter it
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 28, 42773, 0, 0, 0, s.`ct`, 0, s.`v1`, s.`v2`, 0, '', 0, 0, 0, '', s.`c` FROM (
  SELECT 47 AS `ct`, 96301 AS `v1`, 8 AS `v2`, 'Well of Eternity trigger 42773 - Power Wash (96301) incomplete' AS `c`
  UNION ALL SELECT 2, 274162, 1, 'Well of Eternity trigger 42773 - holding the Venom-dripping Heart 274162'
) s
WHERE NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 28 AND c.`SourceGroup` = 42773 AND c.`SourceEntry` = 0);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 28, 42773, 0, c.`ConditionTypeOrReference`, @EVERLAKE_FILE, 'INFERRED from the objective text (entered with the heart)'
FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 28 AND c.`SourceGroup` = 42773 AND c.`SourceEntry` = 0 AND c.`ConditionTypeOrReference` IN (2, 47);

-- shape: cylinder, radius 15, 40 high (INFERRED)
INSERT INTO `areatrigger_create_properties` (`Id`, `IsCustom`, `AreaTriggerId`, `IsAreatriggerCustom`, `Shape`, `ShapeData0`, `ShapeData1`, `ShapeData2`, `ShapeData3`, `ShapeData4`, `ShapeData5`)
SELECT 920020300, 1, 42773, 0, 4, 15, 15, 40, 40, 0, 0 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `areatrigger_create_properties` p WHERE p.`Id` = 920020300 AND p.`IsCustom` = 1);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'areatrigger_create_properties', 920020300, 1, 0, 0, @EVERLAKE_FILE, 'cylinder r15 h40 (INFERRED)'
FROM `areatrigger_create_properties` p WHERE p.`Id` = 920020300 AND p.`IsCustom` = 1 AND p.`AreaTriggerId` = 42773;

-- the spawn, in the Well of Eternity (map 1)
INSERT INTO `areatrigger` (`SpawnId`, `AreaTriggerCreatePropertiesId`, `IsCustom`, `MapId`, `SpawnDifficulties`, `PosX`, `PosY`, `PosZ`, `Orientation`, `PhaseUseFlags`, `PhaseId`, `PhaseGroup`, `ScriptName`, `Comment`, `VerifiedBuild`)
SELECT 920020300, 920020300, 1, 1, '0', 5406.9, -3479.4, 1530, 0, 1, 0, 0, '', 'Quest 96301 Power Wash - Well of Eternity entered with the chimaera heart (area trigger 42773)', 0 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `areatrigger` a WHERE a.`SpawnId` = 920020300);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'areatrigger', 920020300, 0, 0, 0, @EVERLAKE_FILE, 'EG Link objectives 71091 point + QuestieDB triggerEnd; z from height.py'
FROM `areatrigger` a WHERE a.`SpawnId` = 920020300 AND a.`AreaTriggerCreatePropertiesId` = 920020300;

COMMIT;


-- ===== Everlake 2026_11_26_81_world_everlake_trevan_weapon_notes_gossip.sql =====
-- 95036 A Moon-Kissed Blade (Horde paladin, Lumina Windsinger 259620 -> Trevan Rol 248840, the Sepulcher): objective 1
-- "Collect the note from Trevan" is Trevan's Weapon Notes 267454. On the realm Trevan has no gossip menu, so nothing
-- gives the note and the quest cannot be completed.
-- 2026_11_26_81_world_everlake_trevan_weapon_notes_gossip.sql: written by hand, not tried in game (2026-11-26).
--
-- How live does it (sources):
--   Client DB2: Trevan's Weapon Notes (1280553) creates 267454 on the caster (SpellEffect 0, target 1).
--   Icy Veins npc 248840 (addon gossip): option 138494 "Tell me about how to forge the weapon we need to destroy Old
--     Fire-Eye." opens a page that ends with option 138493 "<Reach out your hand and take the note from Trevan.>".
--   EG Link npcs (build 70938, CC BY 4.0): Trevan Rol has Gossip + QuestGiver and option 138494 with that text.
--   Wowhead item 267454: created by spell 1280553; objective of 95036 only.
-- The page texts have no BroadcastText on the realm (neither the client's BroadcastText.db2 nor hotfixes have them),
-- so this does not rebuild the two pages. Trevan gets one menu, 920020301, with the realm's usual greeting (npc_text 68,
-- "Greetings, $n.", used by 840 menus) and Blizzard's last option 138493 with its live text. Choosing it makes the
-- player cast Trevan's Weapon Notes on themselves, so the note comes from the client's own spell.
-- The option shows while 95036 is in the log and not complete and the player has no note (INFERRED: the live
-- conditions are not public). Only while Trevan has no menu, no script and no SmartAI rows.
-- Each added row is recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_81_world_everlake_trevan_weapon_notes_gossip.sql';

START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS `everlake_trevan_stage`;
CREATE TEMPORARY TABLE `everlake_trevan_stage` (`ok` tinyint NOT NULL) ENGINE=InnoDB;
INSERT INTO `everlake_trevan_stage` (`ok`)
SELECT 1 FROM `creature_template` t
WHERE t.`entry` = 248840 AND t.`ScriptName` = '' AND t.`AIName` IN ('', 'SmartAI')
  AND NOT EXISTS (SELECT 1 FROM `creature_template_gossip` g WHERE g.`CreatureID` = 248840)
  AND NOT EXISTS (SELECT 1 FROM `gossip_menu` m WHERE m.`MenuID` = 920020301)
  AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` o WHERE o.`MenuID` = 920020301 OR o.`GossipOptionID` = 138493)
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` x WHERE x.`entryorguid` = 248840 AND x.`source_type` = 0)
  AND EXISTS (SELECT 1 FROM `npc_text` n WHERE n.`ID` = 68);

INSERT INTO `gossip_menu` (`MenuID`, `TextID`, `VerifiedBuild`)
SELECT 920020301, 68, 0 FROM `everlake_trevan_stage` WHERE `ok` = 1;
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`)
SELECT 248840, 920020301, 0 FROM `everlake_trevan_stage` WHERE `ok` = 1;
INSERT INTO `gossip_menu_option` (`MenuID`, `GossipOptionID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `Language`, `Flags`,
    `ActionMenuID`, `ActionPoiID`, `GossipNpcOptionID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `SpellID`, `OverrideIconID`, `VerifiedBuild`)
SELECT 920020301, 138493, 0, 0, '<Reach out your hand and take the note from Trevan.>', 0, 0, 0, 0, 0, NULL, 0, 0, '', 0, NULL, NULL, 0
FROM `everlake_trevan_stage` WHERE `ok` = 1;

-- option conditions: 95036 incomplete, no note yet
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, 920020301, 0, 0, 0, 47, 0, 95036, 8, 0, '', 0, 0, 0, '', 'Trevan Rol - take the note - A Moon-Kissed Blade (95036) incomplete'
FROM `everlake_trevan_stage` WHERE `ok` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 15, 920020301, 0, 0, 0, 2, 0, 267454, 1, 0, '', 1, 0, 0, '', 'Trevan Rol - take the note - not holding Trevan''s Weapon Notes 267454'
FROM `everlake_trevan_stage` WHERE `ok` = 1;

-- choosing it: close the window, the player casts Trevan's Weapon Notes (1280553, triggered) on themselves
UPDATE `creature_template` t JOIN `everlake_trevan_stage` s ON s.`ok` = 1
SET t.`AIName` = 'SmartAI' WHERE t.`entry` = 248840 AND t.`AIName` = '' AND t.`ScriptName` = '';
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 248840, 0, 0, 1, '', 62, 0, 100, 0, 920020301, 0, 0, 0, 0, '', 72, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,
    'Trevan Rol - On gossip option 920020301/0 (take the note) - Close gossip'
FROM `everlake_trevan_stage` WHERE `ok` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 248840, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, '', 85, 1280553, 2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,
    'Trevan Rol - Linked - Invoker casts Trevan''s Weapon Notes 1280553 on self (gives 267454)'
FROM `everlake_trevan_stage` WHERE `ok` = 1;

INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gossip_menu', 920020301, 68, 0, 0, @EVERLAKE_FILE, 'realm greeting npc_text 68; live page texts have no BroadcastText'
FROM `gossip_menu` m WHERE m.`MenuID` = 920020301 AND m.`TextID` = 68;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template_gossip', 248840, 920020301, 0, 0, @EVERLAKE_FILE, 'Icy Veins + EG Link: Trevan Rol has gossip'
FROM `creature_template_gossip` g WHERE g.`CreatureID` = 248840 AND g.`MenuID` = 920020301;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gossip_menu_option', 920020301, 0, 0, 0, @EVERLAKE_FILE, 'Icy Veins npc 248840 gossip option 138493 text'
FROM `gossip_menu_option` o WHERE o.`MenuID` = 920020301 AND o.`OptionID` = 0 AND o.`GossipOptionID` = 138493;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 15, 920020301, 0, c.`ConditionTypeOrReference`, @EVERLAKE_FILE, 'INFERRED option conditions'
FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 15 AND c.`SourceGroup` = 920020301 AND c.`SourceEntry` = 0 AND c.`ConditionTypeOrReference` IN (2, 47);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', 248840, 0, x.`id`, 0, @EVERLAKE_FILE, 'client SpellEffect 1280553 creates 267454'
FROM `smart_scripts` x WHERE x.`entryorguid` = 248840 AND x.`source_type` = 0 AND x.`id` IN (0, 1)
  AND (x.`event_param1` = 920020301 OR x.`action_param1` = 1280553);

DROP TEMPORARY TABLE IF EXISTS `everlake_trevan_stage`;

COMMIT;


-- ===== Everlake 2026_11_26_86_world_everlake_experimental_method_workstations.sql =====
-- 95316 The Experimental Method (Curious Crow 257753, Mount Hyjal): "Use the pinecones to destroy the Ashen Reign
-- workstations." Its objectives count the credits 263806 Vessel, 263808 Disease, 263807 Alchemy and 264352 Slime
-- "[DNT] Kill Credit: Work Stations Disrupted", which nothing on the realm gives: the pinecone hits nothing.
-- 2026_11_26_86_world_everlake_experimental_method_workstations.sql: written by hand, not tried in game (2026-11-26).
--
-- How live does it (sources):
--   Client DB2: the quest's start item, Slimy Pinecone 273323 (ItemXItemEffect 165300 -> ItemEffect 233123), casts
--     1292139 Slimy Pinecone: a dummy aura on a nearby creature (TARGET_UNIT_NEARBY_ENTRY, 20 yd, 1.3 s cast). The
--     credit is given on the server: no client spell gives 263806 or 264352, and 1290709/1290710 (KILL_CREDIT2 for
--     263807/263808) are triggered-only spells nothing in the client casts. The core has no script for any of them.
--   EG Link item_uses + objectives (build 71037, CC BY 4.0): the pinecone (spellId 1292139) was used four times, each
--     giving one objective: objective 1 (Vessel) at 4691.1 -2639.5, 2 (Disease) at 4739.7 -2533.6, 3 (Alchemy) at
--     4724.2 -2470.4 and 4 (Slime) at 4621.0 -2415.0 (map 1). Objective n is quest_objectives StorageIndex n.
--   The realm has no workstation creature or object at those points (world_ptr, 25 yd around each), so the
--     workstations themselves are not known to any source the tracker holds.
--   ForeverTracker tools/height.py: ground at the four points 1152.58, 1157.51, 1157.47, 1165.01.
--
-- Rows: one spawn of each credit creature (they are invisible [DNT] triggers, flags_extra 128) at EG Link's point,
-- guids 920086600-920086603; each gets a SmartAI that gives the caster its own credit when 1292139 hits it, and a spell
-- condition makes the pinecone's nearby-creature target one of the four (without one, the core takes any creature).
-- INFERRED: live hits a workstation, not a credit trigger; the trigger at the same spot gives the same credit.
-- Rows are only added where missing (no spawn, no AI). Each added row is recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_86_world_everlake_experimental_method_workstations.sql';
SET @EVERLAKE_NOTE := 'client ItemEffect 233123 / SpellEffect 1292139; EG Link item_uses + objectives 71037';

START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS `everlake_workstation_stage`;
CREATE TEMPORARY TABLE `everlake_workstation_stage` (
  `entry` int unsigned NOT NULL, `guid` bigint unsigned NOT NULL, `x` float NOT NULL, `y` float NOT NULL, `z` float NOT NULL,
  `grp` int unsigned NOT NULL, `comment` varchar(255) NOT NULL, `ok` tinyint NOT NULL DEFAULT '0', PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `everlake_workstation_stage` (`entry`, `guid`, `x`, `y`, `z`, `grp`, `comment`) VALUES
(263806, 920086600, 4691.1, -2639.5, 1152.58, 0, 'Kill Credit: Vessel Workstation - On spell hit Slimy Pinecone (1292139) - Quest credit 263806 (The Experimental Method 95316)'),
(263808, 920086601, 4739.7, -2533.6, 1157.51, 1, 'Kill Credit: Disease Workstation - On spell hit Slimy Pinecone (1292139) - Quest credit 263808 (The Experimental Method 95316)'),
(263807, 920086602, 4724.2, -2470.4, 1157.47, 2, 'Kill Credit: Alchemy Workstation - On spell hit Slimy Pinecone (1292139) - Quest credit 263807 (The Experimental Method 95316)'),
(264352, 920086603, 4621.0, -2415.0, 1165.01, 3, 'Kill Credit: Slime Workstation - On spell hit Slimy Pinecone (1292139) - Quest credit 264352 (The Experimental Method 95316)');
UPDATE `everlake_workstation_stage` s
JOIN `creature_template` t ON t.`entry` = s.`entry` AND t.`ScriptName` = '' AND t.`AIName` IN ('', 'SmartAI')
SET s.`ok` = 1
WHERE NOT EXISTS (SELECT 1 FROM `smart_scripts` d WHERE d.`entryorguid` = s.`entry` AND d.`source_type` = 0)
  AND NOT EXISTS (SELECT 1 FROM `creature` c WHERE c.`id` = s.`entry`)
  AND NOT EXISTS (SELECT 1 FROM `creature` c WHERE c.`guid` = s.`guid`);

-- the credit triggers, one at each spot where live gave that objective
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`,
  `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`,
  `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`,
  `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT s.`guid`, s.`entry`, 1, 0, 0, '0', 0, 0, 0, -1, 0, 0, s.`x`, s.`y`, s.`z`, 0, 300, 0, 0, 100, 0, NULL, NULL, NULL, NULL, '', NULL, 0
FROM `everlake_workstation_stage` s WHERE s.`ok` = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature', s.`guid`, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM `everlake_workstation_stage` s WHERE s.`ok` = 1;

-- the pinecone hitting a trigger gives the caster that trigger's credit
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT s.`entry`, 0, 0, 0, '', 8, 0, 100, 0, 1292139, 0, 0, 0, 0, '', 33, s.`entry`, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, s.`comment`
FROM `everlake_workstation_stage` s WHERE s.`ok` = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', s.`entry`, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM `everlake_workstation_stage` s WHERE s.`ok` = 1;
UPDATE `creature_template` t JOIN `everlake_workstation_stage` s ON s.`entry` = t.`entry`
SET t.`AIName` = 'SmartAI'
WHERE s.`ok` = 1 AND t.`AIName` = '' AND t.`ScriptName` = '';

-- the pinecone's nearby-creature target is one of the four triggers (only when all four were placed here)
SET @EVERLAKE_ALL4 := (SELECT COUNT(*) = 4 FROM `everlake_workstation_stage` o WHERE o.`ok` = 1);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 13, 1, 1292139, 0, s.`grp`, 31, 0, 3, s.`entry`, 0, '', 0, 0, 0, '', 'Slimy Pinecone targets an Ashen Reign workstation credit trigger (The Experimental Method 95316)'
FROM `everlake_workstation_stage` s
WHERE NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 13 AND c.`SourceEntry` = 1292139)
  AND @EVERLAKE_ALL4 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 13, 1, 1292139, c.`ElseGroup`, @EVERLAKE_FILE, CONCAT('implicit target of 1292139: ', c.`ConditionValue2`)
FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 13 AND c.`SourceGroup` = 1 AND c.`SourceEntry` = 1292139 AND c.`ConditionTypeOrReference` = 31
  AND @EVERLAKE_ALL4 = 1;

DROP TEMPORARY TABLE IF EXISTS `everlake_workstation_stage`;

COMMIT;


-- ===== Everlake 2026_11_26_87_world_everlake_saving_our_own_captives.sql =====
-- 93058 Saving Our Own (Nerlokh 253177, Shen'dralas): "rescue 5 Gelkis Captives within the Valley of Bones". Its
-- objective counts credit 254825 "Gelkis Captive", which nothing on the realm gives: the captives cannot be freed.
-- 2026_11_26_87_world_everlake_saving_our_own_captives.sql: written by hand, not tried in game (2026-11-26).
--
-- How live does it (sources):
--   Client DB2: 1263364 Break Chain (2 s cast, any range) is a dummy on its target (TARGET_UNIT_TARGET_ANY) with
--     KILL_CREDIT2 254825 on the caster: the player who breaks a captive's chain gets the credit from the spell itself.
--     No item, object or other spell casts it, so live casts it from the captive (a click). The core has no script.
--   Icy Veins (wowf npc 253431): the Gelkis Captive 253431 stands in the Valley of Bones (map 2652 points) and is the
--     objective of 92893 No Mercy for the Weak, the Magram side of the same captives (slay 5). 254825 has the same
--     models but no points: it is only the credit. The realm has 253431 spawned (3 spawns), without AI or click.
--
-- Rows: the captive 253431 gets the spell click flag and a click that makes the player cast Break Chain on it
-- (npc_spellclick_spells, cast_flags 1: the clicker casts on the captive), only while 93058 is in the player's log
-- (condition source 18); when Break Chain hits it, the captive loses its click and despawns after 3 s (it respawns as
-- spawned). INFERRED: live's click is not in any source; Break Chain is the only spell that gives 254825.
-- Rows are only added where the captive has no AI, script or click. Each added row is recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_87_world_everlake_saving_our_own_captives.sql';
SET @EVERLAKE_NOTE := 'client SpellEffect 1263364 (KILL_CREDIT2 254825); Icy Veins npc 253431';

START TRANSACTION;

SET @EVERLAKE_OK := (SELECT COUNT(*) = 1 FROM `creature_template` t WHERE t.`entry` = 253431 AND t.`ScriptName` = '' AND t.`AIName` IN ('', 'SmartAI'))
  AND (SELECT COUNT(*) = 0 FROM `smart_scripts` s WHERE s.`entryorguid` = 253431 AND s.`source_type` = 0)
  AND (SELECT COUNT(*) = 0 FROM `npc_spellclick_spells` k WHERE k.`npc_entry` = 253431);

-- clicking a captive makes the player cast Break Chain on it
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`)
SELECT 253431, 1263364, 1, 0 FROM DUAL WHERE @EVERLAKE_OK = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'npc_spellclick_spells', 253431, 1263364, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE
FROM `npc_spellclick_spells` k WHERE @EVERLAKE_OK = 1 AND k.`npc_entry` = 253431 AND k.`spell_id` = 1263364;

-- only for players with Saving Our Own in their log (not yet complete)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 18, 253431, 1263364, 0, 0, 9, 0, 93058, 0, 0, '', 0, 0, 0, '', 'Gelkis Captive: Break Chain click only while Saving Our Own (93058) is taken'
FROM DUAL
WHERE @EVERLAKE_OK = 1
  AND NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 18 AND c.`SourceGroup` = 253431 AND c.`SourceEntry` = 1263364);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 18, 253431, 1263364, 0, @EVERLAKE_FILE, 'click condition: quest 93058 taken'
FROM `conditions` c WHERE @EVERLAKE_OK = 1 AND c.`SourceTypeOrReferenceId` = 18 AND c.`SourceGroup` = 253431 AND c.`SourceEntry` = 1263364 AND c.`ConditionValue1` = 93058;

-- freed: no more click, gone after 3 s (respawns as spawned)
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 253431, 0, 0, 0, '', 8, 0, 100, 0, 1263364, 0, 0, 0, 0, '', 83, 16777216, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Gelkis Captive - On spell hit Break Chain (1263364) - Remove npc flag spellclick (Saving Our Own 93058)'
FROM DUAL WHERE @EVERLAKE_OK = 1
UNION ALL
SELECT 253431, 0, 1, 0, '', 8, 0, 100, 0, 1263364, 0, 0, 0, 0, '', 41, 3000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Gelkis Captive - On spell hit Break Chain (1263364) - Despawn in 3 s (Saving Our Own 93058)'
FROM DUAL WHERE @EVERLAKE_OK = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', 253431, 0, s.`id`, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE
FROM `smart_scripts` s WHERE @EVERLAKE_OK = 1 AND s.`entryorguid` = 253431 AND s.`source_type` = 0 AND s.`event_param1` = 1263364;

UPDATE `creature_template` t
SET t.`AIName` = 'SmartAI', t.`npcflag` = t.`npcflag` | 16777216
WHERE @EVERLAKE_OK = 1 AND t.`entry` = 253431 AND t.`ScriptName` = '';
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template', 253431, 0, 0, 0, @EVERLAKE_FILE, 'AIName SmartAI + npcflag spellclick (16777216) added'
FROM DUAL WHERE @EVERLAKE_OK = 1;

COMMIT;


-- ===== Everlake 2026_11_26_88_world_everlake_ewe_wandered_off_sheep.sql =====
-- 96674 Ewe Wandered Off (Mirt 248419, Elderwild): "Capture and return 6 Escaped Sheep." Its objective counts credit
-- 265988 "[DNT] Kill Credit: Escaped Sheep", which nothing on the realm gives: the sheep cannot be caught.
-- 2026_11_26_88_world_everlake_ewe_wandered_off_sheep.sql: written by hand, not tried in game (2026-11-26).
--
-- How live does it (sources):
--   Client DB2: 1296141 Kill Credit (DNT) gives 265988 (KILL_CREDIT2 on its caster); it is a triggered-only spell that
--     nothing in the client casts. 1296140 Sheep Caught! is an aura on its caster; 1296072 / 1296076 Caught Sheep are
--     auras on the sheep. No item uses any of them, so live gives the credit from a server script.
--   Icy Veins (wowf npc 265962): the Escaped Sheep has cursor "questinteract" (it is clicked). The realm has it spawned
--     (4 spawns, 5105-5189 / -1291..-1409, map 1) without AI or click; Mirt stands at 5091.3 -1464.7.
--   Quest text (Icy Veins quest 96674): "Capture and return 6 Escaped Sheep"; they wandered off from Mirt.
--
-- Rows: the sheep gets the spell click flag and a click on which the player casts Sheep Caught! (1296140) on himself
-- (cast_flags 3), only while 96674 is in the player's log (condition source 18). On the click the sheep loses its click
-- and follows the player (SMART_ACTION_FOLLOW); when it comes within interaction range of Mirt 248419 the core gives
-- the player (and group) credit 265988 and despawns the sheep (it respawns as spawned).
-- INFERRED: live's script is not in any source; the click, the follow and the return to Mirt follow the quest text.
-- Rows are only added where the sheep has no AI, script or click. Each added row is recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_88_world_everlake_ewe_wandered_off_sheep.sql';
SET @EVERLAKE_NOTE := 'client SpellEffect 1296141 (KILL_CREDIT2 265988) / 1296140; Icy Veins npc 265962 questinteract';

START TRANSACTION;

SET @EVERLAKE_OK := (SELECT COUNT(*) = 1 FROM `creature_template` t WHERE t.`entry` = 265962 AND t.`ScriptName` = '' AND t.`AIName` IN ('', 'SmartAI'))
  AND (SELECT COUNT(*) = 0 FROM `smart_scripts` s WHERE s.`entryorguid` = 265962 AND s.`source_type` = 0)
  AND (SELECT COUNT(*) = 0 FROM `npc_spellclick_spells` k WHERE k.`npc_entry` = 265962);

-- clicking a sheep: the player casts Sheep Caught! on himself
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`)
SELECT 265962, 1296140, 3, 0 FROM DUAL WHERE @EVERLAKE_OK = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'npc_spellclick_spells', 265962, 1296140, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE
FROM `npc_spellclick_spells` k WHERE @EVERLAKE_OK = 1 AND k.`npc_entry` = 265962 AND k.`spell_id` = 1296140;

-- only for players with Ewe Wandered Off in their log (not yet complete)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 18, 265962, 1296140, 0, 0, 9, 0, 96674, 0, 0, '', 0, 0, 0, '', 'Escaped Sheep: click only while Ewe Wandered Off (96674) is taken'
FROM DUAL
WHERE @EVERLAKE_OK = 1
  AND NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 18 AND c.`SourceGroup` = 265962 AND c.`SourceEntry` = 1296140);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 18, 265962, 1296140, 0, @EVERLAKE_FILE, 'click condition: quest 96674 taken'
FROM `conditions` c WHERE @EVERLAKE_OK = 1 AND c.`SourceTypeOrReferenceId` = 18 AND c.`SourceGroup` = 265962 AND c.`SourceEntry` = 1296140 AND c.`ConditionValue1` = 96674;

-- caught: no more click, follow the clicker; at Mirt (248419) the core gives credit 265988 and despawns the sheep
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 265962, 0, 0, 0, '', 73, 0, 100, 0, 0, 0, 0, 0, 0, '', 83, 16777216, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaped Sheep - On spellclick - Remove npc flag spellclick (Ewe Wandered Off 96674)'
FROM DUAL WHERE @EVERLAKE_OK = 1
UNION ALL
SELECT 265962, 0, 1, 0, '', 73, 0, 100, 0, 0, 0, 0, 0, 0, '', 29, 0, 0, 248419, 265988, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Escaped Sheep - On spellclick - Follow clicker, credit 265988 at Mirt 248419 (Ewe Wandered Off 96674)'
FROM DUAL WHERE @EVERLAKE_OK = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', 265962, 0, s.`id`, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE
FROM `smart_scripts` s WHERE @EVERLAKE_OK = 1 AND s.`entryorguid` = 265962 AND s.`source_type` = 0 AND s.`event_type` = 73;

UPDATE `creature_template` t
SET t.`AIName` = 'SmartAI', t.`npcflag` = t.`npcflag` | 16777216
WHERE @EVERLAKE_OK = 1 AND t.`entry` = 265962 AND t.`ScriptName` = '';
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template', 265962, 0, 0, 0, @EVERLAKE_FILE, 'AIName SmartAI + npcflag spellclick (16777216) added'
FROM DUAL WHERE @EVERLAKE_OK = 1;

COMMIT;


-- ===== Everlake 2026_11_26_89_world_everlake_sunderbark.sql =====
-- Sunderbark (248709), "Ancient of Corruption", the elite ancient of 92959 The Dying Ancients (Fraxinus 248366, Mount
-- Hyjal): "Hunt down and destroy the corrupted ancient Sunderbark, then plant a seed in his remains." The realm had no
-- Sunderbark, and nothing gave the objective's credit 268220 "DNT Sunderbark kill credit".
-- 2026_11_26_89_world_everlake_sunderbark.sql: written by hand, not tried in game (2026-11-26).
--
-- Sources:
--   Icy Veins (wowf npc 248709) and EG Link creature_details (71091, CC BY 4.0): name, title, type 10, elite
--     (classification 1), unit class 1, health multiplier 4, display 131637 at scale 1.5, creature difficulty 328270,
--     type flags 128 (CREATURE_TYPE_FLAG_INTERACT_WHILE_DEAD: his corpse can be clicked). Level 56: Icy Veins
--     addon_levels, EG Link creatures (71037) and Wowhead's kept page. Hostile: Wowhead "React" red for both sides,
--     EG Link reactions Horde 2. Abilities on Wowhead's kept page: War Stomp (45), Entangling Roots (11922), Dazed.
--   Position: EG Link creatures (71037) saw him at map 1 4412.1 -3087.3; Wowhead's kept page puts him at Mount Hyjal
--     60-65 / 72-83. ForeverTracker tools/height.py there: terrain 1043.04.
--   Client DB2, how the seed is planted: 1246989 Planting Seed (2 s cast, 20 yd) uses the quest's start item Seed of
--     the Ancients 248975 as its reagent (SpellReagents 38968), may target the dead (SpellMisc Attributes2 0x1
--     ALLOW_DEAD_TARGET), puts a dummy aura on its target, summons the Young Tree 659886 (effect 50) and gives its
--     caster credit 268220 (KILL_CREDIT2). The seed has no use spell, so the player casts it on the corpse he can
--     click. Young Tree 659886: EG Link object_details 71037 and Icy Veins gameobject 659886 (type 5, display 126957,
--     size 0.1). The core has no script for any of these ids.
--   EG Link objectives (71037): the 92959 credit was gained at 4402.0 -3075.5, 15 yd from the point above.
--
-- Rows: Sunderbark's template, difficulty, model and level; one spawn, guid 920086700; the Young Tree template; a
-- spell click on Sunderbark that makes the clicker cast Planting Seed on him (cast_flags 1), only while 92959 is in the
-- player's log (condition source 18); a SmartAI that puts the spell click flag back on his corpse when he dies (the core
-- clears all npc flags at death) and casts his two abilities in combat.
-- INFERRED (no source gives them): faction 16, speeds, attack time, respawn 300 s, wander 10 yd, the ability timers,
--   and the click itself (live's corpse interaction is not in any source; this is how the realm can cast the spell).
--   No loot: no source lists any, and a lootable corpse would take the right click before the spell click.
--   Not done: the quest text says "strike the corrupted tree and he will come"; no source names that tree, so he
--   stands spawned.
-- No row is added where the realm already has one. Each added row is recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';

SET @EVERLAKE_FILE := '2026_11_26_89_world_everlake_sunderbark.sql';

START TRANSACTION;

-- Young Tree (659886), the object Planting Seed summons
SET @EVERLAKE_G659886 := (SELECT COUNT(*) = 0 FROM `gameobject_template` WHERE `entry` = 659886);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `Data33`, `Data34`, `ContentTuningId`, `RequiredLevel`, `AIName`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 659886, 5, 126957, 'Young Tree', '', '', '', 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', NULL, 0 FROM DUAL WHERE @EVERLAKE_G659886 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject_template', 659886, 0, 0, 0, @EVERLAKE_FILE, 'Icy Veins gameobject=659886; EG Link object_details 71037' FROM DUAL WHERE @EVERLAKE_G659886 = 1;

-- Sunderbark (248709)
SET @EVERLAKE_NOTE := 'Icy Veins npc=248709 + EG Link creature_details 71091 / creatures 71037; faction 16 INFERRED (hostile, none named)';
SET @EVERLAKE_C248709 := (SELECT COUNT(*) = 0 FROM `creature_template` WHERE `entry` = 248709)
  AND (SELECT COUNT(*) = 0 FROM `everlake_import_rows` WHERE `tbl` = 'creature_template' AND `k1` = 248709);
INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Classification`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `family`, `trainer_class`, `type`, `VehicleId`, `AIName`, `MovementType`, `ExperienceModifier`, `RacialLeader`, `movementId`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 248709, 0, 0, 'Sunderbark', NULL, 'Ancient of Corruption', NULL, NULL, 0, 0, 16, 0, 1, 1.14286, 1, 1, 0, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 10, 0, 'SmartAI', 0, 1, 0, 0, 0, 0, 1, 0, 0, '', NULL, 0 FROM DUAL WHERE @EVERLAKE_C248709 = 1;
INSERT INTO `creature_template_difficulty` (`Entry`, `DifficultyID`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `ContentTuningID`, `HealthScalingExpansion`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `CreatureDifficultyID`, `TypeFlags`, `TypeFlags2`, `TypeFlags3`, `LootID`, `PickPocketLootID`, `SkinLootID`, `GoldMin`, `GoldMax`, `StaticFlags1`, `StaticFlags2`, `StaticFlags3`, `StaticFlags4`, `StaticFlags5`, `StaticFlags6`, `StaticFlags7`, `StaticFlags8`, `VerifiedBuild`)
SELECT 248709, 0, 0, 0, 0, 0, 4, 1, 1, 1, 328270, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 FROM DUAL WHERE @EVERLAKE_C248709 = 1;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)
SELECT 248709, 0, 131637, 1.5, 1, 0 FROM DUAL WHERE @EVERLAKE_C248709 = 1;
INSERT INTO `creature_classic_level` (`entry`, `level_min`, `level_max`)
SELECT 248709, 56, 56 FROM DUAL
WHERE @EVERLAKE_C248709 = 1 AND NOT EXISTS (SELECT 1 FROM `creature_classic_level` WHERE `entry` = 248709);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template', 248709, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM DUAL WHERE @EVERLAKE_C248709 = 1 AND EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 248709);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template_difficulty', 248709, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM DUAL WHERE @EVERLAKE_C248709 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template_model', 248709, 0, 0, 0, @EVERLAKE_FILE, @EVERLAKE_NOTE FROM DUAL WHERE @EVERLAKE_C248709 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_classic_level', 248709, 0, 0, 0, @EVERLAKE_FILE, 'level 56: Icy Veins addon_levels, EG Link creatures 71037, Wowhead' FROM DUAL WHERE @EVERLAKE_C248709 = 1;

-- the rest only while the template is this file's
SET @EVERLAKE_CS248709 := (SELECT COUNT(*) = 1 FROM `everlake_import_rows` WHERE `tbl` = 'creature_template' AND `k1` = 248709 AND `file` = CONVERT(@EVERLAKE_FILE USING utf8mb4) COLLATE utf8mb4_unicode_ci)
  AND (SELECT COUNT(*) = 1 FROM `creature_template` WHERE `entry` = 248709 AND `VerifiedBuild` = 0 AND `ScriptName` = '');

-- one spawn at EG Link's point (wander INFERRED)
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`,
  `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`,
  `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`,
  `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 920086700, 248709, 1, 0, 0, '0', 0, 0, 0, -1, 0, 0, 4412.1, -3087.3, 1043.04, 0, 300, 10, 0, 100, 1, NULL, NULL, NULL, NULL, '', NULL, 0
FROM DUAL
WHERE @EVERLAKE_CS248709 = 1 AND NOT EXISTS (SELECT 1 FROM `creature` WHERE `id` = 248709)
  AND NOT EXISTS (SELECT 1 FROM `creature` WHERE `guid` = 920086700);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature', 920086700, 0, 0, 0, @EVERLAKE_FILE, 'EG Link creatures 71037 position; height.py terrain 1043.04'
FROM `creature` c WHERE @EVERLAKE_CS248709 = 1 AND c.`guid` = 920086700 AND c.`id` = 248709;

-- clicking his corpse makes the player cast Planting Seed on it (the seed is its reagent; the spell gives 268220)
SET @EVERLAKE_K248709 := @EVERLAKE_CS248709 = 1
  AND (SELECT COUNT(*) = 0 FROM `npc_spellclick_spells` WHERE `npc_entry` = 248709)
  AND (SELECT COUNT(*) = 0 FROM `smart_scripts` WHERE `entryorguid` = 248709 AND `source_type` = 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`)
SELECT 248709, 1246989, 1, 0 FROM DUAL WHERE @EVERLAKE_K248709 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'npc_spellclick_spells', 248709, 1246989, 0, 0, @EVERLAKE_FILE, 'client SpellEffect/SpellReagents/SpellMisc 1246989; type flag 128 (interact while dead)'
FROM `npc_spellclick_spells` k WHERE @EVERLAKE_K248709 = 1 AND k.`npc_entry` = 248709 AND k.`spell_id` = 1246989;

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 18, 248709, 1246989, 0, 0, 9, 0, 92959, 0, 0, '', 0, 0, 0, '', 'Sunderbark: Planting Seed click only while The Dying Ancients (92959) is taken'
FROM DUAL
WHERE @EVERLAKE_K248709 = 1
  AND NOT EXISTS (SELECT 1 FROM `conditions` c WHERE c.`SourceTypeOrReferenceId` = 18 AND c.`SourceGroup` = 248709 AND c.`SourceEntry` = 1246989);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'conditions', 18, 248709, 1246989, 0, @EVERLAKE_FILE, 'click condition: quest 92959 taken'
FROM `conditions` c WHERE @EVERLAKE_K248709 = 1 AND c.`SourceTypeOrReferenceId` = 18 AND c.`SourceGroup` = 248709 AND c.`SourceEntry` = 1246989 AND c.`ConditionValue1` = 92959;

-- SmartAI: spell click flag back on the corpse at death; War Stomp and Entangling Roots in combat (timers INFERRED)
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 248709, 0, 0, 0, '', 6, 0, 100, 0, 0, 0, 0, 0, 0, '', 81, 16777216, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunderbark - On death - Set npc flag spellclick (Planting Seed, The Dying Ancients 92959)'
FROM DUAL WHERE @EVERLAKE_K248709 = 1
UNION ALL
SELECT 248709, 0, 1, 0, '', 0, 0, 100, 0, 6000, 9000, 14000, 18000, 0, '', 11, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunderbark - In combat - Cast War Stomp'
FROM DUAL WHERE @EVERLAKE_K248709 = 1
UNION ALL
SELECT 248709, 0, 2, 0, '', 0, 0, 100, 0, 3000, 5000, 12000, 16000, 0, '', 11, 11922, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunderbark - In combat - Cast Entangling Roots on victim'
FROM DUAL WHERE @EVERLAKE_K248709 = 1;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', 248709, 0, s.`id`, 0, @EVERLAKE_FILE, 'abilities: Wowhead kept page; death click: type flag 128 + Planting Seed; timers INFERRED'
FROM `smart_scripts` s WHERE @EVERLAKE_K248709 = 1 AND s.`entryorguid` = 248709 AND s.`source_type` = 0;

COMMIT;


-- ===== Everlake 2026_11_26_90_world_everlake_valennia_double.sql =====
-- Valennia Stormfist stood twice at the Peacekeeper camp on map 2991, 12 yards apart.
-- 2026_11_26_90_world_everlake_valennia_double.sql: written from the test realm's world (2026-11-26, tracker Query
-- page), after a player saw two of her.
--
-- Our sniff file placed two Valennia entries side by side, neither phased:
--   252383  guid 21100970  kept: core script classic_npc_valennia_stormfist, starts and ends her quest chain
--                                (Desperate Times, To Valanaar, In Service of Zephras, Prepare for Battle, ...),
--                                stands beside Talaanis Shadowsong
--   260628  guid 21101717  removed: no script, no text, ends only the placeholder quest 93949 "Bugged"
-- The removed spawn has no addon, pool, spawn group, formation, event or per-spawn script. Her other two spawns
-- (253590 elsewhere on the island, 253844 the muster in phase 29805) are other story moments and stay.
--
-- Running it again changes nothing: the row goes only while it still holds 260628 and the kept spawn still stands.

DELETE c FROM `creature` c
JOIN `creature` k ON k.`guid` = 21100970 AND k.`id` = 252383
WHERE c.`guid` = 21101717 AND c.`id` = 260628;


-- ===== Everlake 2026_11_26_92_world_everlake_darkmoon_vendor_strays.sql =====
-- Darkmoon Faire vendors listed 33 later-expansion items that this game does not have.
-- 2026_11_26_92_world_everlake_darkmoon_vendor_strays.sql: written from the test realm's world (2026-11-26, tracker
-- Query page) while checking every Darkmoon Faire item.
--
-- None of these items is in the client's ItemSparse, in the live hotfixes or in hotfixes.item_sparse, so the tracker
-- has no entry for any of them and no player can see them. The rows come from the base world database, not from the
-- core's SQL or from this repository.
--   14847 Professor Thaddeus Paleo  21 TBC/Wrath potions and scrolls (22829 Super Healing Potion, 27498-27503, ...)
--   14844 Sylannia                   3 later drinks (33234, 33236, 44941)
--   14845 Stamp Thunderhorn          4 later food and drink (33246, 33254, 44940, 73260)
--   14828 Gelvas Grimegate           5 Cata Darkmoon items (73762 balloon, 77158 tonk, 77256 sword, 78340/78341 cloaks)
-- Gelvas keeps the ten ticket prizes (19291-19298, 19426, 19491, 22729), which live sells too.
-- The other NPCs that list some of the same items (Outland and Northrend vendors) are left alone.
--
-- Running it again changes nothing.

DELETE FROM `npc_vendor` WHERE `entry` = 14847 AND `item` IN
  (22829, 22832, 27498, 27499, 27500, 27501, 27502, 27503, 33447, 33457, 33458, 33459, 33460, 33461, 33462,
   37091, 37093, 37097, 43463, 43465, 43467);
DELETE FROM `npc_vendor` WHERE `entry` = 14844 AND `item` IN (33234, 33236, 44941);
DELETE FROM `npc_vendor` WHERE `entry` = 14845 AND `item` IN (33246, 33254, 44940, 73260);
DELETE FROM `npc_vendor` WHERE `entry` = 14828 AND `item` IN (73762, 77158, 77256, 78340, 78341);


-- ===== Everlake 2026_11_26_93_world_everlake_holiday_vendor_strays.sql =====
-- Holiday vendors listed 44 later-expansion items that this game does not have.
-- 2026_11_26_93_world_everlake_holiday_vendor_strays.sql: written from the test realm's world (2026-11-26, tracker
-- Query page) after the Darkmoon Faire vendors (2026_11_26_92) were cleaned the same way.
--
-- Checked: every vendor a game event spawns or restocks (29 vendors, 330 rows). None of the items below is in the
-- client's ItemSparse, in the live hotfixes or in hotfixes.item_sparse, so no player can see them. The rows come from
-- the base world database, not from the core's SQL or from this repository.
--   Feast of Winter Veil  the ten Copperpinch and Jinglepocket goblins: 34410, 34412 or 34413, 70923, 188680
--   Scourge Invasion      Argent Quartermaster 16786: 13 Wrath items
--   Lunar Festival        Fariel Starsong 15909: 44916-44919
--   Harvest Festival      Wagner Hammerstrike 15011, Javnir Nashak 15012: 34850
-- Fariel keeps the rocket recipe bundles 21740-21743: the hotfixes carry them from a live build (70685).
--
-- Running it again changes nothing.

DELETE FROM `npc_vendor` WHERE `entry` IN (13418, 13430, 13431, 13434, 13436) AND `item` IN (34410, 34412);
DELETE FROM `npc_vendor` WHERE `entry` IN (13420, 13429, 13432, 13433, 13435) AND `item` IN (34413, 70923, 188680);
DELETE FROM `npc_vendor` WHERE `entry` = 16786 AND `item` IN
  (40492, 40593, 40601, 43068, 43070, 43073, 43074, 43077, 43078, 43081, 43082, 43530, 43531);
DELETE FROM `npc_vendor` WHERE `entry` = 15909 AND `item` IN (44916, 44917, 44918, 44919);
DELETE FROM `npc_vendor` WHERE `entry` IN (15011, 15012) AND `item` = 34850;


-- ===== Everlake 2026_11_26_95_world_everlake_crystalline_elements_fragments.sql =====
-- Crystalline Elements (95928, Mayena Earthseeker): the four crystal fragments in The Shaper's Terrace (map 3001), which
-- the realm had templates and loot for but never spawned (tracker quest gaps, 2026-11-26).
-- 2026_11_26_95_world_everlake_crystalline_elements_fragments.sql: written by hand, not tried in game.
--
-- What the sources give:
--   - Wowhead Forever item pages 271894/271898/271902/271912: each crystal "is looted from" its Fragment object
--     (649099 Fiery, 649097 Charged, 649100 Noxious, 649103 Moist); the realm's templates and loot already match.
--   - Icy Veins quest 95928, Mayena's progress text: a fellow "reports seeing 'elemental raptors'".
--   - Wowhead Forever NPC comments: the four elemental raptors are summoned at a console fed with Power Crystals of one
--     colour: Cinder (261974) red, Bolt (262081) yellow, Snowtalon (262297) blue, Vitrix (272561) green. The core script
--     (classic_instance_shapers_terrace) has the same pairs on the realm's four Archival Panels 650303 (red),
--     673520 (yellow), 672255 (blue), 672256 (green), and summons each raptor 5 yards in front of its panel.
-- No source the tracker has gives a position for the fragments (Wowhead shows them only as "in a dungeon"; Questie,
-- NorgannonDB, Icy Veins and EG Link have no spawn points). INFERRED: each fragment stands by the panel of the raptor of
-- its element (Fiery = red/Cinder, Charged = yellow/Bolt, Moist = blue/Snowtalon, Noxious = green/Vitrix), 4 yards to
-- the panel's side so it does not sit where the raptor appears, at the height of the server's maps (ForeverTracker
-- tools/height.py). Orientation 0, rotation 0 and a 30 s respawn are INFERRED. Live may instead drop the fragment when
-- the raptor dies; a look in game should move them where live has them.
--
-- Own guid block 920027300-920027309 (920027300-920027303 used). Each spawn is added only while its guid is free and
-- the object has no spawn yet, and recorded in everlake_import_rows. Never edit this file once it is deployed: a later
-- fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_95_world_everlake_crystalline_elements_fragments.sql';

START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS `everlake_cef_stage`;
CREATE TEMPORARY TABLE `everlake_cef_stage` (
  `guid` bigint unsigned NOT NULL PRIMARY KEY, `id` int unsigned NOT NULL, `map` smallint unsigned NOT NULL,
  `diff` varchar(100) NOT NULL, `x` float NOT NULL, `y` float NOT NULL, `z` float NOT NULL, `respawn` int NOT NULL,
  `note` varchar(255) NOT NULL, `ok` tinyint NOT NULL DEFAULT 0);
INSERT INTO `everlake_cef_stage` (`guid`, `id`, `map`, `diff`, `x`, `y`, `z`, `respawn`, `note`) VALUES
(920027300, 649099, 3001, '1,201', -5901.6, -859.4, 112.75, 30, 'INFERRED: Fiery Crystal Fragment by the red panel 650303 (Cinder, Wowhead npc 261974 comment); height.py'),
(920027301, 649097, 3001, '1,201', -5929.9, -1224.7, 9.22, 30, 'INFERRED: Charged Crystal Fragment by the yellow panel 673520 (Bolt, Wowhead npc 262081 comment); height.py'),
(920027302, 649103, 3001, '1,201', -5684.5, -606.8, 13.76, 30, 'INFERRED: Moist Crystal Fragment by the blue panel 672255 (Snowtalon, Wowhead npc 262297 comment); height.py'),
(920027303, 649100, 3001, '1,201', -5517.5, -843.5, 22.14, 30, 'INFERRED: Noxious Crystal Fragment by the green panel 672256 (Vitrix, Wowhead npc 272561 comment); height.py');
-- a spawn goes in while its guid is free, the template exists and the object has no spawn but this file's own
UPDATE `everlake_cef_stage` s SET s.`ok` = 1
WHERE EXISTS (SELECT 1 FROM `gameobject_template` t WHERE t.`entry` = s.`id`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` g WHERE g.`guid` = s.`guid`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` g WHERE g.`id` = s.`id` AND (g.`guid` < 920027300 OR g.`guid` > 920027309));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT s.`guid`, s.`id`, s.`map`, 0, 0, s.`diff`, 0, 0, 0, -1, s.`x`, s.`y`, s.`z`, 0, 0, 0, 0, 1, s.`respawn`, 255, 1, '', NULL, 0
FROM `everlake_cef_stage` s WHERE s.`ok` = 1 ORDER BY s.`guid`;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject', s.`guid`, 0, 0, 0, @EVERLAKE_FILE, s.`note` FROM `everlake_cef_stage` s WHERE s.`ok` = 1;
DROP TEMPORARY TABLE `everlake_cef_stage`;

COMMIT;


-- ===== Everlake 2026_11_26_95_world_everlake_spawned_vendor_strays.sql =====
-- Vendors standing in the world listed 266 items that this game does not have.
-- 2026_11_26_95_world_everlake_spawned_vendor_strays.sql: written from the test realm's world (2026-11-26, tracker
-- Query page) after the Darkmoon Faire (2026_11_26_92) and holiday (2026_11_26_93) vendors were cleaned the same way.
--
-- Checked: every npc_vendor item (2271 vendors, 10108 items) against the client's ItemSparse, the live hotfixes and
-- hotfixes.item_sparse. The rows below list an item in none of them, on the 22 vendors that have a spawn; the client
-- cannot show such an item, so no player sees these rows. They come from the base world database.
--   16 Dalaran NPCs our sniff file stands at old Dalaran (map 0): their Wrath stock (Blazik Fireclaw 104 of 184,
--      Hexil Garrot 24 of 24, ...). Hexil, Caliel, Amisi, Ainderu, Nixi and Aili have nothing left to sell.
--   6 Kalimdor vendors: Aendel Windspear and Vargus (Cenarion Circle patterns and plans live no longer has as items;
--      the tracker finds what they make obtainable another way), Lenedil Moonwing, Aili Greenwillow, Evie Whirlbrew
--      (13480, an old copy of Recipe: Major Mana Potion; 13501 stays), Apothecary Durelle.
-- Left alone: 956 vendors with no spawn anywhere (16078 such rows) and items in hotfixes.item_sparse only.
--
-- Running it again changes nothing.

-- 11188 Evie Whirlbrew: 1
DELETE FROM `npc_vendor` WHERE `entry` = 11188 AND `type` = 1 AND `item` IN
  (13480);
-- 15176 Vargus: 5
DELETE FROM `npc_vendor` WHERE `entry` = 15176 AND `type` = 1 AND `item` IN
  (22209, 22214, 22766, 22767, 22768);
-- 15293 Aendel Windspear: 10
DELETE FROM `npc_vendor` WHERE `entry` = 15293 AND `type` = 1 AND `item` IN
  (20382, 20506, 20507, 20508, 20509, 20510, 20511, 22769, 22770, 22771);
-- 28686 Caliel Brightwillow: 9
DELETE FROM `npc_vendor` WHERE `entry` = 28686 AND `type` = 1 AND `item` IN
  (33443, 33444, 33445, 33449, 33454, 35950, 35952, 35953, 35954);
-- 28687 Amisi Azuregaze: 9
DELETE FROM `npc_vendor` WHERE `entry` = 28687 AND `type` = 1 AND `item` IN
  (33443, 33444, 33445, 33449, 33454, 35950, 35952, 35953, 35954);
-- 28776 Elizabeth Ross: 11
DELETE FROM `npc_vendor` WHERE `entry` = 28776 AND `type` = 1 AND `item` IN
  (31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221);
-- 28989 Aemara: 2
DELETE FROM `npc_vendor` WHERE `entry` = 28989 AND `type` = 1 AND `item` IN
  (44637, 44643);
-- 28990 Anthony Durain: 2
DELETE FROM `npc_vendor` WHERE `entry` = 28990 AND `type` = 1 AND `item` IN
  (40700, 40701);
-- 29049 Arille Azuregaze: 6
DELETE FROM `npc_vendor` WHERE `entry` = 29049 AND `type` = 1 AND `item` IN
  (33444, 33445, 35954, 40035, 40036, 40042);
-- 29491 Karandonna: 15
DELETE FROM `npc_vendor` WHERE `entry` = 29491 AND `type` = 1 AND `item` IN
  (42360, 42361, 42363, 42365, 42368, 42369, 42370, 42371, 42372, 42373, 42374, 42375, 42376, 42377, 42378);
-- 29512 Ainderu Summerleaf: 5
DELETE FROM `npc_vendor` WHERE `entry` = 29512 AND `type` = 1 AND `item` IN
  (21895, 21916, 21917, 21918, 21919);
-- 29537 Darahir: 9
DELETE FROM `npc_vendor` WHERE `entry` = 29537 AND `type` = 1 AND `item` IN
  (22147, 22148, 22832, 33448, 37201, 39973, 44605, 44614, 44615);
-- 29538 Hexil Garrot: 24
DELETE FROM `npc_vendor` WHERE `entry` = 29538 AND `type` = 1 AND `item` IN
  (40694, 40695, 40702, 40704, 40716, 40738, 40739, 40748, 40749, 44641, 44644, 44652, 45829, 45830, 45838,
   45839, 45846, 45847, 50972, 50973, 50981, 50982, 50994, 50995);
-- 29547 Applebough: 6
DELETE FROM `npc_vendor` WHERE `entry` = 29547 AND `type` = 1 AND `item` IN
  (27856, 29450, 35948, 35949, 43086, 43088);
-- 30885 Blazik Fireclaw: 104
DELETE FROM `npc_vendor` WHERE `entry` = 30885 AND `type` = 1 AND `item` IN
  (25829, 34986, 35008, 35016, 35020, 35021, 35027, 35028, 35029, 35030, 35031, 35039, 35040, 35041, 35059,
   35060, 35061, 35062, 35063, 35073, 35074, 35088, 35089, 35090, 35091, 35092, 35094, 35105, 35106, 35129,
   35130, 35131, 35132, 35133, 35134, 35135, 35140, 35145, 35146, 35148, 35155, 35160, 35161, 35163, 35170,
   35175, 35176, 35178, 37927, 37928, 37929, 41591, 41592, 44429, 44431, 51330, 51331, 51332, 51333, 51334,
   51335, 51336, 51346, 51347, 51348, 51349, 51353, 51354, 51355, 51356, 51357, 51358, 51359, 51360, 51361,
   51362, 51363, 51364, 51377, 51396, 51407, 51408, 51409, 51417, 51423, 51437, 51452, 51455, 51468, 51469,
   51470, 51471, 51472, 51473, 51474, 51475, 51476, 51477, 51478, 51479, 51501, 51513, 51533, 69861);
-- 32287 Archmage Alvareaux: 18
DELETE FROM `npc_vendor` WHERE `entry` = 32287 AND `type` = 1 AND `item` IN
  (41718, 42188, 43157, 44141, 44159, 44166, 44167, 44170, 44171, 44173, 44174, 44176, 44179, 44180, 44181,
   44182, 44183, 50368);
-- 32334 Nixi Fireclaw: 4
DELETE FROM `npc_vendor` WHERE `entry` = 32334 AND `type` = 1 AND `item` IN
  (33444, 33445, 35954, 43236);
-- 32337 Christi Stockton: 8
DELETE FROM `npc_vendor` WHERE `entry` = 32337 AND `type` = 1 AND `item` IN
  (44621, 44622, 44623, 44625, 44626, 44632, 44678, 44679);
-- 32403 Sandra Bartan: 12
DELETE FROM `npc_vendor` WHERE `entry` = 32403 AND `type` = 1 AND `item` IN
  (33443, 33444, 33445, 33449, 33454, 35950, 35952, 35953, 35954, 40035, 40036, 40042);
-- 43408 Aili Greenwillow: 1
DELETE FROM `npc_vendor` WHERE `entry` = 43408 AND `type` = 1 AND `item` IN
  (37460);
-- 43411 Lenedil Moonwing: 4
DELETE FROM `npc_vendor` WHERE `entry` = 43411 AND `type` = 1 AND `item` IN
  (58256, 58260, 58274, 58279);
-- 248196 Apothecary Durelle: 1
DELETE FROM `npc_vendor` WHERE `entry` = 248196 AND `type` = 1 AND `item` IN
  (250996);


-- ===== Everlake 2026_11_26_96_world_everlake_digestible_research_journal.sql =====
-- Digestible Research (95790, Alliance, ends at Curator Thorius 8256): the quest had no giver on the realm (tracker
-- quest gaps, 2026-11-26). 2026_11_26_96_world_everlake_digestible_research_journal.sql: written by hand, not tried in game.
--
-- What the sources give:
--   - Wowhead Forever quest 95790: no starter listed; its one comment: "Quest is given inside the instance, at the start."
--     Its text opens "<This journal seems to have been torn to shreds ... a field journal of one of the unfortunate
--     Explorers' League adventurers. Chew marks ... raptors.>": the giver is a journal, not a person.
--   - Icy Veins WoW Forever gameobject 649128 "Partially Digested Journal" (added in 70888): type 2 (quest giver),
--     display 470, scale 1, content tuning 5841, props [0, 29809, 0 ...]. The realm had no template for it.
-- INFERRED (no source links the object to the quest by id, and none gives its position): 649128 is the giver of 95790
-- (the only journal object of that build, named for the quest's 15 Partially Digested Journal Pages, item 271972), and it
-- lies at the start of The Shaper's Terrace (map 3001), 4 yards beside the spot players arrive at (world_safe_locs
-- 1104146, -6117.1 -1246.4 -143.25), at the height of the server's maps (ForeverTracker tools/height.py). Orientation 0,
-- rotation 0 and a 2 min respawn are INFERRED. A look in game should move it where live has it.
--
-- Own guid block 920027310-920027319 (920027310 used). Each row goes in only while missing and is recorded in
-- everlake_import_rows. Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_96_world_everlake_digestible_research_journal.sql';

START TRANSACTION;

-- the object (Icy Veins gameobject 649128), only while the realm has none
SET @EVERLAKE_NEW_T := (SELECT COUNT(*) = 0 FROM `gameobject_template` WHERE `entry` = 649128);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `ContentTuningId`, `AIName`, `ScriptName`, `VerifiedBuild`)
SELECT 649128, 2, 470, 'Partially Digested Journal', '', '', '', 1, 0, 29809, 5841, '', '', 70888 FROM DUAL WHERE @EVERLAKE_NEW_T;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject_template', 649128, 0, 0, 0, @EVERLAKE_FILE, 'icyveins gameobject 649128' FROM DUAL WHERE @EVERLAKE_NEW_T;

-- it gives Digestible Research (INFERRED from the quest text and the Wowhead comment)
SET @EVERLAKE_NEW_S := (SELECT COUNT(*) = 0 FROM `gameobject_queststarter` WHERE `id` = 649128 AND `quest` = 95790)
  AND (SELECT COUNT(*) = 1 FROM `quest_template` WHERE `ID` = 95790);
INSERT INTO `gameobject_queststarter` (`id`, `quest`) SELECT 649128, 95790 FROM DUAL WHERE @EVERLAKE_NEW_S;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject_queststarter', 649128, 95790, 0, 0, @EVERLAKE_FILE, 'INFERRED: journal text of 95790; Wowhead quest 95790 comment' FROM DUAL WHERE @EVERLAKE_NEW_S;

-- one spawn at the start of the dungeon, while its guid is free and the object has no spawn but this file's own
SET @EVERLAKE_NEW_G := (SELECT COUNT(*) = 0 FROM `gameobject` WHERE `guid` = 920027310)
  AND (SELECT COUNT(*) = 0 FROM `gameobject` WHERE `id` = 649128 AND (`guid` < 920027310 OR `guid` > 920027319));
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 920027310, 649128, 3001, 0, 0, '1,201', 0, 0, 0, -1, -6117.1, -1242.4, -143.25, 0, 0, 0, 0, 1, 120, 255, 1, '', NULL, 0
FROM DUAL WHERE @EVERLAKE_NEW_G;
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'gameobject', 920027310, 0, 0, 0, @EVERLAKE_FILE, 'INFERRED: beside the landing (Wowhead quest 95790 comment); height.py' FROM DUAL WHERE @EVERLAKE_NEW_G;

COMMIT;


-- ===== Everlake 2026_11_26_97_world_everlake_state_secrets_alliance_handin.sql =====
-- State Secrets (96377, Alliance, Renzik the Shiv 6946): hand-in quest with no giver's text (tracker quest gaps, 2026-11-26).
-- 2026_11_26_97_world_everlake_state_secrets_alliance_handin.sql: written by hand, not tried in game.
--
-- Live has no quest text for any of the three State Secrets quests: Icy Veins WoW Forever quests 96376, 96377 and 96379
-- have description and objective NULL, the Wowhead Forever and ForeverChanges pages show none, and players' addons
-- recorded only the progress and turn-in words (which the realm already has). Each is the hand-in of the Document Box
-- (274041, the reward of More Valuable Than Gold 96337) to one faction's spymaster, and Icy Veins records Renzik only as
-- the ender of 96377.
-- The realm built the Horde (96376) and neutral (96379) copies as hand-in quests (QuestType 0, 2026_11_14_950), but the
-- Alliance copy 96377 came in later (2026_11_20_25) as a normal quest (QuestType 2), which asks for giver's text that
-- live does not have. INFERRED from its two siblings: 96377 is a hand-in quest too. Only changed while it is still the
-- row 2026_11_20_25 wrote (QuestType 2, no description, no objectives text).
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

UPDATE `quest_template` SET `QuestType` = 0
WHERE `ID` = 96377 AND `QuestType` = 2
  AND COALESCE(`QuestDescription`, '') = '' AND COALESCE(`LogDescription`, '') = '';


-- ===== Everlake 2026_11_26_98_world_everlake_hyjal_quest_credit_npcs.sql =====
-- Three Mount Hyjal (Forever zone 616, UiMap 2482) quests whose objective creatures were not on the realm (2026-11-26).
-- 2026_11_26_98_world_everlake_hyjal_quest_credit_npcs.sql: written by hand from the tracker's kept facts, not tried in game.
-- The core has no script for any NPC, spell or quest below (checked in the fork's src/ and sql/custom/).
--
-- 1. 92833 Ve'han's Fall counts creature 260674 "Ve'han Talongrasp", which has no spawn on live either (Wowhead
--    Forever and Icy Veins give no map point for it). The one in the world is the elite 267182 "Ve'han Talongrasp,
--    Disciple of the Wild King" (Wowhead Forever tooltip, Icy Veins, EG Link creature_details 71091): it drops the
--    same quest item 270301 and its map points (Wowhead 75.8 32.6 / 75.8 35 / 76.0 33.8, Icy Veins loot point 76.5
--    34.9) are the realm's three 267182 spawns (42000067-69, from 2026_11_05_99). The realm still holds the old
--    record for 267182, "Ve'ho Manyhorns, Lieutenant of the Wild King", model 142562; live has Ve'han, model 149297
--    at scale 1.25 (Icy Veins npc_display, EG Link). So:
--      - 267182 gets the live name, title and model, each only while it holds the old one;
--      - 260674 gets a template (Icy Veins / EG Link: humanoid, unit class 2, model 149297, health x1.5, mana x1.1,
--        CreatureDifficultyID 343881; level 60 INFERRED from 267182 and the quest level) and is 267182's KillCredit1,
--        so killing Ve'han counts. INFERRED: live may turn the elite into 260674 once the staff is used; the credit
--        is the same either way.
--      - Wowhead Forever lists 1326056 Blackthorne's Ward among 267182's abilities, and the quest's Staff of the
--        Mountain (267079) casts 1279523 Remove Protection, whose client SpellEffect is REMOVE_AURA 1326056 on the
--        target ("Dispel the magic protecting him", quest text). 267182 wears the ward from spawn (addon aura), so
--        the staff has something to strip, only where 267182 has no addon row.
-- 2. 96003 Drawing Down the Malevolent counts 263427 "Bethra'zel the Feeble" and 263426 "Mazzogore the Weak". Live
--    has no spawn of either (no map point in any source). The demons in the world are the elites 263394 Bethra'zel
--    and 252457 Mazzogore (Wowhead Forever: level 60 elite demons, hostile to both factions; Icy Veins: level 60,
--    one loot point each, Mount Hyjal 58.6 32.5 and 50.5 39.7). The realm has none of the four. All four get
--    templates from Icy Veins' npc records (type, unit class, model and scale, health and mana multipliers,
--    CreatureDifficultyID), level 60 (Icy Veins addon_levels for the elites, INFERRED for the weak ones), faction 14
--    like the camp's Doomguards (249236). The elites carry the weak ones as KillCredit1 (INFERRED as in 1: the quest's
--    Eye of Endless Influence casts 1289714 Power Sap, a dummy effect the core does not script). One spawn each at
--    Icy Veins' loot point, turned into a world position with the client's UiMapAssignment, height from the realm's
--    maps and vmaps (ForeverTracker tools/height.py) on the floor nearest the camp's Doomguards (z hints 1497 and
--    1540). Respawn 300 s, no wander, orientation 0: INFERRED. Their loot and abilities are left out.
-- 3. 93383 Contents Under Pressure: "Wait until you can safely open the Personal Survival Pack." counts 254777, an
--    invisible Personal Survival Pack (Icy Veins: type 10, model 11686, the realm's other kill-credit bunnies use the
--    same). No source records how long the wait is or what gives the credit. The pack the player talks to (254644,
--    spawned on the realm at Icy Veins' talk point) gives the credit when the quest is accepted, by SmartAI. INFERRED:
--    live makes the player wait a moment first (the progress text "The red indicator light on the radio flashes
--    dimly"); no source gives the time, so there is no wait here. 254777 gets a bunny template (as 272603 in the
--    core's 2026_11_22_60) because the SmartAI credit needs one.
--
-- Guids 920036600-920036601, a block of their own (920036600-920036649).
-- Rows are only added where none exist, AI only where the NPC has none. Added rows are recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_98_world_everlake_hyjal_quest_credit_npcs.sql';

START TRANSACTION;

-- new templates, only where the entry has none
DROP TEMPORARY TABLE IF EXISTS `everlake_hy_npc`;
CREATE TEMPORARY TABLE `everlake_hy_npc` (
  `entry` int unsigned NOT NULL, `credit` int unsigned NOT NULL, `name` varchar(100) NOT NULL, `subname` varchar(100) NULL,
  `faction` int unsigned NOT NULL, `classification` tinyint NOT NULL, `unit_class` tinyint NOT NULL, `unit_flags` int unsigned NOT NULL,
  `type` tinyint NOT NULL, `flags_extra` int unsigned NOT NULL, `display` int unsigned NOT NULL, `scale` float NOT NULL,
  `health` float NOT NULL, `mana` float NOT NULL, `cdid` int NOT NULL, `level` tinyint unsigned NOT NULL, `note` varchar(255) NOT NULL,
  `ok` tinyint NOT NULL DEFAULT 0, PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `everlake_hy_npc` VALUES
(260674, 0, 'Ve''han Talongrasp', 'Disciple of the Wild King', 14, 0, 2, 0, 7, 0, 149297, 1, 1.5, 1.1, 343881, 60, 'Icy Veins + EG Link 71091 npc 260674; level INFERRED', 0),
(263426, 0, 'Mazzogore the Weak', NULL, 14, 0, 1, 0, 3, 0, 137433, 1, 1.2, 1, 346733, 60, 'Icy Veins + EG Link 71091 npc 263426; level INFERRED', 0),
(263427, 0, 'Bethra''zel the Feeble', NULL, 14, 0, 2, 0, 3, 0, 4426, 1.25, 1.5, 5, 346734, 60, 'Icy Veins + EG Link 71091 npc 263427; level INFERRED', 0),
(252457, 263426, 'Mazzogore', NULL, 14, 1, 1, 0, 3, 0, 137433, 1.5, 5, 1, 333297, 60, 'Icy Veins + EG Link 71091 npc 252457, Wowhead Forever elite; KillCredit1 INFERRED', 0),
(263394, 263427, 'Bethra''zel', NULL, 14, 1, 2, 0, 3, 0, 4426, 2, 20, 5, 346701, 60, 'Icy Veins + EG Link 71091 npc 263394, Wowhead Forever elite; KillCredit1 INFERRED', 0),
(254777, 0, 'Personal Survival Pack', NULL, 35, 0, 2, 33554432, 10, 128, 11686, 1, 5.05, 1, 335683, 57, 'Icy Veins npc 254777 (type 10, model 11686), Wowhead level 57; bunny flags as 272603', 0);
UPDATE `everlake_hy_npc` s SET s.`ok` = 1 WHERE NOT EXISTS (SELECT 1 FROM `creature_template` t WHERE t.`entry` = s.`entry`);

INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Classification`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `family`, `trainer_class`, `type`, `VehicleId`, `AIName`, `MovementType`, `ExperienceModifier`, `RacialLeader`, `movementId`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT s.`entry`, s.`credit`, 0, s.`name`, NULL, s.`subname`, NULL, NULL, 0, 0, s.`faction`, 0, 1, 1.14286, 1, s.`classification`, 0, 2000, 2000, 1, 1, s.`unit_class`, s.`unit_flags`, 2048, 0, 0, 0, s.`type`, 0, '', 0, 1, 0, 0, 0, 0, 1, 0, s.`flags_extra`, '', NULL, 0
FROM `everlake_hy_npc` s WHERE s.`ok` = 1;
INSERT INTO `creature_template_difficulty` (`Entry`, `DifficultyID`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `ContentTuningID`, `HealthScalingExpansion`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `CreatureDifficultyID`, `TypeFlags`, `TypeFlags2`, `TypeFlags3`, `LootID`, `PickPocketLootID`, `SkinLootID`, `GoldMin`, `GoldMax`, `StaticFlags1`, `StaticFlags2`, `StaticFlags3`, `StaticFlags4`, `StaticFlags5`, `StaticFlags6`, `StaticFlags7`, `StaticFlags8`, `VerifiedBuild`)
SELECT s.`entry`, 0, 0, 0, 0, 0, s.`health`, s.`mana`, 1, 1, s.`cdid`, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
FROM `everlake_hy_npc` s WHERE s.`ok` = 1 AND NOT EXISTS (SELECT 1 FROM `creature_template_difficulty` d WHERE d.`Entry` = s.`entry` AND d.`DifficultyID` = 0);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)
SELECT s.`entry`, 0, s.`display`, s.`scale`, 1, 0
FROM `everlake_hy_npc` s WHERE s.`ok` = 1 AND NOT EXISTS (SELECT 1 FROM `creature_template_model` m WHERE m.`CreatureID` = s.`entry`);
INSERT INTO `creature_classic_level` (`entry`, `level_min`, `level_max`)
SELECT s.`entry`, s.`level`, s.`level` FROM `everlake_hy_npc` s WHERE s.`ok` = 1 AND NOT EXISTS (SELECT 1 FROM `creature_classic_level` l WHERE l.`entry` = s.`entry`);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template', s.`entry`, 0, 0, 0, @EVERLAKE_FILE, s.`note` FROM `everlake_hy_npc` s WHERE s.`ok` = 1;
DROP TEMPORARY TABLE `everlake_hy_npc`;

-- 1. 267182: live name, title and model; credit 260674; Blackthorne's Ward from spawn
UPDATE `creature_template` SET `name` = 'Ve''han Talongrasp', `subname` = 'Disciple of the Wild King'
WHERE `entry` = 267182 AND `name` = 'Ve''ho Manyhorns';
UPDATE `creature_template_model` SET `CreatureDisplayID` = 149297, `DisplayScale` = 1.25
WHERE `CreatureID` = 267182 AND `Idx` = 0 AND `CreatureDisplayID` = 142562;
SET @EVERLAKE_HAS_260674 := (SELECT COUNT(*) FROM `creature_template` WHERE `entry` = 260674);
UPDATE `creature_template` SET `KillCredit1` = 260674
WHERE `entry` = 267182 AND `KillCredit1` = 0 AND `KillCredit2` <> 260674 AND @EVERLAKE_HAS_260674 > 0;
INSERT INTO `creature_template_addon` (`entry`, `PathId`, `mount`, `MountCreatureID`, `StandState`, `AnimTier`, `VisFlags`, `SheathState`, `PvPFlags`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `visibilityDistanceType`, `auras`)
SELECT 267182, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '1326056' FROM DUAL
WHERE EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 267182)
  AND NOT EXISTS (SELECT 1 FROM `creature_template_addon` WHERE `entry` = 267182);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template_addon', 267182, 0, 0, 0, @EVERLAKE_FILE, 'Wowhead Forever ability 1326056; client SpellEffect of 1279523 removes it'
FROM `creature_template_addon` WHERE `entry` = 267182 AND `auras` = '1326056';

-- 2. Bethra'zel and Mazzogore (own block: put back as written)
DELETE FROM `creature` WHERE `guid` BETWEEN 920036600 AND 920036649;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnDifficulties`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `MovementType`, `VerifiedBuild`)
SELECT 920036600, 252457, 1, '0', 5385.51, -2676.05, 1494.20, 0, 300, 0, 0, 0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 252457);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnDifficulties`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `MovementType`, `VerifiedBuild`)
SELECT 920036601, 263394, 1, '0', 5552.85, -2958.05, 1537.19, 0, 300, 0, 0, 0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 263394);

-- 3. Personal Survival Pack (254644): credit 254777 when Contents Under Pressure is accepted
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `action_param7`, `action_param_string`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_param_string`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
SELECT 254644, 0, 0, 0, '', 19, 0, 100, 0, 93383, 0, 0, 0, 0, '', 33, 254777, 0, 0, 0, 0, 0, 0, '', 7, 0, 0, 0, 0, '', 0, 0, 0, 0, 'Personal Survival Pack - On quest 93383 accepted - Kill credit 254777 to the player'
FROM DUAL
WHERE EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 254644 AND `AIName` = '' AND `ScriptName` = '')
  AND EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 254777)
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` WHERE `entryorguid` = 254644 AND `source_type` = 0);
UPDATE `creature_template` SET `AIName` = 'SmartAI'
WHERE `entry` = 254644 AND `AIName` = '' AND `ScriptName` = ''
  AND EXISTS (SELECT 1 FROM `smart_scripts` WHERE `entryorguid` = 254644 AND `source_type` = 0 AND `event_type` = 19 AND `event_param1` = 93383);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'smart_scripts', 254644, 0, 0, 0, @EVERLAKE_FILE, 'Icy Veins/Wowhead: 254644 starts and ends 93383, objective 254777; no wait (time unknown)'
FROM `smart_scripts` WHERE `entryorguid` = 254644 AND `source_type` = 0 AND `id` = 0 AND `event_type` = 19;

COMMIT;


-- ===== Everlake 2026_11_26_99_world_everlake_twilight_ritual_circle.sql =====
-- Twilight Ritual Circle (262006) for Sickening Lights (95602, Horde, Riverglades), template only (2026-11-26).
-- 2026_11_26_99_world_everlake_twilight_ritual_circle.sql: written by hand from the tracker's kept facts, not tried in game.
--
-- 95602 "Destroy 5 Twilight Ritual Circles found throughout the caves underneath Sunnyglade" counts 272603
-- "[DNT] Kill Credit" (on the realm since the core's 2026_11_22_60, unspawned like on live). The thing the player
-- destroys is the creature 262006 "Twilight Ritual Circle" (EG Link creatures 70938-71037: seen 13-30 times, level 1,
-- hostile to the Horde; Icy Veins npc 262006: 16 sightings on UiMap 2548 Riverglades, level 1; Wowhead Forever:
-- objective of the Alliance twin 95642). The realm has no template for it. It gets one from Icy Veins' record (type 10,
-- unit class 1, model 143045, health x1.35, CreatureDifficultyID 345276), level 1, faction 14 (hostile to both: the
-- Alliance quest destroys them too, INFERRED), no movement. KillCredit1 = 272603, so destroying one counts for 95602
-- (INFERRED: no source names the link; 272603 has no spawn and is objective of 95602 only).
--
-- NOT spawned: Icy Veins' sightings are where the watching player stood (they sit 30-100 yards from each other above
-- a cave model with floors from about +8 down to -55), and no source gives a circle's own position or cave floor.
-- Place them in game (Forge) in the caves under Sunnyglade near Clubtoe (260931).
--
-- Rows are only added where none exist and are recorded in everlake_import_rows.
-- Never edit this file once it is deployed: a later fix is a new file. Running it again changes nothing.

CREATE TEMPORARY TABLE IF NOT EXISTS `everlake_import_rows` (
  `tbl` varchar(64) NOT NULL COMMENT 'world table of the row',
  `k1` bigint NOT NULL COMMENT 'the row''s key, in the table''s primary key order',
  `k2` bigint NOT NULL DEFAULT '0',
  `k3` bigint NOT NULL DEFAULT '0',
  `k4` bigint NOT NULL DEFAULT '0',
  `file` varchar(200) NOT NULL COMMENT 'the update file that added the row',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT 'the sources that gave it',
  PRIMARY KEY (`tbl`, `k1`, `k2`, `k3`, `k4`),
  KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rows the Everlake world import added';
SET @EVERLAKE_FILE := '2026_11_26_99_world_everlake_twilight_ritual_circle.sql';

START TRANSACTION;

SET @EVERLAKE_NEW_262006 := (SELECT COUNT(*) = 0 FROM `creature_template` WHERE `entry` = 262006);
SET @EVERLAKE_HAS_272603 := (SELECT COUNT(*) > 0 FROM `creature_template` WHERE `entry` = 272603);

INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Classification`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `family`, `trainer_class`, `type`, `VehicleId`, `AIName`, `MovementType`, `ExperienceModifier`, `RacialLeader`, `movementId`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 262006, IF(@EVERLAKE_HAS_272603, 272603, 0), 0, 'Twilight Ritual Circle', NULL, NULL, NULL, NULL, 0, 0, 14, 0, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 10, 0, '', 0, 1, 0, 1693, 0, 0, 1, 0, 0, '', NULL, 0
FROM DUAL WHERE @EVERLAKE_NEW_262006;
INSERT INTO `creature_template_difficulty` (`Entry`, `DifficultyID`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `ContentTuningID`, `HealthScalingExpansion`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `CreatureDifficultyID`, `TypeFlags`, `TypeFlags2`, `TypeFlags3`, `LootID`, `PickPocketLootID`, `SkinLootID`, `GoldMin`, `GoldMax`, `StaticFlags1`, `StaticFlags2`, `StaticFlags3`, `StaticFlags4`, `StaticFlags5`, `StaticFlags6`, `StaticFlags7`, `StaticFlags8`, `VerifiedBuild`)
SELECT 262006, 0, 0, 0, 0, 0, 1.35, 1, 1, 1, 345276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
FROM DUAL WHERE @EVERLAKE_NEW_262006 AND NOT EXISTS (SELECT 1 FROM `creature_template_difficulty` WHERE `Entry` = 262006 AND `DifficultyID` = 0);
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)
SELECT 262006, 0, 143045, 1, 1, 0
FROM DUAL WHERE @EVERLAKE_NEW_262006 AND NOT EXISTS (SELECT 1 FROM `creature_template_model` WHERE `CreatureID` = 262006);
INSERT INTO `creature_classic_level` (`entry`, `level_min`, `level_max`)
SELECT 262006, 1, 1 FROM DUAL WHERE @EVERLAKE_NEW_262006 AND NOT EXISTS (SELECT 1 FROM `creature_classic_level` WHERE `entry` = 262006);
INSERT IGNORE INTO `everlake_import_rows` (`tbl`, `k1`, `k2`, `k3`, `k4`, `file`, `note`)
SELECT 'creature_template', 262006, 0, 0, 0, @EVERLAKE_FILE, 'Icy Veins + EG Link npc 262006; KillCredit1 272603 INFERRED (95602)'
FROM DUAL WHERE @EVERLAKE_NEW_262006;

COMMIT;


-- ===== Everlake 2026_11_26_910_world_everlake_alard_trainer_strays.sql =====
-- Alard Schmied (28694, Blacksmithing Trainer at old Dalaran) taught 99 spells that this game does not have.
-- 2026_11_26_910_world_everlake_alard_trainer_strays.sql: written from the test realm's world (2026-11-26, tracker
-- Query page) after the vendor cleanups (2026_11_26_92, _93, _95).
--
-- Checked: every trainer_spell row (704 trainers, 4638 spells) against the client's SpellName and hotfixes.spell_name.
-- 2473 spells are in neither; of the trainers a spawned creature uses (creature_trainer), only trainer 813 has any:
-- 99 of its 154 rows, Wrath and later blacksmithing recipes from the base world database. No remaining trainer spell
-- needs one of the missing spells as ReqAbility. Trainers no spawned creature uses (4321 such rows) are left alone.
--
-- Running it again changes nothing.

DELETE FROM `trainer_spell` WHERE `TrainerId` = 813 AND `SpellId` IN
  (52567, 52568, 52569, 52570, 52571, 52572, 54550, 54551, 54552, 54553, 54554, 54555, 54556, 54557, 54917,
   54918, 54941, 54944, 54945, 54946, 54947, 54948, 54949, 55013, 55014, 55015, 55017, 55055, 55056, 55057,
   55058, 55174, 55177, 55179, 55181, 55182, 55185, 55200, 55201, 55203, 55204, 55206, 55298, 55300, 55301,
   55302, 55303, 55304, 55305, 55306, 55307, 55308, 55309, 55310, 55311, 55312, 55369, 55370, 55371, 55372,
   55373, 55374, 55375, 55376, 55377, 55656, 55834, 55835, 55839, 56234, 56280, 56357, 56400, 56549, 56550,
   56551, 56552, 56553, 56554, 56555, 56556, 59405, 59406, 59436, 59438, 59440, 59441, 59442, 61008, 61009,
   61010, 63182, 264435, 264439, 330149, 330150, 330151, 330152, 330153);


-- ===== Everlake 2026_11_26_911_world_everlake_tbc_quest_object_strays.sql =====
-- Four TBC quest objects stood on the old continents and opened to nothing: 21 spawns.
-- 2026_11_26_911_world_everlake_tbc_quest_object_strays.sql: written from the test realm's world (2026-11-26, tracker
-- Query page) while checking every spawned object.
--
-- Each one's loot table has no rows, and the quest item it is meant to give is in neither the client's ItemSparse, the
-- live hotfixes nor hotfixes.item_sparse; nobody gives the quests:
--   181687 Warsong Lumber Pile   18 spawns, Ashenvale            item 23776, no quest asks for it
--   181620 Unopened Crate         1 spawn                         item 23646, quest 9435 "[DEPRECATED] Missing Crystals"
--   181627 Weapon Rack            1 spawn                         item 23660, quest 9439 "Unclaimed Baggage"
--   182063 Basin of Holy Water    1 spawn, Eastern Plaguelands    item 24284, quest 9735 "True Masters of the Light"
-- The spawns come from the base world database (guid = entry * 100 + n), not from the core's SQL or this repository.
-- No addon, pool, game event, spawn group, override or SmartAI row refers to them. The templates stay.
--
-- Running it again changes nothing.

DELETE FROM `gameobject` WHERE `id` IN (181687, 181620, 181627, 182063) AND `guid` IN
  (18162000, 18162700, 18168700, 18168701, 18168702, 18168703, 18168704, 18168705, 18168706, 18168707, 18168708,
   18168709, 18168710, 18168711, 18168712, 18168713, 18168714, 18168715, 18168716, 18168717, 18206300);


-- ===== Everlake 2026_11_26_912_world_everlake_lunar_elder_foreign_options.sql =====
-- Lunar Festival elders showed 12 gossip options and 10 greetings from other expansions' NPCs.
-- 2026_11_26_912_world_everlake_lunar_elder_foreign_options.sql: written from the test realm's world (2026-11-26,
-- tracker Query page) while checking every spawned NPC's gossip menu.
--
-- The elders' menus (creature_template_gossip, build 48676) share their ids with Legion-era menus in the base world
-- database, so their option lists also held those NPCs' options (builds 27101-27980, one pair 62748), for example:
--   21059 Elder Starweave    "Why is an ethereal traveling on a ship full of draenei?", "... Locus-Walker?", a shop
--   21071 Elder Windrun      "I need a cache key [100 Nethershards]", "I have Nethershards, are you willing to trade?"
--   21043 Elder Primestone   "I want to transmogrify my gear.", "I would like to buy from you."
--   21063 Elder Stormbrow    "I would like to buy from you." (no stock)
--   21004 Bladesing, 21013 Dawnstrider, 21017 Goldwell, 21058 Starsong: one stray line each
-- Their four conditions (quest-not-taken checks on the elders' coin quests) go with them; no locale row or SmartAI
-- script refers to them. The elders' "Where is Elder ...?" options and their quests stay.
--
-- Ten of these menus also held those NPCs' greeting as a second, unconditioned text (gossip_menu, builds 27101-27980),
-- beside the elder's own (7933, 7935 or 7956): "Wanna know the key to beating the Legion? Buildings, mate.",
-- "I will never trust the Betrayer or his Illidari lackeys...", "You again? You can't have my treasure!" and so on.
-- Those ten rows go too; each menu keeps its elder text.
--
-- Running it again changes nothing.

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND (`SourceGroup`, `SourceEntry`) IN
  ((21043, 1), (21059, 1), (21059, 2), (21071, 1));
DELETE FROM `gossip_menu_option` WHERE (`MenuID`, `OptionID`) IN
  ((21004, 0), (21013, 0), (21017, 0), (21043, 0), (21043, 1), (21058, 0), (21059, 0), (21059, 1), (21059, 2),
   (21063, 0), (21071, 0), (21071, 1));
DELETE FROM `gossip_menu` WHERE (`MenuID`, `TextID`) IN
  ((21004, 31695), (21005, 31696), (21013, 31708), (21017, 31715), (21058, 31832), (21059, 31834), (21062, 31837),
   (21063, 31838), (21066, 31841), (21071, 31895));


-- ===== Everlake 2026_11_26_913_world_everlake_primestone_transmog_greeting.sql =====
-- Elder Primestone (15570, Lunar Festival, Silithus) kept a transmogrifier's greeting beside her own.
-- 2026_11_26_913_world_everlake_primestone_transmog_greeting.sql: follow-up to
-- 2026_11_26_912_world_everlake_lunar_elder_foreign_options.sql, which removed her menu's transmog and shop options but
-- missed this text (its row carries build 56461, outside the Legion builds that file looked for).
--
-- Menu 21043 held two unconditioned texts: 7933, the elders' "Now is the time when the year is new and the moon shines
-- bright...", and 31799, "I have all the tools necessary to adjust the appearance of your weapons and armor. Shall we
-- begin?". The second goes; 7933 stays. The npc_text row stays for whatever else uses it.
--
-- Running it again changes nothing.

DELETE FROM `gossip_menu` WHERE `MenuID` = 21043 AND `TextID` = 31799;
