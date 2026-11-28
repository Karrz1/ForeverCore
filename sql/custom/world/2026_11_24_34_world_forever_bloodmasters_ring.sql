-- Bloodmaster's Ring (Bolder'ok, zone 16591): the six ring fights after Pay to Play 94669, held until now for want of their
-- quest givers. The quest records (levels, flags, rewards, texts) are the client's for build 71037. Hand-made, best guess:
-- every fight starts and ends at Jezap Jinglesprocket (257062), who gives Pay to Play and takes A Treat for a Friend in the
-- data we have, and the champion's fight ends at Clugfist (255829), as its log text says. The client sends no objectives for
-- these quests: each gets one kill objective for its contender (the AreaDescription line, "Buzzbeak defeated"). Accepting a fight
-- calls the contender next to the player and on to the player, if one is not up already; the summon leaves 60 s after its
-- fight. A fight lost (the quests fail on death) is taken again from Jezap. Objective ids 29945001-29945006.

-- 94670 Bloodmaster's Ring: Buzzbeak defeated (level 41, min 36)
DELETE FROM `quest_template` WHERE `ID`=94670;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94670,2,16591,1,94739,6,1.0,0,1.0,0,0,3145739,0,0,0,12261800583900083122,2782,6,0,'Bloodmaster''s Ring','Defeat Buzzbeak in the Bloodmaster''s Ring.','The battle of the Bloodmaster''s Ring begins!

We''ll start you off easy here, pal. This flighty fiend''ll take you down, then pick ya clean.

Now quit standin'' around and step into the ring. Fame awaits!','Buzzbeak defeated','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94670;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (29945001,94670,0,0,0,257056,1,0,1,'Buzzbeak defeated',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94670;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94670,0,0,94669);
DELETE FROM `quest_classic_money` WHERE `ID`=94670;
DELETE FROM `quest_classic_level` WHERE `ID`=94670;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94670,41,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94670;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94670,2,41);
DELETE FROM `quest_offer_reward` WHERE `ID`=94670;
DELETE FROM `quest_request_items` WHERE `ID`=94670;
DELETE FROM `creature_queststarter` WHERE `quest`=94670;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94670;
DELETE FROM `creature_questender` WHERE `quest`=94670;
DELETE FROM `gameobject_questender` WHERE `quest`=94670;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94670,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94670,0);

-- 94739 Bloodmaster's Ring: Kronk defeated (level 42, min 36)
DELETE FROM `quest_template` WHERE `ID`=94739;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94739,2,16591,1,94962,6,1.0,0,1.0,0,0,3145739,0,0,0,12261800583900083122,2782,6,0,'Bloodmaster''s Ring','Defeat Kronk in the Bloodmaster''s Ring.','Glad you made it through the first round, I guess.

This next contestant and I go way back. He ain''t the brightest fella, but he''s sure good at pummeling anything in his path.

Just head on into the pit and get yourself ready while I make the announcement.','Kronk defeated','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94739;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (29945002,94739,0,0,0,258491,1,0,1,'Kronk defeated',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94739;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94739,0,0,94670);
DELETE FROM `quest_classic_money` WHERE `ID`=94739;
DELETE FROM `quest_classic_level` WHERE `ID`=94739;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94739,42,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94739;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94739,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=94739;
DELETE FROM `quest_request_items` WHERE `ID`=94739;
DELETE FROM `creature_queststarter` WHERE `quest`=94739;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94739;
DELETE FROM `creature_questender` WHERE `quest`=94739;
DELETE FROM `gameobject_questender` WHERE `quest`=94739;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94739,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94739,0);

-- 94962 Bloodmaster's Ring: Bonegnaw defeated (level 42, min 36)
DELETE FROM `quest_template` WHERE `ID`=94962;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94962,2,16591,1,94964,6,1.0,0,1.0,0,0,3145739,0,0,0,12261800583900083122,2782,6,0,'Bloodmaster''s Ring','Defeat Bonegnaw in the Bloodmaster''s Ring.','Alright, so you got a few wins under your belt. So what?

You''re a long way from becoming the champ, bub. But I tell ya what--I''ll make sure this next battle ain''t one you''ll soon forget.

