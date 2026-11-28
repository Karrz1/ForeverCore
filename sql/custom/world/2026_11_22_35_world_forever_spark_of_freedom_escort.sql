-- Spark of Freedom (87491, Wetlands, Discord "bugs 10" item 7): the Captive Fire Elemental (271481) in Dun Modr gives it and
-- Roggo Harlbarrow (1072) takes it (QuestieDB Forever play traces, Questie team, GPL-3.0). Our world lacked the quest: its
-- record is live's (EG Link build 70888, Efficient Games, https://efficient.games, CC BY 4.0, as Everlake's 2026_11_14_950 build
-- has it, github.com/buildthehomelab/wow-everlake-world-data, GPL-3.0). The elemental had no quest marker and no script, and
-- nothing could complete the quest (an escort: it completes as an event).
-- Now: the elemental offers it; on accept it walks south through Dun Modr to its southern edge, by Roggo's camp, and the
-- escort completes for the players with it (SmartAI escort, as our other escorts). If it dies on the way, the quest fails.
-- The path nodes are our own Dun Modr spawn spots (the core finds the way between them); not sniffed.
-- Only where the elemental still has no script and no path of this id exists. Safe to run more than once.

-- The quest record (only if missing)
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_template`;
CREATE TEMPORARY TABLE `forever_k35_quest_template` SELECT `ID`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`RewardItem2`,`RewardAmount2`,`ItemDrop2`,`ItemDropQuantity2`,`RewardItem3`,`RewardAmount3`,`ItemDrop3`,`ItemDropQuantity3`,`RewardItem4`,`RewardAmount4`,`ItemDrop4`,`ItemDropQuantity4`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardChoiceItemID4`,`RewardChoiceItemQuantity4`,`RewardChoiceItemID5`,`RewardChoiceItemQuantity5`,`RewardChoiceItemID6`,`RewardChoiceItemQuantity6`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionCapIn1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`RewardFactionCapIn2`,`RewardFactionID3`,`RewardFactionValue3`,`RewardFactionOverride3`,`RewardFactionCapIn3`,`RewardFactionID4`,`RewardFactionValue4`,`RewardFactionOverride4`,`RewardFactionCapIn4`,`RewardFactionID5`,`RewardFactionValue5`,`RewardFactionOverride5`,`RewardFactionCapIn5`,`RewardCurrencyID1`,`RewardCurrencyQty1`,`RewardCurrencyID2`,`RewardCurrencyQty2`,`RewardCurrencyID3`,`RewardCurrencyQty3`,`RewardCurrencyID4`,`RewardCurrencyQty4`,`QuestType`,`QuestInfoID`,`RewardNextQuest`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`QuestSortID`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardSpell`,`AllowableRaces`,`AcceptedSoundKitID`,`CompleteSoundKitID`,`Expansion`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog` FROM `quest_template` WHERE 0;
INSERT INTO `forever_k35_quest_template` (`ID`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`RewardItem2`,`RewardAmount2`,`ItemDrop2`,`ItemDropQuantity2`,`RewardItem3`,`RewardAmount3`,`ItemDrop3`,`ItemDropQuantity3`,`RewardItem4`,`RewardAmount4`,`ItemDrop4`,`ItemDropQuantity4`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardChoiceItemID4`,`RewardChoiceItemQuantity4`,`RewardChoiceItemID5`,`RewardChoiceItemQuantity5`,`RewardChoiceItemID6`,`RewardChoiceItemQuantity6`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionCapIn1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`RewardFactionCapIn2`,`RewardFactionID3`,`RewardFactionValue3`,`RewardFactionOverride3`,`RewardFactionCapIn3`,`RewardFactionID4`,`RewardFactionValue4`,`RewardFactionOverride4`,`RewardFactionCapIn4`,`RewardFactionID5`,`RewardFactionValue5`,`RewardFactionOverride5`,`RewardFactionCapIn5`,`RewardCurrencyID1`,`RewardCurrencyQty1`,`RewardCurrencyID2`,`RewardCurrencyQty2`,`RewardCurrencyID3`,`RewardCurrencyQty3`,`RewardCurrencyID4`,`RewardCurrencyQty4`,`QuestType`,`QuestInfoID`,`RewardNextQuest`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`QuestSortID`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardSpell`,`AllowableRaces`,`AcceptedSoundKitID`,`CompleteSoundKitID`,`Expansion`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`) VALUES
(87491,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,47,5,0,7,0,0,0,7,0,0,0,7,0,0,0,7,0,0,0,7,0,0,0,0,0,0,0,0,2,1,0,0,36700162,0,0,0,11,5,1.0,0,6130900294268439629,890,878,-2,'Spark of Freedom','Escort the captive fire elemental out of Dun Modr and to its freedom.','Sss! The foul Dark Irons have summoned me and kept me caged next to their petty fire pit!\r\n\r\nFire must run wild, run free! Release me! Must escape! Must BURN!\r\n\r\nNo Dark Iron is safe! Burn them to the ground! Burn their black powder! Burn their fortress, their fuses, their folly!\r\n\r\nLet me out and I will BURN THEM ALL!','Escort the fire elemental out of Dun Modr','');
INSERT INTO `quest_template` (`ID`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`RewardItem2`,`RewardAmount2`,`ItemDrop2`,`ItemDropQuantity2`,`RewardItem3`,`RewardAmount3`,`ItemDrop3`,`ItemDropQuantity3`,`RewardItem4`,`RewardAmount4`,`ItemDrop4`,`ItemDropQuantity4`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardChoiceItemID4`,`RewardChoiceItemQuantity4`,`RewardChoiceItemID5`,`RewardChoiceItemQuantity5`,`RewardChoiceItemID6`,`RewardChoiceItemQuantity6`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionCapIn1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`RewardFactionCapIn2`,`RewardFactionID3`,`RewardFactionValue3`,`RewardFactionOverride3`,`RewardFactionCapIn3`,`RewardFactionID4`,`RewardFactionValue4`,`RewardFactionOverride4`,`RewardFactionCapIn4`,`RewardFactionID5`,`RewardFactionValue5`,`RewardFactionOverride5`,`RewardFactionCapIn5`,`RewardCurrencyID1`,`RewardCurrencyQty1`,`RewardCurrencyID2`,`RewardCurrencyQty2`,`RewardCurrencyID3`,`RewardCurrencyQty3`,`RewardCurrencyID4`,`RewardCurrencyQty4`,`QuestType`,`QuestInfoID`,`RewardNextQuest`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`QuestSortID`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardSpell`,`AllowableRaces`,`AcceptedSoundKitID`,`CompleteSoundKitID`,`Expansion`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`) SELECT `s`.`ID`,`s`.`RewardItem1`,`s`.`RewardAmount1`,`s`.`ItemDrop1`,`s`.`ItemDropQuantity1`,`s`.`RewardItem2`,`s`.`RewardAmount2`,`s`.`ItemDrop2`,`s`.`ItemDropQuantity2`,`s`.`RewardItem3`,`s`.`RewardAmount3`,`s`.`ItemDrop3`,`s`.`ItemDropQuantity3`,`s`.`RewardItem4`,`s`.`RewardAmount4`,`s`.`ItemDrop4`,`s`.`ItemDropQuantity4`,`s`.`RewardChoiceItemID1`,`s`.`RewardChoiceItemQuantity1`,`s`.`RewardChoiceItemID2`,`s`.`RewardChoiceItemQuantity2`,`s`.`RewardChoiceItemID3`,`s`.`RewardChoiceItemQuantity3`,`s`.`RewardChoiceItemID4`,`s`.`RewardChoiceItemQuantity4`,`s`.`RewardChoiceItemID5`,`s`.`RewardChoiceItemQuantity5`,`s`.`RewardChoiceItemID6`,`s`.`RewardChoiceItemQuantity6`,`s`.`RewardFactionID1`,`s`.`RewardFactionValue1`,`s`.`RewardFactionOverride1`,`s`.`RewardFactionCapIn1`,`s`.`RewardFactionID2`,`s`.`RewardFactionValue2`,`s`.`RewardFactionOverride2`,`s`.`RewardFactionCapIn2`,`s`.`RewardFactionID3`,`s`.`RewardFactionValue3`,`s`.`RewardFactionOverride3`,`s`.`RewardFactionCapIn3`,`s`.`RewardFactionID4`,`s`.`RewardFactionValue4`,`s`.`RewardFactionOverride4`,`s`.`RewardFactionCapIn4`,`s`.`RewardFactionID5`,`s`.`RewardFactionValue5`,`s`.`RewardFactionOverride5`,`s`.`RewardFactionCapIn5`,`s`.`RewardCurrencyID1`,`s`.`RewardCurrencyQty1`,`s`.`RewardCurrencyID2`,`s`.`RewardCurrencyQty2`,`s`.`RewardCurrencyID3`,`s`.`RewardCurrencyQty3`,`s`.`RewardCurrencyID4`,`s`.`RewardCurrencyQty4`,`s`.`QuestType`,`s`.`QuestInfoID`,`s`.`RewardNextQuest`,`s`.`StartItem`,`s`.`Flags`,`s`.`FlagsEx`,`s`.`FlagsEx2`,`s`.`TimeAllowed`,`s`.`QuestSortID`,`s`.`RewardXPDifficulty`,`s`.`RewardXPMultiplier`,`s`.`RewardSpell`,`s`.`AllowableRaces`,`s`.`AcceptedSoundKitID`,`s`.`CompleteSoundKitID`,`s`.`Expansion`,`s`.`LogTitle`,`s`.`LogDescription`,`s`.`QuestDescription`,`s`.`AreaDescription`,`s`.`QuestCompletionLog` FROM `forever_k35_quest_template` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_template` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_template`;
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_classic_level`;
CREATE TEMPORARY TABLE `forever_k35_quest_classic_level` SELECT `ID`,`QuestLevel`,`MinLevel`,`MaxLevel` FROM `quest_classic_level` WHERE 0;
INSERT INTO `forever_k35_quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES
(87491,30,25,0);
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT `s`.`ID`,`s`.`QuestLevel`,`s`.`MinLevel`,`s`.`MaxLevel` FROM `forever_k35_quest_classic_level` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_classic_level` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_classic_level`;
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_template_class`;
CREATE TEMPORARY TABLE `forever_k35_quest_template_class` SELECT `ID`,`LevelType`,`QuestLevel` FROM `quest_template_classic_level` WHERE 0;
INSERT INTO `forever_k35_quest_template_class` (`ID`,`LevelType`,`QuestLevel`) VALUES
(87491,2,30);
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT `s`.`ID`,`s`.`LevelType`,`s`.`QuestLevel` FROM `forever_k35_quest_template_class` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_template_classic_level` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_template_class`;
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_classic_money`;
CREATE TEMPORARY TABLE `forever_k35_quest_classic_money` SELECT `ID`,`RewardMoney`,`RewardMoneyMaxLevel` FROM `quest_classic_money` WHERE 0;
INSERT INTO `forever_k35_quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES
(87491,2500,0);
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT `s`.`ID`,`s`.`RewardMoney`,`s`.`RewardMoneyMaxLevel` FROM `forever_k35_quest_classic_money` `s` WHERE NOT EXISTS (SELECT 1 FROM `quest_classic_money` `x` WHERE `x`.`ID`=`s`.`ID`);
DROP TEMPORARY TABLE IF EXISTS `forever_k35_quest_classic_money`;

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2, `AIName` = 'SmartAI'
WHERE `entry` = 271481 AND `AIName` = '' AND `ScriptName` = ''
  AND EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 87491)
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` WHERE `entryorguid` = 271481 AND `source_type` = 0);

INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`)
SELECT 271481,87491,0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 87491)
  AND NOT EXISTS (SELECT 1 FROM `creature_queststarter` WHERE `id` = 271481 AND `quest` = 87491);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`)
SELECT 1072,87491,0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 87491)
  AND NOT EXISTS (SELECT 1 FROM `creature_questender` WHERE `id` = 1072 AND `quest` = 87491);

INSERT INTO `waypoint_path` (`PathId`,`MoveType`,`Flags`,`Velocity`,`Comment`)
SELECT 27148110,0,0,NULL,'Captive Fire Elemental - Spark of Freedom escort out of Dun Modr' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `waypoint_path` WHERE `PathId` = 27148110);
INSERT INTO `waypoint_path_node` (`PathId`,`NodeId`,`PositionX`,`PositionY`,`PositionZ`,`Orientation`,`Delay`)
SELECT `s`.* FROM (
  SELECT 27148110 AS `PathId`,1 AS `NodeId`,-2612.45 AS `PositionX`,-2289.9 AS `PositionY`,88.4282 AS `PositionZ`,NULL AS `Orientation`,0 AS `Delay`
  UNION ALL SELECT 27148110,2,-2622.38,-2322.33,79.815,NULL,0
  UNION ALL SELECT 27148110,3,-2617.98,-2365.4,80.8526,NULL,0
  UNION ALL SELECT 27148110,4,-2619.93,-2416.02,79.311,NULL,0) `s`
WHERE EXISTS (SELECT 1 FROM `waypoint_path` `p` WHERE `p`.`PathId` = 27148110 AND `p`.`Comment` LIKE 'Captive Fire Elemental%')
  AND NOT EXISTS (SELECT 1 FROM `waypoint_path_node` `n` WHERE `n`.`PathId` = 27148110);

INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,
  `event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,
  `action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
SELECT 271481,0,0,0,19,0,100,0,87491,0,0,0,0,53,0,27148110,0,87491,10000,0,7,0,0,0,0,0,0,0,
  'Captive Fire Elemental - On Quest ''Spark of Freedom'' Taken - Start Escort Path'
FROM DUAL WHERE EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 271481 AND `AIName` = 'SmartAI' AND `ScriptName` = '')
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` WHERE `entryorguid` = 271481 AND `source_type` = 0);
