-- New spawns of 2026_11_25_20: the model info and loot they were missing (dev DBErrors.log, af70f).
-- Sebastian Jurgens 228956 (gives Rift Away 84213, spawned by 2026_11_25_20) uses display 121807, which had no `creature_model_info`
-- row, so the server dropped the spawn at load ("No model data exist for `CreatureDisplayID` = 121807", "invalid model 121807 ...
-- can't load"). 121807 is in the client's CreatureDisplayInfo (70959 to 71091) on model 2244, the model of displays
-- 16063 and 16176: it takes their size, else a human-sized 0.306 / 1.5. A later sniff replaces it. Safe to run again.
INSERT IGNORE INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`, `VerifiedBuild`)
SELECT 121807,
    COALESCE((SELECT `BoundingRadius` FROM `creature_model_info` WHERE `DisplayID` IN (16063, 16176) ORDER BY `DisplayID` LIMIT 1), 0.306),
    COALESCE((SELECT `CombatReach` FROM `creature_model_info` WHERE `DisplayID` IN (16063, 16176) ORDER BY `DisplayID` LIMIT 1), 1.5),
    0, 0;

-- Book 441247 and Old Crate 442688 (also spawned by 2026_11_25_20) point at loot 123805 and 123680, which we did not have, so both
-- opened empty. Their contents as Everlake's world data names them (1b7b651, GPL-3, with credit): the Book holds item 220345, the
-- Old Crate holds the Old Key 221497, which starts The Old Key 95599. Safe to run again.
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (123805, 123680);
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(123805, 0, 220345, 100, 0, 1, 0, 1, 1, 'Book 441247'),
(123680, 0, 221497, 100, 0, 1, 0, 1, 1, 'Old Crate 442688: Old Key');
