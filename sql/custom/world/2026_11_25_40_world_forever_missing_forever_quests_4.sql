-- WoW Forever: Forever quests players do on the live realm (build 1.60.1.71091) that our world did not have (fourth batch;
-- earlier batches 2026_11_22_80/83/91). Full live record: title, story, objective line, levels, races, flags, objectives with
-- their live ids, rewards, start item, the giver's progress and reward lines, and the quest item drops they need.
-- Quest records and lines: Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
-- (https://creativecommons.org/licenses/by/4.0/). Source: github.com/JIVESCORP/eg-link-output-wowf quests.enUS, texts.enUS, npcs.
-- Changed: picked and converted to our tables.
-- Who starts and ends each quest, quest chains, story/progress/reward lines EG Link lacks, and quest item drop chances:
-- Icy Veins WoW Forever database (db.icy-veins.com/wow-forever) and Wowhead Forever quest and item pages.
-- Only quests whose giver, turn-in and every objective target exist and are spawned in our world are here.
-- Previous-quest locks only where the Icy Veins quest chain and a second source agree. Safe to run again: every row is replaced by key.

-- loot ids for creatures that had none
UPDATE `creature_template_difficulty` SET `LootID`=248395 WHERE `Entry`=248395 AND `DifficultyID`=0 AND `LootID`=0;
UPDATE `creature_template_difficulty` SET `LootID`=249230 WHERE `Entry`=249230 AND `DifficultyID`=0 AND `LootID`=0;
UPDATE `creature_template_difficulty` SET `LootID`=249551 WHERE `Entry`=249551 AND `DifficultyID`=0 AND `LootID`=0;
UPDATE `creature_template_difficulty` SET `LootID`=260422 WHERE `Entry`=260422 AND `DifficultyID`=0 AND `LootID`=0;
UPDATE `creature_template_difficulty` SET `LootID`=266357 WHERE `Entry`=266357 AND `DifficultyID`=0 AND `LootID`=0;
UPDATE `creature_template_difficulty` SET `LootID`=275174 WHERE `Entry`=275174 AND `DifficultyID`=0 AND `LootID`=0;
DELETE FROM `creature_loot_template` WHERE `Entry`=266357 AND `ItemType`=0 AND `Item`=275482;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (266357,0,275482,15,1,1,0,1,1,'quest 96781');
DELETE FROM `creature_loot_template` WHERE `Entry`=260422 AND `ItemType`=0 AND `Item`=274396;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (260422,0,274396,35,1,1,0,1,1,'quest 95317');
DELETE FROM `creature_loot_template` WHERE `Entry`=248395 AND `ItemType`=0 AND `Item`=247892;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (248395,0,247892,49,1,1,0,1,1,'quest 91755');
DELETE FROM `creature_loot_template` WHERE `Entry`=249247 AND `ItemType`=0 AND `Item`=272973;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (249247,0,272973,4,1,1,0,1,1,'quest 92317');
DELETE FROM `creature_loot_template` WHERE `Entry`=249551 AND `ItemType`=0 AND `Item`=273832;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (249551,0,273832,7,1,1,0,1,1,'quest 92533');
DELETE FROM `creature_loot_template` WHERE `Entry`=275174 AND `ItemType`=0 AND `Item`=273828;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (275174,0,273828,15,1,1,0,1,1,'quest 92533');
DELETE FROM `creature_loot_template` WHERE `Entry`=7458 AND `ItemType`=0 AND `Item`=258323;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (7458,0,258323,6,1,1,0,1,1,'quest 93406');
DELETE FROM `creature_loot_template` WHERE `Entry`=249230 AND `ItemType`=0 AND `Item`=271220;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (249230,0,271220,23,1,1,0,1,1,'quest 92960');
DELETE FROM `creature_loot_template` WHERE `Entry`=5991 AND `ItemType`=0 AND `Item`=280181;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (5991,0,280181,17,1,1,0,1,1,'quest 87295');
DELETE FROM `creature_loot_template` WHERE `Entry`=5990 AND `ItemType`=0 AND `Item`=280181;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (5990,0,280181,17,1,1,0,1,1,'quest 87295');
DELETE FROM `creature_loot_template` WHERE `Entry`=260826 AND `ItemType`=0 AND `Item`=268998;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (260826,0,268998,52,1,1,0,1,1,'quest 91883');
DELETE FROM `gameobject_loot_template` WHERE `Entry`=119849 AND `ItemType`=0 AND `Item`=210177;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (119849,0,210177,100,1,1,0,1,1,'quest 79096');
DELETE FROM `gameobject_loot_template` WHERE `Entry`=119761 AND `ItemType`=0 AND `Item`=209846;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (119761,0,209846,100,1,1,0,1,1,'quest 78143');

-- 79624 Anyone Can Cook (level 40, min 32, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=79624;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (79624,2,45,0,0,3,1.0,0,1.0,0,0,33554432,0,0,0,18446744073709551615,'Anyone Can Cook','Find an ogre who can read the Illegible Recipe.','The recipe appears to be for some sort of meat dish. It is written in a language you don''t understand. Ogre is your best guess, given the source and subject matter.

Ogres aren''t usually culinary types but, if you knew one with such an inclination, they could translate the recipe for you.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=79624;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (476995,79624,1,0,0,213422,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=79624;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (79624,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=79624;
DELETE FROM `quest_classic_level` WHERE `ID`=79624;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (79624,40,32,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=79624;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (79624,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=79624;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (79624,0,0,0,0,0,0,0,0,'You have recipe? Skonk listening.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=79624;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (79624,0,0,0,0,'Who you? Maybe Skonk first customer?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=79624;
DELETE FROM `gameobject_queststarter` WHERE `quest`=79624;
DELETE FROM `creature_questender` WHERE `quest`=79624;
DELETE FROM `gameobject_questender` WHERE `quest`=79624;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (217300,79624,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (217300);

-- 78823 Terror of the Desert Skies (level 40, min 26, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=78823;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (78823,2,3,0,0,3,1.0,0,1.0,0,0,33554432,0,0,0,18446744073709551615,'Terror of the Desert Skies','Bring the Primitive Drawing to Hemet Nesingwary in Stranglethorn Vale.','The drawing is composed of rough, broad, strokes and seems to depict a large bird of prey. Despite the simple composition, the artist clearly viewed this creature with fear and awe. An expert on big game could likely tell you more.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=78823;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (477006,78823,1,0,0,211269,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=78823;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (78823,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=78823;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (78823,2500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=78823;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (78823,40,26,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=78823;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (78823,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=78823;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (78823,0,0,0,0,0,0,0,0,'Well now. This is certainly interesting...',71037);
DELETE FROM `quest_request_items` WHERE `ID`=78823;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (78823,0,0,0,0,'Got something for me, $c?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=78823;
DELETE FROM `gameobject_queststarter` WHERE `quest`=78823;
DELETE FROM `creature_questender` WHERE `quest`=78823;
DELETE FROM `gameobject_questender` WHERE `quest`=78823;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (715,78823,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (715);

-- 93644 Tattered Journal (level 45, min 35, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93644;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93644,2,16651,0,0,5,1.0,0,1.0,0,0,36700160,0,0,0,18446744073709551615,'Tattered Journal','The text suggests the author of this journal may be somewhere in Shen''dralas.','<Found near Shen''dralas, this dirty old tome no longer holds most of its knowledge.

Of the text that remains, individual letters are difficult to distinguish from words. It may prove challenging to read at first, but one of them appears to be a surname.

Perhaps its author, "Evenshade", may be found nearby.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93644;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (467059,93644,1,0,0,260347,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93644;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (93644,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93644;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (93644,6500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=93644;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93644,45,35,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93644;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93644,2,45);
DELETE FROM `quest_offer_reward` WHERE `ID`=93644;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93644,0,0,0,0,0,0,0,0,'My journal? Certainly not, it was lost centuries ago.

<Mordent reclaims the dirty tome and examines the cover. His brow lifts in surprise, but it falls after he opens the covers.>

You have indeed found my journal, but alas, all that I had written is gone. I have not forgotten what was within, but I do not wish to speak any of it aloud.

Should its pages have also survived somehow, you have my permission to attempt to restore it.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93644;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93644,0,0,0,0,'Is there something you need?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=93644;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93644;
DELETE FROM `creature_questender` WHERE `quest`=93644;
DELETE FROM `gameobject_questender` WHERE `quest`=93644;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (253471,93644,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (253471);

-- 95384 Partial Mystical Notes (level 40, min 32, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95384;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95384,2,33,0,0,5,1.0,0,1.0,0,0,33554688,0,0,0,18446744073709551615,277256,1,21,3,0,213127,1,'Partial Mystical Notes','Bring the partial scroll to Dudd Fizzlescroll in Booty Bay.','<The strange symbols on the magical scroll confound you. Though you do not speak the language recorded, you don''t sense any particularly volatile forces within. Perhaps a collector of odd magics would find some use for the scroll.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95384;
DELETE FROM `quest_template_addon` WHERE `ID`=95384;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95384,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95384;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95384,5000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95384;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95384,40,32,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95384;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95384,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95384;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95384,0,0,0,0,0,0,0,0,'Strange scroll, you say? Yeah, this looks like some top-grade magic. The GOOD stuff. Thanks for bringin'' it here, friend. Take this as a reward for your time.

Now, let me just see about translating this mess and getting it transcribed into my records...',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95384;
DELETE FROM `creature_queststarter` WHERE `quest`=95384;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95384;
DELETE FROM `creature_questender` WHERE `quest`=95384;
DELETE FROM `gameobject_questender` WHERE `quest`=95384;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260873,95384,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260873);

-- 95534 Strahnbrad Mystery (level 36, min 25, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95534;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95534,2,36,0,0,5,1.0,0,1.0,0,0,33554432,0,0,0,18446744073709551615,277206,1,213421,1,'Strahnbrad Mystery','Solve the mystery of Strahnbrad and report your findings in town in Hillsbrad.','<The note is singed in places, but is still readable.>

Rumor has it those old bellows have a mind of their own, springing to life when no one is watching. I don''t care if it''s a ghost story, you''d better get to the bottom of it before I return.

There''s great power in Strahnbrad, I know it.

< The rest of the note is singed and torn, as if burnt by fire magic. >','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95534;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470850,95534,0,0,0,217305,1,0,1,'Discover the fiery mystery of Strahnbrad',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95534;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95534,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95534;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95534,4000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95534;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95534,36,25,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95534;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95534,2,36);
DELETE FROM `quest_offer_reward` WHERE `ID`=95534;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95534,0,0,0,0,0,0,0,0,'So there was a fire elemental living in the old bellows up in Strahnbrad? The real mystery is how it got there, I suppose. Either way, good work. Your efforts will be rewarded.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95534;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95534,0,0,0,0,'Hm? There''s a mystery in Strahnbrad you''re investigating? Pah, that old ghost town is nothing special.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95534;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95534;
DELETE FROM `creature_questender` WHERE `quest`=95534;
DELETE FROM `gameobject_questender` WHERE `quest`=95534;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2378,95534,0),(2402,95534,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2378,2402);

-- 94885 Field Marshal's Log (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94885;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94885,2,16591,0,94887,5,1.0,0,1.0,0,0,3145728,1,0,0,6130900294268439629,'Field Marshal''s Log','Deliver the Field Marshal''s Log to Demar Brant in Farholde Keep.','The log is full of meticulous recordings on the comings and goings of Twilight''s Hammer forces throughout the Riverglades. 

The author is nowhere to be found, but this information could help shed light on enemy movements.

Someone in Farholde will want to see this.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94885;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469574,94885,1,0,0,266427,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94885;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (94885,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94885;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94885,2500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94885;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94885,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94885;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94885,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=94885;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94885,0,0,0,0,0,0,0,0,'These notes come too late, I''m afraid. We are now well aware of the dangers within Sunnyglade. What''s more troubling is that you have found them.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94885;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94885,0,0,0,0,'What have you found?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94885;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94885;
DELETE FROM `creature_questender` WHERE `quest`=94885;
DELETE FROM `gameobject_questender` WHERE `quest`=94885;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,94885,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257558);

-- 79096 Ataeric: On Arcane Curiosities (level 20, min 1, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=79096;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (79096,0,0,0,0,1,1.0,0,1.0,0,0,33554688,0,0,0,18446744073709551615,'Ataeric: On Arcane Curiosities','','','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=79096;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (445450,79096,1,0,1,210177,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=79096;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (79096,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=79096;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (79096,125,0);
DELETE FROM `quest_classic_level` WHERE `ID`=79096;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (79096,20,1,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=79096;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (79096,2,20);
DELETE FROM `quest_offer_reward` WHERE `ID`=79096;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (79096,0,0,0,0,0,0,0,0,'Thank you, $N. Our knowledge expands through your efforts.

If you discover more magical works that might benefit the library, please bring them to me.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=79096;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (79096,0,0,0,0,'Have you brought something to add to our collection?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=79096;
DELETE FROM `gameobject_queststarter` WHERE `quest`=79096;
DELETE FROM `creature_questender` WHERE `quest`=79096;
DELETE FROM `gameobject_questender` WHERE `quest`=79096;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (211022,79096,0),(211033,79096,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (211022,79096,0),(211033,79096,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (211022,211033);

-- 78143 Secrets of the Dreamers (level 20, min 1, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=78143;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (78143,0,0,0,0,1,1.0,0,1.0,0,0,33554688,0,0,0,18446744073709551615,'Secrets of the Dreamers','','','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=78143;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (443982,78143,1,0,0,209846,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=78143;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (78143,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=78143;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (78143,125,0);
DELETE FROM `quest_classic_level` WHERE `ID`=78143;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (78143,20,1,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=78143;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (78143,2,20);
DELETE FROM `quest_offer_reward` WHERE `ID`=78143;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (78143,0,0,0,0,0,0,0,0,'Thank you, $N. Our knowledge expands through your efforts.

If you discover more magical works that might benefit the library, please bring them to me.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=78143;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (78143,0,0,0,0,'Have you brought something to add to our collection?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=78143;
DELETE FROM `gameobject_queststarter` WHERE `quest`=78143;
DELETE FROM `creature_questender` WHERE `quest`=78143;
DELETE FROM `gameobject_questender` WHERE `quest`=78143;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (211022,78143,0),(211033,78143,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (211022,78143,0),(211033,78143,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (211022,211033);

-- 95326 The Big Payback (level 39, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95326;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95326,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,2827,5,0,'The Big Payback','Kill the Venture Co. Agent and take back Ruzzgot''s Shipment for him in Booty Bay.','<The ledger contains a log of each of Ruzzgot''s deliveries. The final note marks the heist a success and Ruzzgot''s valuables collected by a nearby Venture Co. agent. The goods must still be with him.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95326;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470257,95326,1,0,0,268810,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95326;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95326,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95326;
DELETE FROM `quest_classic_level` WHERE `ID`=95326;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95326,39,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95326;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95326,2,39);
DELETE FROM `quest_offer_reward` WHERE `ID`=95326;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95326,0,0,0,0,0,0,0,0,'That''s more like it! If a caravaneer can''t be trusted with a delivery, what else does he have? 

Say, you don''t need help shipping this to Powderfuse Port, do ya?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95326;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95326,0,0,0,0,'Well? You find out who took my stuff?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95326;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95326;
DELETE FROM `creature_questender` WHERE `quest`=95326;
DELETE FROM `gameobject_questender` WHERE `quest`=95326;
INSERT INTO `gameobject_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (630887,95326,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (3945,95326,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (3945);

-- 96781 What's the Big Idea? (level 36, min 24, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96781;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96781,2,0,0,96782,5,1.0,0,1.0,0,0,8,0,0,0,18446744073709551615,349,5,0,'What''s the Big Idea?','Steal Barton''s Scouting Report by pickpocketing it from him. Then, bring the report to Myrokos Silentform at Ravenholdt Manor.','We have noticed a Syndicate scouting party prowling around the ruins of Alterac, led by a man named Barton.

They''re clearly searching for something, but I cannot know what without reading his scouting reports.

I ask that you pickpocket the report from him, rather than killing him outright. Barton''s death will tip off the Syndicate that we''re on to them, and they will certainly take counter-measures to cover their tracks.

If you hope to find him, he is most likely among the Syndicate at Strahnbrad.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96781;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (474187,96781,1,0,0,275482,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96781;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (96781,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96781;
DELETE FROM `quest_classic_level` WHERE `ID`=96781;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96781,36,24,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96781;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96781,2,36);
DELETE FROM `quest_offer_reward` WHERE `ID`=96781;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96781,0,0,0,0,0,0,0,0,'It appears you''ve some light fingers on you, $n. Very good.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96781;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96781,0,0,0,0,'What are they after in those ruins, I wonder?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96781;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96781;
DELETE FROM `creature_questender` WHERE `quest`=96781;
DELETE FROM `gameobject_questender` WHERE `quest`=96781;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (13085,96781,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (13085,96781,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (13085);

-- 95317 Notation, Notation, Notation (level 57, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95317;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95317,2,616,0,0,5,1.0,0,1.0,0,0,3145736,0,0,0,18446744073709551615,'Notation, Notation, Notation','Find $1oa Fel Ash Experimentation Notes.','Listen, $c. There have been some awfully noisy visitors just up the mountain. They are tainting the land with their foul demon magic and experimenting with piles of ash. It''s high time we investigate.

By we, I mean you.

I want you to poke around and investigate their camp! See if you can bring me some notes on what our mysterious fel ''friends'' have been up to. Surely with egos that large they''ve written something we can utilize. Perhaps they are carrying something on their person?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95317;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (473176,95317,1,0,4,274396,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95317;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95317,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95317;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95317,15750,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95317;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95317,57,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95317;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95317,2,57);
DELETE FROM `quest_offer_reward` WHERE `ID`=95317;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95317,0,0,0,0,0,0,0,0,'<The crow looks less enthused the longer you explain your findings about the experiments, to the point where she begins to look bored.>

You dirtwalkers use SO MANY words to describe things. To what end I wonder? A simple summary of their evil deeds is sufficient, yet they record them in such detail. You mortals are an enigma, always sticking your beak where it doesn''t belong.

What''s important now is how we will stop them and I have an idea. I''ll find a tall cliff to drop these notes off of later.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95317;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95317,0,0,0,0,'Blech, the smells coming out of that area burn my nostrils. It seems like there are four separate areas functioning in that warlock camp, but I can''t get close enough to make out what they''re doing.

Hopefully you''ll be able to find something that will tell us what they are doing here. These demon casters don''t seem very smart.

Whatever they''re doing, it certainly isn''t natural, which is all the more reason to get them on their way quickly.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95317;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95317;
DELETE FROM `creature_questender` WHERE `quest`=95317;
DELETE FROM `gameobject_questender` WHERE `quest`=95317;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257753,95317,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257753,95317,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257753);

-- 87494 Microcrystal Contamination (level 55, min 45, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=87494;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (87494,2,490,0,0,5,1.0,0,1.0,0,0,36700160,0,0,0,18446744073709551615,281261,1,281262,1,'Microcrystal Contamination','Take the Crystal Infused Scale to Torwa Pathfinder.','This scale is slightly more reflective and iridescent than the others, as if it''s embedded with tiny particles of crystal.

Torwa Pathfinder might be able to make something of this.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=87494;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (477434,87494,1,0,0,280459,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=87494;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (87494,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=87494;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (87494,8500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=87494;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (87494,55,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=87494;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (87494,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=87494;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (87494,0,0,0,0,0,0,0,0,'What a strange scale you''ve found!

It looks like the creature must have ingested so much crystal dust that it started suffusing its scale layer. This is probably a result of feeding from an area near a broken crystal, where the dust made its way into the plants, and then was ingested.

I suspect that larger doses would have a profound and visible effect. This beast was fortunate enough to avoid ingesting too much.

I''ll add this to my collection.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=87494;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (87494,0,0,0,0,'Un''goro is nature at its wildest and most untamed.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=87494;
DELETE FROM `gameobject_queststarter` WHERE `quest`=87494;
DELETE FROM `creature_questender` WHERE `quest`=87494;
DELETE FROM `gameobject_questender` WHERE `quest`=87494;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (9619,87494,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (9619,87494,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (9619);

-- 91755 Leaves to Ligatures (level 56, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=91755;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (91755,2,616,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Leaves to Ligatures','Collect $1oa Verdant Leaves from Tainted Shrubbery in the foothills of Mount Hyjal.','Have you seen those nasty tainted shrubberies wandering around this valley?

Those plants are mean, but some of them are not entirely toxic. Their leaves can have medicinal purposes.

Would you be so kind as to fetch me some Verdant Leaves? You''ll have to do a little pruning, of course.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=91755;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (463378,91755,1,0,0,247892,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=91755;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (91755,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=91755;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (91755,16167,0);
DELETE FROM `quest_classic_level` WHERE `ID`=91755;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (91755,56,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=91755;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (91755,2,56);
DELETE FROM `quest_offer_reward` WHERE `ID`=91755;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (91755,0,0,0,0,0,0,0,0,'Lovely! With these I can create some medicines for Fraxinus that will help to draw out the toxins that are poisoning him.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=91755;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (91755,0,0,0,0,'How many Verdant Leaves have you found? Those shrubberies are dangerous, but the only way to get the medicinal plant matter is to take it from the plants!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=91755;
DELETE FROM `gameobject_queststarter` WHERE `quest`=91755;
DELETE FROM `creature_questender` WHERE `quest`=91755;
DELETE FROM `gameobject_questender` WHERE `quest`=91755;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (248367,91755,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (248367,91755,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (248367);

-- 98325 Blood and Thunder (level 60, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=98325;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (98325,2,1583,81,0,1,1.0,0,1.0,0,0,536870922,0,0,0,12261800583900083122,76,1,0,'Blood and Thunder','Speak to Warlord Goretooth to serve the Kargath Expeditionary Force.','I seek the best the Horde has to offer, $c. And ONLY the best.

There are certain tasks that require a degree of valor that few possess. And fewer still are willing to lay it on the line when it really counts.

Are you $r enough to do what must be done? Let us speak if so.

If not, begone. I have no time to waste on cowardice.','Speak to Warlord Goretooth to serve the Kargath Expeditionary Force','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=98325;
DELETE FROM `quest_template_addon` WHERE `ID`=98325;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (98325,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=98325;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (98325,900,0);
DELETE FROM `quest_classic_level` WHERE `ID`=98325;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (98325,60,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=98325;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (98325,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=98325;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (98325,0,0,0,0,0,0,0,0,'<Warlord Goretooth grins.>

You have your orders.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=98325;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (98325,0,0,0,0,'Are you here to fight? To do what must be done in the name of our Warchief?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=98325;
DELETE FROM `gameobject_queststarter` WHERE `quest`=98325;
DELETE FROM `creature_questender` WHERE `quest`=98325;
DELETE FROM `gameobject_questender` WHERE `quest`=98325;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (9077,98325,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (9077,98325,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (9077);

-- 93197 Mending Communications (level 58, min 56, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93197;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93197,2,616,0,93406,3,1.0,0,1.0,0,257808,36700160,0,0,0,18446744073709551615,'Mending Communications','Take mail parcels from Sebelia at the summit camp on Mount Hyjal to Innkeeper Vizzie in Everlook.','With all of the fighting and the retreat from the Nordrassil Lodge, we''ve been terribly shorthanded out here.

If you are traveling back and forth between here and Everlook, I have some mail that needs to go to the town for distribution, and we need any waiting mail brought back up. I have a stack of parcels ready for transport, if you would be so good as to help.','','Parcel of Mail delivered to Innkeeper Vizzie in Winterspring',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93197;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (473281,93197,1,0,0,257808,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93197;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (93197,0,0,0,1);
DELETE FROM `quest_classic_money` WHERE `ID`=93197;
DELETE FROM `quest_classic_level` WHERE `ID`=93197;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93197,58,56,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93197;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93197,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=93197;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93197,0,0,0,0,0,0,0,0,'So, all the latest news from the mountain! I''ll get this into the post and out to the right people.

In the meantime, while you''re here...',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93197;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93197,0,0,0,0,'You look like you got something for me!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=93197;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93197;
DELETE FROM `creature_questender` WHERE `quest`=93197;
DELETE FROM `gameobject_questender` WHERE `quest`=93197;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (243815,93197,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (11118,93197,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (11118,243815);

-- 95320 A Curious Question (level 57, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95320;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95320,2,616,0,0,1,1.0,0,1.0,0,0,34603016,0,0,0,18446744073709551615,'A Curious Question','Find the imprisoned demon.','There is a caged demon just up the road near the entrance of the demon caster encampment that has been making a great deal of fuss.

All this ranting and raving about imprisonment and freedom. Something about scorching bones and revenge?

<The crow leans in and gives you a mischievous look. As if to emphasize, she then dangles an iron key in one of her talons.>

Let''s see if we can''t make a deal with our little ''friend'' and see what he knows about these nasty demon casters.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95320;
DELETE FROM `quest_template_addon` WHERE `ID`=95320;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95320,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95320;
DELETE FROM `quest_classic_level` WHERE `ID`=95320;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95320,57,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95320;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95320,2,57);
DELETE FROM `quest_offer_reward` WHERE `ID`=95320;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95320,0,0,0,0,0,0,0,0,'Listen, by the looks of it you aren''t friends with these pathetic excuses for warlocks.

You want info? Well I want revenge, and my freedom obviously.

Let''s make a deal.

You help me get out, I give you information and it just so happens we dismantle their operations in the process. Pretty good offer, no?

<Felflick gives you an oily grin.>

So, what do you say, mortal? Do you want to know the dark secrets of the Ashen Reign in exchange for some teeny, tiny favors?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95320;
DELETE FROM `creature_queststarter` WHERE `quest`=95320;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95320;
DELETE FROM `creature_questender` WHERE `quest`=95320;
DELETE FROM `gameobject_questender` WHERE `quest`=95320;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257753,95320,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263757,95320,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257753,263757);

-- 88807 Slay the Spitelash (level 48, min 45, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=88807;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (88807,2,16,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,69,5,0,'Slay the Spitelash','Kill 8 Spitelash Warriors and 8 Spitelash Screamers for Commander Truesong in Azshara.','Azshara may appear beautiful, but it is a cursed place. There are horrors deep beneath its waters, waiting to emerge and tear the world asunder.

All we can do for now is fight the horrors that have already surfaced.

The Spitelash Naga occupy the Ruins of Eldarath to the north east. The ones within the ruins are well-fortified, so we must pick off the weaker ones along the outskirts first.

As you can see, we could always use another fighter here, if you are up to the task.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=88807;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (459126,88807,0,0,3,6190,8,0,1,NULL,71037),(459127,88807,0,1,4,6193,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=88807;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (88807,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=88807;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (88807,8350,0);
DELETE FROM `quest_classic_level` WHERE `ID`=88807;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (88807,48,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=88807;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (88807,2,48);
DELETE FROM `quest_offer_reward` WHERE `ID`=88807;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (88807,0,0,0,0,0,0,0,0,'A commendable first step, <Class>. Now we strike the ruins proper.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=88807;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (88807,0,0,0,0,'There is much to be done in our fight against the Spitelash, and few hands to do it.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=88807;
DELETE FROM `gameobject_queststarter` WHERE `quest`=88807;
DELETE FROM `creature_questender` WHERE `quest`=88807;
DELETE FROM `gameobject_questender` WHERE `quest`=88807;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (239822,88807,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (239822,88807,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (239822);

-- 90487 Ancient Allies (level 56, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=90487;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (90487,2,616,0,0,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Ancient Allies','Travel west from the hermit''s cave to find an outpost of ancients and dryads on the lower slopes of Mount Hyjal.','$n, I have little more to offer. If you mean to make the long trek up the mountain, you might do well to speak with some of its ancient caretakers.

Follow the road to the west. Look north, toward the foot of the mountain. You will eventually see an outpost, a remnant of the guardians that once roamed the slopes. There is an ancient there named Fraxinus. He and his friends can assist you.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=90487;
DELETE FROM `quest_template_addon` WHERE `ID`=90487;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (90487,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=90487;
DELETE FROM `quest_classic_level` WHERE `ID`=90487;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (90487,56,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=90487;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (90487,2,56);
DELETE FROM `quest_offer_reward` WHERE `ID`=90487;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (90487,0,0,0,0,0,0,0,0,'Ah... you have come from afar.

Hyjal suffers under the fel taint that rains down from the summit. The wilds... are dangerous to mortals.

Be careful, traveler. The mountain has never been safe for your kind... and the dangers are greater now.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=90487;
DELETE FROM `creature_queststarter` WHERE `quest`=90487;
DELETE FROM `gameobject_queststarter` WHERE `quest`=90487;
DELETE FROM `creature_questender` WHERE `quest`=90487;
DELETE FROM `gameobject_questender` WHERE `quest`=90487;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256222,90487,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (248366,90487,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (248366,256222);

-- 92020 Hol'anyee's Big Book of Big Lizards (level 55, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92020;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92020,2,490,0,0,1,1.0,0,1.0,0,275903,36700160,0,0,0,18446744073709551615,275903,1,'Hol''anyee''s Big Book of Big Lizards','Take Hol''anyee''s Big Book of Big Lizards to a druid at the summit of Mount Hyjal.','I''ve been taking notes and making drawings in my sketchbooks of all of the creatures living in Un''Goro Crater, and I made a few copies so that I can send them to people who might be interested!

I have a sketchbook copy here that I''ve been meaning to get into the hands of the druids on Mount Hyjal, since I know that they love to study the natural world.

Hyjal''s a bit of a trip, though. Do you think you could take it along in case you go there?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92020;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (474537,92020,1,0,0,275903,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92020;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (92020,0,0,0,1);
DELETE FROM `quest_classic_money` WHERE `ID`=92020;
DELETE FROM `quest_classic_level` WHERE `ID`=92020;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92020,55,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92020;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92020,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=92020;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92020,0,0,0,0,0,0,0,0,'A book of sketches and notes about... giant lizards in Un''Goro Crater?

Honestly, I don''t know if anyone has time to read it right now, but the author has a good eye. The sketches in particular are useful and informative.

Thank you for delivering this. I''ll make sure it''s added to the libraries of druidic knowledge of the natural world.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92020;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92020,0,0,0,0,'What''s this book?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92020;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92020;
DELETE FROM `creature_questender` WHERE `quest`=92020;
DELETE FROM `gameobject_questender` WHERE `quest`=92020;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (9271,92020,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (40833,92020,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (9271,40833);

-- 92317 Stolen Life (level 58, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92317;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92317,2,616,0,0,4,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Stolen Life','Acquire a Drop of Stolen Life from the Scourge in the ruins on Mount Hyjal, then return to Ketharas.','So, the hermit druid seeks a force to balance the ''life'' in this magic of his? Then the answer is death, naturally. You have come to the right place for such a thing.

No doubt you''ve seen the undead crawling all over my domain. They are fueled by stolen power that animates them even in death.

That stolen power is exactly what is needed in this spell you speak of. Kill the undead and search through their skulls for a coalesced Drop of Stolen Life. Return it to Ketharas once you have it.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92317;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472526,92317,1,0,0,272973,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92317;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (92317,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92317;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (92317,12788,0);
DELETE FROM `quest_classic_level` WHERE `ID`=92317;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92317,58,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92317;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92317,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=92317;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92317,0,0,0,0,0,0,0,0,'Ah, this is perfect. Thank you, $n. I am impressed you were able to meet with Marrosis. He can often be difficult to converse with. He is correct; this is exactly what we needed.

Once added to our spell, this Drop of Stolen Life should strengthen its ability to draw out stolen power by acting as a counterbalance to the essence of life we already have and the strange energies of the staff.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92317;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92317,0,0,0,0,'Were you able to meet with Jereman? Hopefully her mischief has led you to answers instead of more questions.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92317;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92317;
DELETE FROM `creature_questender` WHERE `quest`=92317;
DELETE FROM `gameobject_questender` WHERE `quest`=92317;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (267113,92317,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256222,92317,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256222,267113);

-- 92533 Twisted Tools (level 60, min 56, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92533;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92533,2,616,0,0,5,1.0,0,1.0,0,0,8,0,0,0,18446744073709551615,275645,1,275647,1,275648,1,'Twisted Tools','Recover a Wicked Ritualist''s Kris and a Recoiling Gnarlybark Staff from Blackthorne cultists.','I have worked iron my whole life, and I can feel when a weapon has twisted away from its purpose. The Blackthorne cult forges tools meant to wound the land as much as flesh. Slay their cultists and bring me what they carry: one of their staves, and a ritual dagger.

They do not merely kill with their blades, they are poisoning them with intent.

By studying the marks left by their corruption, we can learn how their influence spreads. Perhaps, we will learn how to stop or even reverse it.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92533;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (473074,92533,1,0,2,273832,1,0,1,NULL,71037),(473075,92533,1,1,3,273828,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92533;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (92533,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92533;
DELETE FROM `quest_classic_level` WHERE `ID`=92533;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92533,60,56,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92533;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92533,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=92533;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92533,0,0,0,0,0,0,0,0,'There''s a darkness about you while you bear these armaments. I will unburden you, and with the Earthmother''s blessing, we may have a chance of reversing this wickedness.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92533;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92533,0,0,0,0,'Do not carry their cursed weaponry long, we do not yet know what affliction is possible by mere handling.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92533;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92533;
DELETE FROM `creature_questender` WHERE `quest`=92533;
DELETE FROM `gameobject_questender` WHERE `quest`=92533;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (243855,92533,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (243855,92533,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (243855);

-- 93406 Unfrozen Deliveries (level 56, min 56, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93406;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93406,2,616,0,93269,4,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Unfrozen Deliveries','Find $1oa pieces of Missing Mail in the hills north of Everlook and bring it back to Innkeeper Vizzie.','So you need to bring the return mail back to Mount Hyjal, eh? There''s a little problem...

Y''see, someone came through here and ransacked the outgoing mail just a few days ago! Probably looking for money in the mail. Ran off into the hills somewhere north of here and never came back. Probably got torn apart by a yeti or something!

Anyway, if you wanna bring back the mail, you''re gonna have to go get it first!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93406;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (466500,93406,1,0,1,258323,4,0,1,'Pieces of Missing Mail',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93406;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (93406,0,0,93197,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93406;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (93406,10875,0);
DELETE FROM `quest_classic_level` WHERE `ID`=93406;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93406,56,56,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93406;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93406,2,56);
DELETE FROM `quest_offer_reward` WHERE `ID`=93406;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93406,0,0,0,0,0,0,0,0,'Hey, you got all the missing mail!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93406;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93406,0,0,0,0,'How goes the search for the missing mail? I bet those yetis in the hills near here have it!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=93406;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93406;
DELETE FROM `creature_questender` WHERE `quest`=93406;
DELETE FROM `gameobject_questender` WHERE `quest`=93406;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (11118,93406,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (11118,93406,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (11118);

-- 95318 Taste of Ash (level 57, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95318;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95318,2,616,0,95319,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,275836,1,'Taste of Ash','Slay $1oa Ashen Acolytes.','So in order to really disrupt operations here and get me out of this cage, we''re going to have to kill four very powerful mortals. This cage has demonic wards on it that won''t be dispelled until all four are dead, and that key can''t be used until the wards are down.

Look, you seem like |5$r that can hold your own but I''m going to need a bit more convincing that you can actually take on these stupid warlocks before I give you any good info.

Like killing a ton of these warlocks for starters. Easy, no?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95318;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470268,95318,0,0,0,260422,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95318;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95318,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95318;
DELETE FROM `quest_classic_level` WHERE `ID`=95318;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95318,57,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95318;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95318,2,57);
DELETE FROM `quest_offer_reward` WHERE `ID`=95318;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95318,0,0,0,0,0,0,0,0,'From the more than murderous look in your eye, and the blood on your clothing, I''d say there are fewer of those Ashen Reign fools than before!

Good.

Now we''ll see if you can handle something a bit more... substantial.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95318;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95318,0,0,0,0,'Ah, you''ve returned.

<Felflick cackles delightedly.>

Tell me, is the screaming I''ve been hearing related to your little task I sent you to do?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95318;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95318;
DELETE FROM `creature_questender` WHERE `quest`=95318;
DELETE FROM `gameobject_questender` WHERE `quest`=95318;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263757,95318,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263757,95318,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (263757);

-- 86616 Repurposed Totems (level 48, min 45, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=86616;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (86616,2,47,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,471,5,0,'Repurposed Totems','Bring $1oa Vilebranch Totems back to Maret Firetend.','As a shaman, one of the challenges of communing with the elements is that there are other shaman with opposing agendas. The elements do not care why we do what we do, they just do as we ask!

The trolls at Jintha''alor also practice the shamanic arts, and their interruptions and attacks are a constant thorn to us here.

Find their Vilebranch totems and bring them back to me so that I can nullify their powers. Some they carry, some they place as wards around their altar.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=86616;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (476742,86616,1,0,0,279225,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=86616;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (86616,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=86616;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (86616,8350,0);
DELETE FROM `quest_classic_level` WHERE `ID`=86616;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (86616,48,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=86616;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (86616,2,48);
DELETE FROM `quest_offer_reward` WHERE `ID`=86616;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (86616,0,0,0,0,0,0,0,0,'Ah, excellent. I will nullify the power of these Vilebranch totems and release it back into the wild. This will free the elementals to assist us, and undercut the power of the trolls.

Job well done, <Class>.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=86616;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (86616,0,0,0,0,'The less those Vilebranch trolls are disrupting the flow of the elements, the simpler it will be to commune with the elementals.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=86616;
DELETE FROM `gameobject_queststarter` WHERE `quest`=86616;
DELETE FROM `creature_questender` WHERE `quest`=86616;
DELETE FROM `gameobject_questender` WHERE `quest`=86616;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (270263,86616,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (270263,86616,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (270263);

-- 90865 Eyes of the Watchers (level 58, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=90865;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (90865,2,616,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Eyes of the Watchers','Retrieve $1oa Watcher''s Eyes for Eluneth.','Just north of here lies the ruins of battles past. A dwindling scourge presence remains.

Though the mindless undead are a threat themselves, the watchers maintain a vigilant eye on those entering the area, making removal of the scourge threat even more difficult.

Remove the threat by taking from these watchers that which they value most.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=90865;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472683,90865,1,0,0,273322,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=90865;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (90865,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=90865;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (90865,17050,0);
DELETE FROM `quest_classic_level` WHERE `ID`=90865;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (90865,58,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=90865;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (90865,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=90865;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (90865,0,0,0,0,0,0,0,0,'Many thanks, $n. With their lookouts removed, it''s only a matter of time before the remaining scourge presence is no more.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=90865;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (90865,0,0,0,0,'Tread carefully. Their eyes are upon us.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=90865;
DELETE FROM `gameobject_queststarter` WHERE `quest`=90865;
DELETE FROM `creature_questender` WHERE `quest`=90865;
DELETE FROM `gameobject_questender` WHERE `quest`=90865;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (264089,90865,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (264089,90865,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (264089);

-- 92171 Taking to New Heights (level 58, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92171;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92171,2,616,0,92500,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Taking to New Heights','Travel to the Shrine of Aviana on Mount Hyjal and seek out Skylord Omnuron for aid.','To defeat Ve''han,  we require a touch of the sky. A bit of the divine, where one''s upward-turned face yearns to fly.

Head to the Shrine of Aviana and seek out Skylord Omnuron. As the leader of the Druids of the Talon, he can assist in adding a touch of Aviana''s grace.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92171;
DELETE FROM `quest_template_addon` WHERE `ID`=92171;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (92171,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92171;
DELETE FROM `quest_classic_level` WHERE `ID`=92171;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92171,58,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92171;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92171,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=92171;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92171,0,0,0,0,0,0,0,0,'Ketharas sent you? He left us abruptly and has isolated himself for years. Yet now he deigns to ask for aid from the druidic order?

No, I will not turn you away. The threat you face sounds grave, and the Druids of the Talon will do our duty to the mountain.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92171;
DELETE FROM `creature_queststarter` WHERE `quest`=92171;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92171;
DELETE FROM `creature_questender` WHERE `quest`=92171;
DELETE FROM `gameobject_questender` WHERE `quest`=92171;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256222,92171,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (254131,92171,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (254131,256222);

-- 92842 A Cousin Abroad (level 55, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92842;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92842,2,28,0,0,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'A Cousin Abroad','Find the missing cousin somewhere on Mount Hyjal.','I have a cousin who, some time ago, mentioned a plan to visit Mount Hyjal and see what has been happening there. Foolishly.

Hyjal is a world away; it could take months for mail to reach him, if he can even find a mailbox.

In the unlikely event that you find yourself on that side of the world, I would appreciate someone looking in on my fool of a cousin.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92842;
DELETE FROM `quest_template_addon` WHERE `ID`=92842;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (92842,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92842;
DELETE FROM `quest_classic_level` WHERE `ID`=92842;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92842,55,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92842;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92842,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=92842;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92842,0,0,0,0,0,0,0,0,'In retrospect, coming here was probably a bad idea.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92842;
DELETE FROM `creature_queststarter` WHERE `quest`=92842;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92842;
DELETE FROM `creature_questender` WHERE `quest`=92842;
DELETE FROM `gameobject_questender` WHERE `quest`=92842;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (10840,92842,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (266803,92842,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (10840,266803);

-- 92859 Shroud of the Winter Wilds (level 60, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92859;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92859,2,618,0,0,3,1.0,0,1.0,0,0,8,0,0,0,18446744073709551615,281234,3,'Shroud of the Winter Wilds','Bring $1oa Winterspring Chimaera Fur and $2oa Winterspring Owl Feathers to Evie Whirlbrew.','Folks have been trying to get onto Mount Hyjal since the end of the war, but there''s one big problem... all the demons in Darkwhisper Gorge!

I think I have the solution. A concoction made from locally-sourced ingredients might be able to make the drinker blend in with the Winterspring surroundings so that creatures here can''t see you as easily.

I''d love to test this theory, if you''re game for bringing me a few small things!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92859;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (477789,92859,1,0,0,281241,5,0,1,NULL,71037),(477790,92859,1,1,1,281242,5,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92859;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (92859,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92859;
DELETE FROM `quest_classic_level` WHERE `ID`=92859;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92859,60,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92859;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92859,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=92859;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92859,0,0,0,0,0,0,0,0,'All right, I''ll mix this all up and you can give it a whirl!

Now remember, this''ll only work in Winterspring. And it''s not perfect invisibility, so don''t get too close!

What, you thought I was gonna try it out? I gotta shop to run!

If it works, I''ll add your name to the fine print! If not... well, I''ll remember you fondly. Good luck!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92859;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92859,0,0,0,0,'I''m so excited about the alchemical possibilities that this presents!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92859;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92859;
DELETE FROM `creature_questender` WHERE `quest`=92859;
DELETE FROM `gameobject_questender` WHERE `quest`=92859;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (11188,92859,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (11188,92859,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (11188);

-- 92960 Siphoned Ephemeral Essence (level 59, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92960;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92960,2,616,0,96003,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Siphoned Ephemeral Essence','Retrieve $1oa Ephemeral Essences for Elaena Moonwhisper.','A lingering demon presence remains to the east. Among them are the hellish beasts responsible for ravaging our kin, siphoning their power to use it against our allies.

Penetrate their camp, locate these beasts and slay them. Retrieve any samples that remain.

Perhaps there is something we can learn from these efforts.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92960;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471580,92960,1,0,0,271220,6,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92960;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (92960,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92960;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (92960,22713,0);
DELETE FROM `quest_classic_level` WHERE `ID`=92960;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92960,59,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92960;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92960,2,59);
DELETE FROM `quest_offer_reward` WHERE `ID`=92960;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92960,0,0,0,0,0,0,0,0,'Fascinating specimens. The closer they are in proximity to one another, the louder they hum. It''s as if they''re attracted to each other. Probably dangerous to intermingle this with other magical objects or energies, but maybe we can do something with them by themselves.

Let''s have a closer look.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92960;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92960,0,0,0,0,'Find anything peculiar?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92960;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92960;
DELETE FROM `creature_questender` WHERE `quest`=92960;
DELETE FROM `gameobject_questender` WHERE `quest`=92960;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263406,92960,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263406,92960,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (263406);

-- 93925 Beads for Brerufa (level 57, min 54, live build 70938)
DELETE FROM `quest_template` WHERE `ID`=93925;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93925,0,361,0,0,1,1.0,0,1.0,0,0,0,1,0,0,18446744073709551615,2747,6,0,'Beads for Brerufa','','','','',70938);
DELETE FROM `quest_objectives` WHERE `QuestID`=93925;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (467991,93925,1,0,3,263439,8,0,1,NULL,70938);
DELETE FROM `quest_template_addon` WHERE `ID`=93925;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (93925,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93925;
DELETE FROM `quest_classic_level` WHERE `ID`=93925;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93925,57,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93925;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93925,2,57);
DELETE FROM `quest_offer_reward` WHERE `ID`=93925;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93925,0,0,0,0,0,0,0,0,'Thank you, one of sturdy legs. Your efforts will be known amongst my tribe, $n!

Know this, I will take the beads as long as there is a need.',70938);
DELETE FROM `quest_request_items` WHERE `ID`=93925;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93925,0,0,0,0,'You show strength, but trust comes slow. Some still watch with hard eyes. I can help you earn their nod.

Deadwood wear cords strung with fine beads of rare earth, smooth stones, and hard gifts of the mountain. These beads mark rank in their tribe. Bring me these signs to prove your deeds.

For every eight beads you bring, your name will weigh more with us.
Go now, and let the wood see your will.',70938);
DELETE FROM `creature_queststarter` WHERE `quest`=93925;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93925;
DELETE FROM `creature_questender` WHERE `quest`=93925;
DELETE FROM `gameobject_questender` WHERE `quest`=93925;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256978,93925,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256978,93925,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256978);

-- 95766 Fine Feathered Friend (level 56, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95766;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95766,2,616,0,0,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Fine Feathered Friend','Find the strange bird in the corrupted lands on the southwest slope.','The cycle of renewal has finally begun. The ancients... shall rise again, and the power of the natural world take its course... to bloom.

You... have helped us tip the scales in nature''s favor. Perhaps... we can yet make a larger impact... on a more dire situation.

Head west... where the land itself is ashen... and you may find an entity who can help. She may look like just a small bird... but her power is great.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95766;
DELETE FROM `quest_template_addon` WHERE `ID`=95766;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95766,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95766;
DELETE FROM `quest_classic_level` WHERE `ID`=95766;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95766,56,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95766;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95766,2,56);
DELETE FROM `quest_offer_reward` WHERE `ID`=95766;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95766,0,0,0,0,0,0,0,0,'So, a dirtwalker, eh? And one of the ancients sent you to me? Of course they did!

<The crow seems to hold herself a bit higher, looking as smug as possible for a bird.>

If the ancients have seen fit to send you to me then you have already proven you are worthy of aiding me on this portion of the mountain.

I may be a being of great intellect and majesty, but even I could use a wing with all of the troubles here. Who knows, if you''re useful enough I may just make you my underwing!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95766;
DELETE FROM `creature_queststarter` WHERE `quest`=95766;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95766;
DELETE FROM `creature_questender` WHERE `quest`=95766;
DELETE FROM `gameobject_questender` WHERE `quest`=95766;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (248366,95766,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257753,95766,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (248366,257753);

-- 95793 Stemming the Demon Tide (level 59, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95793;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95793,2,616,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Stemming the Demon Tide','Slay $1oa Felguard Sentinels in Dae''gun.','Ah, a $c. I see great strength and determination in you--qualities necessary to rid these lands of evil.

The demons that walked these lands during the great battle were defeated, yet some still remain. It is important to prevent them from escaping.

The ruins to the east are dangerous. Carry your strength into their den. Destroy the unwelcome before our lands perish.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95793;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471579,95793,0,0,2,249229,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95793;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95793,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95793;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95793,20556,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95793;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95793,59,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95793;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95793,2,59);
DELETE FROM `quest_offer_reward` WHERE `ID`=95793;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95793,0,0,0,0,0,0,0,0,'You persevere.

Perhaps regrowth begins anew.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95793;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95793,0,0,0,0,'Every demon that falls brings us one step closer to peace within these mountains.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95793;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95793;
DELETE FROM `creature_questender` WHERE `quest`=95793;
DELETE FROM `gameobject_questender` WHERE `quest`=95793;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (249052,95793,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (249052,95793,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (249052);

-- 96145 Past Wing and Claw (level 58, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96145;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96145,2,616,0,0,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Past Wing and Claw','Seek Phoebe Highfeather at the Shrine of Aviana.','Traveler, be wary! Though the Shrine of Aviana lies ahead, the area is claimed now by the harpies of the Wormwing tribe.

Like my family, the Highfeathers, I am a follower of Aviana, but the Wormwings are not so loyal. They are a danger to anyone who passes through their territory.

If you can make your way past them, my cousin Phoebe Highfeather helps to protect the shrine.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96145;
DELETE FROM `quest_template_addon` WHERE `ID`=96145;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (96145,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96145;
DELETE FROM `quest_classic_level` WHERE `ID`=96145;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96145,58,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96145;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96145,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=96145;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96145,0,0,0,0,0,0,0,0,'You have found the Shrine of Aviana, traveler, and we two--myself and Skylord Omnuron--are its last guardians.

The Wormwings would exterminate us if they could, but we defend this place with the grace of the sky goddess. Her dream lives on through us.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96145;
DELETE FROM `creature_queststarter` WHERE `quest`=96145;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96145;
DELETE FROM `creature_questender` WHERE `quest`=96145;
DELETE FROM `gameobject_questender` WHERE `quest`=96145;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (268168,96145,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260825,96145,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260825,268168);

-- 97319 A Cousin Abroad (level 55, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97319;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97319,2,28,0,0,1,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,'A Cousin Abroad','Find the missing cousin somewhere on Mount Hyjal.','A cousin of mine on Kalimdor has been cutting his way through the most dangerous sites there and, last I heard, is on his way to Mount Hyjal.

This seems like a ridiculous waste of time.

If you ever find yourself out in that part of the world, it would be good to know that he hasn''t gotten himself killed. Yet.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97319;
DELETE FROM `quest_template_addon` WHERE `ID`=97319;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (97319,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97319;
DELETE FROM `quest_classic_level` WHERE `ID`=97319;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97319,55,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97319;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97319,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=97319;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97319,0,0,0,0,0,0,0,0,'In retrospect, coming here was probably a bad idea.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97319;
DELETE FROM `creature_queststarter` WHERE `quest`=97319;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97319;
DELETE FROM `creature_questender` WHERE `quest`=97319;
DELETE FROM `gameobject_questender` WHERE `quest`=97319;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (10839,97319,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (266802,97319,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (10839,266802);

-- 87295 Deflective Surface (level 52, min 46, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=87295;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (87295,2,4,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Deflective Surface','Bring $1oa Redstone Basilisk Scales to Bernie Heisten.','You may have seen the Redstone basilisks wandering the wastes outside while you were on your way to Nethergarde Keep. They''re tough creatures, well adapted to survival in the Blasted Lands. One of their key qualities is their sturdy scales, which reflect heat, protect against sand and wind, and even deflect weapon blows!

They''re a perfect material for making shields, and if you can bring me a bundle, I''ll compensate you well. Only bring ones in good condition!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=87295;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (477137,87295,1,0,0,280181,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=87295;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (87295,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=87295;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (87295,10200,0);
DELETE FROM `quest_classic_level` WHERE `ID`=87295;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (87295,52,46,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=87295;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (87295,2,52);
DELETE FROM `quest_offer_reward` WHERE `ID`=87295;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (87295,0,0,0,0,0,0,0,0,'These look perfect! They''ll make a fine set of shields for the local soldiers.

Here, you''ve earned this.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=87295;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (87295,0,0,0,0,'Sure is hot today, isn''t it?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=87295;
DELETE FROM `gameobject_queststarter` WHERE `quest`=87295;
DELETE FROM `creature_questender` WHERE `quest`=87295;
DELETE FROM `gameobject_questender` WHERE `quest`=87295;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (3546,87295,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (3546,87295,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (3546);

-- 88857 Saving a Sentinel (level 47, min 45, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=88857;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (88857,2,16,0,0,5,1.0,0,1.0,0,0,3145730,0,0,0,6130900294268439629,69,5,0,'Saving a Sentinel','Help Keldara Sunblade escape the Haldarr Encampment, then speak to Commander Truesong at Talrendis Point.','<The sentinel speaks in a low whisper>

Listen, $c, before they hear us. I am a sentinel from Talrendis Point. The satyr here believe me injured, but I am only feigning; waiting for the moment they drop their guard and I can escape.

Your arrival is perhaps such a moment.

Help me out of here, would you?','Help Keldara Sunblade escape the Haldarr Encampment','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=88857;
DELETE FROM `quest_template_addon` WHERE `ID`=88857;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (88857,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=88857;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (88857,5000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=88857;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (88857,47,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=88857;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (88857,2,47);
DELETE FROM `quest_offer_reward` WHERE `ID`=88857;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (88857,0,0,0,0,0,0,0,0,'So Keldara lives? This is a great relief. I will eagerly await her return.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=88857;
DELETE FROM `creature_queststarter` WHERE `quest`=88857;
DELETE FROM `gameobject_queststarter` WHERE `quest`=88857;
DELETE FROM `creature_questender` WHERE `quest`=88857;
DELETE FROM `gameobject_questender` WHERE `quest`=88857;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (222478,88857,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (239822,88857,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (222478,239822);

-- 91770 Bark Bite (level 56, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=91770;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (91770,2,616,0,0,1,1.0,0,1.0,0,247963,36700160,0,0,0,18446744073709551615,14530,5,247963,1,'Bark Bite','Apply the poultice to Fraxinus.','With the ingredients you brought, I can make some simple medicine. This poultice should aid Fraxinus. He is old, you know, and he was badly burned during the wars. His bark hurts and his limbs ache. He is my best friend and I just want him to feel better!

Take this poultice and apply it liberally to all of the places where his bark is split and his sap is weeping.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=91770;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (463415,91770,0,0,0,248366,1,0,1,'Fraxinus soothed',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=91770;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (91770,0,0,0,1);
DELETE FROM `quest_classic_money` WHERE `ID`=91770;
DELETE FROM `quest_classic_level` WHERE `ID`=91770;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (91770,56,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=91770;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (91770,2,56);
DELETE FROM `quest_offer_reward` WHERE `ID`=91770;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (91770,0,0,0,0,0,0,0,0,'Mmm... hrm... that feels... soothing.

My roots and branches are weak, but for a little while, at least, they are without pain.

Perhaps instead of "stranger," I might call you "friend"?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=91770;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (91770,0,0,0,0,'Ah, greetings again, little one. Excuse me... if I am not... sociable. The fel taint that afflicts Hyjal... festers in my very roots and bark. These old wounds of mine, they burn... they seep... I only wish to sleep.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=91770;
DELETE FROM `gameobject_queststarter` WHERE `quest`=91770;
DELETE FROM `creature_questender` WHERE `quest`=91770;
DELETE FROM `gameobject_questender` WHERE `quest`=91770;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (248367,91770,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (248366,91770,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (248366,248367);

-- 91883 Spear of the Skylord (level 59, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=91883;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (91883,2,616,0,0,4,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Spear of the Skylord','Slay Zarrat Wormwing and return Omnuron''s Spear.','While fighting off the Wormwing harpies I was brutally ambushed by a harpy named Zarrat who patrols this area. She snatched my spear and carried it off before I could recover. To what end she desired to possess it, I cannot say.

That spear has been in my family for generations and is of great importance to me. If you spot Zarrat among the harpies, slay her and return my spear. She is stealthy, and will not be easily found, but I would be grateful to have my spear returned.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=91883;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470471,91883,1,0,0,268998,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=91883;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (91883,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=91883;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (91883,13800,0);
DELETE FROM `quest_classic_level` WHERE `ID`=91883;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (91883,59,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=91883;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (91883,2,59);
DELETE FROM `quest_offer_reward` WHERE `ID`=91883;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (91883,0,0,0,0,0,0,0,0,'Thank you for returning my spear. I am glad to have a better means to defend myself from the Wormwings.

Through it I am able to better channel my spells, so I had felt like a piece of myself was missing in its absence.

It is a relief to have this spear safely back in my hands.

Thank you, <Class>.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=91883;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (91883,0,0,0,0,'Have you found Zarrat? Her cunning is considerable.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=91883;
DELETE FROM `gameobject_queststarter` WHERE `quest`=91883;
DELETE FROM `creature_questender` WHERE `quest`=91883;
DELETE FROM `gameobject_questender` WHERE `quest`=91883;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (254131,91883,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (254131,91883,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (254131);

-- 93546 Spectral Iron Ore (level 42, min 35, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93546;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93546,2,16651,0,96060,4,1.0,0,1.0,0,259229,36700160,0,0,0,18446744073709551615,259229,1,'Spectral Iron Ore','Search for Spectral Iron Deposits around Shen''dralas and collect $1oa Spectral Iron Ore. Return to Vindael in Shen''dralas once you have found enough.','Finally, FINALLY I can use this anvil for something other than a monumentally heavy table. I am delighted to finally hone my craft again after centuries of missed practice.

Now, you are probably thinking, "Vindael, this sounds like you are setting the stage for another request." And you would be correct!

I need to replenish my supply of iron, but your iron has a similar predicament to my blade. Fortunately, the solution is MUCH simpler.

<He hands you a ghostly pickaxe, without a chance to refuse.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93546;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (466722,93546,1,0,0,259226,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93546;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (93546,0,0,0,1);
DELETE FROM `quest_classic_money` WHERE `ID`=93546;
DELETE FROM `quest_classic_level` WHERE `ID`=93546;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93546,42,35,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93546;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93546,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=93546;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93546,0,0,0,0,0,0,0,0,'Wow, what a haul! You are tremendously helpful for someone that has to waste a third of your life sleeping. Where do you find the time to help a stranger out?

Ah, a reward? You were expecting a reward?

No, I don''t think I''m quite ready to offer you one just yet.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93546;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93546,0,0,0,0,'Regular iron just won''t do, I''m afraid. By now I am sure you understand why.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=93546;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93546;
DELETE FROM `creature_questender` WHERE `quest`=93546;
DELETE FROM `gameobject_questender` WHERE `quest`=93546;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (254717,93546,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (254717,93546,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (254717);

-- 93773 The Pact (level 58, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93773;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93773,2,616,0,96930,3,1.0,0,1.0,0,0,36700160,0,0,0,18446744073709551615,'The Pact','Report back Ketharas on Mount Hyjal.','It seems that Ve''han has successfully stolen at least a portion of the power of a Wild God. Such a thing seems beyond belief to me, but here we are.

And what is this "Pact" Ve''han spoke of? $n, you must return to Ketharas. Tell him what you''ve learned.

I''m sorry to say but it is likely well beyond your abilities to put a foe such as Ve''han down. Only the power of--well, the Wild Gods themselves may be able to counteract this magic.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93773;
DELETE FROM `quest_template_addon` WHERE `ID`=93773;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (93773,0,0,95006,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93773;
DELETE FROM `quest_classic_level` WHERE `ID`=93773;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93773,58,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93773;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93773,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=93773;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93773,0,0,0,0,0,0,0,0,'This is terrible. Why would a druid do this to a Wild God?

As for this "Pact"... I''ve heard whispers of a group of apostate druids that broke away from the Circle. The Blackthorne Pact, they call themselves... but I''d never have dreamed that they would be capable of something like this.

This is terrible. Just terrible.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93773;
DELETE FROM `creature_queststarter` WHERE `quest`=93773;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93773;
DELETE FROM `creature_questender` WHERE `quest`=93773;
DELETE FROM `gameobject_questender` WHERE `quest`=93773;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (11802,93773,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256222,93773,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (11802,256222);

-- 95026 Blight No More (level 58, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95026;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95026,2,616,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,276341,1,'Blight No More','Eliminate $1oa Forgotten Soldiers and $2oa Fleshflay Raveners.','Escapin'' war don''t mean we be safe here. Dem creatures to da east been plaguin'' da area all dis time.

Maybe you be ready for a challenge, eh?

Strike ''em down. Ain''t nobody gonna be missin'' dem after all.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95026;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472793,95026,0,0,0,249247,3,0,1,NULL,71037),(472465,95026,0,1,2,249228,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95026;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95026,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95026;
DELETE FROM `quest_classic_level` WHERE `ID`=95026;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95026,58,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95026;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95026,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=95026;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95026,0,0,0,0,0,0,0,0,'A true hunter, eh? You bringin'' da safety to us here.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95026;
DELETE FROM `creature_queststarter` WHERE `quest`=95026;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95026;
DELETE FROM `creature_questender` WHERE `quest`=95026;
DELETE FROM `gameobject_questender` WHERE `quest`=95026;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (244511,95026,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (244511,95026,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (244511);

-- 95926 The Dark Crystal (level 60, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95926;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95926,2,16985,81,0,5,2.675,0,1.0,0,0,33554696,0,0,0,12261800583900083122,279908,1,279910,1,279912,1,68,5,0,76,3,0,'The Dark Crystal','Gather a colorless Drained Crystal Fragment near the Achromatic Crystal in the Shaper''s Terrace.','You there! I have a job for someone of your... skills.

I have gotten word from my sources of a crystal found in Shaper''s Terrace that can seemingly drain the elements around it. Or perhaps it can drain life essence itself. It is unclear from this report.

I must have a fragment of this crystal! Just think of the applications of such a powerful artifact.

Go to Shaper''s Terrace and bring me back a sample of this colorless Achromatic Crystal, and I will reward you for your efforts.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95926;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471748,95926,1,0,0,271771,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95926;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (95926,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95926;
DELETE FROM `quest_classic_level` WHERE `ID`=95926;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95926,60,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95926;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95926,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=95926;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95926,0,0,0,0,0,0,0,0,'Ah, excellent! This is a fine specimen.

The Royal Apothecary Society thanks you for your... contributions to our knowledge.

Dark Lady watch over you, <Class>.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95926;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95926,0,0,0,0,'Hello, can I help you? Oh, yes, $n.

Apologies I had forgotten about your errand. Have you returned with the crystal fragment?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95926;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95926;
DELETE FROM `creature_questender` WHERE `quest`=95926;
DELETE FROM `gameobject_questender` WHERE `quest`=95926;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2055,95926,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2055,95926,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2055);

-- 96131 An Oldstone But An Old Friend (level 58, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96131;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96131,2,616,0,92612,1,1.0,0,1.0,0,273845,3145728,0,0,0,18446744073709551615,273845,1,'An Oldstone But An Old Friend','Take the Faintly Glowing Branch to Ketharas.','I''m sure you''ve met that old stick-in-the-mud, that lives in the cave south of here? 

You must take this staff to him along with my feather. He will know what it means. Or he won''t! Either way it will get his attention.

He may be an oldstone, but he is reliable. He''s one of the few mortals I would trust with a matter as grave as this. 
 
Quickly, Dirtwalker! I fear a shadow is falling over Hyjal we cannot see.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96131;
DELETE FROM `quest_template_addon` WHERE `ID`=96131;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (96131,0,0,0,1);
DELETE FROM `quest_classic_money` WHERE `ID`=96131;
DELETE FROM `quest_classic_level` WHERE `ID`=96131;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96131,58,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96131;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96131,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=96131;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96131,0,0,0,0,0,0,0,0,'<Ketharas gently takes the staff and feather from you. He holds the feather in his palm for a moment and closes his eyes, then frowns deeply.>

Come, <Class>, you must tell me all about this staff you have found.

This magic... I feel that this could be the beginning of a very important turning point for us here on the mountain. For good, perhaps? More likely, I fear, it is for ill.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96131;
DELETE FROM `creature_queststarter` WHERE `quest`=96131;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96131;
DELETE FROM `creature_questender` WHERE `quest`=96131;
DELETE FROM `gameobject_questender` WHERE `quest`=96131;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257753,96131,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256222,96131,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256222,257753);

-- 97170 Learning to Ride (level 40, min 40, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97170;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97170,2,12,0,0,0,1.0,0,1.0,0,0,1048576,0,0,0,1,72,2,0,'Learning to Ride','Learn the Apprentice Riding skill from Randal Hunter.','Hello, $c! It would seem you are now seasoned enough as an adventurer for me to teach you how to ride a horse, for a fee of course.

Katie will provide you with a free mount once ye have trained with me, and after you will be able to purchase any additional mounts you would like. There are many creatures out in the world, and each requires their own riding skill, but you will have to find trainers for each.

Speak to me when you have enough coin, and I will teach you all I know about riding horses.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97170;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475266,97170,14,0,0,231898,1,0,1,'Learn: Apprentice Riding',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97170;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (97170,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97170;
DELETE FROM `quest_classic_level` WHERE `ID`=97170;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97170,40,40,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97170;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97170,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=97170;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97170,0,0,0,0,0,0,0,0,'Hello, <Class>! I''m happy to see you''ve completed your training with Randal. I''m glad he sent you my way!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97170;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97170,0,0,0,0,'Once you learn how to ride a horse, you''ll be able to go on journeys with your mount all over the world.

It''s certainly faster than running everywhere. Though, I won''t stop you if that is your preference.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97170;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97170;
DELETE FROM `creature_questender` WHERE `quest`=97170;
DELETE FROM `gameobject_questender` WHERE `quest`=97170;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (4732,97170,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (384,97170,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (384,4732);

-- 97203 Learning to Ride (level 40, min 40, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97203;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97203,2,85,0,0,0,1.0,0,1.0,0,0,1048576,0,0,0,16,68,2,0,'Learning to Ride','Learn the Apprentice Riding skill from Velma Warnam.','Greetings, $c. It would seem you are now seasoned enough as an adventurer for me to teach you how to ride a skeletal steed, for a fee.

Zachariah will provide you with a free mount once you have trained with me, and after you will be able to purchase any additional mounts you desire. There are many creatures out in the world, and each requires their own riding skill, but you will have to find trainers for each.

Speak to me when you have enough coin, and I will teach you about skeletal horses.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97203;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475372,97203,14,0,0,231906,1,0,1,'Learn: Apprentice Riding',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97203;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (97203,0,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97203;
DELETE FROM `quest_classic_level` WHERE `ID`=97203;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97203,40,40,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97203;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97203,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=97203;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97203,0,0,0,0,0,0,0,0,'Ah hello, $c. I''m pleased to see you''ve completed your training with Velma.

She has a way with these creatures that few others do. If you have trained with her you will have no issues with any of our steeds here in Brill.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97203;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97203,0,0,0,0,'Once you learn how to ride a skeletal horse, you''ll be able to go on journeys with your mount all over the world.

It''s certainly faster than running everywhere. Though, I won''t stop you if that is your preference.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97203;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97203;
DELETE FROM `creature_questender` WHERE `quest`=97203;
DELETE FROM `gameobject_questender` WHERE `quest`=97203;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (4773,97203,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (4731,97203,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (4731,4773);


-- Previous-quest locks for quests we already have: the Icy Veins quest chain names the step before, and the live quest
-- data (Efficient Games next-quest link) agrees. Only quests that had no lock get one; 98189 follows 286, not 285.
INSERT IGNORE INTO `quest_template_addon` (`ID`) VALUES (79192),(96392),(92517),(95288),(96101),(92519),(94887),(95296),(95682),(97331),(92459),(97287),(94928),(95322),(95472),(95986),(94617),(95321),(94615),(94981),(79235),(94891),(95975),(95325),(96010),(94893),(95312),(96108),(94892),(96105),(95383),(96104),(96109),(94998),(94997),(95420),(95427),(94727),(94974),(94669),(96026),(95418),(94670),(94739),(92743),(94734),(94962),(99258),(93604),(94733),(94964),(94737),(94965),(98341),(95063),(92841),(92844),(98189);
UPDATE `quest_template_addon` SET `PrevQuestID`=79008 WHERE `ID`=79192 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=79229 WHERE `ID`=79235 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=92458 WHERE `ID`=92459 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=92514 WHERE `ID`=92517 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=97539 WHERE `ID`=92519 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=1369 WHERE `ID`=92743 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=92743 WHERE `ID`=92841 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=92841 WHERE `ID`=92844 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=93601 WHERE `ID`=93604 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94613 WHERE `ID`=94615 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94615 WHERE `ID`=94617 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94668 WHERE `ID`=94669 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94669 WHERE `ID`=94670 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94680 WHERE `ID`=94727 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94964 WHERE `ID`=94733 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94733 WHERE `ID`=94734 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94734 WHERE `ID`=94737 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94670 WHERE `ID`=94739 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94885 WHERE `ID`=94887 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94890 WHERE `ID`=94891 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94887 WHERE `ID`=94892 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94892 WHERE `ID`=94893 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94925 WHERE `ID`=94928 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94739 WHERE `ID`=94962 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94962 WHERE `ID`=94964 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94737 WHERE `ID`=94965 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94973 WHERE `ID`=94974 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94980 WHERE `ID`=94981 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94983 WHERE `ID`=94997 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94997 WHERE `ID`=94998 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94965 WHERE `ID`=95063 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=94928 WHERE `ID`=95288 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95294 WHERE `ID`=95296 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95383 WHERE `ID`=95312 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95312 WHERE `ID`=95321 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95295 WHERE `ID`=95322 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95322 WHERE `ID`=95325 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95296 WHERE `ID`=95383 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95427 WHERE `ID`=95418 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95418 WHERE `ID`=95420 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95601 WHERE `ID`=95427 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95321 WHERE `ID`=95472 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95663 WHERE `ID`=95682 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95957 WHERE `ID`=95975 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95984 WHERE `ID`=95986 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=92914 WHERE `ID`=96010 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=95183 WHERE `ID`=96026 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=96638 WHERE `ID`=96101 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=96103 WHERE `ID`=96104 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=96104 WHERE `ID`=96105 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=96107 WHERE `ID`=96108 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=96108 WHERE `ID`=96109 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=96408 WHERE `ID`=96392 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=96984 WHERE `ID`=97287 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=97329 WHERE `ID`=97331 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=286 WHERE `ID`=98189 AND `PrevQuestID` IN (0,285);
UPDATE `quest_template_addon` SET `PrevQuestID`=98340 WHERE `ID`=98341 AND `PrevQuestID`=0;
UPDATE `quest_template_addon` SET `PrevQuestID`=99257 WHERE `ID`=99258 AND `PrevQuestID`=0;

-- Seeking Strahad (1798): Lago Blackwrench in Ironforge offers it too (Wowhead and Icy Veins).
DELETE FROM `creature_queststarter` WHERE `id`=6120 AND `quest`=1798;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (6120,1798,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=6120;
-- A Bit of Wet Work (96381): offered and taken by the Sully McCleary 260271 (Wowhead and Icy Veins), not 260146.
DELETE FROM `creature_queststarter` WHERE `quest`=96381;
DELETE FROM `creature_questender` WHERE `quest`=96381;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260271,96381,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260271,96381,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=260271;
