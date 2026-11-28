-- Narassin's Strongbox (676349), Tower of Althalaxx, Darkshore. Players get the Azsharan Key 282406 from Athrikus Narassin 3660
-- (2026_11_17_97) but the chest it opens did not exist: no template, no spawn. It is a server-side object on live (not in the
-- 71139 GameObjects.db2). Data from Wowhead Forever (object 676349, read 11-27): a chest, model 130736, key Azsharan Key,
-- contains Narassin's Tome 282404 (79 of 79), two spots on the tower top, Darkshore 56.1,26.5 and 56.2,26.4.
-- Lock 4529 is the client's own (71139 Lock.db2): Azsharan Key 282406, or Lockpicking 70.
-- Spots: map coords -> world with UiMapAssignment 46749 (UiMap 1439), next to Narassin (7183.5,-727.6,94.06); one of the two up
-- at a time (pool). Height, facing and respawn time are not in the data: z from Narassin's spawn, facing 0, 5 min respawn.
-- Guids 48143000-48143001, pool 48143000. Safe to run again.
DELETE FROM `gameobject_template` WHERE `entry`=676349;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`Data2`,`Data3`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`VerifiedBuild`) VALUES
(676349,3,130736,'Narassin''s Strongbox','','','',1,4529,676349,0,1,0,0,'','',71139);

DELETE FROM `gameobject_loot_template` WHERE `Entry`=676349;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(676349,0,282404,100,0,1,0,1,1,'Narassin''s Strongbox - Narassin''s Tome');

DELETE FROM `pool_members` WHERE `type`=1 AND `spawnId` IN (48143000,48143001);
DELETE FROM `pool_template` WHERE `entry`=48143000;
DELETE FROM `gameobject` WHERE `guid` IN (48143000,48143001);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`) VALUES
(48143000,676349,1,148,0,'0',0,0,0,-1,7176.2,-732.9,94.1,0,0,0,0,1,300,100,1,71139),
(48143001,676349,1,148,0,'0',0,0,0,-1,7180.5,-739.4,94.1,0,0,0,0,1,300,100,1,71139);
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES (48143000,1,'Narassin''s Strongbox, Tower of Althalaxx');
INSERT INTO `pool_members` (`type`,`spawnId`,`poolSpawnId`,`chance`,`description`) VALUES
(1,48143000,48143000,0,'Narassin''s Strongbox, spot 1'),
(1,48143001,48143000,0,'Narassin''s Strongbox, spot 2');
