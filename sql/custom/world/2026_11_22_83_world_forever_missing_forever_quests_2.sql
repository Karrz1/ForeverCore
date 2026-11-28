-- WoW Forever: more Forever quests players do on the live realm that our world did not have (second batch; first batch is
-- 2026_11_22_80). Full live record: title, story, objective line, levels, races, flags, objectives with their live ids,
-- rewards, start item, and the giver's progress and reward lines; plus the quest item drops they need.
-- Quest records and lines: Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
-- (https://creativecommons.org/licenses/by/4.0/). Source: github.com/JIVESCORP/eg-link-output-wowf quests.enUS, texts.enUS, npcs.
-- Changed: picked and converted to our tables.
-- Who starts and ends each quest, reward/progress lines EG Link lacks, and quest item drop chances (players' loot counts):
-- Wowhead Forever quest and item pages.
-- Only quests whose giver, turn-in and every objective target exist and are spawned in our world are here.
-- Previous-quest locks are not set (no source we may use has them yet). Safe to run again: every row is replaced by key.

-- loot ids for creatures that had none
UPDATE `creature_template_difficulty` SET `LootID`=263749 WHERE `Entry`=263749 AND `DifficultyID`=0 AND `LootID`=0;
DELETE FROM `creature_loot_template` WHERE `Entry`=9938 AND `ItemType`=0 AND `Item`=277129;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (9938,0,277129,16,1,1,0,1,1,'quest 97197');
DELETE FROM `creature_loot_template` WHERE `Entry`=263749 AND `ItemType`=0 AND `Item`=272190;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (263749,0,272190,91,1,1,0,1,1,'quest 96126');
DELETE FROM `creature_loot_template` WHERE `Entry`=256899 AND `ItemType`=0 AND `Item`=265750;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (256899,0,265750,85,1,1,0,1,1,'quest 95562');
DELETE FROM `creature_loot_template` WHERE `Entry`=8956 AND `ItemType`=0 AND `Item`=277958;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (8956,0,277958,38,1,1,0,1,1,'quest 86577');
DELETE FROM `creature_loot_template` WHERE `Entry`=8957 AND `ItemType`=0 AND `Item`=277958;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (8957,0,277958,14,1,1,0,1,1,'quest 86577');
DELETE FROM `creature_loot_template` WHERE `Entry`=8958 AND `ItemType`=0 AND `Item`=277958;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (8958,0,277958,21,1,1,0,1,1,'quest 86577');
DELETE FROM `creature_loot_template` WHERE `Entry`=8759 AND `ItemType`=0 AND `Item`=238463;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (8759,0,238463,45,1,1,0,1,1,'quest 89001');
DELETE FROM `creature_loot_template` WHERE `Entry`=8760 AND `ItemType`=0 AND `Item`=238463;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (8760,0,238463,60,1,1,0,1,1,'quest 89001');
DELETE FROM `creature_loot_template` WHERE `Entry`=8761 AND `ItemType`=0 AND `Item`=238463;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (8761,0,238463,13,1,1,0,1,1,'quest 89001');
DELETE FROM `creature_loot_template` WHERE `Entry`=9568 AND `ItemType`=0 AND `Item`=272018;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (9568,0,272018,13,1,1,0,1,1,'quest 96075');
DELETE FROM `creature_loot_template` WHERE `Entry`=9019 AND `ItemType`=0 AND `Item`=272019;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (9019,0,272019,13,1,1,0,1,1,'quest 96075');

-- 97047 The Cook in the Cage (level 38, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97047;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97047,2,33,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'The Cook in the Cage','Find a key to Wendel''s cage, and a disguise for him to sneak out, within the Kurzen compound.','Hey! You! You have to help me! I was just out exploring the jungle when, all of a sudden, I was ambushed by these maniacs! I don''t know what they plan to do with me, but I''ve heard talk of tigers and headshrinkers, and I don''t want part in either!

I don''t know how, but you have to get me out of here! Please! A key to this cage, a disguise to sneak out, something! Anything!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97047;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (474894,97047,1,0,0,216616,1,0,1,NULL,71037),(474895,97047,1,1,1,216617,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97047;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97047,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97047;
DELETE FROM `quest_classic_level` WHERE `ID`=97047;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97047,38,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97047;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97047,2,38);
DELETE FROM `quest_offer_reward` WHERE `ID`=97047;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97047,0,0,0,0,0,0,0,0,'<A wave of relief washes over Wendel''s face.>

Oh, thank you! Thank you so much, friend! You''ve really saved my hide.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97047;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97047,0,0,0,0,'<The young man in the cage is wracked with panic. He can hardly put words together.>',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97047;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97047;
DELETE FROM `creature_questender` WHERE `quest`=97047;
DELETE FROM `gameobject_questender` WHERE `quest`=97047;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (218230,97047,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (218230,97047,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (218230);

-- 95330 Love Thy Neighbor (level 37, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95330;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95330,2,16591,0,0,1,1.0,0,1.0,0,268816,3145728,0,0,0,6130900294268439629,2826,1,0,'Love Thy Neighbor','Deliver Cassandra''s surplus farm goods to Halligan Turner at Turner''s Logging Camp.','My husband and I have a farm north of here. I come to Farholde after each harvest to sell what we grow. In good seasons, I like to set aside whatever we don''t sell to give to folks who need a little pick-me-up. Gotta take care of your neighbors, I say.

There''s a logging camp north of our farm, right on the river. I''m sure those boys could use some fruits and vegetables to give ''em some variety in their diet.

If you''re heading that way, could you give this to the foreman there? Name''s Halligan Turner.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95330;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470277,95330,1,0,0,268816,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95330;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95330,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95330;
DELETE FROM `quest_classic_level` WHERE `ID`=95330;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95330,37,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95330;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95330,2,37);
DELETE FROM `quest_offer_reward` WHERE `ID`=95330;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95330,0,0,0,0,0,0,0,0,'The Wheelers are too kind!

Cassandra''s right, we don''t eat much besides meat and bread out here. I''ll make sure everyone gets a share of these.

Thank you for the gift. I''ll have to repay her kindness some time.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95330;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95330,0,0,0,0,'Looks like you''ve got a delivery for me.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95330;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95330;
DELETE FROM `creature_questender` WHERE `quest`=95330;
DELETE FROM `gameobject_questender` WHERE `quest`=95330;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259863,95330,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256438,95330,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256438,259863);

-- 95267 The Monster Surfaces (level 42, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95267;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95267,2,16591,0,0,5,1.0,0,1.0,0,268647,36700160,0,0,0,18446744073709551615,274948,1,2827,6,0,'The Monster Surfaces','Use the Big Ball o'' Bait to lure out the sea monster. Then, bring its head to Argo Brinewhistle.','The last part''s <hic> easy...just take that big ball ''a guts, aaand chuck it in the water! Er...not here though...that''d be a disaster.

Go to those <hic> murloc islands, where ya found the drawing. Look for fresh wreckage in the water. That''s where you gotta throw the bait.

Soon as that thing sticks its head up, chop it off! We''ll make a decoration of it...for the boat!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95267;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470205,95267,1,0,1,268633,1,0,1,NULL,71037),(470206,95267,1,1,0,268647,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95267;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95267,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95267;
DELETE FROM `quest_classic_level` WHERE `ID`=95267;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95267,42,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95267;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95267,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=95267;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95267,0,0,0,0,0,0,0,0,'What the...ya actually got it!? Ha ha ha! 

<Argo clumsily snatches the creature''s head, and looks it in the eyes>

Whoowee <hic>, what a beaut! Think I''ll put ''er right on the <hic> stern! Drinks are on me tonight, pal!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95267;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95267,0,0,0,0,'Is it...is that monster dead yet...?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95267;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95267;
DELETE FROM `creature_questender` WHERE `quest`=95267;
DELETE FROM `gameobject_questender` WHERE `quest`=95267;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260231,95267,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260231,95267,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260231);

-- 95296 Shipping and Handling (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95296;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95296,2,16591,0,95383,1,1.0,0,1.0,0,268811,36700160,0,0,0,18446744073709551615,2827,1,0,'Shipping and Handling','Speak with Wharfmaster Steamfizzle at Steamwheedle Port in Tanaris.','Sounds like you''re ready for your next lesson, champ. I got some negotiatin'' of my own to do here in town, so I need you to run a few errands for me while I''m busy.

All I need you to do is take the next ship over there by the docks and deliver this crate to my associate in Steamwheedle Port.

Don''t gimme that look. It''ll be plenty excitin'', I''m sure. Gettin'' a goblin to pay his dues is much harder than roughin'' up the local riffraff, not to mention gettin'' through customs. You''ll figure it out.','','Speak with Wharfmaster Steamfizzle at Steamwheedle Port in Tanaris',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95296;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470259,95296,1,0,0,268811,1,0,1,NULL,71037),(470488,95296,8,1,-1,0,1000,0,1,'Customs cleared',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95296;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95296,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95296;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95296,-1000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95296;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95296,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95296;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95296,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95296;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95296,0,0,0,0,0,0,0,0,'There''s no way I''m lettin'' you into my town without me checkin'' your cargo first.

<The wharfmaster clears his throat deliberately as he maintains eye contact with you.>

No. Way.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95296;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95296,0,0,0,0,'Shipment from Powderfuse Port, huh? And from Friz no less. Good luck with that, buddy. You gotta wake up pretty early in the mornin'' to pull that one over me!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95296;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95296;
DELETE FROM `creature_questender` WHERE `quest`=95296;
DELETE FROM `gameobject_questender` WHERE `quest`=95296;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (255897,95296,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260405,95296,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (255897,260405);

-- 97332 Twice Misplaced Trust (level 41, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97332;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97332,2,33,0,0,5,1.0,0,1.0,0,277974,36700160,0,0,0,18446744073709551615,2595,1,278017,1,278018,1,278019,1,'Twice Misplaced Trust','Deliver the Twice Reordered Package to Wharfmaster Whizzbuzz at Powderfuse Port in the Riverglades.','As much as I don''t like the guy, I''ve heard what the Bloodscalp tribe do to their prisoners, and it ain''t pretty. I''m glad Zimmix made it out alright.

However, I have another urgent delivery and I do NOT trust him to take it on. The problem? Nobody else will be available to take this before he does. You, however, have rescued lost cargo and a captured goblin, so you''re looking pretty trustworthy from down here.

Any chance I can convince you to take this to Whizzbuzz at Powderfuse Port?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97332;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475843,97332,1,0,0,277974,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97332;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97332,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97332;
DELETE FROM `quest_classic_level` WHERE `ID`=97332;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97332,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97332;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97332,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=97332;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97332,0,0,0,0,0,0,0,0,'Huh? What you got for me?

<Whizzbuzz peeks inside the crate and his expression immediately lights up with surprise.>

Look''t this! Lozgil finally pulled through. It only took a scathing letter and payin'' the courier to threaten him to get the point across. Wonder what his excuse is. Did the ship''s captain get captured? Did a zeppelin crash?

Haha, could you imagine? We don''t even have a zeppelin tower around here!

You look like you went through a lot to deliver this, so have a reward.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97332;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97332,0,0,0,0,'Can''t you see I''m busy?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97332;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97332;
DELETE FROM `creature_questender` WHERE `quest`=97332;
DELETE FROM `gameobject_questender` WHERE `quest`=97332;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (4631,97332,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259961,97332,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (4631,259961);

-- 94982 Eye of Mugg (level 45, min 40, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94982;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94982,2,16842,81,0,6,2.375,0,1.0,0,0,36700168,0,0,0,6130900294268439629,279852,1,279853,1,279480,1,2826,6,0,'Eye of Mugg','Infiltrate Krol''dok Stronghold and return to Commander Brant with proof of their leader''s demise.','Our scouts mentioned a network of caves to the northwest along the mountains, hidden by natural surroundings. Most who sought information from deep within have yet to return. I fear they may be lost.

Those watching from a distance mentioned a Twilight presence moving in and out of the caves, often in darkness.

Locate this stronghold. If it is what I think it is we must deliver a deathly blow to their leader. Only then may we continue our efforts to remove them from these lands.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94982;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469521,94982,1,0,0,267086,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94982;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94982,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94982;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94982,13000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94982;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94982,45,40,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94982;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94982,2,45);
DELETE FROM `quest_offer_reward` WHERE `ID`=94982;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94982,0,0,0,0,0,0,0,0,'This is quite gruesome, $n. Our allies will be pleased by your actions.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94982;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94982,0,0,0,0,'Has the threat been eliminated?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94982;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94982;
DELETE FROM `creature_questender` WHERE `quest`=94982;
DELETE FROM `gameobject_questender` WHERE `quest`=94982;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,94982,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,94982,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257558);

-- 94984 Tome of Twilight (level 44, min 39, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94984;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94984,2,16842,81,0,6,2.375,0,1.0,0,0,36700168,0,0,0,6130900294268439629,279854,1,279855,1,2826,6,0,'Tome of Twilight','Kill Nar''gurk within Krol''dok Stronghold and recover any valuable information.','No matter our efforts, the Twilight forces persist. We''ve deduced they must be coming from somewhere else.

With the new pet you brought me, I was able to politely ask our dear Twilight Thrall if it knew anything about where its former masters were coming from. Of note was mention of shadow magics and an ogre by the name of Nar''gurk in a hidden stronghold north of Sunnyglade.

Seek him out. Kill him and recover what you can. There must be something we can learn from these efforts.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94984;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469531,94984,1,0,0,267104,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94984;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94984,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94984;
DELETE FROM `quest_classic_level` WHERE `ID`=94984;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94984,44,39,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94984;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94984,2,44);
DELETE FROM `quest_offer_reward` WHERE `ID`=94984;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94984,0,0,0,0,0,0,0,0,'As I suspected, magic bindings and a shadow cipher. It may take weeks to understand the contents.

Nevertheless, your work has been of delightful help, $n. I shall start at once.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94984;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94984,0,0,0,0,'Find anything of interest?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94984;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94984;
DELETE FROM `creature_questender` WHERE `quest`=94984;
DELETE FROM `gameobject_questender` WHERE `quest`=94984;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257591,94984,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257591,94984,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257591);

-- 94894 The Twilight Threat (level 45, min 38, live build 70959)
DELETE FROM `quest_template` WHERE `ID`=94894;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94894,2,16591,0,0,6,1.0,0,1.0,0,265837,36700160,0,0,0,6130900294268439629,72,6,0,'The Twilight Threat','Deliver Kilgar''s Head to Bolvar Fordragon within Stormwind Keep in Stormwind City.','Lady Amberhall told me of your exploits with the Twilight''s Hammer. I''m impressed. But concerned.

Farholde started its campaign originally to remove the Horde from our homeland. While that remains our primary goal, we cannot take this sudden surge in cultist activity lightly. If our pleas to Stormwind remain unheard, we will be overwhelmed as we face foes on two fronts alone.

With the evidence you carry, perhaps they can set aside their pride long enough to listen. At this point it''s our only option.','','Deliver Kilgar''s Head to Bolvar Fordragon within Stormwind Keep in Stormwind City.',70959);
DELETE FROM `quest_objectives` WHERE `QuestID`=94894;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469312,94894,1,0,1,265837,1,0,1,NULL,70959);
DELETE FROM `quest_template_addon` WHERE `ID`=94894;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94894,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94894;
DELETE FROM `quest_classic_level` WHERE `ID`=94894;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94894,45,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94894;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94894,2,45);
DELETE FROM `quest_offer_reward` WHERE `ID`=94894;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94894,0,0,0,0,0,0,0,0,'Troubling news indeed, friend. But this changes little. We are already at war, and on a much grander scale than a single hamlet on the outskirts of Alliance territory. We don''t have the resources to support a personal vendetta.

More homes than those of the Riverglades have been razed by the Horde threat. If Brant could just put his ego aside, he and his cavalry could do great things for the Alliance. I see now that is a lost cause.',70959);
DELETE FROM `quest_request_items` WHERE `ID`=94894;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94894,0,0,0,0,'Word from Farholde, is it? After all this time has the Knight Commander finally seen reason?',70959);
DELETE FROM `creature_queststarter` WHERE `quest`=94894;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94894;
DELETE FROM `creature_questender` WHERE `quest`=94894;
DELETE FROM `gameobject_questender` WHERE `quest`=94894;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,94894,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (1748,94894,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (1748,257558);

-- 94925 A Fur Trade (level 39, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94925;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94925,2,16591,0,94928,5,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,2826,5,0,'A Fur Trade','Bring 8 Prized Lion Hides to Watcher Terral.','Farholde prides itself on its independence, but there are a few things we can only get through trade.

We''ve negotiated an arrangement with a dealer at Powderfuse Port. We provide her with goods that are dangerous to acquire, and she provides us with specialty munitions.

Currently, she''s in the market for lion fur. A pride of them live atop a large hill in the center of the plains. If you''d like to make yourself useful, you could aid me in harvesting some of their hides.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94925;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469337,94925,1,0,0,266888,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94925;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94925,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94925;
DELETE FROM `quest_classic_level` WHERE `ID`=94925;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94925,39,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94925;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94925,2,39);
DELETE FROM `quest_offer_reward` WHERE `ID`=94925;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94925,0,0,0,0,0,0,0,0,'Yes, these will do nicely. Let me package them up for you to deliver.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94925;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94925,0,0,0,0,'The lions hunt in packs, $c. Be careful not to get surrounded.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94925;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94925;
DELETE FROM `creature_questender` WHERE `quest`=94925;
DELETE FROM `gameobject_questender` WHERE `quest`=94925;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259352,94925,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259352,94925,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (259352);

-- 94983 Twilight Mementos (level 42, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94983;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94983,2,16842,81,94997,6,2.375,0,1.0,0,0,36700168,0,0,0,6130900294268439629,2826,6,0,'Twilight Mementos','Collect $1oa Cultist Bangles from the Twilight''s Hammer in Krol''dok Stronghold.','The stories our scouts shared were quite horrid. I''ll spare you the gruesome details. What we''ve discovered confirms previous reports of a cultist hideout.

To the north lies a cave, well hidden by its surroundings. This cave leads to... well, a place we''ve yet to infiltrate. We believe it''s a foothold, nestled deep within the mountains.

It''s time we repay the cultists for their actions against our allies.

Venture north, seek out our enemies, and return to me with proof of their demise.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94983;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469528,94983,1,0,0,267234,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94983;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94983,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94983;
DELETE FROM `quest_classic_level` WHERE `ID`=94983;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94983,42,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94983;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94983,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=94983;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94983,0,0,0,0,0,0,0,0,'Your findings are unsettling. And these... these are quite mysterious... How strange...

<Sergeant Riftan pauses a moment to stare at the mementos.>

These carry a dark undertone--some kind of energy. Do you feel that?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94983;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94983,0,0,0,0,'Well? What have you found?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94983;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94983;
DELETE FROM `creature_questender` WHERE `quest`=94983;
DELETE FROM `gameobject_questender` WHERE `quest`=94983;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258023,94983,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (258023,94983,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (258023);

-- 94890 Bring Me His Head (level 46, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94890;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94890,2,16591,1,94891,6,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,275046,1,275049,1,2826,6,0,'Bring Me His Head','Defeat Overlord Kilgar within the Twilight''s Shroud and bring his head to Sergeant Riftan.','With this kind of momentum, we can''t stop now. The soldiers we rescued are itching to draw blood, and you''ve already proven yourself a capable battering ram.

Return to the Twilight''s Shroud and finish what we''ve started. Their leader, an orc by the name of Overlord Kilgar, hides deep within his keep while his underlings are lost in their panic.

If we want to put an end to this, bring me the head of Kilgar. These gods-fearing cowards can''t make a single decision on their own.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94890;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469305,94890,1,0,2,265837,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94890;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94890,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94890;
DELETE FROM `quest_classic_level` WHERE `ID`=94890;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94890,46,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94890;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94890,2,46);
DELETE FROM `quest_offer_reward` WHERE `ID`=94890;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94890,0,0,0,0,0,0,0,0,'Not quite what I signed up for when we started this patrol, but it''s good we got here when we did.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94890;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94890,0,0,0,0,'What better report is there than total victory?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94890;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94890;
DELETE FROM `creature_questender` WHERE `quest`=94890;
DELETE FROM `gameobject_questender` WHERE `quest`=94890;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258023,94890,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (258023,94890,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (258023);

-- 95788 Magics of the Drowned City (level 40, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95788;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95788,2,16550,81,0,5,2.675,0,1.0,0,0,33554696,0,0,0,6130900294268439629,72,5,0,'Magics of the Drowned City','Collect $1oa I''lalai Fetishes from trolls in the Drowned City.','The Skullsplitter fetishes Brother Nimetz sent with you are indeed powerful, though I do not think they contributed to Kurzen''s condition, or at least not directly.

Still, if the rumors are true and the lost troll city of I''lalai has indeed risen from its watery grave, it is possible the dark magics used to raise the doomed city may be related.

If you dare to venture into the Drowned City of I''lalai, please gather any troll fetishes you find and bring them here to me for further study.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95788;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471385,95788,1,0,4,270343,5,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95788;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95788,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95788;
DELETE FROM `quest_classic_level` WHERE `ID`=95788;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95788,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95788;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95788,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95788;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95788,0,0,0,0,0,0,0,0,'I am no mage, but even I can see how distinct these are from the fetishes I''ve examined before. Their construction is more intricate in some ways, but more simple in others. They also seem to feature a great sea serpent of some kind.

Fascinating.

With what you have told me of the roaming undead, invading pirates, blood rituals and naga forces all converging on the ruins, it would seem I''lalai is now a hotbed of many kinds of magic all being swirled together.

This certainly requires further study.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95788;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95788,0,0,0,0,'Have you traveled to the fabled Drowned City? What did you find?

Come, I want to hear everything you saw in exact detail, if you have the time.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95788;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95788;
DELETE FROM `creature_questender` WHERE `quest`=95788;
DELETE FROM `gameobject_questender` WHERE `quest`=95788;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2277,95788,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2277,95788,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2277);

-- 94891 News to Farholde (level 46, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94891;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94891,2,16591,0,0,5,1.0,0,1.0,0,265837,36700160,0,0,0,6130900294268439629,275042,1,2826,5,0,'News to Farholde','Return to Ashe Amberhall in Farholde Keep.','Seems like things are quieting down around here for now, but I want to keep an eye out. You want to send Amberhall a report? Send her this.

<Sergeant Riftan tosses Kilgar''s head back to you.>

That ought to shut her up. At least for a while. Good work out there.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94891;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469315,94891,1,0,0,265837,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94891;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94891,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94891;
DELETE FROM `quest_classic_level` WHERE `ID`=94891;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94891,46,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94891;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94891,2,46);
DELETE FROM `quest_offer_reward` WHERE `ID`=94891;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94891,0,0,0,0,0,0,0,0,'With how long you were gone, I was starting to worry I misjudged your talents. But it seems you were just the right tool for the job.

And that Riftan. Still kicking around then, is he? I just knew you two would get along splendidly!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94891;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94891,0,0,0,0,'You had a successful venture, I trust?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94891;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94891;
DELETE FROM `creature_questender` WHERE `quest`=94891;
DELETE FROM `gameobject_questender` WHERE `quest`=94891;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258023,94891,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257591,94891,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257591,258023);

-- 95613 Keeping the Light On (level 38, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95613;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95613,2,16591,0,0,4,1.0,0,1.0,0,0,3145736,0,0,0,6130900294268439629,2826,2,0,'Keeping the Light On','Bring $1oa Holy Candles to Sister Rowland in Farholde Keep.','While we no longer hold service at the church, I feel it important to keep the candles lit on the graves of our fallen in the church''s crypt. To me, keeping the candle''s flame alive is a symbol that they are not forgotten and their sacrifices were not in vain.

If you would, bring me candles so that I might continue this ritual. It would mean a great deal to me.

If you''re not sure where to find them, speak with Marla in the house just outside of the church. She''s a friend and may have some to spare.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95613;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471049,95613,1,0,0,17028,5,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95613;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95613,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95613;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95613,3000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95613;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95613,38,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95613;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95613,2,38);
DELETE FROM `quest_offer_reward` WHERE `ID`=95613;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95613,0,0,0,0,0,0,0,0,'These will do marvellously. I thank you again for your help, $n.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95613;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95613,0,0,0,0,'I know a few candles are a small gesture in the grand scheme of what we''re doing here, but just as I care for the living, so too must I care for the dead.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95613;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95613;
DELETE FROM `creature_questender` WHERE `quest`=95613;
DELETE FROM `gameobject_questender` WHERE `quest`=95613;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (262031,95613,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (262031,95613,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (262031);

-- 97197 Fragment of the Firelands (level 55, min 46, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97197;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97197,2,1584,81,0,6,2.1,0,1.0,0,0,8,0,0,0,12261800583900083122,2787,7,30000,'Fragment of the Firelands','Recover a Fragment of the Firelands from Blackrock Depths for Alaana Stormwalker in Mulgore.','Muln tells me that there is a location in the deepest depths of a place called Blackrock Mountain where the barrier between Azeroth and the elemental plane has been damaged, allowing a myriad of elemental creatures from the realm of the Firelands to escape into this reality, including giants as large as an Anchor Pylon!

I''d very much like to study any fragments of material that could be gathered from one of these creatures. Would you brave the Blackrock Depths and recover a sample for me?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97197;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475467,97197,1,0,0,277129,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97197;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97197,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97197;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (97197,20108,0);
DELETE FROM `quest_classic_level` WHERE `ID`=97197;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97197,55,46,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97197;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97197,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=97197;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97197,0,0,0,0,0,0,0,0,'Oh thank you, $n! I am eager to begin studying this sample!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97197;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97197,0,0,0,0,'The concept of a towering giant made entirely of molten rock is both thrilling and terrifying to me.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97197;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97197;
DELETE FROM `creature_questender` WHERE `quest`=97197;
DELETE FROM `gameobject_questender` WHERE `quest`=97197;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259119,97197,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259119,97197,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (259119);

-- 95066 The Rog'mar Situation (level 39, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95066;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95066,2,16591,0,0,3,1.0,0,1.0,0,274981,36700160,0,0,0,6130900294268439629,275052,1,2826,5,0,'The Rog''mar Situation','Deliver the report to Demar Brant in Farholde Keep.','The message we''ve delivered is clear.

Return to Brant within the keep and show him the report. I''m certain he''ll be pleased with our progress.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95066;
DELETE FROM `quest_template_addon` WHERE `ID`=95066;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95066,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95066;
DELETE FROM `quest_classic_level` WHERE `ID`=95066;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95066,39,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95066;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95066,2,39);
DELETE FROM `quest_offer_reward` WHERE `ID`=95066;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95066,0,0,0,0,0,0,0,0,'It seems Cornelius has proven quite effective at his post, with your help, of course.

Unfortunately, celebration distracts from our remaining work, exposing us to unnecessary vulnerabilities, but... perhaps a moment to reflect on our progress is in order.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95066;
DELETE FROM `creature_queststarter` WHERE `quest`=95066;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95066;
DELETE FROM `creature_questender` WHERE `quest`=95066;
DELETE FROM `gameobject_questender` WHERE `quest`=95066;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259352,95066,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,95066,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257558,259352);

-- 95472 Consolation Prize (level 40, min 36, live build 70959)
DELETE FROM `quest_template` WHERE `ID`=95472;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95472,2,16591,0,0,4,1.0,0,1.0,0,268805,36700160,0,0,0,18446744073709551615,270334,1,2827,5,0,'Consolation Prize','Bring Tazzik''s Sweaty Shirt to Friz Frazzlespark in Powderfuse Port.','I''m tellin'' ya, I can''t pay Friz back! I got nothin'' left but the shirt off my back!

Why are you lookin'' at me like that...','','',70959);
DELETE FROM `quest_objectives` WHERE `QuestID`=95472;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470725,95472,1,0,1,268805,1,0,1,NULL,70959);
DELETE FROM `quest_template_addon` WHERE `ID`=95472;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95472,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95472;
DELETE FROM `quest_classic_level` WHERE `ID`=95472;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95472,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95472;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95472,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95472;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95472,0,0,0,0,0,0,0,0,'He did WHAT? That little weasel!

<Friz balls up the shirt and stamps it into the ground.>

New lesson, lackey! Never trust a promise, and make sure to collect cash on delivery.

Well, here''s your share of the profits. No. Please. It''s all yours, I insist.',70959);
DELETE FROM `quest_request_items` WHERE `ID`=95472;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95472,0,0,0,0,'Lackey? Why are you givin'' me this...',70959);
DELETE FROM `creature_queststarter` WHERE `quest`=95472;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95472;
DELETE FROM `creature_questender` WHERE `quest`=95472;
DELETE FROM `gameobject_questender` WHERE `quest`=95472;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260857,95472,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (255897,95472,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (255897,260857);

-- 95786 An Acquaintance in Southshore (level 40, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95786;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95786,2,33,0,0,5,1.0,0,1.0,0,270340,33554688,0,0,0,6130900294268439629,72,5,0,67,5,0,270340,1,'An Acquaintance in Southshore','Find Loremaster Dibbs in Southshore and bring him the Savage Coast Report Bundle.','$n, I have a friend in the Hillsbrad Foothills that is studying troll legends and evil magic. I think he may have insight about how this foul magic captured Colenel Kurzen''s mind.

I also have a scout''s report that the local trolls seem to be agitated, mentioning the word..."I''lalai".

I must know if this is related to Kurzen''s corruption! Here, take the fetishes and legends along with this scouting report to Loremaster Dibbs. With any luck he will be able to unravel some of their secrets.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95786;
DELETE FROM `quest_template_addon` WHERE `ID`=95786;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95786,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95786;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95786,5000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95786;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95786,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95786;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95786,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95786;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95786,0,0,0,0,0,0,0,0,'Brother Nimetz sent you all the way from Stranglethorn? You have made quite the trek then. It must be a matter of some importance.

Come, tell me what has brought you all the way to Southshore.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95786;
DELETE FROM `creature_queststarter` WHERE `quest`=95786;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95786;
DELETE FROM `creature_questender` WHERE `quest`=95786;
DELETE FROM `gameobject_questender` WHERE `quest`=95786;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (739,95786,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2277,95786,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (739,2277);

-- 96609 A Taste of Home (level 52, min 44, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96609;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96609,2,16560,0,0,5,1.0,0,1.0,0,0,264,0,0,0,6130900294268439629,276896,1,276903,1,276904,1,2740,5,0,'A Taste of Home','Bring $1oa bottles of Silvermoon Shimmerwine to Arille Azuregaze in Dalaran city.','Are you familiar with Silvermoon Shimmerwine? It has a delicate flavor that is entirely unique to the vineyards of Eversong and it is the one thing I truly miss from my homeland.

Unfortunately, it is extremely hard to find on this side of the Thalassian Gate.

I had a patron bring me a bottle that he claimed to have "liberated" from blood elves in northern Azshara. If your adventures take you to that region and you can recover more bottles for me, I would handsomely reward your efforts.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96609;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (473708,96609,1,0,1,274966,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96609;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96609,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96609;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (96609,15500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=96609;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96609,52,44,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96609;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96609,2,52);
DELETE FROM `quest_offer_reward` WHERE `ID`=96609;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96609,0,0,0,0,0,0,0,0,'I hope you didn''t have to kill too many of my misguided kin to recover these.

I know this was quite the trek and I appreciate the effort. As promised, here is your reward.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96609;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96609,0,0,0,0,'My wayward people are on a course of action that will lead them to ruin, and I have little desire to return home to Silvermoon to witness how far we''ve fallen firsthand.

However, I must confess that I miss some of the finer things that my homeland has to offer.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96609;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96609;
DELETE FROM `creature_questender` WHERE `quest`=96609;
DELETE FROM `gameobject_questender` WHERE `quest`=96609;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (29049,96609,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (29049,96609,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (29049);

-- 94893 Delivering Closure (level 47, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94893;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94893,2,16591,0,0,5,1.0,0,1.0,0,266428,36700160,0,0,0,6130900294268439629,72,5,0,'Delivering Closure','Deliver Marshal Ryan''s Crest to Abigail Lawson in the Cathedral Square of Stormwind City.','So, his final thoughts were of Abigail?

I know this is not your business, friend, but I must ask you to deliver the news of the Marshal''s passing on my behalf. Ryan''s betrothed, Abigail Lawson, did not join us when we established Farholde Keep. The two of them apparently had a disagreement, and while I do not know the specifics, I do know that she now resides within Stormwind City.

Please take the Marshal''s crest to Terry for me. I don''t think my presence would be a welcome one.','','Deliver Marshal Ryan''s Crest to Terry Lawrence in the Cathedral Square of Stormwind City.',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94893;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469310,94893,1,0,1,266428,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94893;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94893,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94893;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94893,7000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94893;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94893,47,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94893;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94893,2,47);
DELETE FROM `quest_offer_reward` WHERE `ID`=94893;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94893,0,0,0,0,0,0,0,0,'Thank you for bringing this, $c. I understand why that coward Demar wouldn''t show his face to me.

If you are going to stay and help them, take care of yourself. Demar is a hero, but that''s the thing about heroes--they excel at getting other people killed.

Idiot...',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94893;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94893,0,0,0,0,'I suppose it was only a matter of time before someone came asking about Ryan. 

When his family was killed during the orc invasion, something changed in him. His vendetta against the Horde warped from a sense of duty into an all-consuming hatred. I tried to convince him to come live with my parents and me here in Stormwind but he wouldn''t budge. He swore to remain until he purged his home of the orcs.

We hadn''t spoken since.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94893;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94893;
DELETE FROM `creature_questender` WHERE `quest`=94893;
DELETE FROM `gameobject_questender` WHERE `quest`=94893;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,94893,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (278088,94893,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257558,278088);

-- 95975 Her World (level 41, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95975;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95975,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,2826,5,0,'Her World','Gather $1oa Wildflowers and deliver them to Tessa Dawnbright in Farholde Keep.','Tess says little Emm can''t sleep without me? And you did all that for them? A total stranger? Damn it. What was I thinking...

Even if I can''t guarantee a perfect world for her, I still need to be a part of it. What am I even fighting for if I can''t hope for a brighter future?

Thank you for helping my family in my absence, friend, but it''s time for me to go home. If I could ask one more favor, can you pick some flowers and take them to Tess? Let her know I''ll be home soon? I need to clean up first.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95975;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471782,95975,1,0,0,271823,20,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95975;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95975,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95975;
DELETE FROM `quest_classic_level` WHERE `ID`=95975;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95975,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95975;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95975,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=95975;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95975,0,0,0,0,0,0,0,0,'Oh these are lovely! Gray got these for me? He''s always such a ray of sunshine. It''s no wonder our little Emma here misses him so much. She''ll be so happy when he gets back.

Isn''t that right Emma? Daddy''s coming home soon! Say daddy. Daddy.

<The baby stops crying and spits up on her blankets.>

It''s a start. Thank you for everything, $n. You''ve been such a blessing. Feel free to visit us any time!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95975;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95975,0,0,0,0,'Good to see you again, $n. Did you find my husband?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95975;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95975;
DELETE FROM `creature_questender` WHERE `quest`=95975;
DELETE FROM `gameobject_questender` WHERE `quest`=95975;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263120,95975,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263089,95975,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (263089,263120);

-- 94892 Dying Wish (level 47, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94892;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94892,2,16591,0,94893,5,1.0,0,1.0,0,266428,36700160,0,0,0,6130900294268439629,2826,5,0,'Dying Wish','Return Marshal Ryan''s crest to Knight Commander Demar Brant in Farholde Keep.','It''s too late for me, stranger. I''m not going to be making it out of this one. Take my crest to the Knight Commander. Warn him...

<Ryan''s eyes begin to glaze over as he mumbles to himself.>

I''m sorry. I should have come home. Abigail...','','Return to Knight Commander Demar Brant in Farholde Keep.',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94892;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469307,94892,1,0,1,266428,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94892;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94892,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94892;
DELETE FROM `quest_classic_level` WHERE `ID`=94892;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94892,47,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94892;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94892,2,47);
DELETE FROM `quest_offer_reward` WHERE `ID`=94892;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94892,0,0,0,0,0,0,0,0,'Ever dutiful till the end. Thank you for bringing this to me, $c.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94892;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94892,0,0,0,0,'Did you find the Marshal?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94892;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94892;
DELETE FROM `creature_questender` WHERE `quest`=94892;
DELETE FROM `gameobject_questender` WHERE `quest`=94892;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257250,94892,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,94892,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257250,257558);

-- 94981 Key Ingredients (level 41, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94981;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94981,2,16842,0,0,5,1.0,0,1.0,0,0,3145736,0,0,0,6130900294268439629,267089,1,'Key Ingredients','Bring $1oa Thick Leather and $2oa Iron Bars to Alphonse Dumas.','The moulding is rather crude, but we may be able to fashion a key with the right materials.

I''ll keep the embers running hot while you gather the necessary components.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94981;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469516,94981,1,0,1,4304,4,0,1,NULL,71037),(469517,94981,1,1,0,3575,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94981;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94981,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94981;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94981,5500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94981;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94981,41,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94981;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94981,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94981;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94981,0,0,0,0,0,0,0,0,'Just what we needed.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94981;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94981,0,0,0,0,'Have you gathered the materials?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94981;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94981;
DELETE FROM `creature_questender` WHERE `quest`=94981;
DELETE FROM `gameobject_questender` WHERE `quest`=94981;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259250,94981,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259250,94981,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (259250);

-- 96083 Clerical Quarantine (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96083;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96083,2,16591,0,0,1,1.0,0,1.0,0,0,8,0,0,0,6130900294268439629,'Clerical Quarantine','Speak to Sister Rowland at the chapel in Farholde Keep.','You have done all you can here, for now.

If you wish to be of further aid, go up the hill to the chapel. It is the smaller building outside the main church.

Sister Rowland is looking after a few quarantined soldiers there who have contracted an unknown illness.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96083;
DELETE FROM `quest_template_addon` WHERE `ID`=96083;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96083,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96083;
DELETE FROM `quest_classic_level` WHERE `ID`=96083;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96083,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96083;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96083,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=96083;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96083,0,0,0,0,0,0,0,0,'Ah, so Brother Lowley sent you? Hard to believe he could spare the hands. That must mean you fulfilled your duties well.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96083;
DELETE FROM `creature_queststarter` WHERE `quest`=96083;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96083;
DELETE FROM `creature_questender` WHERE `quest`=96083;
DELETE FROM `gameobject_questender` WHERE `quest`=96083;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263613,96083,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (262031,96083,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (262031,263613);

-- 92343 Get to the Roots of It (level 55, min 45, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92343;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92343,2,16554,81,0,5,2.0,0,1.0,0,0,36700424,0,0,0,12261800583900083122,81,6,0,'Get to the Roots of It','Gather 10 Nordrassil Root Caps inside Blackmaw Hold for Nara Wildmane in Thunder Bluff.','The burrow you speak of is a tunnel to Blackmaw Hold. In the past, the furbolg have guarded it fiercely, making it inaccessible to outsiders. With this satyr situation, however, we can get inside.

So close to Nordrassil, there would be actively growing roots. Older roots can be seen on the world''s surface, but newer ones can only be found deep underground. Little is known of their magical properties.

If you were to bring me some samples to study, the druids of Thunder Bluff would be in your debt.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92343;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (464441,92343,1,0,1,250773,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92343;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92343,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92343;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (92343,13419,0);
DELETE FROM `quest_classic_level` WHERE `ID`=92343;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92343,55,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92343;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92343,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=92343;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92343,0,0,0,0,0,0,0,0,'Yes, I can sense these roots teeming with the power of the world tree. I am sure my study of them will be fruitful. You have my thanks, $n.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92343;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92343,0,0,0,0,'I''m not usually one to take advantage of a situation like this, but we can''t let this opportunity pass us by.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92343;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92343;
DELETE FROM `creature_questender` WHERE `quest`=92343;
DELETE FROM `gameobject_questender` WHERE `quest`=92343;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (5770,92343,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (5770,92343,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (5770);

-- 95799 Findings for the Explorer's League (level 40, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95799;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95799,2,1537,0,0,4,1.0,0,1.0,0,0,33554696,0,0,0,6130900294268439629,272124,1,279880,1,279881,1,72,4,0,47,3,0,'Findings for the Explorer''s League','Bring Loremaster Dibbs'' I''lalai Translations to Historian Karnik in Ironforge.','I must write my colleague in Ironforge at the Explorer''s League immediately. This is a discovery of historical proportions.

Would you mind delivering the letter to Ironforge for me? I will write a copy of my translations of the tablets for you.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95799;
DELETE FROM `quest_template_addon` WHERE `ID`=95799;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95799,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95799;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95799,3500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95799;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95799,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95799;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95799,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95799;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95799,0,0,0,0,0,0,0,0,'Ah, Loremaster Dibbs never fails to bring me things of great interest. While my area of study isn''t focused on trolls, I certainly can appreciate his passion.

This is splendid news. I will get a team together to strike out for this lost city of I''lalai at once!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95799;
DELETE FROM `creature_queststarter` WHERE `quest`=95799;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95799;
DELETE FROM `creature_questender` WHERE `quest`=95799;
DELETE FROM `gameobject_questender` WHERE `quest`=95799;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2277,95799,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2916,95799,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2277,2916);

-- 98233 Sword in the Slime (level 42, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=98233;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (98233,2,15,0,0,5,1.0,0,1.0,0,0,33554440,0,0,0,6130900294268439629,281308,1,72,5,0,'Sword in the Slime','Recover Jameson''s Training Sword and bring it to Guard Jameson.','I was having a drink with my buddies over at the tavern a few nights back and they dared me to try and take on one of those nasty oozes alone.

Seeing as I don''t have a sword, you can probably guess how well that went.

When I went to attack it my sword got stuck and things didn''t go as planned.

I need to get it back before my sergeant realizes I lost it! It should be stuck in an ooze out there somewhere, west of here across the bay.

Please, if you''re headed out that way, can you look for it?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=98233;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (477094,98233,1,0,0,280203,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=98233;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (98233,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=98233;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (98233,5500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=98233;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (98233,42,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=98233;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (98233,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=98233;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (98233,0,0,0,0,0,0,0,0,'By the Light, that smells awful! I have no idea how I am going to get that foul odor off of this blade.

Oh great. Now I''ve gotten the ooze all over myself as well.

Well, thank you for getting my sword back, $n. I endeavor to repay the favor someday.

Preferably when I smell better than I do now.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=98233;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (98233,0,0,0,0,'Blast! I wish my friends hadn''t goaded me into this. They told me that there was no way I could take on one of those wretched oozes by myself. Naturally in my...

<Jameson clears his throat.>

... completely sober state, I thought it was a good idea to prove them wrong.

Clearly it didn''t go the way I had envisioned. That will teach me to try to fight and indulge in the same evening.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=98233;
DELETE FROM `gameobject_queststarter` WHERE `quest`=98233;
DELETE FROM `creature_questender` WHERE `quest`=98233;
DELETE FROM `gameobject_questender` WHERE `quest`=98233;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (271167,98233,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (271167,98233,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (271167);

-- 95315 The Riverglades Report (level 38, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95315;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95315,2,45,0,0,1,1.0,0,1.0,0,275994,36700160,0,0,0,6130900294268439629,2826,1,0,275994,1,'The Riverglades Report','Deliver Captain Nials'' Correspondence to Demar Brant at Farholde Keep along the southeastern coast in the Riverglades.','Word from one of our scouts suggests a large force of enemies amassing to the far, far south, well beyond the Wetlands.

Even more curious is there appears to be an alliance settlement out there. Farholde? The name sounds familiar.

Let''s not wait on this. Best to begin the conversation before it''s too late. We''re dealing with enough here as it is.

Take this correspondence and deliver it to whoever claims to be the leader of this detachment.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95315;
DELETE FROM `quest_template_addon` WHERE `ID`=95315;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95315,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95315;
DELETE FROM `quest_classic_level` WHERE `ID`=95315;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95315,38,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95315;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95315,2,38);
DELETE FROM `quest_offer_reward` WHERE `ID`=95315;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95315,0,0,0,0,0,0,0,0,'This came from all the way up north? I can''t believe someone finally made contact. We''ve been at it for so long and all but given up hope.

I''ll be sure one of my messengers delivers a swift response.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95315;
DELETE FROM `creature_queststarter` WHERE `quest`=95315;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95315;
DELETE FROM `creature_questender` WHERE `quest`=95315;
DELETE FROM `gameobject_questender` WHERE `quest`=95315;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2700,95315,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257558,95315,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2700,257558);

-- 95383 Shipping and Handling (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95383;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95383,2,16591,0,95312,1,1.0,0,1.0,0,268811,36700160,0,0,0,18446744073709551615,2827,1,0,'Shipping and Handling','Deliver Friz''s Secret Stash to Tazzik in Steamwheedle Port.','<Wharfmaster Steamfizzle inspects the coin you offered him.>

Whoa-ho! Ol'' Friz sure is training the new generation right. Apologies for the delay, $Gsir:ma''am;. You''re here to deliver a crate to someone in town, right? I don''t know anythin'' about that, but if I did, I''d go talk with Tazzik on the dock. He seems to be interested in things like that.

But be quick about it though, yeah? Don''t need folks gettin'' the wrong idea, ya know.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95383;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470489,95383,1,0,1,268811,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95383;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95383,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95383;
DELETE FROM `quest_classic_level` WHERE `ID`=95383;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95383,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95383;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95383,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95383;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95383,0,0,0,0,0,0,0,0,'Hello beautiful! Friz sure delivers, doesn''t she? And look at the quality of these.

What? Hey don''t look at me. I didn''t tell you to spend all your gold breaking the law. Far as I''m concerned, this shipment''s been cleared by customs. Friz''s money on the other hand... that might be a problem.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95383;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95383,0,0,0,0,'Uck, you don''t have to tell me where you''re from. I can smell Powderfuse Port all over you.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95383;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95383;
DELETE FROM `creature_questender` WHERE `quest`=95383;
DELETE FROM `gameobject_questender` WHERE `quest`=95383;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260405,95383,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260857,95383,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260405,260857);

-- 96126 An Ogre's Captive (level 44, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96126;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96126,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,2826,5,0,'An Ogre''s Captive','Find Gronok the Butcher, kill him, and bring Dunston the key to his shackles.','I''m not sure how you got in here, but please, listen to me.

As you know, I serve as a watchman for Farholde Keep.

While on patrol, I was ambushed by a band of these brutes and taken prisoner. Now, I am forced to fight in the ring for their amusement.

I haven''t much strength left. If I''m to escape, it''s now or never. 

My captor is an ogre they call "Gronok the Butcher". He has the key to my shackles. Will you bring me that key and help me out of here?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96126;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472370,96126,1,0,0,272190,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96126;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96126,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96126;
DELETE FROM `quest_classic_level` WHERE `ID`=96126;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96126,44,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96126;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96126,2,44);
DELETE FROM `quest_offer_reward` WHERE `ID`=96126;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96126,0,0,0,0,0,0,0,0,'You have the key! Excellent! I am beyond grateful, $n. 

Now, let''s get out of here.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96126;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96126,0,0,0,0,'I''m glad someone finally found me. I don''t know how many more days I could have survived.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96126;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96126;
DELETE FROM `creature_questender` WHERE `quest`=96126;
DELETE FROM `gameobject_questender` WHERE `quest`=96126;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259057,96126,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259057,96126,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (259057);

-- 93394 Meeting the Magister (level 43, min 35, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93394;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93394,2,16651,0,0,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Meeting the Magister','Locate Magister Kirandis inside the temple of Shen''dralas.','I suspect your curiosity is luring you toward the grand structure now, yes? Good!

The Shen''dralar there are unlikely to welcome you with open arms, but so long as you tread respectfully, I do not think you will run into any trouble.

With any luck, my old friend Kirandis might be easy to find. Of everyone, he is the most likely to be amicable to your presence.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93394;
DELETE FROM `quest_template_addon` WHERE `ID`=93394;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (93394,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93394;
DELETE FROM `quest_classic_level` WHERE `ID`=93394;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93394,43,35,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93394;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93394,2,43);
DELETE FROM `quest_offer_reward` WHERE `ID`=93394;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93394,0,0,0,0,0,0,0,0,'It is remarkable to see that the pylons'' power burns brightly once more. I am surprised I hadn''t noticed before you arrived. I was beginning to think that this one would soon suffer the same fate, and we would be lost to time.

Thank you for tethering us back in full to Shen''dralas. Try to meet some of our denizens. They may be wary of you, but that will pass.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93394;
DELETE FROM `creature_queststarter` WHERE `quest`=93394;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93394;
DELETE FROM `creature_questender` WHERE `quest`=93394;
DELETE FROM `gameobject_questender` WHERE `quest`=93394;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (253471,93394,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (254656,93394,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (253471,254656);

-- 94997 Lingering Essence (level 42, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94997;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94997,2,16842,0,94998,5,1.0,0,1.0,0,268035,36700160,0,0,0,6130900294268439629,2826,5,0,268035,1,'Lingering Essence','Bring the Satchel of Cursed Mementos to Ashe Amberhall in Farholde Keep.','We mustn''t linger. Take these to the keep at once.

Find Ashe Amberhall. She may be a pain, but she''s well respected in her field of study. Perhaps she can shed some light on what energies are contained within these objects.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94997;
DELETE FROM `quest_template_addon` WHERE `ID`=94997;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94997,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94997;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94997,5500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94997;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94997,42,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94997;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94997,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=94997;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94997,0,0,0,0,0,0,0,0,'Riftan sent you? That old dog has been battling those damn cultists so long I worry his fatigue has begun to wear on his mind.

Ah, I''ve started babbling again. Forgive me. His concerns may be founded.

Let''s see what you''ve got.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94997;
DELETE FROM `creature_queststarter` WHERE `quest`=94997;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94997;
DELETE FROM `creature_questender` WHERE `quest`=94997;
DELETE FROM `gameobject_questender` WHERE `quest`=94997;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258023,94997,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257591,94997,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257591,258023);

-- 94998 Curios of Curiosity (level 42, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94998;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94998,2,16842,0,0,5,1.0,0,1.0,0,268036,36700160,0,0,0,6130900294268439629,279850,1,2826,5,0,268036,1,'Curios of Curiosity','Bring the Satchel of Mementos to Melanie Sable.','Quite simple to dispel, really. Remnants of something, that''s for sure. What, exactly, I do not know.

Well, I''m afraid I''ve done all that I can. I''m sorry if you were expecting more from me, but... on second thought, the craftsmanship of these is quite unique. Perhaps they could be of some use.

Take these to Melanie Sable. Tell her I sent you. Let her know they''re safe.

She may have some use for them just yet.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94998;
DELETE FROM `quest_template_addon` WHERE `ID`=94998;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94998,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94998;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94998,5500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94998;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94998,42,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94998;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94998,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=94998;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94998,0,0,0,0,0,0,0,0,'The intricate work on these is quite remarkable. It would be a shame if they went to waste.

Tell you what. If you''ll allow me to take a closer look I may be able to fashion something of use. All I ask is you allow me to keep one for myself for further study.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94998;
DELETE FROM `creature_queststarter` WHERE `quest`=94998;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94998;
DELETE FROM `creature_questender` WHERE `quest`=94998;
DELETE FROM `gameobject_questender` WHERE `quest`=94998;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257591,94998,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259287,94998,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257591,259287);

-- 95420 Land of Giants (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95420;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95420,2,16591,0,0,1,1.0,0,1.0,0,265750,36700160,0,0,0,12261800583900083122,2782,1,0,'Land of Giants','Deliver Chogg''s head to the ogre city to the north.','Clearly these wayward ogres are no friends to the Twilight''s Hammer. We orcs have an honored history fighting alongside ogres, and it may be time to call upon those old alliances again. And this head may be the key.

There have been reports of ogre activity in the hills far to the north. If this Clubtoe is to be believed, that must be where this clan calls home. Go to their stronghold and offer this trophy as a token of our friendship. With luck, they will listen to your proposal before they step on you.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95420;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470555,95420,1,0,0,265750,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95420;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95420,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95420;
DELETE FROM `quest_classic_level` WHERE `ID`=95420;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95420,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95420;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95420,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95420;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95420,0,0,0,0,0,0,0,0,'You smash Chogg''Zac? Little thing shows power.

What you want with Clugfist?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95420;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95420,0,0,0,0,'<The massive ogre belches in your face.>

What tiny creature bring Clugfist?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95420;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95420;
DELETE FROM `creature_questender` WHERE `quest`=95420;
DELETE FROM `gameobject_questender` WHERE `quest`=95420;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256710,95420,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (255829,95420,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (255829,256710);

-- 95562 Cut Off the Heads (level 41, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95562;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95562,2,16591,1,0,5,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,2826,5,0,'Cut Off the Heads','Kill Chogg''Zac in the caves beneath Sunnyglade and retrieve their heads for Apprentice Claire.','I have a confession to make. Lady Amberhall did send me to collect those samples, but in truth I volunteered. Sunnyglade was my home before the war took it from me, and I could not rest knowing monsters still taint it. Be it horde or Twilight.

There is no victory here by learning from them. There''s nothing to learn. They''re beasts, plain and simple, and should be put down like beasts.

We must slay their master at the bottom of this cave and bring an end to this. Surely my mistress will understand.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95562;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470923,95562,1,0,0,265750,1,0,1,NULL,71037),(477662,95562,1,1,1,265751,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95562;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95562,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95562;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95562,2500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95562;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95562,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95562;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95562,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=95562;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95562,0,0,0,0,0,0,0,0,'It''s dead? You killed the ogres?

You''ve done the right thing, $n. Now let''s get out of here.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95562;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95562,0,0,0,0,'The ghosts of this village cry out for vengeance, $n. And we must give it to them.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95562;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95562;
DELETE FROM `creature_questender` WHERE `quest`=95562;
DELETE FROM `gameobject_questender` WHERE `quest`=95562;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256831,95562,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256831,95562,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256831);

-- 95798 The Web of Magic (level 40, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95798;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95798,2,279,0,0,4,1.0,0,1.0,0,270339,33554688,0,0,0,6130900294268439629,279879,1,279878,1,72,4,0,270339,1,'The Web of Magic','Bring the I''lalai Fetish to Abra Cadabra in Dalaran.','$n, I want you to take this I''lalai Fetish to my friend Abra in Dalaran. I would love to have her examine it if she has the time to do so.

She is also particularly interested in troll practices and magic, so I believe this discovery will be exciting for her to unravel.

Do be careful, though. The Kirin Tor can be a bit particular about who they let into their grand city. If you haven''t already become a noteworthy visitor, you may need to find a way into their good graces.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95798;
DELETE FROM `quest_template_addon` WHERE `ID`=95798;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95798,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95798;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95798,3500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95798;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95798,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95798;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95798,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95798;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95798,0,0,0,0,0,0,0,0,'My word! The amount of different and conflicting magics pulling on this fetish is remarkable. It is certainly a good thing you have brought it to me.

In the wrong hands this could be very dangerous if not handled with extreme caution.

Thank you for bringing it all the way here, $c. I will send Loremaster Dibbs my findings promptly.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95798;
DELETE FROM `creature_queststarter` WHERE `quest`=95798;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95798;
DELETE FROM `creature_questender` WHERE `quest`=95798;
DELETE FROM `gameobject_questender` WHERE `quest`=95798;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2277,95798,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (252019,95798,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2277,252019);

-- 86577 A Sampling of Putrescence (level 55, min 48, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=86577;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (86577,2,361,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'A Sampling of Putrescence','Bring $1oa Putrescent Bear Organs and $2oa Putrescent Wolf Organs to Kelek Skykeeper.','The corruption that rains down from Hyjal flows through the mountain''s waters and seeps into everything here in the wood. The creatures that drink the water take the corruption into themselves. It makes them ferocious, diseased, and fearless.

To counter these effects, I must understand them, and to do that I need samples from the afflicted.

A few samples of putrescent organs from the wolves and bears should do. Take your time; the creatures are common here in Felwood.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=86577;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475820,86577,1,0,0,277958,8,0,1,NULL,71037),(475821,86577,1,1,1,277959,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=86577;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (86577,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=86577;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (86577,16783,0);
DELETE FROM `quest_classic_level` WHERE `ID`=86577;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (86577,55,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=86577;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (86577,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=86577;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (86577,0,0,0,0,0,0,0,0,'Ah, these samples are... gooey.

See how they are covered in tumors and pustules? These animals were suffering excruciating pain. Doubtless that drives their aggression.

But I do not know how to cure it. I suspect the solution lies on Hyjal, and we simply suffer the aftereffects.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=86577;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (86577,0,0,0,0,'We must get to the bottom of the corruption that is turning Felwood into a demon-haunted wilderness!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=86577;
DELETE FROM `gameobject_queststarter` WHERE `quest`=86577;
DELETE FROM `creature_questender` WHERE `quest`=86577;
DELETE FROM `gameobject_questender` WHERE `quest`=86577;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (10920,86577,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (10920,86577,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (10920);

-- 89001 Home on the Range (level 48, min 45, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=89001;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (89001,2,16,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,6130900294268439629,47,5,0,'Home on the Range','Bring 5 Mosshoof Hides to Berdun Cliffbrew at Talrendis Point in Azshara.','Greetings traveller!

If yer lookin'' for a place to hang yer hat, look no further than Berdun''s travel lodge! The tent''s in a bit o'' disrepair right now, but that can be remedied.

Tell ye what. If ye get me what I need to fix the tent, I''ll let ye stay here for free. How''s that sound?

I''ll need some mosshoof hides. The easiest to hunt mosshooves are just north o'' here, but the hide of any mooshoof will do.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=89001;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (459465,89001,1,0,0,238463,5,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=89001;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (89001,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=89001;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (89001,6600,0);
DELETE FROM `quest_classic_level` WHERE `ID`=89001;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (89001,48,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=89001;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (89001,2,48);
DELETE FROM `quest_offer_reward` WHERE `ID`=89001;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (89001,0,0,0,0,0,0,0,0,'Nicely done, friend! I''ll fix this place up right away. Kick up yer feet and take a load off!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=89001;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (89001,0,0,0,0,'Got the supplies yet?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=89001;
DELETE FROM `gameobject_queststarter` WHERE `quest`=89001;
DELETE FROM `creature_questender` WHERE `quest`=89001;
DELETE FROM `gameobject_questender` WHERE `quest`=89001;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (240482,89001,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (240482,89001,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (240482);

-- 91737 Remote Contact (level 52, min 44, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=91737;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (91737,2,16,0,3517,1,1.0,0,1.0,0,0,0,0,0,0,12261800583900083122,76,1,0,'Remote Contact','Speak to Jediga in Azshara.','My duties occasionally require reagents from the farther corners of Azeroth. However, I am always needed here in Thunder Bluff, and so I am in need of competent aides.

To that end, I am awaiting a delivery from an orc named Jediga, in Azshara. If you care to make yourself useful, find her camp, and inquire as to when I can expect it to arrive.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=91737;
DELETE FROM `quest_template_addon` WHERE `ID`=91737;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (91737,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=91737;
DELETE FROM `quest_classic_level` WHERE `ID`=91737;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (91737,52,44,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=91737;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (91737,2,52);
DELETE FROM `quest_offer_reward` WHERE `ID`=91737;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (91737,0,0,0,0,0,0,0,0,'Ah, so you''ve been in contact with Magatha have you? Well then, let us get straight to business.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=91737;
DELETE FROM `creature_queststarter` WHERE `quest`=91737;
DELETE FROM `gameobject_queststarter` WHERE `quest`=91737;
DELETE FROM `creature_questender` WHERE `quest`=91737;
DELETE FROM `gameobject_questender` WHERE `quest`=91737;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (4046,91737,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (8587,91737,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (4046,8587);

-- 96026 Step Two: More Rock (level 41, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96026;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96026,2,16591,0,0,4,1.0,0,1.0,0,0,3145736,0,0,0,12261800583900083122,251460,1,2782,5,0,'Step Two: More Rock','Deliver $1oa Heavy Weightstones to Hamur in Bolder''ok.','Dese good rock. Now need finishing touch. More rock.

Only rock can make rock stronger. Dat the way of rocks.

Me see some tinies make extra heavy rock. Bring me heavy rocks and me make weapon.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96026;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471850,96026,1,0,1,3241,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96026;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96026,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96026;
DELETE FROM `quest_classic_level` WHERE `ID`=96026;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96026,41,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96026;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96026,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=96026;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96026,0,0,0,0,0,0,0,0,'Dese very heavy! Now me smash good rocks with heavy rocks!

<Hamur crushes the rocks you collected into dust, leaving only the weightstones.>

Dese good for smashing. Here you go.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96026;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96026,0,0,0,0,'Smith tinies turn rocks into heavy rock. Genius. Maybe you buy from dem?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96026;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96026;
DELETE FROM `creature_questender` WHERE `quest`=96026;
DELETE FROM `gameobject_questender` WHERE `quest`=96026;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263440,96026,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263440,96026,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (263440);

-- 98192 Skin Careful, Skin Sharp (level 43, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=98192;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (98192,2,15,0,0,5,1.0,0,1.0,0,0,8,0,0,0,18446744073709551615,'Skin Careful, Skin Sharp','Bring $1oa Intact Raptor Hides to Krak in Brackenwall Village.','You little! You help Krak smash the red bities and get scale hide!

Krak smash red bities to take scale hide, but Krak hands too big. Krak keep cutting hides, make them full of holes.

But you little! You go get hides from red bities in Dragonmurk in south. They mean and fast. You little, could get eaten.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=98192;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (476968,98192,1,0,0,279601,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=98192;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (98192,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=98192;
DELETE FROM `quest_classic_level` WHERE `ID`=98192;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (98192,43,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=98192;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (98192,2,43);
DELETE FROM `quest_offer_reward` WHERE `ID`=98192;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (98192,0,0,0,0,0,0,0,0,'These good! You get good scale hides. We no run out soon.

When last time we ran out we not have enough to cover one ogre. Many us not have cover then.

Orc friends not like that. They say so, very much, a lot.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=98192;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (98192,0,0,0,0,'Krak need more hide from bities. It good you help.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=98192;
DELETE FROM `gameobject_queststarter` WHERE `quest`=98192;
DELETE FROM `creature_questender` WHERE `quest`=98192;
DELETE FROM `gameobject_questender` WHERE `quest`=98192;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (4883,98192,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (4883,98192,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (4883);

-- 91952 The Source of the Corruption (level 55, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=91952;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (91952,2,361,0,0,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'The Source of the Corruption','Find the hermit Ketharas on Mount Hyjal.','So much corruption rains down into Felwood from above. When the waters run high from Hyjal, they are filled with fel taint. It soaks into the ground and diseases the trees and plants.

There was a druid who lived in the wild, a hermit named Ketharas, who had a deep knowledge of the mountain. If anyone knows what has happened on Hyjal, it is he.

I think that Felwood cannot heal until the problem on Hyjal is resolved.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=91952;
DELETE FROM `quest_template_addon` WHERE `ID`=91952;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (91952,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=91952;
DELETE FROM `quest_classic_level` WHERE `ID`=91952;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (91952,55,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=91952;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (91952,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=91952;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (91952,0,0,0,0,0,0,0,0,'Greta is correct. The destruction of Archimonde at the end of the war rained down fel tainted ash all across the mountain. While I have been working to rehabilitate the landscape, progress is slow. Nature will eventually reassert itself, but the process may take many years.

Still, it is good to know that there are still other people who care.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=91952;
DELETE FROM `creature_queststarter` WHERE `quest`=91952;
DELETE FROM `gameobject_queststarter` WHERE `quest`=91952;
DELETE FROM `creature_questender` WHERE `quest`=91952;
DELETE FROM `gameobject_questender` WHERE `quest`=91952;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (10922,91952,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256222,91952,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (10922,256222);

-- 94974 Key Ingredients (level 41, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94974;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94974,2,16842,0,0,5,1.0,0,1.0,0,0,3145736,0,0,0,12261800583900083122,267089,1,'Key Ingredients','Bring $1oa Thick Leather and $2oa Iron Bar to Kreza Darkthorn.','The moulding is crude and worn, but we may be able to fashion a key.

It may take some time to gather the components necessary. I''ll keep these embers running hot while you gather the materials.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94974;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469488,94974,1,0,1,4304,4,0,1,NULL,71037),(469487,94974,1,1,0,3575,12,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94974;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94974,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94974;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94974,5500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94974;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94974,41,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94974;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94974,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94974;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94974,0,0,0,0,0,0,0,0,'The moulding should hold. Let''s see what we can do.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94974;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94974,0,0,0,0,'Do you have the materials?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94974;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94974;
DELETE FROM `creature_questender` WHERE `quest`=94974;
DELETE FROM `gameobject_questender` WHERE `quest`=94974;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256657,94974,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256657,94974,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256657);

-- 95327 All's Well That Ends Well (level 40, min 36, live build 70959)
DELETE FROM `quest_template` WHERE `ID`=95327;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95327,2,16591,0,0,5,1.0,0,1.0,0,268810,36700160,0,0,0,18446744073709551615,2827,5,0,'All''s Well That Ends Well','Return to Friz Frazzlespark at Powderfuse Port in the Riverglades.','Looks like a deal''s a deal. The Venture Co. got their comeuppance, Friz gets her loot, and everybody''s happy. Overall a pretty smooth transaction if I do say so myself.

Now scram, I got another shipment comin'' in soon from some Southsea Pirates.','','',70959);
DELETE FROM `quest_objectives` WHERE `QuestID`=95327;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470258,95327,1,0,0,268810,1,0,1,NULL,70959);
DELETE FROM `quest_template_addon` WHERE `ID`=95327;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95327,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95327;
DELETE FROM `quest_classic_level` WHERE `ID`=95327;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95327,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95327;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95327,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95327;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95327,0,0,0,0,0,0,0,0,'Glad you finally made it back. Took you awhile. I once tried to set up a trade route with Booty Bay but they weren''t interested. Guess they didn''t wanna do business with a place called ''Powderfuse Port.'' Go figure.

Anyways, nice job, kid.',70959);
DELETE FROM `quest_request_items` WHERE `ID`=95327;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95327,0,0,0,0,'Wouldn''t be a Ruzzgot delivery if it didn''t have a little blood on it. I take it you had fun?',70959);
DELETE FROM `creature_queststarter` WHERE `quest`=95327;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95327;
DELETE FROM `creature_questender` WHERE `quest`=95327;
DELETE FROM `gameobject_questender` WHERE `quest`=95327;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (3945,95327,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (255897,95327,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (3945,255897);

-- 96783 A Way In (level 36, min 24, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96783;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96783,2,0,0,0,5,1.0,0,1.0,0,0,8,0,0,0,18446744073709551615,'A Way In','Steal a Syndicate uniform from Northfold Manor to infiltrate Stromgarde Keep.','Stromgarde Keep is one of the Syndicate''s largest strongholds. Many of the organization''s most important dealings take place behind its walls.

I have received word of a certain trade taking place between members of the Syndicate somewhere in Arathi Highlands, and I''m certain the details of this trade can be found somewhere in Stromgarde.

To infiltrate the keep without arousing suspicion, you''ll need a disguise. See if you can find one among the Syndicate outside the keep, at Northfold Manor.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96783;
DELETE FROM `quest_template_addon` WHERE `ID`=96783;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96783,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96783;
DELETE FROM `quest_classic_level` WHERE `ID`=96783;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96783,36,24,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96783;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96783,2,36);
DELETE FROM `quest_offer_reward` WHERE `ID`=96783;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96783,0,0,0,0,0,0,0,0,'<Taking the uniform, you ready yourself for the next part of your mission.>',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96783;
DELETE FROM `creature_queststarter` WHERE `quest`=96783;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96783;
DELETE FROM `creature_questender` WHERE `quest`=96783;
DELETE FROM `gameobject_questender` WHERE `quest`=96783;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (13085,96783,0);
INSERT INTO `gameobject_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (656157,96783,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (13085);

-- 97198 Blackmaw Magic (level 59, min 52, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97198;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97198,2,16554,81,0,6,2.0,0,1.0,0,0,264,0,0,0,12261800583900083122,2787,6,30000,81,6,0,'Blackmaw Magic','Recover a Blackmaw Ritual Totem from Blackmaw Hold.','The Blackmaw furbolgs in the mountains overlooking Azshara have been corrupted by dark and sinister magic. We do not know the full extent of the corruption and what impact it may have upon the elements in the area, but we hope to understand it better.

Travel to the stronghold known as Blackmaw Hold and recover one of the Blackmaw Ritual Totems for us. Only the most powerful of the Blackmaw''s shamans will be carrying one of these, so bring allies and prepare for a difficult battle.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97198;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475461,97198,1,0,0,276893,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97198;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97198,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97198;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (97198,27456,0);
DELETE FROM `quest_classic_level` WHERE `ID`=97198;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97198,59,52,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97198;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97198,2,59);
DELETE FROM `quest_offer_reward` WHERE `ID`=97198;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97198,0,0,0,0,0,0,0,0,'Thank you for your efforts here, $n. I''m sure that it was not easy to recover this totem, and the Earthen Ring is in your debt.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97198;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97198,0,0,0,0,'Elemental magic is neither evil, nor good, but it simply reflects the will of the one who channels it. Studying the tools and methods of those who seek to corrupt the natural order will help us become ever more effective at doing battle against such forces.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97198;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97198;
DELETE FROM `creature_questender` WHERE `quest`=97198;
DELETE FROM `gameobject_questender` WHERE `quest`=97198;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259118,97198,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259118,97198,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (259118);

-- 93226 Buying Friendship: Magram (level 45, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93226;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93226,2,405,0,0,1,1.0,0,1.0,0,257685,305135616,0,0,0,18446744073709551615,93,0,300000,92,0,-1500000,'Buying Friendship: Magram','Bring the Totem Tote to the Magram Quartermaster at Magram Village in the Desolace to significantly increase your reputation with that clan. You must be of at least Neutral standing with the Magram Clan Centaur.','Siding with the Magram would be my choice. There is no question that they are the dominant clan in the present day, regardless of their previous struggles. I have heard reports that they are brutally hostile against the Gelkis.

I sympathize with both warring clans and especially the Gelkis, but this is their war; not ours. We ought to side with the faction that poses the least risk to our cause. I believe that to be the Magram.

Bring this to their quartermaster in Magram Village to the southeast.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93226;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (466325,93226,1,0,0,257685,1,0,1,NULL,71037),(472290,93226,6,1,-1,93,0,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93226;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (93226,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93226;
DELETE FROM `quest_classic_level` WHERE `ID`=93226;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93226,45,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93226;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93226,2,45);
DELETE FROM `quest_offer_reward` WHERE `ID`=93226;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93226,0,0,0,0,0,0,0,0,'<Gorhak''s eyes widen as you offer up the bundle of carved totems, but his brow furrows as his eyes flick back up toward you.>

I am no fool, outsider. This donation is not without cause. You want something, either from me or from our clan. I do not know what.

<With a single swipe of his hand, the quartermaster claims the bag as his own.>

And today, I do not care what your ulterior motive might be.

Welcome to Magram Village, outsider.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93226;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93226,0,0,0,0,'What business does an outsider have with Gorhak?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=93226;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93226;
DELETE FROM `creature_questender` WHERE `quest`=93226;
DELETE FROM `gameobject_questender` WHERE `quest`=93226;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (5396,93226,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (253139,93226,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (5396,253139);

-- 89228 Winter Frontier Fishery (level 48, min 45, live build 70959)
DELETE FROM `quest_template` WHERE `ID`=89228;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (89228,2,16,0,89015,5,1.0,0,1.0,0,0,3145736,0,0,0,6130900294268439629,47,5,0,'Winter Frontier Fishery','Fish up 10 Winter Squid for Berdun Cliffbrew at Talrendis Point, in Azshara.','Any travel lodge worth its salt''s gotta have somethin'' to eat.

Squid are in season, and ye can fish ''em up from the coasts here in Azshara. Never was much of an angler myself, but I''m a mean cook!

What do ye say? Feelin'' some seafood?

If ye aren''t much for fishin'', try makin'' friends with one! Or pay ''em for their goods and buy some.','','',70959);
DELETE FROM `quest_objectives` WHERE `QuestID`=89228;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (459754,89228,1,0,0,13755,10,0,1,NULL,70959);
DELETE FROM `quest_template_addon` WHERE `ID`=89228;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (89228,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=89228;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (89228,8350,0);
DELETE FROM `quest_classic_level` WHERE `ID`=89228;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (89228,48,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=89228;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (89228,2,48);
DELETE FROM `quest_offer_reward` WHERE `ID`=89228;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (89228,0,0,0,0,0,0,0,0,'Perfect, these''ll cook up nicely!',70959);
DELETE FROM `quest_request_items` WHERE `ID`=89228;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (89228,0,0,0,0,'Got that squid yet? I''m gettin'' a bit peckish now that I''m talkin'' about it.',70959);
DELETE FROM `creature_queststarter` WHERE `quest`=89228;
DELETE FROM `gameobject_queststarter` WHERE `quest`=89228;
DELETE FROM `creature_questender` WHERE `quest`=89228;
DELETE FROM `gameobject_questender` WHERE `quest`=89228;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (240482,89228,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (240482,89228,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (240482);

-- 92844 Mountain of Bones (level 42, min 35, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92844;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92844,2,16651,0,92847,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,93,0,50000,92,0,-250000,'Mountain of Bones','Maintain your reputation with the Magram, and bring $1oa Gently Cursed Bones to Orgrul south of the Magram Village in Desolace.','Some sort of necromantic energy has permeated throughout the Valley of Bones, for reasons we have yet to understand.

Those reasons are also of no importance to us. The magic is ours now, and those who do not fight with blade or mallet are trained in this new magic.

If you think I intend to start you off with a challenging task, think again. For now, go into the Valley of Bones and fetch some bones for me. I am sure you can handle that.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92844;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (465668,92844,1,0,0,254663,426,0,1,NULL,71037),(465670,92844,6,1,-1,93,9000,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92844;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92844,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92844;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (92844,3000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=92844;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92844,42,35,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92844;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92844,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=92844;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92844,0,0,0,0,0,0,0,0,'<Orgrul begins to count the bones, but begins to skip numbers as they gain a second digit and eventually loses count. He tries a second time, but glares your direction partway through when your expression contorts while observing.>

Bah. I will count them later. This looks like enough. You had best not be deceiving me.

I will hold onto these.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92844;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92844,0,0,0,0,'For every bone short you are for the task, I will take one of yours to make up the difference.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92844;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92844;
DELETE FROM `creature_questender` WHERE `quest`=92844;
DELETE FROM `gameobject_questender` WHERE `quest`=92844;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (253136,92844,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (253136,92844,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (253136);

-- 95928 Crystalline Elements (level 60, min 55, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95928;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95928,2,16985,81,0,5,2.675,0,1.0,0,0,33554696,0,0,0,12261800583900083122,279904,1,279906,1,76,3,0,2787,5,0,'Crystalline Elements','Bring Mayena Earthseeker a Moist Crystal, a Charged Crystal, a Noxious Crystal and a Fiery Crystal from Shaper''s Terrace.','Ah, it is good you have come here, $c.

I have been studying crystals of late and word has reached me about a peculiar set of crystals said to be from Un''Goro Crater. I have samples of the most basic ones, but I have heard tell of larger more potent crystals seen in a place called Shaper''s Terrace.

I do not know much of this place aside from it containing these crystals that supposedly have the very elements within them. If you find yourself there, please bring me a sample of each color.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95928;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471856,95928,1,0,0,271894,1,0,1,NULL,71037),(471857,95928,1,1,1,271898,1,0,1,NULL,71037),(471858,95928,1,2,2,271902,1,0,1,NULL,71037),(471859,95928,1,3,3,271912,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95928;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95928,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95928;
DELETE FROM `quest_classic_level` WHERE `ID`=95928;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95928,60,55,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95928;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95928,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=95928;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95928,0,0,0,0,0,0,0,0,'Fascinating. I will begin my studies on these right away.

Hopefully in time we can understand how the elements and the creatures of this, ''Shaper''s Terrace'', have influenced one another.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95928;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95928,0,0,0,0,'Have you brought the crystals? I have read reports from one of our fellows that traveled that way. He reports seeing ''elemental raptors''.

In all my years I have yet to see such a thing, but I feel the crystals and creatures must have some relation.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95928;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95928;
DELETE FROM `creature_questender` WHERE `quest`=95928;
DELETE FROM `gameobject_questender` WHERE `quest`=95928;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263445,95928,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263445,95928,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (263445);

-- 96075 In Demand - Blackrock Legal Records (level 60, min 60, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96075;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96075,2,35,0,0,0,1.0,0,1.0,0,0,3145800,2097152,0,0,18446744073709551615,271994,1,'In Demand - Blackrock Legal Records','Acquire Nefarian''s Remit from General Drakkisath in Blackrock Spire, Overseer''s License from Overlord Wyrmthalak in Blackrock Spire, and Bronzebeard Wedding Contract from Emperor Thaurissan in Blackrock Depths, and bring them to Pix Xizzix in Booty Bay.','My employers are looking to get their hands on legal documents surrounding the ownership of Blackrock Mountain. Some kind of property dispute. In any case, if you could acquire these key records, I can afford to reward you generously.

Retrieve Nefarian''s Remit from General Drakkisath in the upper part of Blackrock Spire, an Overseer''s License from Overlord Wyrmthalak in the lower part of Blackrock Spire, and a Bronzebeard Wedding Contract from Emperor Thaurissan in the Blackrock Depths.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96075;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472093,96075,1,0,0,272017,1,0,1,NULL,71037),(472094,96075,1,1,2,272018,1,0,1,NULL,71037),(472095,96075,1,2,3,272019,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96075;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96075,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96075;
DELETE FROM `quest_classic_level` WHERE `ID`=96075;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96075,60,60,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96075;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96075,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=96075;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96075,0,0,0,0,0,0,0,0,'Well done. My buyers will pay well for these. Enjoy the spoils!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96075;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96075,0,0,0,0,'You fetch me those documents yet?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96075;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96075;
DELETE FROM `creature_questender` WHERE `quest`=96075;
DELETE FROM `gameobject_questender` WHERE `quest`=96075;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (227853,96075,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (227853,96075,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (227853);

