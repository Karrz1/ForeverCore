-- Wetlands quests that could not be taken, and quests with no place marked on the map (Discord "bugs 10", items 5 to 11).
--   Trying Times (98246, Howin Kindfeather 270637): 12 Perfect Razormaw Eggs from the egg nests at Raptor Ridge and Saltspray Glen.
--   Bring Back a Bang (88756, Ashlan Stonesmirk 1073): 3 Stolen Explosives from the Dark Iron tents on Direforge Hill.
--     Both quest records are live's (EG Link build 70888, as Everlake's 2026_11_14_950 build has them; Efficient Games,
--     https://efficient.games, CC BY 4.0); giver and turn-in from QuestieDB's Forever play traces (Questie team, GPL-3.0); the 13 + 29
--     egg nests and 6 explosives were never spawned: their spots are Everlake's 2026_11_19_937 (Wowhead Forever map points, heights
--     from the realm's maps), with Everlake's loot rows (one item, only while the quest needs it). Everlake's world data:
--     github.com/buildthehomelab/wow-everlake-world-data (GPL-3.0). Same guids as there, only where the object has no spawn yet.
--   Map areas for Sunscorched Shells (1710), Slowing the Orc Advance (86757), Bloom of the Heavens (98208), Vengeful Trail (98417),
--   Shared Fury (98418) and the two quests above, plus the turn-in where the quest had none: each area is drawn round our own
--   spawns of what the step needs (the creatures that drop the item, the objects that hold it, the creatures to kill), not sniffed.
--   An area goes in only where that quest step has no marker yet, so live markers that come later win. Vengeful Trail and Shared
--   Fury need Maseara Autumnmoon's quests (forestsong-1121, 2026_11_21_71) first; without them their lines change nothing.
-- Not here: Spark of Freedom (87491, the Dun Modr escort): it needs an escort script, a separate fix.
-- Safe to run more than once.

