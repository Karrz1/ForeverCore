-- WoW Forever: dungeon quests of the new Forever dungeons that our world did not have (Alcaz Prison, Krol'dok
-- Stronghold, Blackmaw Hold, City of Dalaran), with their givers. Full live record: title, story, objective line, levels, races, flags,
-- objectives with their live ids, item/choice/reputation/money rewards, start item, next quest.
-- Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/).
-- Source: github.com/JIVESCORP/eg-link-output-wowf quests.enUS and texts.enUS. Changed: picked and converted to our tables.
-- Who starts and ends each quest, and the progress and reward lines EG Link lacks, are from Wowhead WoW Forever.
-- Every giver, turn-in and objective target is spawned in our world, and every quest item already drops.
-- Safe to run again: every row is replaced by key.

-- 96772 The Dragon's Journal (level 53, min 46, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96772;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96772,2,16620,81,0,6,2.2,0,1.0,0,0,8,0,0,0,6130900294268439629,2740,7,30000,72,6,0,'The Dragon''s Journal','Recover Zarla''s Journal from the depths of Alcaz Prison.','Timear and I have been scrying the area on Kalimdor known as Alcaz Island and we''ve all but confirmed the presence of a powerful magic user there. The mage in question was able to dispel our probes, but before she did, I was able to glean an image of a tome of some sort. I believe it was a journal, written in ancient draconic script.

I don''t know what is in that book, but I''d like to study it. We want you to travel to the hidden prison beneath Alcaz Island and recover that book for us.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96772;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475392,96772,1,0,0,276890,1,0,1,'Recover the Journal',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96772;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96772,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96772;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (96772,16752,0);
DELETE FROM `quest_classic_level` WHERE `ID`=96772;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96772,53,46,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96772;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96772,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=96772;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96772,0,0,0,0,0,0,0,0,'So the mage we detected was actually a black dragon in disguise? I can''t say I''m terribly surprised. Dragons are ever crafty. 

The fact that you are standing here before me now suggests that you were forced to dispatch the dragon, yes? You''ll get no complaints from me. You recovered the journal and there''s one fewer villain in the world. That''s a good day''s work as far as I am concerned.

