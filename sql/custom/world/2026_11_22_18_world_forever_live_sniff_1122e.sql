-- WoW Forever: live capture of 22 Nov 22:17-23:10 (client 71037; Westfall, Stormwind harbor). Only what the world DB
-- lacked or had different from live. Safe to run again.

-- 1. Manifest Clerk Philmor 268511 (Stormwind harbor, quest Philmor's Favor 97220): live opens his own greeting
--    (menu 43808, BroadcastText 318392, sent by the hotfixes kit of the same day) and he carries item 2714 in his hand.
--    Ours had no menu, no gossip flag (live npcflag 3) and no item.
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=268511;
DELETE FROM `npc_text` WHERE `ID`=690006;
INSERT INTO `npc_text` (`ID`,`Probability0`,`Probability1`,`Probability2`,`Probability3`,`Probability4`,`Probability5`,`Probability6`,`Probability7`,
  `BroadcastTextID0`,`BroadcastTextID1`,`BroadcastTextID2`,`BroadcastTextID3`,`BroadcastTextID4`,`BroadcastTextID5`,`BroadcastTextID6`,`BroadcastTextID7`,`VerifiedBuild`) VALUES
(690006,1,0,0,0,0,0,0,0,318392,0,0,0,0,0,0,0,71037);
DELETE FROM `gossip_menu` WHERE `MenuID`=43808;
INSERT INTO `gossip_menu` (`MenuID`,`TextID`,`VerifiedBuild`) VALUES (43808,690006,71037);
DELETE FROM `creature_template_gossip` WHERE `CreatureID`=268511;
INSERT INTO `creature_template_gossip` (`CreatureID`,`MenuID`,`VerifiedBuild`) VALUES (268511,43808,71037);
DELETE FROM `creature_equip_template` WHERE `CreatureID`=268511 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`,
  `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES
(268511, 1, 2714, 0, 0, 0, 0, 0, 0, 0, 0, 71037);
UPDATE `creature` SET `equipment_id`=1 WHERE `id`=268511;

-- 2. Stormwind Crier 269863: live has one, mounted, at Sentinel Hill in Westfall; we spawn it nowhere (guid 46130022).
--    The template is already in the world DB.
DELETE FROM `creature` WHERE `guid`=46130022;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`,
  `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `ScriptName`, `VerifiedBuild`) VALUES
(46130022, 269863, 0, 40, 108, '0', 0, 0, 0, -1, 0, 0, -10586.8506, 986.9202, 37.3910, 5.858883, 120, 0, 0, 100, 0, '', 71037);
DELETE FROM `creature_template_addon` WHERE `entry`=269863;
INSERT INTO `creature_template_addon` (`entry`,`PathId`,`mount`,`MountCreatureID`,`StandState`,`AnimTier`,`VisFlags`,`SheathState`,`PvPFlags`,`emote`,
  `aiAnimKit`,`movementAnimKit`,`meleeAnimKit`,`visibilityDistanceType`,`auras`) VALUES
(269863,0,2404,0,0,0,0,1,0,0,0,0,0,0,'');