-- Quest records, givers and turn-ins
DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_template`;
CREATE TEMPORARY TABLE `forever_k70_quest_template` SELECT `ID`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`RewardItem2`,`RewardAmount2`,`ItemDrop2`,`ItemDropQuantity2`,`RewardItem3`,`RewardAmount3`,`ItemDrop3`,`ItemDropQuantity3`,`RewardItem4`,`RewardAmount4`,`ItemDrop4`,`ItemDropQuantity4`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardChoiceItemID4`,`RewardChoiceItemQuantity4`,`RewardChoiceItemID5`,`RewardChoiceItemQuantity5`,`RewardChoiceItemID6`,`RewardChoiceItemQuantity6`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionCapIn1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`RewardFactionCapIn2`,`RewardFactionID3`,`RewardFactionValue3`,`RewardFactionOverride3`,`RewardFactionCapIn3`,`RewardFactionID4`,`RewardFactionValue4`,`RewardFactionOverride4`,`RewardFactionCapIn4`,`RewardFactionID5`,`RewardFactionValue5`,`RewardFactionOverride5`,`RewardFactionCapIn5`,`RewardCurrencyID1`,`RewardCurrencyQty1`,`RewardCurrencyID2`,`RewardCurrencyQty2`,`RewardCurrencyID3`,`RewardCurrencyQty3`,`RewardCurrencyID4`,`RewardCurrencyQty4`,`QuestType`,`QuestInfoID`,`RewardNextQuest`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`QuestSortID`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardSpell`,`AllowableRaces`,`AcceptedSoundKitID`,`CompleteSoundKitID`,`Expansion`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog` FROM `quest_template` WHERE 0;
INSERT INTO `forever_k70_quest_template` (`ID`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`RewardItem2`,`RewardAmount2`,`ItemDrop2`,`ItemDropQuantity2`,`RewardItem3`,`RewardAmount3`,`ItemDrop3`,`ItemDropQuantity3`,`RewardItem4`,`RewardAmount4`,`ItemDrop4`,`ItemDropQuantity4`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardChoiceItemID4`,`RewardChoiceItemQuantity4`,`RewardChoiceItemID5`,`RewardChoiceItemQuantity5`,`RewardChoiceItemID6`,`RewardChoiceItemQuantity6`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionCapIn1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`RewardFactionCapIn2`,`RewardFactionID3`,`RewardFactionValue3`,`RewardFactionOverride3`,`RewardFactionCapIn3`,`RewardFactionID4`,`RewardFactionValue4`,`RewardFactionOverride4`,`RewardFactionCapIn4`,`RewardFactionID5`,`RewardFactionValue5`,`RewardFactionOverride5`,`RewardFactionCapIn5`,`RewardCurrencyID1`,`RewardCurrencyQty1`,`RewardCurrencyID2`,`RewardCurrencyQty2`,`RewardCurrencyID3`,`RewardCurrencyQty3`,`RewardCurrencyID4`,`RewardCurrencyQty4`,`QuestType`,`QuestInfoID`,`RewardNextQuest`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`QuestSortID`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardSpell`,`AllowableRaces`,`AcceptedSoundKitID`,`CompleteSoundKitID`,`Expansion`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`) VALUES
(88756,6714,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,47,5,0,7,0,0,0,7,0,0,0,7,0,0,0,7,0,0,0,7,0,0,0,0,0,0,0,0,2,1,0,0,36700168,0,0,0,11,5,1.0,0,6130900294268439629,890,878,-2,'Bring Back a Bang','Retrieve $1oa Stolen Explosives from the Dark Iron Dwarf camps.','The Dark Irons have a few camps east of here on Direforge Hill, and they''ve stolen a bunch of explosives from our construction site and hauled ''em back to their tents.\r\n\r\nI don''t need tae tell ya what kinda mischief Dark Irons can get up tae with a barrel o'' powder!\r\n\r\nI know the Dark Irons are dangerous, but we need those barrels back. You can tell ''em from other barrels because of the red markings on ''em. We cannae let the Dark Irons keep ''em!','',''),
(98246,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,471,5,0,7,0,0,0,7,0,0,0,7,0,0,0,7,0,0,0,7,0,0,0,0,0,0,0,0,2,0,0,0,36700168,0,0,0,11,5,1.0,0,6130900294268439629,890,878,-2,'Trying Times','Gather $1oa Perfect Razormaw Eggs for Howin Kindfeather.','I''ll need some eggs if my plan is going tae work. Bassbeak needs a nice an'' full belly--I ain''t in the business of hoppin'' on the back of a surly gryphon.\r\n\r\nThey need to be perfect--no cracks or anything.\r\n\r\nTake some from the Razormaw raptors--they''re known for having yolks the size of a gnome''s noggin. You can find ''em in Raptor Ridge to the northeast and Saltspray Glen to the northwest.\r\n\r\nLet''s make it a nice even dozen, just to be safe.','','');
INSERT INTO `quest_template` (`ID`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`RewardItem2`,`RewardAmount2`,`ItemDrop2`,`ItemDropQuantity2`,`RewardItem3`,`RewardAmount3`,`ItemDrop3`,`ItemDropQuantity3`,`RewardItem4`,`RewardAmount4`,`ItemDrop4`,`ItemDropQuantity4`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardChoiceItemID4`,`RewardChoiceItemQuantity4`,`RewardChoiceItemID5`,`RewardChoiceItemQuantity5`,`RewardChoiceItemID6`,`RewardChoiceItemQuantity6`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionCapIn1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`RewardFactionCapIn2`,`RewardFactionID3`,`RewardFactionValue3`,`RewardFactionOverride3`,`RewardFactionCapIn3`,`RewardFactionID4`,`RewardFactionValue4`,`RewardFactionOverride4`,`RewardFactionCapIn4`,`RewardFactionID5`,`RewardFactionValue5`,`RewardFactionOverride5`,`RewardFactionCapIn5`,`RewardCurrencyID1`,`RewardCurrencyQty1`,`RewardCurrencyID2`,`RewardCurrencyQty2`,`RewardCurrencyID3`,`RewardCurrencyQty3`,`RewardCurrencyID4`,`RewardCurrencyQty4`,`QuestType`,`QuestInfoID`,`RewardNextQuest`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`QuestSortID`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardSpell`,`AllowableRaces`,`AcceptedSoundKitID`,`CompleteSoundKitID`,`Expansion`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`) SELECT `s`.`ID`,`s`.`RewardItem1`,`s`.`RewardAmount1`,`s`.`ItemDrop1`,`s`.`ItemDropQuantity1`,`s`.`RewardItem2`,`s`.`RewardAmount2`,`s`.`ItemDrop2`,`s`.`ItemDropQuantity2`,`s`.`RewardItem3`,`s`.`RewardAmount3`,`s`.`ItemDrop3`,`s`.`ItemDropQuantity3`,`s`.`RewardItem4`,`s`.`RewardAmount4`,`s`.`ItemDrop4`,`s`.`ItemDropQuantity4`,`s`.`RewardChoiceItemID1`,`s`.`RewardChoiceItemQuantity1`,`s`.`RewardChoiceItemID2`,`s`.`RewardChoiceItemQuantity2`,`s`.`RewardChoiceItemID3`,`s`.`RewardChoiceItemQuantity3`,`s`.`RewardChoiceItemID4`,`s`.`RewardChoiceItemQuantity4`,`s`.`RewardChoiceItemID5`,`s`.`RewardChoiceItemQuantity5`,`s`.`RewardChoiceItemID6`,`s`.`RewardChoiceItemQuantity6`,`s`.`RewardFactionID1`,`s`.`RewardFactionValue1`,`s`.`RewardFactionOverride1`,`s`.`RewardFactionCapIn1`,`s`.`RewardFactionID2`,`s`.`RewardFactionValue2`,`s`.`RewardFactionOverride2`,`s`.`RewardFactionCapIn2`,`s`.`RewardFactionID3`,`s`.`RewardFactionValue3`,`s`.`RewardFactionOverride3`,`s`.`RewardFactionCapIn3`,`s`.`RewardFactionID4`,`s`.`RewardFactionValue4`,`s`.`RewardFactionOverride4`,`s`.`RewardFactionCapIn4`,`s`.`RewardFactionID5`,`s`.`RewardFactionValue5`,`s`.`RewardFactionOverride5`,`s`.`RewardFactionCapIn5`,`s`.`RewardCurrencyID1`,`s`.`RewardCurrencyQty1`,`s`.`RewardCurrencyID2`,`s`.`RewardCurrencyQty2`,`s`.`RewardCurrencyID3`,`s`.`RewardCurrencyQty3`,`s`.`RewardCurrencyID4`,`s`.`RewardCurrencyQty4`,`s`.`QuestType`,`s`.`QuestInfoID`,`s`.`RewardNextQuest`,`s`.`StartItem`,`s`.`Flags`,`s`.`FlagsEx`,`s`.`FlagsEx2`,`s`.`TimeAllowed`,`s`.`QuestSortID`,`s`.`RewardXPDifficulty`,`s`.`RewardXPMultiplier`,`s`.`RewardSpell`,`s`.`AllowableRaces`,`s`.`AcceptedSoundKitID`,`s`.`CompleteSoundKitID`,`s`.`Expansion`,`s`.`LogTitle`,`s`.`LogDescription`,`s`.`QuestDescription`,`s`.`AreaDescription`,`s`.`QuestCompletionLog` FROM `forever_k70_quest_template` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_template` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_template`;

DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_objectives`;
CREATE TEMPORARY TABLE `forever_k70_quest_objectives` SELECT `ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Description` FROM `quest_objectives` WHERE 0;
INSERT INTO `forever_k70_quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Description`) VALUES
(477543,88756,1,0,0,280806,3,32,''),
(477114,98246,1,0,1,280132,12,32,'');
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Description`) SELECT `s`.`ID`,`s`.`QuestID`,`s`.`Type`,`s`.`Order`,`s`.`StorageIndex`,`s`.`ObjectID`,`s`.`Amount`,`s`.`Flags`,`s`.`Description` FROM `forever_k70_quest_objectives` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_objectives` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_objectives`;

DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_classic_level`;
CREATE TEMPORARY TABLE `forever_k70_quest_classic_level` SELECT `ID`,`QuestLevel`,`MinLevel`,`MaxLevel` FROM `quest_classic_level` WHERE 0;
INSERT INTO `forever_k70_quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES
(88756,31,25,0),
(98246,29,21,0);
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT `s`.`ID`,`s`.`QuestLevel`,`s`.`MinLevel`,`s`.`MaxLevel` FROM `forever_k70_quest_classic_level` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_classic_level` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_classic_level`;

DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_template_class`;
CREATE TEMPORARY TABLE `forever_k70_quest_template_class` SELECT `ID`,`LevelType`,`QuestLevel` FROM `quest_template_classic_level` WHERE 0;
INSERT INTO `forever_k70_quest_template_class` (`ID`,`LevelType`,`QuestLevel`) VALUES
(88756,2,31),
(98246,2,29);
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT `s`.`ID`,`s`.`LevelType`,`s`.`QuestLevel` FROM `forever_k70_quest_template_class` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_template_classic_level` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_template_class`;

DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_classic_money`;
CREATE TEMPORARY TABLE `forever_k70_quest_classic_money` SELECT `ID`,`RewardMoney`,`RewardMoneyMaxLevel` FROM `quest_classic_money` WHERE 0;
INSERT INTO `forever_k70_quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES
(88756,3000,0);
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT `s`.`ID`,`s`.`RewardMoney`,`s`.`RewardMoneyMaxLevel` FROM `forever_k70_quest_classic_money` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_classic_money` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k70_quest_classic_money`;

DROP TEMPORARY TABLE IF EXISTS `forever_k70_creature_queststarte`;
CREATE TEMPORARY TABLE `forever_k70_creature_queststarte` SELECT `id`,`quest` FROM `creature_queststarter` WHERE 0;
INSERT INTO `forever_k70_creature_queststarte` (`id`,`quest`) VALUES
(1073,88756),
(270637,98246);
INSERT INTO `creature_queststarter` (`id`,`quest`) SELECT `s`.`id`,`s`.`quest` FROM `forever_k70_creature_queststarte` `s` WHERE NOT EXISTS (SELECT 1 FROM `creature_queststarter` `x` WHERE `x`.`id`=`s`.`id` AND `x`.`quest`=`s`.`quest`);
DROP TEMPORARY TABLE IF EXISTS `forever_k70_creature_queststarte`;

DROP TEMPORARY TABLE IF EXISTS `forever_k70_creature_questender`;
CREATE TEMPORARY TABLE `forever_k70_creature_questender` SELECT `id`,`quest` FROM `creature_questender` WHERE 0;
INSERT INTO `forever_k70_creature_questender` (`id`,`quest`) VALUES
(1073,88756),
(270637,98246);
INSERT INTO `creature_questender` (`id`,`quest`) SELECT `s`.`id`,`s`.`quest` FROM `forever_k70_creature_questender` `s` WHERE NOT EXISTS (SELECT 1 FROM `creature_questender` `x` WHERE `x`.`id`=`s`.`id` AND `x`.`quest`=`s`.`quest`);
DROP TEMPORARY TABLE IF EXISTS `forever_k70_creature_questender`;

DROP TEMPORARY TABLE IF EXISTS `forever_k70_objects`;
CREATE TEMPORARY TABLE `forever_k70_objects` (`guid` BIGINT UNSIGNED NOT NULL, `id` INT UNSIGNED NOT NULL, `map` SMALLINT UNSIGNED NOT NULL,
  `x` FLOAT NOT NULL, `y` FLOAT NOT NULL, `z` FLOAT NOT NULL, `o` FLOAT NOT NULL, `r2` FLOAT NOT NULL, `r3` FLOAT NOT NULL, `respawn` INT NOT NULL,
  `add` TINYINT NOT NULL DEFAULT 0, PRIMARY KEY (`guid`));
INSERT INTO `forever_k70_objects` (`guid`,`id`,`map`,`x`,`y`,`z`,`o`,`r2`,`r3`,`respawn`) VALUES
(920007259,671892,0,-2478.67,-1808.03,10.07,1.184,0.558022,0.829826,300),
(920007260,671892,0,-2652.31,-1832.84,10.01,4.171,0.870439,-0.492277,300),
(920007261,671892,0,-2657.82,-1841.11,9.15,4.203,0.862451,-0.50614,300),
(920007262,671892,0,-2701.92,-1853.52,9.77,0.519,0.256597,0.966518,300),
(920007263,671892,0,-2693.65,-1857.66,9.56,0.9,0.434966,0.900447,300),
(920007264,671892,0,-2781.85,-1936.23,24.71,5.108,0.554359,-0.832278,300),
(920007265,671892,0,-2834.22,-2006.53,29.15,0,0,1,300),
(920007266,671892,0,-3082.29,-3114.82,83.1,4.502,0.777445,-0.628951,300),
(920007267,671892,0,-3189.78,-3147.91,65.36,3.788,0.948223,-0.317606,300),
(920007268,671892,0,-3013.38,-3243.02,59.31,1.46,0.66687,0.745174,300),
(920007269,671892,0,-2952.74,-3284.37,62.34,0.074,0.036992,0.999316,300),
(920007270,671892,0,-3181.51,-3354.68,75.45,0,0,1,300),
(920007271,671892,0,-3377.2,-3424.98,63.38,0,0,1,300),
(920007272,671931,0,-2481.42,-1808.03,10.01,0.984,0.47239,0.88139,300),
(920007273,671931,0,-2649.55,-1832.84,10.13,4.078,0.89238,-0.451284,300),
(920007274,671931,0,-2657.82,-1832.84,9.49,4.39,0.811429,-0.584451,300),
(920007275,671931,0,-2699.17,-1853.52,9.75,0.848,0.41141,0.911451,300),
(920007276,671931,0,-2765.32,-1853.52,11.09,0.092,0.045984,0.998942,300),
(920007277,671931,0,-2586.16,-1882.47,10.33,3.953,0.918825,-0.394665,300),
(920007278,671931,0,-2779.1,-1944.5,24.71,5.767,0.255237,-0.966879,300),
(920007279,671931,0,-2696.41,-1956.91,14.61,1.597,0.71631,0.697782,300),
(920007280,671931,0,-2831.47,-2002.4,30.34,0.781,0.380651,0.924719,300),
(920007281,671931,0,-3013.38,-3077.6,66.75,0.193,0.09635,0.995347,300),
(920007282,671931,0,-3013.38,-3110.69,64.54,0.096,0.047982,0.998848,300),
(920007283,671931,0,-3062.99,-3114.82,76.47,3.835,0.940498,-0.339799,300),
(920007284,671931,0,-3032.67,-3139.64,70.11,3.414,0.990739,-0.135783,300),
(920007285,671931,0,-3170.49,-3172.72,64.45,4.363,0.819245,-0.573444,300),
(920007286,671931,0,-3170.49,-3180.99,64.41,3.814,0.944014,-0.329906,300),
(920007287,671931,0,-3002.35,-3193.4,59.5,3.452,0.98798,-0.154581,300),
(920007288,671931,0,-3049.21,-3197.53,55.34,4.946,0.619882,-0.784695,300),
(920007289,671931,0,-2905.89,-3205.8,59.72,4.252,0.849793,-0.527116,300),
(920007290,671931,0,-3120.87,-3214.07,64.12,2.615,0.965537,0.260265,300),
(920007291,671931,0,-3112.6,-3247.16,65.39,4.875,0.647343,-0.762199,300),
(920007292,671931,0,-3255.93,-3255.43,64.87,0,0,1,300),
(920007293,671931,0,-3153.95,-3259.56,61.44,3.722,0.958186,-0.286147,300),
(920007294,671931,0,-3040.94,-3267.83,68.8,3.262,0.998188,-0.060167,300),
(920007295,671931,0,-3049.21,-3267.83,71.01,2.414,0.934553,0.355825,300),
(920007296,671931,0,-2955.5,-3280.24,62.28,0.526,0.259979,0.965614,300),
(920007297,671931,0,-3269.71,-3321.59,75.51,0,0,1,300),
(920007298,671931,0,-3297.27,-3375.35,75.01,0,0,1,300),
(920007299,671931,0,-3206.32,-3391.9,64.13,0,0,1,300),
(920007300,671931,0,-3308.3,-3404.3,65.08,0,0,1,300),
(920007335,673206,0,-2831.47,-2862.56,32.91,5.431,0.413316,-0.910588,300),
(920007336,673206,0,-2817.69,-2870.83,32.68,3.052,0.998997,0.044781,300),
(920007337,673206,0,-2870.05,-2957.68,33.71,1.115,0.529066,0.84858,300),
(920007338,673206,0,-2900.37,-2965.95,35.04,1.431,0.655995,0.754765,300),
(920007339,673206,0,-2922.42,-2970.08,30.55,3.709,0.960025,-0.279913,300),
(920007340,673206,0,-2936.2,-2970.08,30.55,4.271,0.844747,-0.535166,300);
UPDATE `forever_k70_objects` `s` SET `s`.`add` = 1
WHERE EXISTS (SELECT 1 FROM `gameobject_template` `t` WHERE `t`.`entry` = `s`.`id`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` `g` WHERE `g`.`guid` = `s`.`guid`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` `g` WHERE `g`.`id` = `s`.`id`);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnDifficulties`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,
  `spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`)