Thank you, $N.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96772;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96772,0,0,0,0,'Did you recover the journal?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96772;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96772;
DELETE FROM `creature_questender` WHERE `quest`=96772;
DELETE FROM `gameobject_questender` WHERE `quest`=96772;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (20735,96772,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (20735,96772,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (20735);

-- 95283 The Missing Kor'kron (level 53, min 48, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95283;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95283,2,15,0,95284,2,1.0,0,1.0,0,0,2097160,0,0,0,12261800583900083122,76,3,0,'The Missing Kor''kron','Speak with Nazeer Bloodspike in Brackenwall Village.','Lok-tar, $n. I find myself in need of assistance with a serious matter. 

Some time ago we dispatched a contingent of Kor''kron Elite to Dustwallow Marsh on a special mission. The problem is, we are far past their scheduled check-in with no word from them.

Head down to Brackenwall Village in Dustwallow Marsh and speak with an orc named Nazeer Bloodspike. No one is more knowledgeable about the state of Dustwallow than he. Find out what you can.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95283;
DELETE FROM `quest_template_addon` WHERE `ID`=95283;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95283,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95283;
DELETE FROM `quest_classic_level` WHERE `ID`=95283;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95283,53,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95283;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95283,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=95283;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95283,0,0,0,0,0,0,0,0,'Eitrigg sent you? What does that old wolf want?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95283;
DELETE FROM `creature_queststarter` WHERE `quest`=95283;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95283;
DELETE FROM `creature_questender` WHERE `quest`=95283;
DELETE FROM `gameobject_questender` WHERE `quest`=95283;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (3144,95283,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (4791,95283,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (3144,4791);

-- 95309 No Orc Left Behind (level 53, min 48, live build 71037); turn-in Commander Folkar inside Alcaz Prison (Wowhead lists no turn-in; the completion line is his)
DELETE FROM `quest_template` WHERE `ID`=95309;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95309,2,16620,81,0,6,1.85,0,1.0,0,0,2097160,0,0,0,12261800583900083122,76,6,0,'No Orc Left Behind','Enter the Alcaz Prison and find Commander Folkar.','Your orders are simple-- Go into the dungeons beneath the keep and find Commander Folkar. Free him if he lives, and learn what you can about what in the twisting nether is going on here.

There''s an army waiting for you down there and you won''t survive on your own. I hope you have allies... preferably strong ones.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95309;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472860,95309,0,0,0,257016,1,0,1,'Find Commander Folkar',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95309;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95309,0,0,95285);
DELETE FROM `quest_classic_money` WHERE `ID`=95309;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95309,13919,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95309;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95309,53,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95309;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95309,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=95309;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95309,0,0,0,0,0,0,0,0,'So Ulka survived and sent you in here after me? You found her surrounded by bodies? Ulka is a credit to the Kor''kron and I will see to it that she gets a field promotion when we are done here.

We can''t leave yet though. Our mission is not yet complete.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95309;
DELETE FROM `creature_queststarter` WHERE `quest`=95309;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95309;
DELETE FROM `creature_questender` WHERE `quest`=95309;
DELETE FROM `gameobject_questender` WHERE `quest`=95309;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260383,95309,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260386,95309,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260383,260386);

-- 94973 Krol'dok Moulding (level 41, min 38, live build 71037); starts from Krol'dok Moulding 267137, which already drops
DELETE FROM `quest_template` WHERE `ID`=94973;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94973,2,16842,0,94974,5,1.0,0,1.0,0,267137,36700160,0,0,0,12261800583900083122,'Krol''dok Moulding','Find someone in Rog''mar who may know about the mould.','<The moulding appears to be for a key.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94973;
DELETE FROM `quest_template_addon` WHERE `ID`=94973;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94973,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94973;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94973,5500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94973;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94973,41,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94973;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94973,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94973;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94973,0,0,0,0,0,0,0,0,'A curious find, $N. If this is from the stronghold it must be important.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94973;
DELETE FROM `creature_queststarter` WHERE `quest`=94973;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94973;
DELETE FROM `creature_questender` WHERE `quest`=94973;
DELETE FROM `gameobject_questender` WHERE `quest`=94973;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256657,94973,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256657);

-- 92065 Blackmaw Reclamation (level 60, min 47, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92065;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardChoiceItemID4`,`RewardChoiceItemQuantity4`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92065,2,16554,81,0,5,2.0,0,1.0,0,0,36700424,0,0,0,18446744073709551615,260216,1,260217,1,260218,1,260219,1,576,6,0,'Blackmaw Reclamation','Bring Varrox Bleakhoof''s Head to Gatekeeper Rageroar at Ursolan.','Will you aid us in our final battle, $r, and be a savior to the Blackmaw?

Varrox Bleakhoof, bane of the Blackmaw: a demon whose appetite for destruction will never be satisfied. His corruption consumes all that it touches. Even now, he and his underlings continue to lay waste to our burrows.

We''ve come far in our fight against the Legashi, but for the Blackmaw to ever have a future, Varrox must fall.

Find him in Blackmaw Hold, and strike him down. Only then can the Blackmaw finally be at peace.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92065;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (464115,92065,1,0,2,249692,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92065;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92065,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92065;
DELETE FROM `quest_classic_level` WHERE `ID`=92065;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92065,60,47,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92065;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92065,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=92065;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92065,0,0,0,0,0,0,0,0,'Words fail to express my gratitude, $N. 

Our struggles do not end here, as we will need much time and labor to rebuild. No doubt there will be a few remaining Legashi to rout as well. Nonetheless, you have delivered us from the brink of extinction.

The Blackmaw will remember you for generations.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92065;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92065,0,0,0,0,'My blood boils to think of the suffering we have endured by Varrox''s hand. His reign over the Legashi must come to an end.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92065;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92065;
DELETE FROM `creature_questender` WHERE `quest`=92065;
DELETE FROM `gameobject_questender` WHERE `quest`=92065;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (236573,92065,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (236573,92065,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (236573);

-- 99187 The Reliquary of Tyr (level 58, min 50, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=99187;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (99187,2,-141,81,0,6,1.75,0,1.0,0,0,8,0,0,0,12261800583900083122,286408,1,'The Reliquary of Tyr','Travel to Blackmaw Hold in Kalimdor, and recover the Reliquary of Tyr.','You may not be a Knight of Lordaeron--though perhaps you are, in a way. However, a Paladin you remain... and you know the power of an oath.

The Blackmaw are powerful totemics, and they would recognize the power of such an artifact as the Reliquary. Undoubtedly, they still possess it.

Thusly I''d ask this of you now--finish the quest I started. Return the Reliquary of Tyr here to Tirisfal Glades where it belongs. Only then will my oath be discharged, and my spirit may move on from this world.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=99187;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (479557,99187,1,0,1,286415,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=99187;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (99187,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=99187;
DELETE FROM `quest_classic_level` WHERE `ID`=99187;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (99187,58,50,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=99187;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (99187,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=99187;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (99187,0,0,0,0,0,0,0,0,'It is done. I can feel the chains that bind me to this existence loosening already. While I am now at peace, I feel that there may yet be a purpose for me to linger here... at least for a time.

You have my gratitude, $N. In life I may have named you as my enemy, but in death, I name you "brother."',71037);
DELETE FROM `quest_request_items` WHERE `ID`=99187;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (99187,0,0,0,0,'I thank you for your aid, hero.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=99187;
DELETE FROM `gameobject_queststarter` WHERE `quest`=99187;
DELETE FROM `creature_questender` WHERE `quest`=99187;
DELETE FROM `gameobject_questender` WHERE `quest`=99187;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (276110,99187,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (276110,99187,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (276110);

-- 92070 A Lost Memento (level 55, min 47, live build 71037); starts from Feathered Charm Necklace 249698, which already drops
DELETE FROM `quest_template` WHERE `ID`=92070;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92070,2,16554,81,0,5,2.0,0,1.0,0,0,36700416,0,0,0,18446744073709551615,279893,1,576,5,0,'A Lost Memento','Find the owner of the Feathered Charm Necklace.','The necklace is adorned with miscellaneous charms: scraps of feathers, acorn shells, and colorful pebbles. Its leather strap is torn. The ornamentation suggests it belonged to a Furbolg, while its small size and rough quality indicate a child''s handiwork.

There''s a chance the necklace is of some sentimental value to one of the Blackmaw. It may be good to find the owner and return it.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92070;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (464121,92070,1,0,0,249698,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92070;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92070,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92070;
DELETE FROM `quest_classic_level` WHERE `ID`=92070;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92070,55,47,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92070;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92070,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=92070;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92070,0,0,0,0,0,0,0,0,'<The furbolg snatches the necklace, barely acknowledging you. Cradling it in one paw, she runs her other paw over each charm and begins muttering.>

Oh...no. No. No! Nama would never have lost her necklace. It was her favorite. She must have...must have...no.

<Before her words nearly devolve into sobs, she composes herself.>

Thank you, $R. Better to know the truth of my cub''s fate, I suppose. But please, leave me now. I''d like to be alone.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92070;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92070,0,0,0,0,'Do you know where my cub is? Please, tell me something! Anything!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92070;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92070;
DELETE FROM `creature_questender` WHERE `quest`=92070;
DELETE FROM `gameobject_questender` WHERE `quest`=92070;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (249855,92070,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (249855);

-- 96603 Unstable Magic (level 60, min 48, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96603;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96603,2,16560,1,0,6,1.75,0,1.0,0,275730,0,0,0,0,6130900294268439629,2740,7,50000,'Unstable Magic','Bring $1oa Motes of Unstable Magic to Archmage Celindra in Dalaran.','Archmage Rhonin is presently abroad investigating a disturbance in the flow of magic across Azeroth. The Archmage has charged me with soliciting the aid of strong adventurers like yourself in gathering important field data to aid him.

Take this Arcane Censer. While afflicted by its magic, you will be able to extract motes of unstable magic from the most skilled spell casters and other singularly powerful entities you may encounter. Bring me said motes and the Kirin Tor will be in your debt.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96603;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (473686,96603,1,0,1,274964,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96603;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96603,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96603;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (96603,33900,0);
DELETE FROM `quest_classic_level` WHERE `ID`=96603;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96603,60,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96603;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96603,2,60);
DELETE FROM `quest_offer_reward` WHERE `ID`=96603;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96603,0,0,0,0,0,0,0,0,'Thank you for your service to the Kirin Tor. Please continue to bring me any other such fragments of magic you find in your travels.

Your service to the Kirin Tor will not go unnoticed.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96603;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96603,0,0,0,0,'This disturbance of magic has us all extremely concerned. So significant was the magical disruption that the arcane barrier that has protected Dalaran during our reconstruction suddenly became impossible to maintain. We have erected lesser wards, but this has still left us dangerously vulnerable.

It''s our hope that we are able to determine the cause of this disruption soon. Any help you provide in this endeavor will surely increase your standing and esteem in the eyes of the Kirin Tor.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96603;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96603;
DELETE FROM `creature_questender` WHERE `quest`=96603;
DELETE FROM `gameobject_questender` WHERE `quest`=96603;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (252085,96603,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (252085,96603,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (252085);

-- 96602 More Unstable Magic (level 58, min 48, live build 71037); follow-up of Unstable Magic, so it waits on 96603
DELETE FROM `quest_template` WHERE `ID`=96602;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96602,0,16560,0,0,0,1.0,0,1.0,0,0,0,0,0,0,18446744073709551615,2740,5,15000,'More Unstable Magic','','','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96602;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (473684,96602,1,0,0,274964,5,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96602;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96602,0,0,96603);
DELETE FROM `quest_classic_money` WHERE `ID`=96602;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (96602,6500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=96602;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96602,58,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96602;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96602,2,58);
DELETE FROM `quest_offer_reward` WHERE `ID`=96602;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96602,0,0,0,0,0,0,0,0,'Thank you for your service to the Kirin Tor. Your contributions are most welcome.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96602;
DELETE FROM `creature_queststarter` WHERE `quest`=96602;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96602;
DELETE FROM `creature_questender` WHERE `quest`=96602;
DELETE FROM `gameobject_questender` WHERE `quest`=96602;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (252085,96602,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (252085,96602,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (252085);

-- Head of Varrox Bleakhoof: the boss's own head for Blackmaw Reclamation, party loot on live (every member with the
-- quest loots one). The 4.51 rate was drops over all kills, most of them by players without the quest.
UPDATE `creature_loot_template` SET `Chance`=100, `Comment`='Varrox Bleakhoof: Head of Varrox Bleakhoof (Blackmaw Reclamation), party loot, every kill while on the quest' WHERE `Entry`=247234 AND `Item`=249692;
