-- WoW Forever: live captures of 21 Nov 10:03 and 11:50 (client 71037; Ashenvale, Duskwood, Stormwind, Ironforge). Only what
-- the world DB lacked or had different from live, and nothing kit 2026_11_21_32 already has. Texts are in the hotfixes file
-- of this kit. Safe to run again.

-- 1. Objects live has that we spawn nowhere (guids 46130134-46130139):
--    Gleaming Crescent Necklace (98027): the Gleaming Crescent Pendant 669176 that starts it, at live's own height, with its
--    Necklace Chain 669178. Stormwind: Fury of the Land 421090. Duskwood: three Empty Vials 694725/694729.
DELETE FROM `gameobject` WHERE `guid` BETWEEN 46130134 AND 46130139;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,
`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,
`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(46130134,669176,1,331,2457,'0',0,0,0,-1,1921.4618,-1931.7830,84.7808,3.769874,-0.424454,-0.481165,-0.61335,0.460566,120,255,1,'',NULL,71037),
(46130135,669178,1,331,2457,'0',0,0,0,-1,1921.3716,-1931.8055,84.7551,5.939521,-0.362076,-0.355579,-0.286758,0.812548,300,255,1,'',NULL,71037),
(46130136,421090,0,1519,1519,'0',0,0,0,-1,-8980.7119,854.7691,30.9238,4.974793,0,0,-0.608521,0.793537,300,255,1,'',NULL,71037),
(46130137,694725,0,10,10,'0',0,0,0,-1,-10689.3691,347.5006,40.1835,3.141593,0,0,-1,0,300,255,1,'',NULL,71037),
(46130138,694729,0,10,10,'0',0,0,0,-1,-10696.8252,342.5221,39.7246,0.606074,0.68108,0.14642,0.272125,0.663807,300,255,1,'',NULL,71037),
(46130139,694729,0,10,10,'0',0,0,0,-1,-10694.0635,349.8167,39.7419,0.695875,0.616494,0.373602,0.0925484,0.686871,300,255,1,'',NULL,71037);

-- 2. Stormwind Harbor Guard 267007: live gives directions (guard menu 435); ours had no gossip at all.
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=267007;
DELETE FROM `creature_template_gossip` WHERE `CreatureID`=267007;
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES
(267007, 435, 71037);

-- 3. Russian turn-in and progress texts live sends that we had none of: the book turn-in quests 78142, 78149,
--    79091-79093 and Gleaming Crescent Necklace 98027. Only where missing.
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (78142,'ruRU','Спасибо, $n. Благодаря тебе архивы наших знаний растут.\r\n\r\nЕсли найдешь другие чародейские труды, которых не хватает в библиотеке, приноси их мне.',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (78149,'ruRU','Спасибо, $n. Благодаря тебе архивы наших знаний растут.\r\n\r\nЕсли найдешь другие чародейские труды, которых не хватает в библиотеке, приноси их мне.',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (79091,'ruRU','Спасибо, $n. Говоришь, это из библиотеки Стальгорна?.. Думаю, они не расстроятся из-за этой потери.\r\n\r\nЕсли найдешь другие чародейские труды, которых не хватает в библиотеке, приноси их мне.',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (79092,'ruRU','Спасибо, $n. Благодаря тебе архивы наших знаний растут.\r\n\r\nЕсли найдешь другие чародейские труды, которых не хватает в библиотеке, приноси их мне.',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (79093,'ruRU','Спасибо, $n. Благодаря тебе архивы наших знаний растут.\r\n\r\nЕсли найдешь другие чародейские труды, которых не хватает в библиотеке, приноси их мне.',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (98027,'ruRU','Ой! Неужели оно нашлось? Я везде искала это ожерелье!\r\n\r\nЯ потеряла его, когда доставляла припасы на одну из наших застав. Потом я пыталась найти его на дороге, но безуспешно.\r\n\r\nСпасибо, что $gпринес:принесла; мне его. Это подарок от моих покойных родителей. Словами не описать, как много оно для меня значит.',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (78142,'ruRU','$gПринес:Принесла; что-то новенькое в нашу коллекцию?',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (78149,'ruRU','$gПринес:Принесла; что-то новенькое в нашу коллекцию?',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (79091,'ruRU','$gПринес:Принесла; что-то новенькое в нашу коллекцию?',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (79092,'ruRU','$gПринес:Принесла; что-то новенькое в нашу коллекцию?',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (79093,'ruRU','$gПринес:Принесла; что-то новенькое в нашу коллекцию?',71037);