Hope you''re ready for a surprise.','Bonegnaw defeated','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94962;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (29945003,94962,0,0,0,255892,1,0,1,'Bonegnaw defeated',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94962;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94962,0,0,94739);
DELETE FROM `quest_classic_money` WHERE `ID`=94962;
DELETE FROM `quest_classic_level` WHERE `ID`=94962;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94962,42,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94962;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94962,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=94962;
DELETE FROM `quest_request_items` WHERE `ID`=94962;
DELETE FROM `creature_queststarter` WHERE `quest`=94962;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94962;
DELETE FROM `creature_questender` WHERE `quest`=94962;
DELETE FROM `gameobject_questender` WHERE `quest`=94962;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94962,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94962,0);

-- 94964 Bloodmaster's Ring: Mog'thar defeated (level 43, min 36)
DELETE FROM `quest_template` WHERE `ID`=94964;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94964,2,16591,1,94733,6,1.0,0,1.0,0,0,3145739,0,0,0,12261800583900083122,2782,6,0,'Bloodmaster''s Ring','Defeat Mog''thar in the Bloodmaster''s Ring.','Let''s see if we can keep this crowd''s excitement goin''.

This next contender ain''t no joke.

Best of luck to ya! See you soon, maybe.','Mog''thar defeated','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94964;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (29945004,94964,0,0,0,258626,1,0,1,'Mog''thar defeated',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94964;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94964,0,0,94962);
DELETE FROM `quest_classic_money` WHERE `ID`=94964;
DELETE FROM `quest_classic_level` WHERE `ID`=94964;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94964,43,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94964;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94964,2,43);
DELETE FROM `quest_offer_reward` WHERE `ID`=94964;
DELETE FROM `quest_request_items` WHERE `ID`=94964;
DELETE FROM `creature_queststarter` WHERE `quest`=94964;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94964;
DELETE FROM `creature_questender` WHERE `quest`=94964;
DELETE FROM `gameobject_questender` WHERE `quest`=94964;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94964,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94964,0);

-- 94965 Bloodmaster's Ring: Snufflesnout defeated (level 44, min 36)
DELETE FROM `quest_template` WHERE `ID`=94965;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94965,2,16591,1,95063,6,1.0,0,1.0,0,0,3145731,0,0,0,12261800583900083122,3928,3,13443,2,2782,6,0,'Bloodmaster''s Ring','Defeat Snufflesnout in the Bloodmaster''s Ring.','Alright, so I''ll place the treat and then you enter the ring and prepare for what''s comin''.

What? Why you lookin'' at me like that? I said we''re gonna feed her. What I may have forgotten to mention was that ol'' Snufflesnout gets pretty riled up at the sight of her favorite treat.

You''re in a bit of a sticky situation here, bub. Proving yourself to our ogre friends is of the utmost importance, but boy oh boy would I be nervous inflicting harm to Chubchob''s precious companion.

Well, off ya go!','Snufflesnout defeated','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94965;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (29945005,94965,0,0,0,258595,1,0,1,'Snufflesnout defeated',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=94965;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94965,0,0,94737);
DELETE FROM `quest_classic_money` WHERE `ID`=94965;
DELETE FROM `quest_classic_level` WHERE `ID`=94965;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94965,44,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94965;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94965,2,44);
DELETE FROM `quest_offer_reward` WHERE `ID`=94965;
DELETE FROM `quest_request_items` WHERE `ID`=94965;
DELETE FROM `creature_queststarter` WHERE `quest`=94965;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94965;
DELETE FROM `creature_questender` WHERE `quest`=94965;
DELETE FROM `gameobject_questender` WHERE `quest`=94965;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94965,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,94965,0);

