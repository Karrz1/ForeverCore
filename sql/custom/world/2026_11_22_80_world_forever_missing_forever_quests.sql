-- WoW Forever: Forever quests players do on the live realm that our world did not have at all (Riverglades, Powderfuse
-- Port, Shen'dralas, Booty Bay and others). Full live record: title, story, objective line, levels, races, flags, objectives
-- with their live ids, item/choice/reputation/money rewards, start item, next quest, and the giver's progress and reward lines.
-- Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/).
-- Source: github.com/JIVESCORP/eg-link-output-wowf quests.enUS and texts.enUS (players' quest caches and the lines the
-- givers said), npcs (who offered and took each quest). Changed: picked and converted to our tables.
-- Who starts and ends each quest is also checked on Wowhead Forever where EG Link has no record of it.
-- Only quests whose giver, turn-in and every objective target exist and are spawned in our world are here.
-- Previous-quest locks are not set (no source we may use has them yet). Safe to run again: every row is replaced by key.

-- 98069 Stolen Freewind Supplies (level 30, min 25, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=98069;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (98069,2,400,0,0,5,1.0,0,1.0,0,0,8,0,0,0,12261800583900083122,81,5,0,'Stolen Freewind Supplies','Bring 8 Stolen Freewind Supplies to Jandia in Freewind Post.','Those wretched harpies! They attacked the last caravan I had scheduled to deliver supplies to Freewind Post. We have enough supplies for the moment, but without more supplies, we''ll run short soon.

I''m not sure what the harpies plan to do with the extra supplies, but I would be grateful if you would recover them for me. They make their lair west of here. They can be found both at the base of the cliffside and inside a cave at the top.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=98069;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (476828,98069,1,0,1,279383,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=98069;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (98069,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=98069;
DELETE FROM `quest_classic_level` WHERE `ID`=98069;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (98069,30,25,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=98069;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (98069,2,30);
DELETE FROM `quest_offer_reward` WHERE `ID`=98069;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (98069,0,0,0,0,0,0,0,0,'Thank you, $N. These supplies will help get us through until the next shipment arrives.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=98069;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (98069,0,0,0,0,'Have you been able to recover the supplies the harpies stole?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=98069;
DELETE FROM `gameobject_queststarter` WHERE `quest`=98069;
DELETE FROM `creature_questender` WHERE `quest`=98069;
DELETE FROM `gameobject_questender` WHERE `quest`=98069;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (4877,98069,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (4877,98069,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (4877);

-- 97328 Anything of Value (level 35, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97328;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97328,2,33,0,97332,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Anything of Value','Recover $1oa Stolen Shipments from the Ruins of Zul''Kunda in Stranglethorn Vale and return your haul to someone in Booty Bay.','<As you sift through the debris left behind by a horrible zeppelin crash directly above, you find evidence of a hefty shipment of supplies that has long since been plundered of all its value. Even the shipping labels have been torn and shredded, leaving only the words ''Booty Bay'' barely legible on one.

Countless two-toed footprints and several patches of divotted earth all lead toward ruins in the northwest.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97328;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475815,97328,1,0,0,277953,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97328;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97328,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97328;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (97328,1800,0);
DELETE FROM `quest_classic_level` WHERE `ID`=97328;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97328,35,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97328;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97328,2,35);
DELETE FROM `quest_offer_reward` WHERE `ID`=97328;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97328,0,0,0,0,0,0,0,0,'You say that all this fell off a zeppelin crash up at the northern side of the jungle, and Bloodscalp trolls had their hands on it? This was supposed to arrive at Powderfuse Port SIX WEEKS ago! We even struck a deal with Grom''gol to use their zeppelin tower for expedited shipping!

I wondered why Whizzbuzz has been sending me snarky letters. We should have never let Zimmix behind the wheel after what happened the last time.

Great. Just great. Take this and leave, I have insurance claims to file.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97328;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97328,0,0,0,0,'You look confused. Lost?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97328;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97328;
DELETE FROM `creature_questender` WHERE `quest`=97328;
DELETE FROM `gameobject_questender` WHERE `quest`=97328;
INSERT INTO `gameobject_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (661516,97328,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (4631,97328,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (4631);

-- 95261 It Takes Guts (level 42, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95261;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95261,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,2827,5,0,'It Takes Guts','Collect $1oa Beast Entrails and $2oa Rotflesh Mushrooms for Argo Brinewhistle.','That monster...with the long neck, just like you said. I''ve seen ''im around those islands -- out on my boat. I tried <hic> tellin'' folks, but ohh nooo, you can''t <hic> believe ol'' Argo. He''s just some...some...drunkard fisherman! Makin'' up stories!

We''ll show ''em...soon as I get some bait...

Hey! Quit standin'' around! I''m gonna need entrails, a LOT of ''em. Any beast from around here. The smellier <hic> the better. I''m also gonna need some Rotflesh mushrooms. Those grow in that cave by Windstead.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95261;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470197,95261,1,0,0,268632,15,0,1,NULL,71037),(470208,95261,1,1,1,268664,8,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95261;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95261,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95261;
DELETE FROM `quest_classic_level` WHERE `ID`=95261;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95261,42,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95261;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95261,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=95261;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95261,0,0,0,0,0,0,0,0,'<Argo throws a hand over his mouth in reaction to the smell.>

Ugh...great work skipper. Now <hic> put those away before I get sick again...',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95261;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95261,0,0,0,0,'When we catch that thing...oh ho...no one''ll be laughing at ol'' Argo then!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95261;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95261;
DELETE FROM `creature_questender` WHERE `quest`=95261;
DELETE FROM `gameobject_questender` WHERE `quest`=95261;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260231,95261,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260231,95261,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260231);

-- 92519 Ward Restocking (level 36, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92519;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92519,2,45,0,0,5,1.0,0,1.0,0,0,768,0,0,0,12261800583900083122,'Ward Restocking','Pick up a case of Packaged Tonics at Jorell''s lab in Go''shek Farm and return to Doctor Gregory Victor in Hammerfall.','Apothecary Jorell was supposed to bring us a case of antidotes and elixirs days ago, but we''re still empty handed. That fool has probably poisoned himself again by brewing in that poorly-ventilated shack he calls his lab.

If you want to further help our ward, you would be a far more reliable individual for this job.

Follow the road to Go''shek farm, south and a bit west of here. You''ll likely find it packed and ready to go, with Jorell either missing or unconcerned with his obligations.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92519;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (464921,92519,1,0,0,278462,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92519;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92519,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92519;
DELETE FROM `quest_classic_level` WHERE `ID`=92519;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92519,36,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92519;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92519,2,36);
DELETE FROM `quest_offer_reward` WHERE `ID`=92519;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92519,0,0,0,0,0,0,0,0,'No broken bottles? Yes, you certainly are a better choice for this than Jorell''s lackeys.

We''ll be able to use these to manage the ills of our patients a while longer.

Since you''ve proved that you are a natural to field work, I understand injuries come with the territory. Have your choice of the supplies, at least you''ll make use of them.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92519;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92519,0,0,0,0,'If you can get them something for the pain, you can have some of these patients back out the door as fast as they walk in.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92519;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92519;
DELETE FROM `creature_questender` WHERE `quest`=92519;
DELETE FROM `gameobject_questender` WHERE `quest`=92519;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (12920,92519,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (12920,92519,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (12920);

-- 97329 Where's the Key? (level 35, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97329;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97329,2,33,0,97331,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Where''s the Key?','Bring the Primitive Key obtained from the trolls at the Ruins of Zul''kunda in Stranglethorn Vale to Zimmix Sputterspark.','You! Yes, you! Come here, keep your voice down!

I screwed up big time. I managed to secure a sweet deal for Booty Bay to use their zeppelin tower for expedited deliveries and on our very first route I saw a huge bird--err, got SHOT DOWN just to the east of here!

I survived the crash, unfortunately, but before I woke up, I was already being dragged by my ears! Now I''m surrounded by bloodthirsty trolls and locked in a cage!

Look, I just need the key, okay? I can escape on my own.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97329;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475819,97329,1,0,0,277957,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97329;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97329,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97329;
DELETE FROM `quest_classic_level` WHERE `ID`=97329;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97329,35,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97329;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97329,2,35);
DELETE FROM `quest_offer_reward` WHERE `ID`=97329;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97329,0,0,0,0,0,0,0,0,'Is that the key?

<Zimmix lunges forward against the front of the cage and he repeatedly attempts to swipe the key from your possession.>

Just hand it over!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97329;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97329,0,0,0,0,'Listen, I like you and all, but you standing around here is making us look suspicious! If you don''t have the key then, I dunno, GO GET IT!

Please?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97329;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97329;
DELETE FROM `creature_questender` WHERE `quest`=97329;
DELETE FROM `gameobject_questender` WHERE `quest`=97329;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (268992,97329,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (268992,97329,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (268992);

-- 95144 Overseas Delivery (level 38, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95144;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95144,2,440,0,0,1,1.0,0,1.0,0,276065,33554432,0,0,0,18446744073709551615,72,4,0,276065,1,'Overseas Delivery','Deliver Fizzgrimble''s Mysterious Crate to Friz Frazzlespark at Powderfuse Port in the Riverglades.','Hey, bub. Got a package that needs to go to an old friend of mine. Whatever you do--

DO NOT OPEN THE PACKAGE!

Take this--carefully--to Friz Frazzlespark across the seas over to our sister port in the Riverglades. And before you ask, no I would not suggest swimming. Didn''t work out so well for the last guy. Oh, and don''t tilt it, shake it, or make any sudden movements.

I recommend heading east to Steamwheedle Port. The ship from there usually provides safe passage.

Best of luck to ya!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95144;
DELETE FROM `quest_template_addon` WHERE `ID`=95144;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95144,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95144;
DELETE FROM `quest_classic_level` WHERE `ID`=95144;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95144,38,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95144;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95144,2,38);
DELETE FROM `quest_offer_reward` WHERE `ID`=95144;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95144,0,0,0,0,0,0,0,0,'A package from my old pal, Fizzgrimble? Just what I''ve been waitin'' for!

You didn''t shake this, tilt it or make any sudden movements while carrying it, did you?

Would you mind turning around while I take a look inside? I wouldn''t want you spoiling the surprise.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95144;
DELETE FROM `creature_queststarter` WHERE `quest`=95144;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95144;
DELETE FROM `creature_questender` WHERE `quest`=95144;
DELETE FROM `gameobject_questender` WHERE `quest`=95144;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (7733,95144,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (255897,95144,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (7733,255897);

-- 97196 The Coldbringer's Eye (level 41, min 34, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97196;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97196,2,722,81,0,6,2.1,0,1.0,0,0,8,0,0,0,12261800583900083122,2787,5,30000,81,6,0,'The Coldbringer''s Eye','Recover The Coldbringer''s Eye from Razorfen Downs.','There is a servant of the Lich King that makes his home deep in the Death''s Head quilboar lair known as Razorfen Downs. It is known to us that he makes use of a scrying orb to observe and direct the movements of his minions elsewhere.

With this artifact, we''d be able to hunt down the covert agents of the Scourge and put an end to them and the threat they pose to Kalimdor forever.

Go into Razorfen Downs to the lair of Amnennar the Coldbringer and retrieve the orb known as the Coldbringer''s Eye for me.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97196;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475472,97196,1,0,0,276916,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97196;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97196,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97196;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (97196,5500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=97196;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97196,41,34,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97196;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97196,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=97196;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97196,0,0,0,0,0,0,0,0,'This will do nicely. We''ve deprived our enemies of an important tool, and equipped ourselves with a powerful weapon to use against the Scourge.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97196;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97196,0,0,0,0,'The Death''s Head quilboar have been a constant thorn in our side for years, due in no small part to machinations of that accursed Lich.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97196;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97196;
DELETE FROM `creature_questender` WHERE `quest`=97196;
DELETE FROM `gameobject_questender` WHERE `quest`=97196;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (264078,97196,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (264078,97196,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (264078);

-- 93787 Food for the Taking (level 36, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93787;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93787,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,'Food for the Taking','Steal $1oa Feed Satchels from the Alliance farm in Meadowsbrook then return to Krom''rosh.','Humans within these lands have long enjoyed the warmth, comfort and sustenance these lands provide. It''s time we start denying these humans such pleasantries.

Seek out the supplies of our enemies at the farm to the southwest. Take whatever you find.

It won''t bring pleasure like bloodying a blade, but slowing them buys us time to plan our next move.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93787;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (467477,93787,1,0,1,262640,6,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93787;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (93787,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93787;
DELETE FROM `quest_classic_level` WHERE `ID`=93787;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93787,36,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93787;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93787,2,36);
DELETE FROM `quest_offer_reward` WHERE `ID`=93787;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93787,0,0,0,0,0,0,0,0,'Smells of earth and root, yes? Not pleasant, but we do what we must to survive.

Throwing this into a boiling cauldron with fish and wild grass makes the pains of hunger retreat like cowardly human dogs.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93787;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93787,0,0,0,0,'Returned with our supplies?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=93787;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93787;
DELETE FROM `creature_questender` WHERE `quest`=93787;
DELETE FROM `gameobject_questender` WHERE `quest`=93787;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256418,93787,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256418,93787,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256418);

-- 95295 I Know a Guy (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95295;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95295,2,16591,0,95322,1,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,2827,1,0,'I Know a Guy','Speak to Friz''s contact in Booty Bay.','Ya did good with those pirates, lackey. But here''s a lesson for ya you may want to remember. What some may call a pirate, others call a freebooter. And you can''t spell freebooter without free booty. And there''s no better place for free booty than Booty Bay!

<Friz waits for your reply.>

Keep up with me here, kid. I''m sayin'' I need you to go to Booty Bay to meet with my contact. He gets goods from the local pirates there-- err, freebooters. Look, just go find Ruzzgot. He''ll explain the rest.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95295;
DELETE FROM `quest_template_addon` WHERE `ID`=95295;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95295,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95295;
DELETE FROM `quest_classic_level` WHERE `ID`=95295;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95295,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95295;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95295,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95295;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95295,0,0,0,0,0,0,0,0,'It''s not every day we get a visitor from Powderfuse Port. That''s no small trek!

I''m guessin'' if you came all the way out here on your own you ain''t in much caravannin'' needs, eh? Who sent you, then? Friz?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95295;
DELETE FROM `creature_queststarter` WHERE `quest`=95295;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95295;
DELETE FROM `creature_questender` WHERE `quest`=95295;
DELETE FROM `gameobject_questender` WHERE `quest`=95295;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (255897,95295,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (3945,95295,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (3945,255897);

-- 92914 Strange Pylons (level 43, min 35, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92914;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92914,2,16651,0,96010,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Strange Pylons','Explore Shen''dralas in an effort to find other pylons like the one you found.','<You approach the strange crystal, guarded mere moments ago by emaciated mana elementals.

Its pedestal, though ancient, is noticeably less dilapidated than the elven ruins it is built upon.

A weak hum of power radiates from the fractured gemstone, but with its magic so heavily depleted its purpose will ultimately remain a mystery for the time being.

Perhaps there is more to discover nearby.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92914;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (465811,92914,19,0,0,39990,0,0,1,'Western pylon found',71037),(465812,92914,19,1,1,39991,0,0,1,'Eastern pylon found',71037),(465813,92914,19,2,2,39992,0,0,1,'Temple pylon found',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92914;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92914,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92914;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (92914,3000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=92914;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92914,43,35,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92914;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92914,2,43);
DELETE FROM `quest_offer_reward` WHERE `ID`=92914;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92914,0,0,0,0,0,0,0,0,'To hear that the crystal within the temple shines brightly is an immense weight off my shoulders. I was worried that the centaur had breached the temple grounds now, too. It would seem they continue to be off-put by what''s inside.

As for the other pylons, if elementals are still standing vigilant over them, then they are quite capable of being restored.

I hope the temple''s denizens didn''t frighten you. They are friendly enough, just bitter. Understandably bitter.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92914;
DELETE FROM `creature_queststarter` WHERE `quest`=92914;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92914;
DELETE FROM `creature_questender` WHERE `quest`=92914;
DELETE FROM `gameobject_questender` WHERE `quest`=92914;
INSERT INTO `gameobject_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (577959,92914,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (253471,92914,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (253471);

-- 95748 The Gurubashi Legends of Old (level 40, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95748;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95748,2,33,0,0,5,1.0,0,1.0,0,0,33554696,0,0,0,12261800583900083122,530,5,0,76,4,0,'The Gurubashi Legends of Old','Use the hide and charcoal to create a rubbing of the Third Troll Legend tablet.','This is odd. This piece of the tablet you have brought me refers to the lost city of I''lalai as if it is a massive sprawling civilization. But the ruins off of the reef are not large enough to be something of that size.

$n, to the north of the Vile Reef there is an ancient troll ruin on the hills along the coast. A tablet that contains legends of the lost troll city is within. I wish to study this legend further.

Take this hide and charcoal to create a rubbing of this tablet, then return to me.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95748;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471188,95748,1,0,2,2007,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95748;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95748,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95748;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95748,5000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95748;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95748,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95748;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95748,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95748;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95748,0,0,0,0,0,0,0,0,'Excellent, this is exactly what I need. I have read this tablet before, but that was when I was a young troll. It''s been many moons since then and my memory is not what it used to be.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95748;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95748,0,0,0,0,'Have you found the tablet?

I hope the Bloodscalp didn''t give you too much trouble. If they did, I hope you killed them for it.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95748;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95748;
DELETE FROM `creature_questender` WHERE `quest`=95748;
DELETE FROM `gameobject_questender` WHERE `quest`=95748;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2519,95748,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2519,95748,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2519);

-- 97884 Armory of Sunnyglade (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97884;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97884,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,280943,1,68,5,0,'Armory of Sunnyglade','Travel to Sunnyglade in the Riverglades and recover the tome of Tremayne Family Blacksmithing Techniques.','You look like a healthy, able-bodied $r. I am looking for someone to travel to Sunnyglade, in the Riverglades just north of the Redridge Mountains.

My family owned an armory there, once. Now I imagine it is a burnt husk, but I would have you retrieve a tome containing my family''s ancestral armor crafting techniques. It was originally in the basement, so hopefully it has not succumbed to the elements just yet.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97884;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (476439,97884,1,0,0,278868,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97884;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97884,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97884;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (97884,5000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=97884;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97884,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97884;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97884,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=97884;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97884,0,0,0,0,0,0,0,0,'Thank you, $c. I very much doubt I would have survived the journey or destination, considering the state you say Sunnyglade is in now.

This tome is exactly what I needed. I am happy to say all of the pages are here as well.

Perhaps I can learn a new trade in undeath. It would give me a skill to hone for the rest of my unlife, at least.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97884;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97884,0,0,0,0,'Ah, you have returned. Were you successful in recovering my family''s tome? What state is Sunnyglade in?

The last time I laid eyes on my old town, it was being burnt to ash.

I joined the Stormwind army and traveled all the way up here to Lordaeron and died in the second war, so I never had a chance to return. I heard of efforts to rebuild Sunnyglade but I am not sure they ever were able to.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97884;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97884;
DELETE FROM `creature_questender` WHERE `quest`=97884;
DELETE FROM `gameobject_questender` WHERE `quest`=97884;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (5819,97884,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (5819,97884,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (5819);

-- 95124 Admiral Lamora (level 45, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95124;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95124,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,2827,6,0,'Admiral Lamora','Slay Admiral Lamora, locate his stash of loot, and return it to Wharfmaster Whizzbuzz.','Now it''s time to go after the big man himself: Admiral Lamora. Obviously, I want him dead, but I need a little something extra from him too.

Seeing how all his plundering has been costing me a fortune, I figure it''s only right that I recoup some losses.

Lamora''s on one of the Eastsea''s boats northeast of here. Find out which and where on it he''s keeping his loot. Bring me whatever he''s got. If it''s locked up, he''s likely got the key on him.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95124;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469875,95124,0,0,1,257861,1,0,1,NULL,71037),(470103,95124,1,1,0,268506,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95124;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95124,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95124;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95124,6500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95124;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95124,45,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95124;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95124,2,45);
DELETE FROM `quest_offer_reward` WHERE `ID`=95124;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95124,0,0,0,0,0,0,0,0,'I''ll be honest, I wasn''t sure you''d survive a tangle with Lamora. Guess you''re the real deal!

If you ever need a favor you can call on ol'' Whizzbuzz. Heck, I might call on you for one too if I need it!

<Wharfmaster Whizzbuzz gives you a wink and a crooked grin.>',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95124;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95124,0,0,0,0,'Killing Lamora is about getting even. Stealing back his loot is about breaking even.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95124;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95124;
DELETE FROM `creature_questender` WHERE `quest`=95124;
DELETE FROM `gameobject_questender` WHERE `quest`=95124;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259961,95124,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259961,95124,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (259961);

-- 96108 Poison Tips (level 40, min 36, live build 70959)
DELETE FROM `quest_template` WHERE `ID`=96108;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96108,2,16591,0,96109,4,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,'Poison Tips','Bring 4 samples of Glade Viper Venom to Neza Bloodsnout at Rog''mar.','Arrows are always essential, but sometimes you need something more potent to take down your prey.

This is where poison coatings come into play. They ruin the meat, but if you need something dead, they do the job.

Poisons can either be brewed or, if you are brave, gathered. You strike me as the latter.

The vipers by the pools to the south produce a powerful venom. If I have estimated you correctly, I think you could collect some of it.','','',70959);
DELETE FROM `quest_objectives` WHERE `QuestID`=96108;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472324,96108,1,0,0,271776,4,0,1,NULL,70959);
DELETE FROM `quest_template_addon` WHERE `ID`=96108;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96108,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96108;
DELETE FROM `quest_classic_level` WHERE `ID`=96108;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96108,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96108;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96108,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=96108;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96108,0,0,0,0,0,0,0,0,'This is enough venom to kill a kodo in minutes--or a human in seconds. In either case, I am eager to put it to use.',70959);
DELETE FROM `quest_request_items` WHERE `ID`=96108;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96108,0,0,0,0,'Be careful while gathering the vipers'' venom that you do not succumb to it yourself.',70959);
DELETE FROM `creature_queststarter` WHERE `quest`=96108;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96108;
DELETE FROM `creature_questender` WHERE `quest`=96108;
DELETE FROM `gameobject_questender` WHERE `quest`=96108;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258031,96108,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (258031,96108,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (258031);

-- 96104 Song of the Strider (level 39, min 36, live build 70959)
DELETE FROM `quest_template` WHERE `ID`=96104;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96104,2,16591,0,96105,5,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,'Song of the Strider','Bring an Intact Tallstrider Beak to Neza Bloodsnout at Rog''mar.','These markings are from a lion. By the look of them, this one is especially large--the leader of the nearby pride.

I would gladly hunt the beast myself, but you have first claim. Instead, I will aid you.

I can make a whistle that mimics the call of a wounded tallstrider. You can use it to lure the lion out. I''ll just need one of their beaks to give it the right sound.

There are tallstriders all over the plains. Find me a beak and the hunt can begin!','','',70959);
DELETE FROM `quest_objectives` WHERE `QuestID`=96104;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472307,96104,1,0,1,271778,1,0,1,NULL,70959);
DELETE FROM `quest_template_addon` WHERE `ID`=96104;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96104,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96104;
DELETE FROM `quest_classic_level` WHERE `ID`=96104;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96104,39,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96104;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96104,2,39);
DELETE FROM `quest_offer_reward` WHERE `ID`=96104;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96104,0,0,0,0,0,0,0,0,'Good find, $c. I will only need a moment to carve this into the proper shape.',70959);
DELETE FROM `quest_request_items` WHERE `ID`=96104;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96104,0,0,0,0,'I have been making whistles and animal calls since I was young. It is a useful skill when hunting certain prey.',70959);
DELETE FROM `creature_queststarter` WHERE `quest`=96104;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96104;
DELETE FROM `creature_questender` WHERE `quest`=96104;
DELETE FROM `gameobject_questender` WHERE `quest`=96104;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258031,96104,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (258031,96104,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (258031);

-- 96109 A Hunter's Quiver (level 40, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96109;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96109,2,16591,0,0,5,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,274926,1,'A Hunter''s Quiver','Gather 6 Prized Lion Hides for Neza Bloodsnout at Rog''mar.','As important as a hunter''s weapons is her quiver. A good quiver holds many arrows, while not being so large as to slow the wearer down. It must be durable, and fit snugly onto the body.

Around here, there is no better material for a quiver than the pelts of lions. They are already well-suited for the life of a hunter on the plains.

The lions gather on a hill to the south. You can see it from here. Please, bring me their pelts.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96109;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472325,96109,1,0,1,266888,6,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96109;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96109,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96109;
DELETE FROM `quest_classic_level` WHERE `ID`=96109;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96109,40,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96109;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96109,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=96109;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96109,0,0,0,0,0,0,0,0,'Arrows, poison, and a quiver to hold it all. You have made quite the hunter''s kit here.

Please, take something in exchange for your labor. May it serve you well out in the field.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96109;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (96109,0,0,0,0,'Like us, the lions hunt in packs. Be on your guard, and make sure you are not surrounded.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=96109;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96109;
DELETE FROM `creature_questender` WHERE `quest`=96109;
DELETE FROM `gameobject_questender` WHERE `quest`=96109;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258031,96109,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (258031,96109,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (258031);

-- 96078 A Tale Spun Around the Fire (level 40, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=96078;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96078,2,33,0,0,4,1.0,0,1.0,0,0,33554696,0,0,0,12261800583900083122,270312,1,270313,1,279885,1,279886,1,279887,1,530,6,0,76,3,0,'A Tale Spun Around the Fire','Take the tablet etchings to Master Gadrin in Sen''jin Village in Durotar.','$n, we Darkspear keep much of our traditions alive by oral storytelling. We pass legends such as these to the next generation, teaching lessons and weaving cautionary tales to our younglings.

These etchings must be taken to our spiritual leader, Master Gadrin in Sen''jin Village. He is one of the wisest Darkspear and he will wish to hear the truth of this tale.

I have prepared an extra copy of this tale for you as well. If you ever lose your copy, I would be happy to create another, for a small fee.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96078;
DELETE FROM `quest_template_addon` WHERE `ID`=96078;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96078,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=96078;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (96078,3500,0);
DELETE FROM `quest_classic_level` WHERE `ID`=96078;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96078,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96078;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96078,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=96078;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96078,0,0,0,0,0,0,0,0,'<Master Gadrin listens closely as you explain your journey and how you came to possess the I''lalai tablet etchings.>

It was good of Kin''Weelay to send you here. I am grateful he has taken such a strong interest in preserving and discovering parts of our ancestral heritage we have lost over the centuries. We Darkspear didn''t break from the Gurubashi that long ago, in the grand scheme of things, you know.

Anyway, Kin''weelay asked me to give this to you, as thanks for all your efforts this day.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96078;
DELETE FROM `creature_queststarter` WHERE `quest`=96078;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96078;
DELETE FROM `creature_questender` WHERE `quest`=96078;
DELETE FROM `gameobject_questender` WHERE `quest`=96078;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2519,96078,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (3188,96078,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2519,3188);

-- 94668 Bloodmaster's Ring (level 41, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94668;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94668,2,16591,0,94669,1,1.0,0,1.0,0,0,3145736,0,0,0,12261800583900083122,2782,1,0,'Bloodmaster''s Ring','Report to Jezap at the Bloodmaster''s Ring.','You smashed weak Twilight ogres. But they weak.

Today you show Bloodmaster and little goblin friend you belong.

Tomorrow, maybe we meet again if you still breathing.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94668;
DELETE FROM `quest_template_addon` WHERE `ID`=94668;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94668,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94668;
DELETE FROM `quest_classic_level` WHERE `ID`=94668;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94668,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94668;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94668,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94668;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94668,0,0,0,0,0,0,0,0,'Hey, hey! Look what we got here. Another victim...er entrant lookin'' to prove themselves at the precipice of power!

Well step right up, bub. Today''s your lucky day... or not.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94668;
DELETE FROM `creature_queststarter` WHERE `quest`=94668;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94668;
DELETE FROM `creature_questender` WHERE `quest`=94668;
DELETE FROM `gameobject_questender` WHERE `quest`=94668;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (255829,94668,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94668,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (255829,257062);

-- 94975 A Token of Vengeance (level 42, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94975;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94975,2,16842,81,0,5,2.375,0,1.0,0,0,36700168,0,0,0,12261800583900083122,267090,1,'A Token of Vengeance','Collect $1oa Cultist Ears from the Twilight''s Hammer in Krol''dok Stronghold.','Our work here is not finished, $n. These cultists have inflicted unimaginable pain upon our allies and rendered these lands for their taking.

We will not tolerate these actions any longer.

To the north lies a hidden cave network, masked by the rugged terrain. Our scouts spoke of cultist movement under the veil of darkness.

Seek out this cave and find where these cultists are hiding. It''s time we deliver a message they won''t soon forget.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94975;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469490,94975,1,0,0,267091,15,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94975;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94975,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94975;
DELETE FROM `quest_classic_level` WHERE `ID`=94975;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94975,42,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94975;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94975,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=94975;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94975,0,0,0,0,0,0,0,0,'A gift from our enemies, bestowed upon you.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94975;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94975,0,0,0,0,'Vengeance is best born of blood.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94975;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94975;
DELETE FROM `creature_questender` WHERE `quest`=94975;
DELETE FROM `gameobject_questender` WHERE `quest`=94975;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258570,94975,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (258570,94975,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (258570);

-- 95955 Stick 'Em (level 39, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95955;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95955,2,16591,0,95913,5,1.0,0,1.0,0,271639,36700160,0,0,0,12261800583900083122,271639,1,'Stick ''Em','Impale $1oa Freshwater Crocolisks then return to Tran''jani in Rog''mar.','You got de spears, now ya gonna learn how to throw dem.

De Riverglades be full o'' crocolisks. Nasty tings. Snap you up if ya ain''t quick. Perfect for target practice, heheh.

Go stick yourself a bunch of dem. Den you come back to ol'' Tran''jani for ya prize. If ya can stick a crocolisk, ya can stick any''ting.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95955;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471711,95955,0,0,1,263190,10,0,1,'Freshwater Crocolisk impaled',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95955;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95955,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95955;
DELETE FROM `quest_classic_level` WHERE `ID`=95955;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95955,39,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95955;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95955,2,39);
DELETE FROM `quest_offer_reward` WHERE `ID`=95955;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95955,0,0,0,0,0,0,0,0,'Impressive work, mon. Ya got de makin''s of a real headhunter in ya. Just remember ol'' Tan''jani when ya make it big, haha!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95955;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95955,0,0,0,0,'Ya find dem crocolisks along de rivers. Just don''t get too close to dem, now. Heheheh.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95955;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95955;
DELETE FROM `creature_questender` WHERE `quest`=95955;
DELETE FROM `gameobject_questender` WHERE `quest`=95955;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263190,95955,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263190,95955,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (263190);

-- 94768 Bring Me His Head (level 46, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94768;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94768,2,16591,1,0,6,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,275050,1,275051,1,'Bring Me His Head','Defeat Overlord Kilgar within the Twilight''s Shroud and bring his head to Da''grosh.','Tran''gul''s notes pointed to a leader of this Twilight''s Hammer presence somewhere in that fortress. With my warriors free and the cult''s numbers in disarray, now is the time to pierce the heart of this infestation.

Return to the Twilight''s Shroud and enter their Stronghold. That is where you will find Overlord Kilgar. That is where we will exact our revenge.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94768;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469122,94768,1,0,2,265837,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94768;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94768,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94768;
DELETE FROM `quest_classic_level` WHERE `ID`=94768;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94768,46,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94768;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94768,2,46);
DELETE FROM `quest_offer_reward` WHERE `ID`=94768;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94768,0,0,0,0,0,0,0,0,'I would have loved to see the look on Kilgar''s face when you showed him just how exposed he truly was.

And now I can.

<Da''grosh laughs as he tosses Kilgar''s head into the dirt.>',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94768;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94768,0,0,0,0,'The coward is sure to be hiding deep within his stronghold. Bring me his head that we may put an end to this blight.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94768;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94768;
DELETE FROM `creature_questender` WHERE `quest`=94768;
DELETE FROM `gameobject_questender` WHERE `quest`=94768;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (258570,94768,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (258570,94768,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (258570);

-- 94972 Tome of Twilight (level 44, min 39, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94972;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94972,2,16842,81,0,6,2.375,0,1.0,0,0,36700168,0,0,0,12261800583900083122,279859,1,279860,1,'Tome of Twilight','Recover the Tome of Twilight from Krol''dok Stronghold.','With their location revealed, it is likely that within this stronghold are secrets kept well hidden from those we have encountered thus far. It would be wise for us to locate and recover any information that may be of use to our fight against these cultists.

See what you can uncover, $n. I await your return.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94972;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469483,94972,1,0,0,267104,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94972;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94972,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94972;
DELETE FROM `quest_classic_level` WHERE `ID`=94972;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94972,44,39,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94972;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94972,2,44);
DELETE FROM `quest_offer_reward` WHERE `ID`=94972;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94972,0,0,0,0,0,0,0,0,'As I suspected, magic bindings and a shadow cipher. It will take time to unlock the secrets within.

Nevertheless, your work has been of great help, $N. I will begin my work at once.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94972;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94972,0,0,0,0,'Find anything of interest?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94972;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94972;
DELETE FROM `creature_questender` WHERE `quest`=94972;
DELETE FROM `gameobject_questender` WHERE `quest`=94972;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256710,94972,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256710,94972,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256710);

-- 95425 Unworthy Champion (level 42, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95425;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95425,2,16591,0,95417,5,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,2782,5,0,'Unworthy Champion','Collect Skullthumper from Klunk for Clugfist in Bolder''ok.','Klunk once Clugfist''s greatest champion. Him strong. Me give Klunk mighty weapon.

But Clugfist wrong. Klunk weak like others. He leave Bolder''ok. Return to Twilight''s Hammer. Take ogres with him to cave east to water. Take mighty weapon with him!

That Clugfist weapon! Bash Klunk''s skull and take back Skullbasher. He nobody''s champion!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95425;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470558,95425,1,0,0,269257,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95425;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95425,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95425;
DELETE FROM `quest_classic_level` WHERE `ID`=95425;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95425,42,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95425;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95425,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=95425;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95425,0,0,0,0,0,0,0,0,'Skullbasher belong to real ogre. Someday Clugfist pick new champion.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95425;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95425,0,0,0,0,'What you want? Bring Skullbasher now!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95425;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95425;
DELETE FROM `creature_questender` WHERE `quest`=95425;
DELETE FROM `gameobject_questender` WHERE `quest`=95425;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (255829,95425,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (255829,95425,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (255829);

-- 94669 Pay to Play (level 41, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94669;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94669,2,16591,0,94670,1,1.0,0,1.0,0,0,3145736,0,0,0,12261800583900083122,2782,1,0,'Pay to Play','Pay the safety deposit to qualify for the Bloodmaster''s Ring.','First things first. I''m gonna need a deposit for your, uh... safety.

Look, I don''t make the rules here. It''s required.

Now if you should choose not to pay I''ll be forced to tell old Clugfist our new friend wasn''t so keen on proving their strength to our warm, welcoming friends here.

That would be a real shame. Catch my drift, bub?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94669;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469050,94669,8,0,-1,0,10000,0,1,'Safety deposit paid',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94669;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94669,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94669;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94669,-10000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94669;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94669,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94669;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94669,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94669;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94669,0,0,0,0,0,0,0,0,'A very wise choice.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94669;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94669,0,0,0,0,'So, what''ll it be?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94669;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94669;
DELETE FROM `creature_questender` WHERE `quest`=94669;
DELETE FROM `gameobject_questender` WHERE `quest`=94669;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94669,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94669,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257062);

-- 94968 Eye of Mugg (level 45, min 40, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94968;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94968,2,16842,81,0,6,2.375,0,1.0,0,0,36700168,0,0,0,12261800583900083122,279852,1,279480,1,279853,1,'Eye of Mugg','Infiltrate Krol''dok Stronghold and return to Krom''rosh with proof of their leader''s demise.','Of the few that managed to infiltrate the cave, most have perished. It seems these Twilight have a foothold much larger than we thought. We will not stand by while these cultists continue to ravage these lands and make sacrifices of our allies. We end this now, $n.

Infiltrate this stronghold, slaughter their forces and bring me proof of their leader''s demise.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94968;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (469477,94968,1,0,0,267086,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94968;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94968,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94968;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (94968,13000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=94968;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94968,45,40,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94968;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94968,2,45);
DELETE FROM `quest_offer_reward` WHERE `ID`=94968;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94968,0,0,0,0,0,0,0,0,'Let this serve as our message.

Lok''tar!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94968;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (94968,0,0,0,0,'Has the leader been located?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=94968;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94968;
DELETE FROM `creature_questender` WHERE `quest`=94968;
DELETE FROM `gameobject_questender` WHERE `quest`=94968;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (256418,94968,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (256418,94968,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (256418);

-- 95770 Locating the Lost City (level 40, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95770;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95770,2,33,0,0,5,1.0,0,1.0,0,0,33554696,0,0,0,12261800583900083122,530,5,0,76,4,0,'Locating the Lost City','Explore the Vile Reef and find the cavern entrance.','After rereading the legend, it doesn''t seem like we are in the wrong place for the lost city, but perhaps there is yet some detail that has been overlooked.

In my younger years I used to dive in the Vile Reef ruins, but that was before the murlocs settled there. If memory serves there was a cavern there.

I have heard that there are now naga gathering in that region, which is unusual. I want to know what has lured them there.

Go and explore just west of the Vile Reef and return to me with any news.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95770;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471235,95770,19,0,4,42153,0,0,1,'Find the Drowned City Entrance',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95770;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95770,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95770;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95770,5000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95770;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95770,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95770;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95770,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95770;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95770,0,0,0,0,0,0,0,0,'<Kin''weelay listens intently as you describe what you have seen.>

You are sure you saw the naga coming and going from this cavern ruin? Though what could they be looking for?

Perhaps it is connected to I''lalai after all. If this is the case, this could be the discovery of the century, $N! The Lost City has been a place of myth and legend for as long as any troll can remember.

But now it is possible the myth could be reality. There is no time to waste; we must investigate.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95770;
DELETE FROM `creature_queststarter` WHERE `quest`=95770;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95770;
DELETE FROM `creature_questender` WHERE `quest`=95770;
DELETE FROM `gameobject_questender` WHERE `quest`=95770;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2519,95770,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2519,95770,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2519);

-- 99257 A Heart of Crystal (level 43, min 35, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=99257;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (99257,2,16651,0,99258,5,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'A Heart of Crystal','Slay a Decrepit Pylon Protector for their Depleted Crystal Heart and bring it to Historian Biraxas within the temple of Shen''dralas.','While I watched in horror as you frolicked through the haunted woods with my precious relic, your meddling did inspire an idea.

The unstable rifts you encountered are the precursors to our pylon guards. We have been unable to conjure more for centuries, and I worry what might happen when those that remain inevitably flicker out.

I know it seems counterintuitive, but see if you can find another pylon protector nearly on the verge of collapse and recover their Crystal Heart. I''ll explain more after.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=99257;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (479766,99257,1,0,0,286647,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=99257;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (99257,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=99257;
DELETE FROM `quest_classic_level` WHERE `ID`=99257;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (99257,43,35,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=99257;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (99257,2,43);
DELETE FROM `quest_offer_reward` WHERE `ID`=99257;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (99257,0,0,0,0,0,0,0,0,'You were successful, I see! And what a heart you recovered. I am excited to know that the passing of centuries did little to tarnish the craftsmanship of this gemstone.

Most importantly, this is a promising discovery. It would seem that, indeed, mana is temporary, but gemstones are forever.

Are you eager to learn what comes next?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=99257;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (99257,0,0,0,0,'I assure you I am not looking to sabotage one of our only means of defense. If a protector does not look as lively and well-nourished as those in our temple, then they are on the last hundred years or so of their lifecycle. If anything, it is a mercy killing.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=99257;
DELETE FROM `gameobject_queststarter` WHERE `quest`=99257;
DELETE FROM `creature_questender` WHERE `quest`=99257;
DELETE FROM `gameobject_questender` WHERE `quest`=99257;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (255486,99257,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (255486,99257,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (255486);

-- 93341 Forlorn Gardens (level 43, min 35, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93341;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93341,2,16651,0,0,3,1.0,0,1.0,0,0,36700168,0,0,0,18446744073709551615,'Forlorn Gardens','Investigate the Forlorn Gardens near Shen''dralas and then return to Mithera at the nearby temple.','As the garden''s caretaker, it was my responsibility to ensure it thrived.

I knew there would come a day when I could no longer maintain it, so I enchanted a necklace gifted from my daughter to transform a new generation of saplings into treants, so they could watch over the garden in my stead. I placed it on an enchanted pedestal, sheltered within a small shrine.

The garden was in great hands. I must know what happened.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93341;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (466465,93341,19,0,0,40275,0,0,1,'Pedestal examined',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93341;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (93341,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93341;
DELETE FROM `quest_classic_level` WHERE `ID`=93341;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93341,43,35,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93341;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93341,2,43);
DELETE FROM `quest_offer_reward` WHERE `ID`=93341;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93341,0,0,0,0,0,0,0,0,'<Mithera listens quietly to your explanation of the situation.>

The pedestal is empty? My necklace is... missing?

<A great sadness washes over her expression.>

I should have expected as much. The quilboar and the centaur have been ravaging these lands for such a short amount of time, but the damage they have already done is immeasurable.

$N, even if the magic is gone from the necklace, I am clinging onto hope that I may have it back. Would you be willing to help?',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93341;
DELETE FROM `creature_queststarter` WHERE `quest`=93341;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93341;
DELETE FROM `creature_questender` WHERE `quest`=93341;
DELETE FROM `gameobject_questender` WHERE `quest`=93341;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (254578,93341,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (254578,93341,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (254578);

-- 93430 Taking the Bait Back (level 35, min 30, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=93430;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (93430,2,8,0,0,4,1.0,0,1.0,0,0,8,0,0,0,18446744073709551615,'Taking the Bait Back','Find the Lost One Fisherman who stole Pelluk''s lure, and take it back.','Now they''ve really done it! As if those wretches weren''t already enough to deal with, one of them has stolen my lucky lure!

I was just out fishing this morning, when one came up out of the muck, cut my line, and ran off with it. The thief is almost certainly one of the Lost Ones'' own fishermen, hoping to use the lure themselves.

Well, our supply of fish depends on that lure, so I need it back. The Lost Ones fish along the banks east of here. Find that thief, $r!','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=93430;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (466557,93430,1,0,0,258530,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=93430;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (93430,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=93430;
DELETE FROM `quest_classic_level` WHERE `ID`=93430;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (93430,35,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=93430;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (93430,2,35);
DELETE FROM `quest_offer_reward` WHERE `ID`=93430;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (93430,0,0,0,0,0,0,0,0,'That''s the one! Oh, thank you, $r. Come back sometime and I''ll give you a share of my catch!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=93430;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (93430,0,0,0,0,'I can''t catch a thing without my lucky lure! We may well starve out here.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=93430;
DELETE FROM `gameobject_queststarter` WHERE `quest`=93430;
DELETE FROM `creature_questender` WHERE `quest`=93430;
DELETE FROM `gameobject_questender` WHERE `quest`=93430;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (254770,93430,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (254770,93430,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (254770);

-- 94733 Our Ogre Friend (level 41, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94733;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94733,2,16591,0,94734,1,1.0,0,1.0,0,0,3145728,0,0,0,12261800583900083122,2782,1,0,'Our Ogre Friend','Locate Gobam in Bolder''ok.','Alright, so you won a few battles. I think you might have what it takes to make it here after all.

Before I convince our next combatant to jump into the ring with you there''s something I need from you first--food for Chub''chob''s pet boar, Snufflesnout.

I promised I''d look after it, and, well, this gig here''s keepin'' me quite busy. Trust me, this''ll benefit the both of us.

Mosey on over to the east of Clugfist''s clubhouse. You''re lookin'' for a shy fella who goes by the name Gobam.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94733;
DELETE FROM `quest_template_addon` WHERE `ID`=94733;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94733,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94733;
DELETE FROM `quest_classic_level` WHERE `ID`=94733;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94733,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94733;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94733,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94733;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94733,0,0,0,0,0,0,0,0,'Goblin sent you? Me no like little goblin. He talk too much.

But me help Chub''chob. He good friend.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94733;
DELETE FROM `creature_queststarter` WHERE `quest`=94733;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94733;
DELETE FROM `creature_questender` WHERE `quest`=94733;
DELETE FROM `gameobject_questender` WHERE `quest`=94733;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94733,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257058,94733,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257058,257062);

-- 95183 Step One: Rock (level 41, min 38, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=95183;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95183,2,16591,0,96026,3,1.0,0,1.0,0,0,36700168,0,0,0,12261800583900083122,2782,5,0,'Step One: Rock','Gather $1oa Good Rocks for Hamur in Bolder''ok.','You want ogre weapon? Me know no. You small. Can''t hold good.

You bring Hamur more rocks, me make you tiny weapon. Good for tiny creature.

Find good rocks for good weapon. Hamur has discerning eye. Not just any rock will do. Find rocks near river outside Bolder''ok.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95183;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470141,95183,1,0,0,271892,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95183;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95183,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95183;
DELETE FROM `quest_classic_level` WHERE `ID`=95183;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95183,41,38,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95183;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95183,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=95183;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95183,0,0,0,0,0,0,0,0,'These good rocks! Hamur make tiny creature tiny weapon.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95183;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95183,0,0,0,0,'Not all rocks equal. Some good. Some gooder.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95183;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95183;
DELETE FROM `creature_questender` WHERE `quest`=95183;
DELETE FROM `gameobject_questender` WHERE `quest`=95183;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (263440,95183,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (263440,95183,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (263440);

-- 94737 A Treat for a Friend (level 41, min 36, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94737;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94737,2,16591,0,94965,1,1.0,0,1.0,0,265810,3145728,0,0,0,12261800583900083122,2782,1,0,265810,1,'A Treat for a Friend','Deliver the bundle of goods to Jezap Jinglesprocket in Bolder''ok.','Ok friend. Here is treat. Snufflesnout snort and be happy when she see this.

And tell goblin please stop talk so much.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94737;
DELETE FROM `quest_template_addon` WHERE `ID`=94737;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94737,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94737;
DELETE FROM `quest_classic_level` WHERE `ID`=94737;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94737,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94737;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94737,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94737;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94737,0,0,0,0,0,0,0,0,'He said that? About me? Eh, no matter.

It''s time we focus on what''s really important--keepin'' ol'' Snufflesnout happy, and by Snufflesnout, I mean Chub''chob.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94737;
DELETE FROM `creature_queststarter` WHERE `quest`=94737;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94737;
DELETE FROM `creature_questender` WHERE `quest`=94737;
DELETE FROM `gameobject_questender` WHERE `quest`=94737;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257058,94737,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94737,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257058,257062);