SELECT `guid`,`id`,`map`,'0',`x`,`y`,`z`,`o`,0,0,`r2`,`r3`,`respawn`,255,1,0 FROM `forever_k70_objects` WHERE `add` = 1;
DROP TEMPORARY TABLE IF EXISTS `forever_k70_objects`;

-- What the eggs and the explosives hold (Everlake 2026_11_16_900 forge import 00036): one quest item each, only while the quest needs it.
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT `s`.`Entry`,0,`s`.`Item`,100,1,1,0,1,1,`s`.`Comment` FROM (
  SELECT 142837 AS `Entry`,280132 AS `Item`,'Razormaw Eggs: Perfect Razormaw Egg (98246)' AS `Comment`
  UNION ALL SELECT 142838,280132,'Razormaw Egg: Perfect Razormaw Egg (98246)'
  UNION ALL SELECT 143081,280806,'Stolen Explosives (88756)') `s`
WHERE EXISTS (SELECT 1 FROM `gameobject_template` `t` WHERE `t`.`type` = 3 AND `t`.`Data1` = `s`.`Entry`)
  AND NOT EXISTS (SELECT 1 FROM `gameobject_loot_template` `l` WHERE `l`.`Entry` = `s`.`Entry` AND `l`.`ItemType` = 0 AND `l`.`Item` = `s`.`Item`);

