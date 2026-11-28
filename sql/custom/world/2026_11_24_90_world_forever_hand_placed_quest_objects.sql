-- WoW Forever: quest objects for the new dungeons, HAND-PLACED, plus the quests that were held for them.
-- No source we may use has a map point for these objects (no sniff yet). Every spawn below is a best guess: a navmesh floor
-- spot in the room of the boss named on its line, reachable from the dungeon entrance, clear of walls and of other spawns.
-- All of them sit in guid range 48161000-48161020 so a sniff run can replace them in one go: delete that range and load
-- the sniffed spawns. The Alcaz note is a hand-made object (entry 29940001): the real one is not in any data we have.
--   The Drowned City (map 2970): The First..Fourth Tablet of I'lalai 642943-642946, one by Zul'Alai, Var'Taka, the
--     Deathless Watcher and Min'loth; their loot 140217-140220 gives the four rubbings 270308-270311 (quest items).
--   Blackmaw Hold (map 2974): Totem of Ursol 570888 by Elder Shaman Bloodmane, Totem of Ursoc 570890 by Varrox Bleakhoof,
--     14 Nordrassil Root Caps 571511 spread through the hold (10 needed; each one gives every grouped player on the quest one).
--   Alcaz Prison (map 2994): the note on the ground near Blazeroar. Using it gives "Read the note" (credit 264861);
--     The Secret Prison 95262 and The Honor of the Kor'kron 95454 end at it, Somber News 95263 and Bad News for Folkar
--     96369 start at it.
--   Westfall: Loose Floorboard 653847 and Connery's Trunk 611086 already stand in Moonbrook (2026_11_21_90); this adds
--     More Valuable Than Gold 96337 (Mason Connery offers it after 96335, Mason's Note 274077 comes with it, ends at the trunk).
-- Quests released: 95775, 95787, 92066, 92343 (rebuilt), 92344, 95262, 95263, 95454, 96369, 96337.
-- Quest records: Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
-- (https://creativecommons.org/licenses/by/4.0/). Source: github.com/JIVESCORP/eg-link-output-wowf, build 1.60.1.71037.
-- Changed: picked and converted to our tables; givers and turn-ins from the quest texts.
-- Safe to run again.

-- The note near Blazeroar (hand-made, the Note model 82080). A quest giver object; using it gives the Read the note credit
-- first, so the quests that end at it show as complete in the same window.
DELETE FROM `gameobject_template` WHERE `entry`=29940001;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(29940001,2,82080,'Note','','','',1,0,0,0,0,'SmartGameObjectAI','',NULL,0);
DELETE FROM `gameobject_template_addon` WHERE `entry`=29940001;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29940001 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(29940001,1,0,0,64,0,100,0,1,33,264861,7,'Note (Alcaz Prison) - On use - Give Read the note credit');

-- The rubbings in the tablets (quest items, only for players on 95775 or 95787)
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (140217,140218,140219,140220);
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(140217,0,270308,100,1,1,0,1,1,'The First Tablet of I''lalai'),
(140218,0,270309,100,1,1,0,1,1,'The Second Tablet of I''lalai'),
(140219,0,270310,100,1,1,0,1,1,'The Third Tablet of I''lalai'),
(140220,0,270311,100,1,1,0,1,1,'The Fourth Tablet of I''lalai');

-- HAND-PLACED spawns (best guess, replace from a sniff)
DELETE FROM `gameobject` WHERE `guid` BETWEEN 48161000 AND 48161020;
DELETE FROM `gameobject_addon` WHERE `guid` BETWEEN 48161000 AND 48161020;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(48161000,642943,2970,0,0,'1,201',0,0,0,-1,-13321.6,2473.8,2.01,4.7124,0,0,0.707103,-0.707111,7200,255,1,'',NULL,0), -- tablet1
(48161001,642944,2970,0,0,'1,201',0,0,0,-1,-13493.6,2787.7,-10.46,3.1416,0,0,1.0,-4e-06,7200,255,1,'',NULL,0), -- tablet2
(48161002,642945,2970,0,0,'1,201',0,0,0,-1,-13327.2,3077.1,-7.73,4.7124,0,0,0.707103,-0.707111,7200,255,1,'',NULL,0), -- tablet3
(48161003,642946,2970,0,0,'1,201',0,0,0,-1,-13317.7,3335.9,0.23,3.1416,0,0,1.0,-4e-06,7200,255,1,'',NULL,0), -- tablet4
(48161004,570888,2974,0,0,'1,201',0,0,0,-1,3477.21,2973.1,137.42,5.7594,0,0,0.258909,-0.965902,7200,255,1,'',NULL,0), -- ursol
(48161005,570890,2974,0,0,'1,201',0,0,0,-1,3553.8,2815.17,178.91,1.0472,0,0,0.500001,0.866025,7200,255,1,'',NULL,0), -- ursoc
(48161006,571511,2974,0,0,'1,201',0,0,0,-1,3508.93,2797.68,193.42,1.3958,0,0,0.64261,0.766193,600,255,1,'',NULL,0), -- root01
(48161007,571511,2974,0,0,'1,201',0,0,0,-1,3543.1,3221.03,319.45,5.236,0,0,0.499995,-0.866028,600,255,1,'',NULL,0), -- root02
(48161008,571511,2974,0,0,'1,201',0,0,0,-1,3260.0,2910.0,204.6,3.1416,0,0,1.0,-4e-06,600,255,1,'',NULL,0), -- root03
(48161009,571511,2974,0,0,'1,201',0,0,0,-1,3376.8,3419.94,269.5,1.047,0,0,0.499914,0.866075,600,255,1,'',NULL,0), -- root04
(48161010,571511,2974,0,0,'1,201',0,0,0,-1,3696.41,3423.3,302.06,1.9197,0,0,0.819106,0.573643,600,255,1,'',NULL,0), -- root05
(48161011,571511,2974,0,0,'1,201',0,0,0,-1,3416.21,3050.17,240.14,2.2684,0,0,0.906196,0.422858,600,255,1,'',NULL,0), -- root06
(48161012,571511,2974,0,0,'1,201',0,0,0,-1,3575.09,2976.93,146.39,5.4099,0,0,0.4229,-0.906177,600,255,1,'',NULL,0), -- root07
(48161013,571511,2974,0,0,'1,201',0,0,0,-1,3312.0,3617.0,344.26,4.7124,0,0,0.707103,-0.707111,600,255,1,'',NULL,0), -- root08
(48161014,571511,2974,0,0,'1,201',0,0,0,-1,3541.38,3533.34,292.75,5.9338,0,0,0.173805,-0.98478,600,255,1,'',NULL,0), -- root09
(48161015,571511,2974,0,0,'1,201',0,0,0,-1,3546.9,3367.09,259.73,2.7927,0,0,0.984823,0.173563,600,255,1,'',NULL,0), -- root10
(48161016,571511,2974,0,0,'1,201',0,0,0,-1,3578.04,3065.63,293.12,4.0146,0,0,0.906235,-0.422774,600,255,1,'',NULL,0), -- root11
(48161017,571511,2974,0,0,'1,201',0,0,0,-1,3301.5,3298.5,262.69,0.0,0,0,0.0,1.0,600,255,1,'',NULL,0), -- root12
(48161018,571511,2974,0,0,'1,201',0,0,0,-1,3399.81,2871.0,200.47,1.9197,0,0,0.819106,0.573643,600,255,1,'',NULL,0), -- root13
(48161019,571511,2974,0,0,'1,201',0,0,0,-1,3467.01,3301.2,323.31,1.9197,0,0,0.819106,0.573643,600,255,1,'',NULL,0), -- root14
(48161020,29940001,2994,0,0,'1,201',0,0,0,-1,-8890.0,2954.0,5.94,1.5708,0,0,0.707108,0.707105,180,255,1,'',NULL,0); -- alcaz_note

-- The quests
-- 95775 The Drowned City (level 40, min 30, live build 71037); rubbings come from the four Tablets of I'lalai placed below
DELETE FROM `quest_template` WHERE `ID`=95775;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`RewardFactionID2`,`RewardFactionValue2`,`RewardFactionOverride2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95775,2,16550,81,0,5,2.675,0,1.0,0,0,33554696,0,0,0,12261800583900083122,530,5,0,76,5,0,'The Drowned City','Use the hide and charcoal to create rubbings of the tablets found in the Drowned City.','What I am about to ask you is no small feat, $c, and will likely require strong allies to accomplish.

I want to know more about the ruins on the other side of the cavern the naga are guarding. If my suspicions prove correct, it could indeed be the lost city of I''lalai. The amount of lost historical knowledge at our fingertips could be unrivaled, but I am too old to venture myself.

Enter the ruins and gather etchings of any tablets you find there, then return to me.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95775;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471250,95775,1,0,4,270308,1,0,1,NULL,71037),(471251,95775,1,1,5,270309,1,0,1,NULL,71037),(471252,95775,1,2,6,270310,1,0,1,NULL,71037),(471253,95775,1,3,7,270311,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95775;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95775,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95775;
DELETE FROM `quest_classic_level` WHERE `ID`=95775;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95775,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95775;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95775,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95775;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95775,0,0,0,0,0,0,0,0,'<Kin''weelay''s hands shake as you hand him the rubbings.>

This is ancient Zandali but it is still legible, even to me. These four tablets speak of the ancient city, though I have never heard this account before.

Nor have I ever heard of the Loa of Tides. I thought all of the serpents depicted at the edges of the tablets were the loa Hethiss, but to my knowledge his avatar does not have a cobra hood or fins.

Could this then be a depiction of the Loa of Tides? It almost looks more like a sea serpent.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95775;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95775,0,0,0,0,'$N! You have returned unharmed, and mostly in one piece it seems. Come sit, and tell me; have you ventured to the ruins of the Drowned City?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95775;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95775;
DELETE FROM `creature_questender` WHERE `quest`=95775;
DELETE FROM `gameobject_questender` WHERE `quest`=95775;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2519,95775,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2519,95775,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2519);

-- 95787 Take Two With Water (level 40, min 30, live build 71037); rubbings come from the four Tablets of I'lalai placed below
DELETE FROM `quest_template` WHERE `ID`=95787;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95787,2,16550,81,0,5,2.675,0,1.0,0,0,33554696,0,0,0,6130900294268439629,72,5,0,'Take Two With Water','Use the hide and charcoal to create rubbings of the tablets found in the Drowned City.','<Loremaster Dibbs'' hands shake as he reads the scouting report and the troll legends.>

Could it be? By this account it sounds like the lost troll city of I''lalai has risen just off the coast of Stranglethorn! We must investigate immediately. Why, if my research is correct this could be the archeological discovery of the century!

Please, I know it is a long trek back to Stranglethorn but if you find yourself in this Drowned City, collect any legends you find there and return them to me.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95787;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (471355,95787,1,0,4,270308,1,0,1,NULL,71037),(471356,95787,1,1,5,270309,1,0,1,NULL,71037),(471357,95787,1,2,6,270310,1,0,1,NULL,71037),(471358,95787,1,3,7,270311,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95787;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95787,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95787;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95787,15000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95787;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95787,40,30,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95787;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95787,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=95787;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95787,0,0,0,0,0,0,0,0,'Four new tablets! This is fantastic news indeed.

My ancient Zandali is a bit rusty, but these legends seem to reference some... entity called The Loa of-

<Loremaster Dibbs squints at the parchment.>

Tides? I-I don''t recognize that title! Marvelous, $N! We may have stumbled upon a new loa!',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95787;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (95787,0,0,0,0,'I wonder if my friends in the Explorer''s League have gotten wind of this risen island--

Oh! $N, you''ve returned. Did you visit the troll ruins? Did you find any new legends?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=95787;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95787;
DELETE FROM `creature_questender` WHERE `quest`=95787;
DELETE FROM `gameobject_questender` WHERE `quest`=95787;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (2277,95787,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (2277,95787,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (2277);

-- 92066 The Twin Bears (level 55, min 47, live build 71037); the two totems are placed below
DELETE FROM `quest_template` WHERE `ID`=92066;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92066,2,16554,81,0,5,2.0,0,1.0,0,0,36700424,0,0,0,18446744073709551615,279891,1,279892,1,576,6,0,'The Twin Bears','Find the Totem of Ursoc and the Totem of Ursol inside Blackmaw Hold. Then, return them to Lorekeeper Nok at Ursolan.','When the Legashi invaded, many precious things were left behind in the commotion. Of particular value to me are two totems. They depict legends of our twin gods, Ursoc and Ursol.

I know our immediate survival is of greatest concern, but we must also think of saving our people''s history.

Those totems are likely still in our former hold. If they are, you would be doing a great kindness by returning them to me.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92066;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (464116,92066,1,0,0,249694,1,0,1,NULL,71037),(464117,92066,1,1,1,249693,1,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92066;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92066,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92066;
DELETE FROM `quest_classic_level` WHERE `ID`=92066;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92066,55,47,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92066;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92066,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=92066;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92066,0,0,0,0,0,0,0,0,'Spirits be praised! The totems are unbroken. Although the Blackmaw have lost much, our stories will live on. Thank you, $R.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92066;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92066,0,0,0,0,'I understand why we had to leave the totems. I just hope the satyr haven''t defaced them.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92066;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92066;
DELETE FROM `creature_questender` WHERE `quest`=92066;
DELETE FROM `gameobject_questender` WHERE `quest`=92066;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (249853,92066,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (249853,92066,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (249853);

-- 92343 Get to the Roots of It (level 55, min 45, live build 71037); already in the DB; rebuilt the same way, root caps placed below
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
DELETE FROM `quest_request_items` WHERE `ID`=92343;
DELETE FROM `creature_queststarter` WHERE `quest`=92343;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92343;
DELETE FROM `creature_questender` WHERE `quest`=92343;
DELETE FROM `gameobject_questender` WHERE `quest`=92343;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (5770,92343,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (5770,92343,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (5770);

-- 92344 Get to the Roots of It (level 55, min 45, live build 71037); giver and turn-in Mathrengyl Bearwalker, named in the log text
DELETE FROM `quest_template` WHERE `ID`=92344;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92344,2,16554,81,0,5,2.0,0,1.0,0,0,33554696,0,0,0,6130900294268439629,69,6,0,'Get to the Roots of It','Gather 10 Nordrassil Root Caps inside Blackmaw Hold for Mathrengyl Bearwalker in Darnassus.','The burrow you speak of is a tunnel to Blackmaw Hold. In the past, the furbolg have guarded it fiercely, making it inaccessible to outsiders. With this satyr situation, however, we can get inside.

So close to Nordrassil, there would be actively growing roots. Older roots can be seen on the world''s surface, but newer ones can only be found deep underground. Little is known of their magical properties.

If you were to bring me some samples to study, the Cenarion Circle would be in your debt.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92344;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (464444,92344,1,0,1,250773,10,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92344;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92344,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92344;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (92344,13419,0);
DELETE FROM `quest_classic_level` WHERE `ID`=92344;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92344,55,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92344;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92344,2,55);
DELETE FROM `quest_offer_reward` WHERE `ID`=92344;
DELETE FROM `quest_request_items` WHERE `ID`=92344;
DELETE FROM `creature_queststarter` WHERE `quest`=92344;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92344;
DELETE FROM `creature_questender` WHERE `quest`=92344;
DELETE FROM `gameobject_questender` WHERE `quest`=92344;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (4217,92344,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (4217,92344,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (4217);

-- 95262 The Secret Prison (level 53, min 48, live build 71037); turn-in at the note by Blazeroar (hand-made object 29940001)
DELETE FROM `quest_template` WHERE `ID`=95262;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95262,2,16620,81,95263,6,2.2,0,1.0,0,0,2097152,0,0,0,6130900294268439629,72,6,0,'The Secret Prison','Enter Alcaz Prison and learn what became of the King of Stormwind.','Can''t say I''ve ever thought much about Alcaz. Near as I can tell, it''s an abandoned outpost from the third war of little significance. Never heard nuthin'' about a prison there. 

Well, there''s nothing for it--we''ve got to get you in there and see what you can see, especially if there''s a chance that the king is there.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95262;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (470212,95262,0,0,0,255702,1,0,1,'Explore Alcaz Prison',71037),(470213,95262,0,1,1,264861,1,0,1,'Learn what became of Varian Wrynn',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95262;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95262,0,0,95198);
DELETE FROM `quest_classic_money` WHERE `ID`=95262;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95262,13919,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95262;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95262,53,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95262;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95262,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=95262;
DELETE FROM `quest_request_items` WHERE `ID`=95262;
DELETE FROM `creature_queststarter` WHERE `quest`=95262;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95262;
DELETE FROM `creature_questender` WHERE `quest`=95262;
DELETE FROM `gameobject_questender` WHERE `quest`=95262;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260271,95262,0);
INSERT INTO `gameobject_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (29940001,95262,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260271);

-- 95263 Somber News (level 53, min 48, live build 71037); starts at the note (bracketed text), ends at Sully
DELETE FROM `quest_template` WHERE `ID`=95263;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95263,2,16620,81,0,2,2.2,0,1.0,0,0,2097152,0,0,0,6130900294268439629,72,4,0,'Somber News','Return to Sully McCleary in Dustwallow Marsh.','<The King is dead--killed in an escape attempt just before the Naga attacked. This is devastating news and will shake Stormwind to its core. You need to return to Sully and tell him what you''ve learned as quickly as possible.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95263;
DELETE FROM `quest_template_addon` WHERE `ID`=95263;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95263,0,0,95262);
DELETE FROM `quest_classic_money` WHERE `ID`=95263;
DELETE FROM `quest_classic_level` WHERE `ID`=95263;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95263,53,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95263;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95263,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=95263;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95263,0,0,0,0,0,0,0,0,'<You hand Sully the note and his expression darkens as he reads it.>

Thank ye, $C. This is terrible news.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95263;
DELETE FROM `creature_queststarter` WHERE `quest`=95263;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95263;
DELETE FROM `creature_questender` WHERE `quest`=95263;
DELETE FROM `gameobject_questender` WHERE `quest`=95263;
INSERT INTO `gameobject_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (29940001,95263,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260271,95263,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260271);

-- 95454 The Honor of the Kor'kron (level 53, min 48, live build 71037); turn-in at the note by Blazeroar
DELETE FROM `quest_template` WHERE `ID`=95454;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95454,2,16620,81,96369,6,1.85,0,1.0,0,0,2097160,0,0,0,12261800583900083122,76,5,0,'The Honor of the Kor''kron','Look for King Varian Wrynn in Alcaz Prison.','My good axe arm is broken and most of my elites are dead. The honor of the Kor''kron rests with you now.

We were sent here to extract a prisoner, but not just any prisoner... We are here for the King of Stormwind, Varian Wrynn. We intercepted information that he was being held here and our Warchief commanded us to bring him back to Orgrimmar alive. The presence of black dragons... complicates things.

I need you to press on and find Wrynn. I will wait for you here while you search for him.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95454;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472986,95454,0,0,0,255702,1,0,1,'Find Varian Wrynn',71037),(472990,95454,0,1,1,264861,1,0,1,'Read the note on the ground',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95454;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95454,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=95454;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95454,13919,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95454;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95454,53,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95454;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95454,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=95454;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (95454,0,0,0,0,0,0,0,0,'<It seems that there''s a greater force pulling the strings than the lesser dragon you just slew. It''s time to go and inform Commander Folkar of what you''ve learned.>',71037);
DELETE FROM `quest_request_items` WHERE `ID`=95454;
DELETE FROM `creature_queststarter` WHERE `quest`=95454;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95454;
DELETE FROM `creature_questender` WHERE `quest`=95454;
DELETE FROM `gameobject_questender` WHERE `quest`=95454;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (260386,95454,0);
INSERT INTO `gameobject_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (29940001,95454,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260386);

-- 96369 Bad News for Folkar (level 53, min 48, live build 71037); starts at the note, ends at Commander Folkar
DELETE FROM `quest_template` WHERE `ID`=96369;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96369,2,16620,81,95483,2,1.85,0,1.0,0,0,2097160,0,0,0,12261800583900083122,76,3,0,'Bad News for Folkar','Report back to Commander Folkar.','<The King is dead--killed in an escape attempt just before the Naga attacked. Many Kor''kron died to learn this news, but this knowledge could shake the Alliance to its core. You need to return to Commander Folkar and tell him what you''ve learned as quickly as possible.>','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96369;
DELETE FROM `quest_template_addon` WHERE `ID`=96369;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96369,0,0,95454);
DELETE FROM `quest_classic_money` WHERE `ID`=96369;
DELETE FROM `quest_classic_level` WHERE `ID`=96369;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96369,53,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96369;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96369,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=96369;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (96369,0,0,0,0,0,0,0,0,'So Wrynn is dead then... 

I will mourn the warriors who died here, but their deaths were not in vain. We know more than we did before, and knowledge of this kind is of value. Stormwind--nay, the Alliance itself has never been more vulnerable and that knowledge is powerful.

Thank you for your service to the Horde. For my part, I owe you my life as well. That is a debt that I will not soon forget. I''ll make my way out of here and see to Sergeant Ulka on my own.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=96369;
DELETE FROM `creature_queststarter` WHERE `quest`=96369;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96369;
DELETE FROM `creature_questender` WHERE `quest`=96369;
DELETE FROM `gameobject_questender` WHERE `quest`=96369;
INSERT INTO `gameobject_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (29940001,96369,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (260386,96369,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (260386);

-- 96337 More Valuable Than Gold (level 53, min 48, live build 71037); Mason Connery offers it after 96335 and hands over Mason's Note on accept; ends at Connery's Trunk in Moonbrook
DELETE FROM `quest_template` WHERE `ID`=96337;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (96337,2,16620,81,0,5,2.2,0,1.0,0,274077,2097664,0,0,0,18446744073709551615,'More Valuable Than Gold','Use the note provided by Mason Connery to find his hidden treasure.','I told you that I''d make it worth your while to free me. I don''t have any gold for you, but I have something better.

Take this. It will help you find a treasure more valuable than gold. Do what you want with it, but if anyone asks you where you got it, tell them that the person who gave it to you died. 

Tell them he was vaporized by dragonfire... blown out to sea.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=96337;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (472910,96337,2,0,0,653847,1,0,1,'Find Mason Connery''s Treasure',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=96337;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (96337,0,0,96335);
DELETE FROM `quest_classic_money` WHERE `ID`=96337;
DELETE FROM `quest_classic_level` WHERE `ID`=96337;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (96337,53,48,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=96337;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (96337,2,53);
DELETE FROM `quest_offer_reward` WHERE `ID`=96337;
DELETE FROM `quest_request_items` WHERE `ID`=96337;
DELETE FROM `creature_queststarter` WHERE `quest`=96337;
DELETE FROM `gameobject_queststarter` WHERE `quest`=96337;
DELETE FROM `creature_questender` WHERE `quest`=96337;
DELETE FROM `gameobject_questender` WHERE `quest`=96337;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (264770,96337,0);
INSERT INTO `gameobject_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (611086,96337,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (264770);

