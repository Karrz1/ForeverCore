-- WoW Forever: live capture of 23 Nov 18:07-19:07 (client 71037; Elwynn Forest, Stormwind, Darnassus). Only what the world
-- DB lacked. Safe to run again.

-- Teuren Vineshade 277042, the Darnassus barber: live spawns him, we spawn him nowhere (guid 46130023).
-- The template is already in the world DB.
DELETE FROM `creature` WHERE `guid`=46130023;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`,
  `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `ScriptName`, `VerifiedBuild`) VALUES
(46130023, 277042, 1, 1657, 1657, '0', 0, 0, 0, -1, 0, 0, 9883.7744, 2315.4500, 1328.3044, 3.400689, 120, 0, 0, 100, 0, '', 71037);
