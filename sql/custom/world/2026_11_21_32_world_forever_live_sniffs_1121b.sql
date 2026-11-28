-- WoW Forever: live captures of 21 Nov 11:14, 18:09 and 21:37 (client 71037; Elwynn, Westfall, Redridge, Stormwind, Darkshore,
-- Ashenvale, Blackfathom Deeps). Only what the world DB lacked or had different from live. Texts are in the hotfixes file of
-- this kit. Safe to run again.

-- 1. Blackfathom Deeps, Altar of the Deeps: live uses button 94485, whose linked trap 94040 casts Blackfathom Teleport (8735).
--    We had button 103016 linked to the Shrine of Gelihast trap 94039 (Blessing of Blackfathom) plus a loose 94039 trap there,
--    so the altar gave the shrine's blessing instead of the teleport. The Shrine of Gelihast itself is unchanged.
DELETE FROM `gameobject` WHERE `guid` IN (30014107,30032935) AND `id` IN (94039,103016);

-- 2. Objects live has that we spawn nowhere (guids 46130100-46130133):
--    Alther's Mill (98386): the live Tarantula Egg 673085 (its spell 1309544 gives the 271912 credit) at live's own places,
--    with the webs around them. It replaces our stand-in egg 673101 (model and heights were guessed), whose spawns go.
--    Stolen Saws (94931): the Stolen Tools chest 624265 its item comes from. Redridge: Weathered Anchor 652519, crates,
--    barrels and a book, an anvil and forge. Stormwind: Gatehouse Shipment 660724 and the General Turalyon plaque 696296.
--    Darkshore: Kerlonian's Bag 669271. Ashenvale: Wooden Figurine 375544 and Archaeologist's Cart 375546.
DELETE FROM `gameobject` WHERE `guid` BETWEEN 67310100 AND 67310113 AND `id`=673101;
DELETE FROM `gameobject` WHERE `guid` BETWEEN 46130100 AND 46130133;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,
`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,
`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(46130100,94485,48,719,719,'0',0,0,0,-1,-839.5863,-477.8427,-33.9758,1.884953,0,0,0.809016,0.587786,7200,255,1,'',NULL,71037),
(46130101,673085,0,44,999,'0',0,0,0,-1,-9235.1299,-2697.3560,89.0860,3.281239,0,0,-0.997563,0.0697661,60,255,1,'',NULL,71037),
(46130102,673085,0,44,44,'0',0,0,0,-1,-9229.5137,-2726.0540,88.8279,4.136433,0,0,-0.878817,0.47716,60,255,1,'',NULL,71037),
(46130103,673085,0,44,0,'0',0,0,0,-1,-9222.9375,-2689.6528,89.0860,4.607672,0,0,-0.743144,0.669131,60,255,1,'',NULL,71037),
(46130104,673085,0,44,44,'0',0,0,0,-1,-9222.6133,-2716.7102,88.8043,5.410522,0,0,-0.422618,0.906308,60,255,1,'',NULL,71037),
(46130105,673085,0,44,0,'0',0,0,0,-1,-9185.7051,-2685.8750,92.7123,4.136433,0,0,-0.878817,0.47716,60,255,1,'',NULL,71037),
(46130106,673085,0,44,999,'0',0,0,0,-1,-9158.5762,-2785.4861,89.6252,1.291542,0,0,0.601814,0.798636,60,255,1,'',NULL,71037),
(46130107,673085,0,44,999,'0',0,0,0,-1,-9129.2393,-2757.8801,92.9102,3.961899,0,0,-0.91706,0.39875,60,255,1,'',NULL,71037),
(46130108,673085,0,44,0,'0',0,0,0,-1,-9127.5713,-2719.6807,93.5249,5.288348,0,0,-0.477159,0.878817,60,255,1,'',NULL,71037),
(46130109,673085,0,44,999,'0',0,0,0,-1,-9116.1025,-2688.3645,90.6667,5.078908,0,0,-0.566406,0.824126,60,255,1,'',NULL,71037),
(46130110,673046,0,44,44,'0',0,0,0,-1,-9235.1396,-2713.4124,102.3183,5.427976,-0.638922,0.291173,-0.295277,0.647927,120,255,1,'',NULL,71037),
(46130111,673049,0,44,44,'0',0,0,0,-1,-9235.0977,-2713.2180,102.2658,0.803164,-0.834789,-0.401868,0.0369959,0.374515,120,255,1,'',NULL,71037),
(46130112,673054,0,44,44,'0',0,0,0,-1,-9237.9102,-2697.9270,91.2491,0.000000,0,0,0,1,120,255,1,'',NULL,71037),
(46130113,673054,0,44,44,'0',0,0,0,-1,-9218.8975,-2690.6372,91.3997,3.473210,0,0,-0.986285,0.16505,120,255,1,'',NULL,71037),
(46130114,673056,0,44,44,'0',0,0,0,-1,-9237.2500,-2700.1650,89.0860,3.141593,0,0,-1,0,120,255,1,'',NULL,71037),
(46130115,673056,0,44,97,'0',0,0,0,-1,-9226.0264,-2785.7883,90.7951,2.286379,0,0,0.909961,0.414694,120,255,1,'',NULL,71037),
(46130116,673056,0,44,44,'0',0,0,0,-1,-9225.0830,-2709.5955,89.0860,2.286379,0,0,0.909961,0.414694,120,255,1,'',NULL,71037),
(46130117,673056,0,44,44,'0',0,0,0,-1,-9224.3838,-2689.3977,89.0860,1.186823,0,0,0.559193,0.829038,120,255,1,'',NULL,71037),
(46130118,673056,0,44,97,'0',0,0,0,-1,-9158.5908,-2785.8838,89.0353,1.186823,0,0,0.559193,0.829038,120,255,1,'',NULL,71037),
(46130119,673056,0,44,0,'0',0,0,0,-1,-9115.8330,-2688.0886,90.2453,2.286379,0,0,0.909961,0.414694,120,255,1,'',NULL,71037),
(46130120,624265,0,44,0,'0',0,0,0,-1,-8788.8926,-2719.3230,200.6062,5.659002,0,0,-0.30705,0.951693,120,255,1,'',NULL,71037),
(46130121,652519,0,44,0,'0',0,0,0,-1,-9399.6846,-2341.6389,57.0859,1.726944,0.545226,0.567836,-0.443152,0.428844,120,255,1,'',NULL,71037),
(46130122,387456,0,44,1000,'0',0,0,0,-1,-9456.3574,-3083.2605,136.6870,0.743321,0,0,0.363163,0.931726,120,255,1,'',NULL,71037),
(46130123,387456,0,44,1000,'0',0,0,0,-1,-9455.9219,-3075.7048,136.6868,0.000000,0,0,0,1,120,255,1,'',NULL,71037),
(46130124,387462,0,44,1000,'0',0,0,0,-1,-9455.3193,-3081.7605,136.6870,0.000000,0,0,0,1,120,255,1,'',NULL,71037),
(46130125,387462,0,44,1000,'0',0,0,0,-1,-9454.7920,-3082.8333,141.7095,0.000000,0,0,0,1,120,255,1,'',NULL,71037),
(46130126,424036,0,44,999,'0',0,0,0,-1,-9418.6289,-2998.5959,156.2725,0.000000,0,0,0,1,120,255,1,'',NULL,71037),
(46130127,617437,0,44,1002,'0',0,0,0,-1,-9663.4014,-1907.4653,56.6954,6.204648,0,0,-0.039259,0.999229,120,255,1,'',NULL,71037),
(46130128,617438,0,44,1002,'0',0,0,0,-1,-9663.5137,-1909.4080,56.8689,3.455756,0,0,-0.987688,0.156436,120,255,1,'',NULL,71037),
(46130129,660724,0,1519,1519,'0',0,0,0,-1,-8859.5664,569.9958,101.0667,1.021683,0,0,0.488912,0.872333,120,255,1,'',NULL,71037),
(46130130,696296,0,1519,1519,'0',0,0,0,-1,-8950.2412,523.9471,98.1296,3.813545,0,0,-0.944089,0.329691,120,255,1,'',NULL,71037),
(46130131,669271,1,148,2077,'0',0,0,0,-1,4381.0488,191.8837,49.6536,0.000000,0,0,0,1,120,255,1,'',NULL,71037),
(46130132,375544,1,331,0,'0',0,0,0,-1,3826.2083,165.3403,20.9978,0.950536,-0.579231,0.405574,0.579231,0.405576,120,255,1,'',NULL,71037),
(46130133,375546,1,331,0,'0',0,0,0,-1,3806.3281,161.0017,7.1765,1.151168,0,0,0.544325,0.838875,120,255,1,'',NULL,71037);

