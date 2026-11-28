-- Alcaz Prison (map 2994): The Questioner (256236, spawn 48150002) walks his patrol inside his room as live has it, from the live
-- capture of 26 November 2026 (client 1.60.1.71139). Runs after 2026_11_27_40. Safe to run again.
-- On live, from 21:59:06 until the pull at 22:11:34 (58 legs seen), he walked between (-8772.96, 2854.23) and (-8762.13, 2845.53),
-- 13.9 yards each way, at walk speed (each leg 5.556 s = 2.5 yards a second). He waited at each end before turning back:
-- at (-8762.13, 2845.53) 5.4-9.1 s, median 6.7 s; at (-8772.96, 2854.23) 5.4-9.1 s, median 7.8 s. Here each end waits its
-- median (INFERRED: live's wait varies, ours is fixed).
-- Path 481500020 (spawn guid * 10).
DELETE FROM `waypoint_path_node` WHERE `PathId` = 481500020;
DELETE FROM `waypoint_path` WHERE `PathId` = 481500020;
INSERT INTO `waypoint_path` (`PathId`,`MoveType`,`Flags`,`Velocity`,`Comment`) VALUES
(481500020,0,0,NULL,'The Questioner - Alcaz Prison patrol (live)');
INSERT INTO `waypoint_path_node` (`PathId`,`NodeId`,`PositionX`,`PositionY`,`PositionZ`,`Orientation`,`Delay`) VALUES
(481500020,0,-8762.130,2845.526,13.191,NULL,6700),
(481500020,1,-8772.957,2854.227,13.191,NULL,7800);
DELETE FROM `creature_addon` WHERE `guid` = 48150002;
INSERT INTO `creature_addon` (`guid`,`PathId`) VALUES (48150002,481500020);
UPDATE `creature` SET `position_x` = -8772.957, `position_y` = 2854.227, `position_z` = 13.191, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 48150002;
