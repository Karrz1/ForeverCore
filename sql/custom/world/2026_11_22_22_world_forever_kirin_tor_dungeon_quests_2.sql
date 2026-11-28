-- WoW Forever: three more Kirin Tor dungeon quests (Alliance), after 2026_11_22_20, with the objects and the drop they need.
--   Past Due 96800 (Magus Olvek 264265): its book, The Lost Magic of the Runemasters (object 650929, template from 2026_11_14_75),
--     was never spawned and its loot 140820 had no row. Spawned beside Arcanist Doan in the Scarlet Monastery Library.
--   The Coldbringer's Eye 96773 (Archmage Lan'dalock 20735): the eye (object 660624) was not in our world. Template from EG Link
--     (object query, build 71037: chest, loot 142133 = the eye 276916, a quest item), spawned beside Amnennar the Coldbringer.
--   Blackmaw Magic 97173 (Archmage Timear 31439): the Blackmaw Ritual Totem 276893 drops from Elder Shaman Bloodmane 247209
--     ("only the most powerful of the Blackmaw's shamans will be carrying one", the quest text), only while the quest needs it.
-- INFERRED (no live position or drop data exists for them): the book's spot (3 yards beside Doan's spawn, on his floor), the
--   eye's spot (3 yards beside Amnennar's spawn, on his floor), the totem's dropper and its 100 % chance.
-- Quests: same sources and build as 2026_11_22_20 (EG Link quest records, CC BY 4.0, https://efficient.games; givers from
-- Wowhead's WoW Forever quest pages, read 2026-11-21; reward/completion texts from Everlake's world data, GPL-3.0).
-- Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/).
-- Still held: Vengeance of the Highborne 96771 (its target Zalfan Moonshadow 268423 is in no live combat log of Krol'dok, so
-- there is no spot for him).
-- Spawn guids 920014010-920014011 (gameobject). Safe to run again.

-- the eye: template (EG Link object_details, build 71037)
DELETE FROM `gameobject_template` WHERE `entry` = 660624;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`Data2`,`Data3`,`Data4`,`Data5`,`Data6`,`Data7`,`Data8`,`Data9`,`Data10`,`Data11`,`Data12`,`Data13`,`Data14`,`Data15`,`Data16`,`Data17`,`Data18`,`Data19`,`Data20`,`Data21`,`Data22`,`Data23`,`Data24`,`Data25`,`Data26`,`Data27`,`Data28`,`Data29`,`Data30`,`Data31`,`Data32`,`Data33`,`Data34`,`ContentTuningId`,`RequiredLevel`,`VerifiedBuild`) VALUES
(660624,3,127182,'The Coldbringer''s Eye','','','',1.0,0,142133,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,162085,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,71037);
DELETE FROM `gameobject_questitem` WHERE `GameObjectEntry` = 660624;
INSERT INTO `gameobject_questitem` (`GameObjectEntry`,`Idx`,`ItemId`,`VerifiedBuild`) VALUES (660624,0,276916,71037);

-- loot: the eye and the book (only while the quest needs them)
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (142133,140820);
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(142133,0,276916,100,1,1,0,1,1,'The Coldbringer''s Eye (EG Link loot, build 71037)'),
(140820,0,273169,100,1,1,0,1,1,'The Lost Magic of the Runemasters (EG Link object query, build 70888)');

-- spawns (INFERRED spots)
DELETE FROM `gameobject` WHERE `guid` IN (920014010,920014011);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(920014010,650929,189,0,0,'1',0,0,0,-1,148.32,-431.69,18.4864,6.24828,0,0,-0.0174,0.99985,7200,255,1,'',NULL,0),
(920014011,660624,129,0,0,'1',0,0,0,-1,2403.37,963.93,55.1437,2.33874,0,0,0.9205,0.3907,7200,255,1,'',NULL,0);

-- the totem: Elder Shaman Bloodmane (loot id = entry since 2026_11_19_70)
DELETE FROM `creature_loot_template` WHERE `Entry` = 247209 AND `Item` = 276893;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(247209,0,276893,100,1,1,0,1,1,'Elder Shaman Bloodmane: Blackmaw Ritual Totem (Blackmaw Magic 97173; dropper and chance INFERRED)');

