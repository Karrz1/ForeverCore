-- WoW Forever: live capture of 22 Nov 15:40-18:01 (client 71037; Wetlands). Only what the world DB lacked or had different
-- from live, and nothing earlier kits already have. Safe to run again.

-- 1. Objects live has that we spawn nowhere (guids 46130140-46130149), seen in two captures:
--    the dwarven camp by the campfire 424066 at -4258 -3113 (torch, jugs, cheese, bowl, bread, rug, mallet, doll) and the
--    Ritual Circle 672308 under the Subdued Dragonspawn 271373.
DELETE FROM `gameobject` WHERE `guid` BETWEEN 46130140 AND 46130149;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,
`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,
`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(46130140,405519,0,11,0,'0',0,0,0,-1,-4256.0869,-3113.5435,28.4604,6.046697,0.0191488,-0.00708008,-0.11785,0.992822,120,255,1,'',NULL,71037),
(46130141,424023,0,11,0,'0',0,0,0,-1,-4257.2676,-3112.9792,28.1583,0.903044,0,0,0.436336,0.899784,120,255,1,'',NULL,71037),
(46130142,424024,0,11,0,'0',0,0,0,-1,-4257.7656,-3113.3733,28.1583,0.000000,0,0,0,1,120,255,1,'',NULL,71037),
(46130143,424025,0,11,0,'0',0,0,0,-1,-4257.6548,-3113.3059,29.3631,4.792030,0.230425,-0.169851,-0.656855,0.697565,120,255,1,'',NULL,71037),
(46130144,424044,0,11,0,'0',0,0,0,-1,-4259.4756,-3117.0435,28.5215,0.915352,0.00411987,0.0678606,0.439053,0.895885,120,255,1,'',NULL,71037),
(46130145,424058,0,11,0,'0',0,0,0,-1,-4261.2412,-3106.3315,30.8580,4.887235,-0.302302,-0.578486,-0.389295,0.649936,120,255,1,'',NULL,71037),
(46130146,424061,0,11,0,'0',0,0,0,-1,-4257.5923,-3113.2935,29.2399,0.006148,-0.00469542,0.0460234,0.00328064,0.998924,120,255,1,'',NULL,71037),
(46130147,620408,0,11,0,'0',0,0,0,-1,-4260.2778,-3120.2517,28.7883,0.751914,-0.0274324,0.0216646,0.367433,0.929393,120,255,1,'',NULL,71037),
(46130148,620410,0,11,0,'0',0,0,0,-1,-4256.2969,-3112.6250,29.0978,0.403316,-0.00650644,0.00793171,0.200326,0.979676,120,255,1,'',NULL,71037),
(46130149,672308,0,11,1017,'0',0,0,0,-1,-3404.5486,-3583.8577,47.2444,0.000000,0,0,0,1,120,255,1,'',NULL,71037);

-- 2. Subdued Dragonspawn 271373 holds a weapon on live (2179); ours had none.
DELETE FROM `creature_equip_template` WHERE `CreatureID`=271373 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`,
  `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES
(271373, 1, 2179, 0, 0, 0, 0, 0, 0, 0, 0, 71037);
UPDATE `creature` SET `equipment_id`=1 WHERE `id`=271373 AND `equipment_id`=0;

-- 3. Russian turn-in and progress texts live sends that we had none of: Bloom of the Heavens 98208, Understanding Our
--    Present 98216. Only where missing.
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (98208,'ruRU','Он уцелел! Слава Элуне!\r\n\r\nТысяча благодарностей, $n. Если не возражаешь, у меня есть к тебе еще одна просьба...',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (98216,'ruRU','Посмотри туда! Видишь, как скрижаль Гоаз начинает светиться вблизи ключа-камня? Я почти могу разобрать еще несколько слов...\r\n\r\nНам по-прежнему нужно узнать больше о том, что собой представляет Гоаз. Чувствую, впереди нас ждет еще много потрясающих открытий!',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98216,'ruRU','Камень что-нибудь сделал?!',71037);