-- 3. Alba Fairmoon 253092 (Westfall) greets with text 301857 on live; she had no menu.
DELETE FROM `npc_text` WHERE `ID`=690005;
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`, `VerifiedBuild`) VALUES
(690005, 1, 301857, 71037);
DELETE FROM `gossip_menu` WHERE `MenuID`=40881;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`, `VerifiedBuild`) VALUES
(40881, 690005, 71037);
DELETE FROM `creature_template_gossip` WHERE `CreatureID`=253092;
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES
(253092, 40881, 71037);

-- 4. Weapons as live shows them: Incinerator Gar'im 214519 (WANTED quest 95999) holds 15275 and had none; the Redridge
--    guards 932-936 carry gun 12523; Lakeshire Guard 10037 and Sentinel Onaeya 11806 carry no ranged weapon.
DELETE FROM `creature_equip_template` WHERE `CreatureID`=214519 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES
(214519, 1, 15275, 0, 0, 0, 0, 0, 0, 0, 0, 71037);
UPDATE `creature` SET `equipment_id`=1 WHERE `equipment_id`=0 AND `id`=214519;
UPDATE `creature_equip_template` SET `ItemID3`=12523, `AppearanceModID3`=0, `ItemVisual3`=0 WHERE `ID`=1 AND `CreatureID` IN (932,933,934,935,936);
UPDATE `creature_equip_template` SET `ItemID3`=0, `AppearanceModID3`=0, `ItemVisual3`=0 WHERE `ID`=1 AND `CreatureID` IN (10037,11806);

-- 5. Russian turn-in and progress texts live sends for WANTED: Incinerator Gar'im 95999 and Blackrock Blockade 98387
--    (we had none in Russian). Only where missing.
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES
(95999, 'ruRU', 'Отличная работа, $n! Испепелитель Гар''им собирался укрепить оборону крепости Каменной Стражи. Эта победа дает нам шанс отбить ее!', 71037),
(98387, 'ruRU', 'Отлично сработано, $n. Поскольку орки клана Черной Горы отрезаны от союзников в Пылающих степях, у них нет никакой надежды удержаться на позициях без надлежащего снабжения.', 71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES
(95999, 'ruRU', 'Что это там у тебя, |3-6($r)?', 71037),
(98387, 'ruRU', 'Большая часть того, что ты найдешь – это все равно добро, награбленное в Приозерье. Мне будет приятно знать, что наш народ процветает, пока орки чахнут.', 71037);
