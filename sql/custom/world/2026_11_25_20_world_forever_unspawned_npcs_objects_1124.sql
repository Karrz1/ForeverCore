-- WoW Forever: creatures and objects we had templates for but never spawned. Positions from Everlake's world data
-- (buildthehomelab/wow-everlake-world-data 1b7b651, GPL-3.0, used with credit), which read them from the ForeverTracker
-- locator (QuestieDB Forever records and Wowhead Forever map pins) with heights from the server's maps.
--   Sebastian Jurgens 228956 (Tanaris coast): gives Rift Away 84213.
--   270573 and 270574: two of the three credit points of Valuable Vantages 98095; they stand still like the third, 270575.
--   Baron Bloodbane 10819 (Eastern Plaguelands rare, drops Royal Seal of Alexis 16999): two spots in one pool, one up at a
--   time, 5 h respawn like the zone's other rares.
--   Book 441247 (Swamp of Sorrows, holds item 220345) and Old Crate 442688 (Thousand Needles, holds Old Key 221497, which
--   starts The Old Key 95599).
-- Guids 920017000-920017006 and pool 920000201 are free here. Running it again changes nothing.

DELETE FROM `pool_members` WHERE `type` = 0 AND `spawnId` IN (920017000, 920017001);
DELETE FROM `pool_template` WHERE `entry` = 920000201;
DELETE FROM `creature` WHERE `guid` BETWEEN 920017000 AND 920017004;
DELETE FROM `gameobject` WHERE `guid` BETWEEN 920017005 AND 920017006;

INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(920017000,10819,0,0,0,'0',0,0,0,-1,0,0,3115.47,-3650.13,142.69,1.693,18000,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,0),
(920017001,10819,0,0,0,'0',0,0,0,-1,0,0,3095.4,-3736.17,133.52,0,18000,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,0),
(920017002,228956,1,0,0,'0',0,0,0,-1,0,0,-10268.92,-4033.76,0.67,1.594,120,0,0,NULL,0,NULL,NULL,NULL,NULL,'',NULL,0),
(920017003,270573,0,0,0,'0',0,0,0,-1,0,0,-275.01,-296.91,170.41,0.888,120,0,0,NULL,0,NULL,NULL,NULL,NULL,'',NULL,0),
(920017004,270574,0,0,0,'0',0,0,0,-1,0,0,-248.11,-1221.97,118.73,1.604,120,0,0,NULL,0,NULL,NULL,NULL,NULL,'',NULL,0);

INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(920017005,441247,0,0,0,'0',0,0,0,-1,-10414.01,-3834.73,28.42,5.991,0,0,0.145574,-0.989347,300,255,1,'',NULL,0),
(920017006,442688,1,0,0,'0',0,0,0,-1,-4589.74,120.05,82.08,3.721,0,0,0.958329,-0.285668,300,255,1,'',NULL,0);

INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(920000201, 1, 'Baron Bloodbane (10819), Eastern Plaguelands: one of two spots');
INSERT INTO `pool_members` (`type`,`spawnId`,`poolSpawnId`,`chance`,`description`) VALUES
(0, 920017000, 920000201, 0, 'Baron Bloodbane, spot 1'),
(0, 920017001, 920000201, 0, 'Baron Bloodbane, spot 2');