-- Map markers
-- 1710 Sunscorched Shells
-- go89635: area 1 (13 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,10,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1441,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=1710 AND `o`.`StorageIndex`=4 AND `o`.`ObjectID`=6849
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=1710 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=10) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 1710 AS `QuestID`,10 AS `Idx1`,0 AS `Idx2`,-5171 AS `X`,-906 AS `Y`,-5 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 1710,10,1,-5119,-1056,-5,0 UNION ALL SELECT 1710,10,2,-5089,-1070,-5,0 UNION ALL SELECT 1710,10,3,-4922,-964,-5,0 UNION ALL SELECT 1710,10,4,-4859,-909,-5,0 UNION ALL SELECT 1710,10,5,-4982,-796,-5,0 UNION ALL SELECT 1710,10,6,-5157,-881,-5,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=1710 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=10 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=1710 AND `StorageIndex`=4 AND `ObjectID`=6849))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=1710 AND `x`.`Idx1`=10);
-- go89635: area 2 (5 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,1,11,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1441,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=1710 AND `o`.`StorageIndex`=4 AND `o`.`ObjectID`=6849
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=1710 AND ((`p`.`BlobIndex`=1 AND `p`.`Idx1`=11)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 1710 AS `QuestID`,11 AS `Idx1`,0 AS `Idx2`,-5207 AS `X`,-1156 AS `Y`,48 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 1710,11,1,-5202,-1242,48,0 UNION ALL SELECT 1710,11,2,-5141,-1213,48,0 UNION ALL SELECT 1710,11,3,-5154,-1174,48,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=1710 AND `p`.`BlobIndex`=1 AND `p`.`Idx1`=11 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=1710 AND `StorageIndex`=4 AND `ObjectID`=6849))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=1710 AND `x`.`Idx1`=11);

