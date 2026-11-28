-- Alcaz Prison (map 2994): the two doors 2026_11_27_40 lacked, now read from the raw object packets of the same live capture
-- (26 November 2026, client 1.60.1.71139). Runs after 2026_11_27_40. Safe to run again.
--  * Prison Gate 649546 at (-8763.44, 2949.20, 6.14), facing 1.5708: the player opened it at 22:02:01 on the way to the
--    Maximum Security Door. Like the other Prison Gates it has no lock and closes by itself (Data2 = 3000 ms; on live it shut
--    5 s after each use). Its template is live's own query answer.
--  * Cell Door 650878 at (-8908.95, 2966.26, 6.75), facing 1.5708, next to 650877 by Blazeroar: opened at 22:10:04 and stayed open.
--    Template already added by 2026_11_27_40.
-- Both start closed (state 1). INFERRED: the parser could not read these two objects' create blocks, so their state is taken
-- from what followed (each was used once and opened), as for the other closed doors.
DELETE FROM `gameobject_template` WHERE `entry` = 649546;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `Data33`, `Data34`, `ContentTuningId`, `RequiredLevel`, `AIName`, `ScriptName`, `StringId`, `VerifiedBuild`) VALUES
(649546, 0, 411, 'Prison Gate', '', '', '', 0.999999821186065673, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT, 71037);
DELETE FROM `gameobject` WHERE `guid` IN (48150027, 48150028);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(48150027,649546,2994,16620,16620,'1,201',0,0,0,-1,-8763.438,2949.199,6.140,1.5708,0,0,0.707106769084930419,0.707106769084930419,7200,255,1,'',NULL,71139),
(48150028,650878,2994,16620,16620,'1,201',0,0,0,-1,-8908.953,2966.259,6.754,1.5708,0,0,0.707106769084930419,0.707106769084930419,7200,255,1,'',NULL,71139);