-- 96800 Past Due (live record, EG Link): giver and turn-in 264265 Magus Olvek (Wowhead)
DELETE FROM `quest_template` WHERE `ID`=96800;
DELETE FROM `quest_classic_level` WHERE `ID`=96800;
DELETE FROM `quest_template_classic_level` WHERE `ID`=96800;
DELETE FROM `quest_template_addon` WHERE `ID`=96800;
DELETE FROM `quest_offer_reward` WHERE `ID`=96800;
DELETE FROM `quest_request_items` WHERE `ID`=96800;
DELETE FROM `quest_classic_money` WHERE `ID`=96800;
DELETE FROM `creature_queststarter` WHERE `quest`=96800;
DELETE FROM `creature_questender` WHERE `quest`=96800;
DELETE FROM `quest_objectives` WHERE `QuestID`=96800;
INSERT INTO `quest_template` (`ID`,`QuestType`,`LogTitle`,`VerifiedBuild`) SELECT 96800,2,'Past Due',-1;
UPDATE `quest_template` SET `QuestDescription`='You there, $c. I have a matter I could use assistance with.\n\nI just so happen to be writing a thesis on the ancient Wildhammer runemasters of Grim Batol, and there''s a particular tome I need to complete my research. According to our ledgers, a mage by the name of Doan checked the book out of the old Dalaran library before the Third War and never returned it!\n\nArcanist Doan is now holed up in the Scarlet Monastery in Tirisfal Glades. Retrieve this book for me and you''ll be well rewarded.', `LogDescription`='Retrieve the book The Lost Magic of the Runemasters from the Scarlet Monastery.', `AreaDescription`='', `QuestCompletionLog`='', `QuestSortID`=796, `QuestInfoID`=81, `RewardNextQuest`=0, `RewardXPDifficulty`=5, `RewardXPMultiplier`=2.375, `RewardSpell`=0, `StartItem`=0, `Flags`=264, `FlagsEx`=0, `AllowableRaces`=6130900294268439629, `TimeAllowed`=0, `VerifiedBuild`=70959, `RewardChoiceItemID1`=276898, `RewardChoiceItemQuantity1`=1, `RewardChoiceItemID2`=276899, `RewardChoiceItemQuantity2`=1, `RewardChoiceItemID3`=0, `RewardChoiceItemQuantity3`=0, `RewardChoiceItemID4`=0, `RewardChoiceItemQuantity4`=0, `RewardChoiceItemID5`=0, `RewardChoiceItemQuantity5`=0, `RewardChoiceItemID6`=0, `RewardChoiceItemQuantity6`=0, `RewardFactionID1`=2740, `RewardFactionValue1`=5, `RewardFactionOverride1`=0, `RewardFactionID2`=0, `RewardFactionValue2`=0, `RewardFactionOverride2`=0, `RewardFactionID3`=0, `RewardFactionValue3`=0, `RewardFactionOverride3`=0, `RewardFactionID4`=0, `RewardFactionValue4`=0, `RewardFactionOverride4`=0, `RewardFactionID5`=0, `RewardFactionValue5`=0, `RewardFactionOverride5`=0 WHERE `ID`=96800;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT 96800,38,30,0;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT 96800,2,38;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) SELECT 96800,0,0,0;
INSERT INTO `quest_offer_reward` (`ID`,`RewardText`,`VerifiedBuild`) SELECT 96800,'Oh you had to kill Doan to get the book back? Oh no...$B$B... well anyway, all''s well that ends well! Thank you for returning this to its rightful place and helping me finish my thesis. I''m quite convinced that reviving the lost art of dwarven rune magic is well within our grasp and I intend to prove it!$B$BIf only I could get into Grim Batol and inspect the runecarvings of old for myself...$B$BSomeday, perhaps.',0;
INSERT INTO `quest_request_items` (`ID`,`CompletionText`,`VerifiedBuild`) SELECT 96800,'Sometimes I feel like this thesis is cursed.',0;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT 96800,4500,0;
DELETE FROM `quest_objectives` WHERE `ID`=474252;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`) SELECT 474252,96800,1,0,0,273169,1,0,0,0,0.0,0,1,NULL,70959;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) SELECT 264265,96800,0;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) SELECT 264265,96800,0;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=264265;

-- 96773 The Coldbringer's Eye (live record, EG Link): giver and turn-in 20735 Archmage Lan'dalock (Wowhead)
DELETE FROM `quest_template` WHERE `ID`=96773;
DELETE FROM `quest_classic_level` WHERE `ID`=96773;
DELETE FROM `quest_template_classic_level` WHERE `ID`=96773;
DELETE FROM `quest_template_addon` WHERE `ID`=96773;
DELETE FROM `quest_offer_reward` WHERE `ID`=96773;
DELETE FROM `quest_request_items` WHERE `ID`=96773;
DELETE FROM `quest_classic_money` WHERE `ID`=96773;
DELETE FROM `creature_queststarter` WHERE `quest`=96773;
DELETE FROM `creature_questender` WHERE `quest`=96773;
DELETE FROM `quest_objectives` WHERE `QuestID`=96773;
INSERT INTO `quest_template` (`ID`,`QuestType`,`LogTitle`,`VerifiedBuild`) SELECT 96773,2,'The Coldbringer''s Eye',-1;
UPDATE `quest_template` SET `QuestDescription`='There is a servant of the Lich King that makes his home deep in the quilboar lair known as Razorfen Downs. It is known to us that he makes use of a scrying orb known as "The Coldbringer''s Eye" to direct the movements of his lesser minions elsewhere.\n\nGo into Razorfen Downs and retrieve the Coldbringer''s Eye on our behalf, $c. The Kirin Tor would pay handsomely to obtain this artifact so that we may study it and understand its inner workings.', `LogDescription`='Recover The Coldbringer''s Eye from Razorfen Downs.', `AreaDescription`='', `QuestCompletionLog`='', `QuestSortID`=722, `QuestInfoID`=81, `RewardNextQuest`=0, `RewardXPDifficulty`=6, `RewardXPMultiplier`=2.1, `RewardSpell`=0, `StartItem`=0, `Flags`=8, `FlagsEx`=0, `AllowableRaces`=6130900294268439629, `TimeAllowed`=0, `VerifiedBuild`=70959, `RewardChoiceItemID1`=0, `RewardChoiceItemQuantity1`=0, `RewardChoiceItemID2`=0, `RewardChoiceItemQuantity2`=0, `RewardChoiceItemID3`=0, `RewardChoiceItemQuantity3`=0, `RewardChoiceItemID4`=0, `RewardChoiceItemQuantity4`=0, `RewardChoiceItemID5`=0, `RewardChoiceItemQuantity5`=0, `RewardChoiceItemID6`=0, `RewardChoiceItemQuantity6`=0, `RewardFactionID1`=2740, `RewardFactionValue1`=7, `RewardFactionOverride1`=30000, `RewardFactionID2`=72, `RewardFactionValue2`=6, `RewardFactionOverride2`=0, `RewardFactionID3`=0, `RewardFactionValue3`=0, `RewardFactionOverride3`=0, `RewardFactionID4`=0, `RewardFactionValue4`=0, `RewardFactionOverride4`=0, `RewardFactionID5`=0, `RewardFactionValue5`=0, `RewardFactionOverride5`=0 WHERE `ID`=96773;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT 96773,41,34,0;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT 96773,2,41;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) SELECT 96773,0,0,0;
INSERT INTO `quest_offer_reward` (`ID`,`RewardText`,`VerifiedBuild`) SELECT 96773,'You have done well. As promised, here is your reward.',0;
INSERT INTO `quest_request_items` (`ID`,`CompletionText`,`VerifiedBuild`) SELECT 96773,'The methods and means of the members of the scourge are mysterious and esoteric, even to the educated mages of the Kirin Tor. Some speculate that their magic is akin to elemental magic in nature, perhaps some force that acts as the antithesis of the light.$B$BSome speculate that their magic is drawn from the spirit realm itself via small tears in the veil between life and death. The more scourge artifacts we can recover intact for study, the more complete our understanding will be.',0;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT 96773,5500,0;
DELETE FROM `quest_objectives` WHERE `ID`=475419;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`) SELECT 475419,96773,1,0,0,276916,1,0,0,0,0.0,0,1,NULL,70959;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) SELECT 20735,96773,0;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) SELECT 20735,96773,0;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=20735;