-- 86757 Slowing the Orc Advance
-- cr11682: area 1 (10 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,10,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=86757 AND `o`.`StorageIndex`=0 AND `o`.`ObjectID`=279505
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=10) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 86757 AS `QuestID`,10 AS `Idx1`,0 AS `Idx2`,2423 AS `X`,-3549 AS `Y`,98 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 86757,10,1,2472,-3564,98,0 UNION ALL SELECT 86757,10,2,2532,-3373,98,0 UNION ALL SELECT 86757,10,3,2434,-3390,98,0 UNION ALL SELECT 86757,10,4,2418,-3486,98,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=10 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=86757 AND `StorageIndex`=0 AND `ObjectID`=279505))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=86757 AND `x`.`Idx1`=10);
-- cr11682: area 2 (3 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,1,11,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=86757 AND `o`.`StorageIndex`=0 AND `o`.`ObjectID`=279505
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND ((`p`.`BlobIndex`=1 AND `p`.`Idx1`=11)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 86757 AS `QuestID`,11 AS `Idx1`,0 AS `Idx2`,1577 AS `X`,-2420 AS `Y`,98 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 86757,11,1,1579,-2520,98,0 UNION ALL SELECT 86757,11,2,1610,-2456,98,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND `p`.`BlobIndex`=1 AND `p`.`Idx1`=11 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=86757 AND `StorageIndex`=0 AND `ObjectID`=279505))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=86757 AND `x`.`Idx1`=11);
-- cr11680: area 1 (31 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,12,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=86757 AND `o`.`StorageIndex`=1 AND `o`.`ObjectID`=279507
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=12) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 86757 AS `QuestID`,12 AS `Idx1`,0 AS `Idx2`,2163 AS `X`,-3342 AS `Y`,114 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 86757,12,1,2248,-3474,114,0 UNION ALL SELECT 86757,12,2,2265,-3487,114,0 UNION ALL SELECT 86757,12,3,2793,-3475,114,0 UNION ALL SELECT 86757,12,4,2759,-3416,114,0 UNION ALL SELECT 86757,12,5,2413,-3137,114,0 UNION ALL SELECT 86757,12,6,2280,-3081,114,0 UNION ALL SELECT 86757,12,7,2169,-3321,114,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=12 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=86757 AND `StorageIndex`=1 AND `ObjectID`=279507))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=86757 AND `x`.`Idx1`=12);
-- cr11680: area 2 (11 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,1,13,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=86757 AND `o`.`StorageIndex`=1 AND `o`.`ObjectID`=279507
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND ((`p`.`BlobIndex`=1 AND `p`.`Idx1`=13)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 86757 AS `QuestID`,13 AS `Idx1`,0 AS `Idx2`,1415 AS `X`,-2309 AS `Y`,100 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 86757,13,1,1438,-2385,100,0 UNION ALL SELECT 86757,13,2,1555,-2549,100,0 UNION ALL SELECT 86757,13,3,1631,-2554,100,0 UNION ALL SELECT 86757,13,4,1658,-2489,100,0 UNION ALL SELECT 86757,13,5,1644,-2424,100,0 UNION ALL SELECT 86757,13,6,1504,-2281,100,0 UNION ALL SELECT 86757,13,7,1448,-2294,100,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND `p`.`BlobIndex`=1 AND `p`.`Idx1`=13 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=86757 AND `StorageIndex`=1 AND `ObjectID`=279507))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=86757 AND `x`.`Idx1`=13);
-- cr11680: area 3 (3 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,2,14,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=86757 AND `o`.`StorageIndex`=1 AND `o`.`ObjectID`=279507
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND ((`p`.`BlobIndex`=2 AND `p`.`Idx1`=14)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 86757 AS `QuestID`,14 AS `Idx1`,0 AS `Idx2`,2624 AS `X`,-3606 AS `Y`,126 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 86757,14,1,2615,-3585,126,0 UNION ALL SELECT 86757,14,2,2595,-3577,126,0 UNION ALL SELECT 86757,14,3,2575,-3585,126,0 UNION ALL SELECT 86757,14,4,2567,-3606,126,0 UNION ALL SELECT 86757,14,5,2575,-3626,126,0 UNION ALL SELECT 86757,14,6,2595,-3634,126,0 UNION ALL SELECT 86757,14,7,2615,-3626,126,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND `p`.`BlobIndex`=2 AND `p`.`Idx1`=14 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=86757 AND `StorageIndex`=1 AND `ObjectID`=279507))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=86757 AND `x`.`Idx1`=14);
-- turn-in (3955)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT 86757,0,15,-1,0,0,1,1440,0,0,0,0,0,0,0,0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID`=86757)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND (`p`.`ObjectiveIndex`=-1 OR (`p`.`BlobIndex`=0 AND `p`.`Idx1`=15)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 86757 AS `QuestID`,15 AS `Idx1`,0 AS `Idx2`,2094 AS `X`,-1153 AS `Y`,102 AS `Z`,0 AS `VerifiedBuild`) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=86757 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=15 AND `p`.`ObjectiveIndex`=-1)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=86757 AND `x`.`Idx1`=15);

-- 98208 Bloom of the Heavens
-- go670962: area 1 (1 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,10,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,0,1437,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98208 AND `o`.`StorageIndex`=0 AND `o`.`ObjectID`=279915
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98208 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=10) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98208 AS `QuestID`,10 AS `Idx1`,0 AS `Idx2`,-3880 AS `X`,-895 AS `Y`,1 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98208,10,1,-3887,-877,1,0 UNION ALL SELECT 98208,10,2,-3905,-870,1,0 UNION ALL SELECT 98208,10,3,-3923,-877,1,0 UNION ALL SELECT 98208,10,4,-3930,-895,1,0 UNION ALL SELECT 98208,10,5,-3923,-913,1,0 UNION ALL SELECT 98208,10,6,-3905,-920,1,0 UNION ALL SELECT 98208,10,7,-3887,-913,1,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98208 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=10 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98208 AND `StorageIndex`=0 AND `ObjectID`=279915))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98208 AND `x`.`Idx1`=10);
-- turn-in (270844)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT 98208,0,11,-1,0,0,0,1437,0,0,0,0,0,0,0,0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID`=98208)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98208 AND (`p`.`ObjectiveIndex`=-1 OR (`p`.`BlobIndex`=0 AND `p`.`Idx1`=11)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98208 AS `QuestID`,11 AS `Idx1`,0 AS `Idx2`,-3686 AS `X`,-720 AS `Y`,11 AS `Z`,0 AS `VerifiedBuild`) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98208 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=11 AND `p`.`ObjectiveIndex`=-1)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98208 AND `x`.`Idx1`=11);