-- 95063 Bloodmaster's Ring: Chub'chob defeated (level 45, min 36)
DELETE FROM `quest_template` WHERE `ID`=95063;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`RewardChoiceItemID3`,`RewardChoiceItemQuantity3`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (95063,2,16591,1,0,6,1.0,6,1.0,1280857,0,3145731,0,0,0,12261800583900083122,275043,1,275044,1,275045,1,2782,0,150000,'Bloodmaster''s Ring','Defeat Chub''chob, Bloodmaster of Bolder''ok, in the Bloodmaster''s Ring, then share the news of becoming the newly crowned champion of the Bloodmaster''s Ring with Clugfist at Bolder''ok.','Ok, listen up. You''ve showed quite a bit of prowess in the ring. You''ve managed to upset Chub''chob more than words can explain. Sure glad I ain''t you right now.

Just in case you was wonderin'', I should remind you that your entry fee does not cover accidental death.

It''s been great knowin'' ya, but you''re on your own from here on out, bub.

Best of luck to ya.','Chub''chob defeated','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=95063;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (29945006,95063,0,0,0,257059,1,0,1,'Chub''chob defeated',71037);
DELETE FROM `quest_template_addon` WHERE `ID`=95063;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (95063,0,0,94965);
DELETE FROM `quest_classic_money` WHERE `ID`=95063;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) VALUES (95063,13000,0);
DELETE FROM `quest_classic_level` WHERE `ID`=95063;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (95063,45,36,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=95063;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (95063,2,45);
DELETE FROM `quest_offer_reward` WHERE `ID`=95063;
DELETE FROM `quest_request_items` WHERE `ID`=95063;
DELETE FROM `creature_queststarter` WHERE `quest`=95063;
DELETE FROM `gameobject_queststarter` WHERE `quest`=95063;
DELETE FROM `creature_questender` WHERE `quest`=95063;
DELETE FROM `gameobject_questender` WHERE `quest`=95063;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (257062,95063,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (255829,95063,0);

UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (257062,255829);

-- The contenders' levels (the fights are levels 41-44; Chub'chob keeps his 43 from the sniff).
DELETE FROM `creature_classic_level` WHERE `entry` IN (257056,258491,255892,258626,258595);
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (257056,41,41),(258491,42,42),(255892,42,42),(258626,43,43),(258595,44,44);

-- Jezap calls each contender when its fight is accepted: 3 y from the player, on to the player (summon flag 4, AttackInvoker),
-- gone 60 s after its fight (summon type 4). Not while that contender is already up within 60 y of Jezap (conditions below).
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (257062,257059);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (257062,257059) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`target_type`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(257062,0,0,0,19,0,100,0,94670,0,0,12,257056,4,60000,0,4,7,3,0,0,0,'Jezap Jinglesprocket - On quest 94670 accepted - Summon Buzzbeak on the invoker'),
(257062,0,1,0,19,0,100,0,94739,0,0,12,258491,4,60000,0,4,7,3,0,0,0,'Jezap Jinglesprocket - On quest 94739 accepted - Summon Kronk on the invoker'),
(257062,0,2,0,19,0,100,0,94962,0,0,12,255892,4,60000,0,4,7,3,0,0,0,'Jezap Jinglesprocket - On quest 94962 accepted - Summon Bonegnaw on the invoker'),
(257062,0,3,0,19,0,100,0,94964,0,0,12,258626,4,60000,0,4,7,3,0,0,0,'Jezap Jinglesprocket - On quest 94964 accepted - Summon Mog''thar on the invoker'),
(257062,0,4,0,19,0,100,0,94965,0,0,12,258595,4,60000,0,4,7,3,0,0,0,'Jezap Jinglesprocket - On quest 94965 accepted - Summon Snufflesnout on the invoker'),
(257062,0,5,0,19,0,100,0,95063,0,0,12,257059,4,60000,0,4,7,3,0,0,0,'Jezap Jinglesprocket - On quest 95063 accepted - Summon Chub''chob on the invoker'),
(257059,0,0,0,54,0,100,0,0,0,0,2,16,0,0,0,0,1,0,0,0,0,'Chub''chob - On just summoned - Set faction hostile (the ring fight; the spawned Chub''chob stays friendly)');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=257062 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`Comment`) VALUES
(22,1,257062,0,0,29,1,257056,60,0,1,'Jezap: summon Buzzbeak only if none is up within 60 y of Jezap'),
(22,2,257062,0,0,29,1,258491,60,0,1,'Jezap: summon Kronk only if none is up within 60 y of Jezap'),
(22,3,257062,0,0,29,1,255892,60,0,1,'Jezap: summon Bonegnaw only if none is up within 60 y of Jezap'),
(22,4,257062,0,0,29,1,258626,60,0,1,'Jezap: summon Mog''thar only if none is up within 60 y of Jezap'),
(22,5,257062,0,0,29,1,258595,60,0,1,'Jezap: summon Snufflesnout only if none is up within 60 y of Jezap');