-- 97173 Blackmaw Magic (live record, EG Link): giver and turn-in 31439 Archmage Timear (Wowhead)
DELETE FROM `quest_template` WHERE `ID`=97173;
DELETE FROM `quest_classic_level` WHERE `ID`=97173;
DELETE FROM `quest_template_classic_level` WHERE `ID`=97173;
DELETE FROM `quest_template_addon` WHERE `ID`=97173;
DELETE FROM `quest_offer_reward` WHERE `ID`=97173;
DELETE FROM `quest_request_items` WHERE `ID`=97173;
DELETE FROM `quest_classic_money` WHERE `ID`=97173;
DELETE FROM `creature_queststarter` WHERE `quest`=97173;
DELETE FROM `creature_questender` WHERE `quest`=97173;
DELETE FROM `quest_objectives` WHERE `QuestID`=97173;
INSERT INTO `quest_template` (`ID`,`QuestType`,`LogTitle`,`VerifiedBuild`) SELECT 97173,2,'Blackmaw Magic',-1;
UPDATE `quest_template` SET `QuestDescription`='The Blackmaw furbolgs in the mountains overlooking Azshara have been dabbling in dark magic. While a primitive people being corrupted by demonic magic is nothing new for Azeroth, Lan''dalock and I would like to study their spell foci.\n\nTravel to the stronghold known as Blackmaw Hold and recover one of the Blackmaw Ritual Totems for us. Only the most powerful of the Blackmaw''s shamans will be carrying one of these, so bring allies and take care.', `LogDescription`='Recover a Blackmaw Ritual Totem from Blackmaw Hold.', `AreaDescription`='', `QuestCompletionLog`='', `QuestSortID`=16554, `QuestInfoID`=81, `RewardNextQuest`=0, `RewardXPDifficulty`=5, `RewardXPMultiplier`=2.0, `RewardSpell`=0, `StartItem`=0, `Flags`=8, `FlagsEx`=0, `AllowableRaces`=6130900294268439629, `TimeAllowed`=0, `VerifiedBuild`=70959, `RewardChoiceItemID1`=0, `RewardChoiceItemQuantity1`=0, `RewardChoiceItemID2`=0, `RewardChoiceItemQuantity2`=0, `RewardChoiceItemID3`=0, `RewardChoiceItemQuantity3`=0, `RewardChoiceItemID4`=0, `RewardChoiceItemQuantity4`=0, `RewardChoiceItemID5`=0, `RewardChoiceItemQuantity5`=0, `RewardChoiceItemID6`=0, `RewardChoiceItemQuantity6`=0, `RewardFactionID1`=2740, `RewardFactionValue1`=6, `RewardFactionOverride1`=30000, `RewardFactionID2`=69, `RewardFactionValue2`=6, `RewardFactionOverride2`=0, `RewardFactionID3`=0, `RewardFactionValue3`=0, `RewardFactionOverride3`=0, `RewardFactionID4`=0, `RewardFactionValue4`=0, `RewardFactionOverride4`=0, `RewardFactionID5`=0, `RewardFactionValue5`=0, `RewardFactionOverride5`=0 WHERE `ID`=97173;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT 97173,59,52,0;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT 97173,2,59;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) SELECT 97173,0,0,0;
INSERT INTO `quest_offer_reward` (`ID`,`RewardText`,`VerifiedBuild`) SELECT 97173,'Excellent work, $N.$B$BMy colleague and I are most eager to study and catalog the magic permeating this totem.',0;
INSERT INTO `quest_request_items` (`ID`,`CompletionText`,`VerifiedBuild`) SELECT 97173,'Spell focus objects can tell us much about the nature of magic being channeled through them. Magic always leaves some sort of lingering "footprint", as it were.',0;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT 97173,22713,0;
DELETE FROM `quest_objectives` WHERE `ID`=475393;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`) SELECT 475393,97173,1,0,0,276893,1,0,0,0,0.0,0,1,NULL,70959;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) SELECT 31439,97173,0;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) SELECT 31439,97173,0;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=31439;