-- 98417 Vengeful Trail
-- go673431: area 1 (3 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,10,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98417 AND `o`.`StorageIndex`=0 AND `o`.`ObjectID`=281014
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98417 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=10) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98417 AS `QuestID`,10 AS `Idx1`,0 AS `Idx2`,2725 AS `X`,-2979 AS `Y`,169 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98417,10,1,2790,-3024,169,0 UNION ALL SELECT 98417,10,2,2797,-2967,169,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98417 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=10 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98417 AND `StorageIndex`=0 AND `ObjectID`=281014))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98417 AND `x`.`Idx1`=10);
-- turn-in (221269)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT 98417,0,11,-1,0,0,1,1440,0,0,0,0,0,0,0,0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID`=98417)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98417 AND (`p`.`ObjectiveIndex`=-1 OR (`p`.`BlobIndex`=0 AND `p`.`Idx1`=11)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98417 AS `QuestID`,11 AS `Idx1`,0 AS `Idx2`,2910 AS `X`,-3274 AS `Y`,169 AS `Z`,0 AS `VerifiedBuild`) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98417 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=11 AND `p`.`ObjectiveIndex`=-1)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98417 AND `x`.`Idx1`=11);

-- 98418 Shared Fury
-- cr3754: area 1 (11 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,10,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98418 AND `o`.`StorageIndex`=0 AND `o`.`ObjectID`=3754
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=10) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98418 AS `QuestID`,10 AS `Idx1`,0 AS `Idx2`,2833 AS `X`,-2823 AS `Y`,207 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98418,10,1,2841,-2881,207,0 UNION ALL SELECT 98418,10,2,2873,-2904,207,0 UNION ALL SELECT 98418,10,3,3066,-2818,207,0 UNION ALL SELECT 98418,10,4,2954,-2744,207,0 UNION ALL SELECT 98418,10,5,2867,-2779,207,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=10 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98418 AND `StorageIndex`=0 AND `ObjectID`=3754))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98418 AND `x`.`Idx1`=10);
-- cr3755: area 1 (13 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,11,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98418 AND `o`.`StorageIndex`=1 AND `o`.`ObjectID`=3755
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=11) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98418 AS `QuestID`,11 AS `Idx1`,0 AS `Idx2`,2833 AS `X`,-2821 AS `Y`,206 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98418,11,1,2841,-2881,206,0 UNION ALL SELECT 98418,11,2,2863,-2904,206,0 UNION ALL SELECT 98418,11,3,2874,-2904,206,0 UNION ALL SELECT 98418,11,4,3066,-2817,206,0 UNION ALL SELECT 98418,11,5,2954,-2744,206,0 UNION ALL SELECT 98418,11,6,2869,-2777,206,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=11 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98418 AND `StorageIndex`=1 AND `ObjectID`=3755))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98418 AND `x`.`Idx1`=11);
-- cr3757: area 1 (12 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,12,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98418 AND `o`.`StorageIndex`=2 AND `o`.`ObjectID`=3757
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=12) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98418 AS `QuestID`,12 AS `Idx1`,0 AS `Idx2`,2872 AS `X`,-2856 AS `Y`,211 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98418,12,1,2915,-2873,211,0 UNION ALL SELECT 98418,12,2,3008,-2819,211,0 UNION ALL SELECT 98418,12,3,3054,-2784,211,0 UNION ALL SELECT 98418,12,4,2886,-2764,211,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=12 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98418 AND `StorageIndex`=2 AND `ObjectID`=3757))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98418 AND `x`.`Idx1`=12);
-- cr3752: area 1 (13 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,13,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,1,1440,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98418 AND `o`.`StorageIndex`=3 AND `o`.`ObjectID`=3752
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=13) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98418 AS `QuestID`,13 AS `Idx1`,0 AS `Idx2`,2872 AS `X`,-2856 AS `Y`,211 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98418,13,1,2915,-2873,211,0 UNION ALL SELECT 98418,13,2,3009,-2818,211,0 UNION ALL SELECT 98418,13,3,3054,-2783,211,0 UNION ALL SELECT 98418,13,4,2887,-2764,211,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=13 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98418 AND `StorageIndex`=3 AND `ObjectID`=3752))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98418 AND `x`.`Idx1`=13);
-- turn-in (221269)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT 98418,0,14,-1,0,0,1,1440,0,0,0,0,0,0,0,0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID`=98418)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND (`p`.`ObjectiveIndex`=-1 OR (`p`.`BlobIndex`=0 AND `p`.`Idx1`=14)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98418 AS `QuestID`,14 AS `Idx1`,0 AS `Idx2`,2910 AS `X`,-3274 AS `Y`,169 AS `Z`,0 AS `VerifiedBuild`) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98418 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=14 AND `p`.`ObjectiveIndex`=-1)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98418 AND `x`.`Idx1`=14);

-- 98246 Trying Times
-- go671892, go671931: area 1 (26 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,10,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,0,1437,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98246 AND `o`.`StorageIndex`=1 AND `o`.`ObjectID`=280132
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98246 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=10) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98246 AS `QuestID`,10 AS `Idx1`,0 AS `Idx2`,-3389 AS `X`,-3434 AS `Y`,66 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98246,10,1,-3214,-3405,66,0 UNION ALL SELECT 98246,10,2,-2938,-3288,66,0 UNION ALL SELECT 98246,10,3,-2891,-3203,66,0 UNION ALL SELECT 98246,10,4,-3005,-3065,66,0 UNION ALL SELECT 98246,10,5,-3199,-3136,66,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98246 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=10 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98246 AND `StorageIndex`=1 AND `ObjectID`=280132))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98246 AND `x`.`Idx1`=10);
-- go671892, go671931: area 2 (16 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,1,11,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,0,1437,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=98246 AND `o`.`StorageIndex`=1 AND `o`.`ObjectID`=280132
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98246 AND ((`p`.`BlobIndex`=1 AND `p`.`Idx1`=11)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98246 AS `QuestID`,11 AS `Idx1`,0 AS `Idx2`,-2846 AS `X`,-2016 AS `Y`,15 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 98246,11,1,-2699,-1972,15,0 UNION ALL SELECT 98246,11,2,-2571,-1883,15,0 UNION ALL SELECT 98246,11,3,-2465,-1803,15,0 UNION ALL SELECT 98246,11,4,-2467,-1803,15,0 UNION ALL SELECT 98246,11,5,-2651,-1820,15,0 UNION ALL SELECT 98246,11,6,-2780,-1849,15,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98246 AND `p`.`BlobIndex`=1 AND `p`.`Idx1`=11 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=98246 AND `StorageIndex`=1 AND `ObjectID`=280132))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98246 AND `x`.`Idx1`=11);
-- turn-in (270637)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT 98246,0,12,-1,0,0,0,1437,0,0,0,0,0,0,0,0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID`=98246)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98246 AND (`p`.`ObjectiveIndex`=-1 OR (`p`.`BlobIndex`=0 AND `p`.`Idx1`=12)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 98246 AS `QuestID`,12 AS `Idx1`,0 AS `Idx2`,-3300 AS `X`,-2432 AS `Y`,19 AS `Z`,0 AS `VerifiedBuild`) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=98246 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=12 AND `p`.`ObjectiveIndex`=-1)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=98246 AND `x`.`Idx1`=12);

-- 88756 Bring Back a Bang
-- go673206: area 1 (6 spawns)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT `o`.`QuestID`,0,10,`o`.`StorageIndex`,`o`.`ID`,`o`.`ObjectID`,0,1437,0,0,0,0,0,0,0,0 FROM `quest_objectives` `o`
WHERE `o`.`QuestID`=88756 AND `o`.`StorageIndex`=0 AND `o`.`ObjectID`=280806
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=88756 AND ((`p`.`BlobIndex`=0 AND `p`.`Idx1`=10) OR `p`.`QuestObjectiveID`=`o`.`ID`));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 88756 AS `QuestID`,10 AS `Idx1`,0 AS `Idx2`,-2949 AS `X`,-2978 AS `Y`,33 AS `Z`,0 AS `VerifiedBuild` UNION ALL SELECT 88756,10,1,-2934,-2980,33,0 UNION ALL SELECT 88756,10,2,-2908,-2979,33,0 UNION ALL SELECT 88756,10,3,-2865,-2972,33,0 UNION ALL SELECT 88756,10,4,-2807,-2860,33,0 UNION ALL SELECT 88756,10,5,-2823,-2850,33,0) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=88756 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=10 AND `p`.`QuestObjectiveID` IN (SELECT `ID` FROM `quest_objectives` WHERE `QuestID`=88756 AND `StorageIndex`=0 AND `ObjectID`=280806))
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=88756 AND `x`.`Idx1`=10);
-- turn-in (1073)
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`)
SELECT 88756,0,11,-1,0,0,0,1437,0,0,0,0,0,0,0,0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID`=88756)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=88756 AND (`p`.`ObjectiveIndex`=-1 OR (`p`.`BlobIndex`=0 AND `p`.`Idx1`=11)));
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`)
SELECT `s`.* FROM (SELECT 88756 AS `QuestID`,11 AS `Idx1`,0 AS `Idx2`,-2649 AS `X`,-2459 AS `Y`,80 AS `Z`,0 AS `VerifiedBuild`) `s`
WHERE EXISTS (SELECT 1 FROM `quest_poi` `p` WHERE `p`.`QuestID`=88756 AND `p`.`BlobIndex`=0 AND `p`.`Idx1`=11 AND `p`.`ObjectiveIndex`=-1)
  AND NOT EXISTS (SELECT 1 FROM `quest_poi_points` `x` WHERE `x`.`QuestID`=88756 AND `x`.`Idx1`=11);
