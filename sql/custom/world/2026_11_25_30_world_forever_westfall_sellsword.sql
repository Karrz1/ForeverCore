-- The Alliance hire network (npc_fb_hire_broker, the 39 brokers of
-- 2026_10_31_20_world_forever_hire_brokers.sql) puts a Sellsword Captain
-- beside the innkeeper of every Alliance levelling town - Elwynn,
-- Dun Morogh, Loch Modan, Redridge, Duskwood, Hillsbrad, the night-elf
-- towns, Theramore and the Stormwind park - but skips Westfall, where the
-- People's Militia chain sends every levelling Alliance player.
--
-- Murgen Flintlock (entry 6110030) stands inside the Sentinel Hill tower
-- with the militia officers:
--   map 0  x -10509.899  y 1026.5471  z 60.5227  orientation 0.527376
-- (exact player .gps, captured in place)
--
-- The template is a straight clone of entry 6110000 (Brannock Ironhale,
-- Goldshire): same faction 12, npcflag 1, broker script, flags_extra 2,
-- dwarf model 1598. No npc_vendor rows - the shop is driven by
-- npc_fb_hire_broker itself.
--
-- The creature_template_gossip row is the fix already applied to the 39
-- brokers in 2026_11_01_20_world_forever_hire_broker_gossip.sql: without
-- it the client is told the NPC has no gossip and strips the talk cursor.
-- Menu 6110000 is the shared broker menu; the script builds the options.
--
-- Spawn guid 61100039: the next free one in the broker range 61100000-61100099 (2026_10_31_20 uses 61100000-61100038).
-- Level and health tuning (creature_template_difficulty) is the Sentinel Hill innkeeper's (Heather, 8931), like every broker;
-- Goldshire's when that row is missing.
-- New spawns load at map/cell load - restart worldserver (or reload the
-- cell) to see him. Safe to run again.

DELETE FROM `creature` WHERE `guid` IN (61100039, 61100300);
DELETE FROM `creature_template_difficulty` WHERE `Entry`=6110030;
DELETE FROM `creature_template_gossip` WHERE `CreatureID`=6110030;
DELETE FROM `creature_template_model` WHERE `CreatureID`=6110030;
DELETE FROM `creature_template` WHERE `entry`=6110030;

INSERT INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`name`,`femaleName`,`subname`,`TitleAlt`,`IconName`,`RequiredExpansion`,`VignetteID`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`Classification`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`unit_flags3`,`family`,`trainer_class`,`type`,`VehicleId`,`AIName`,`MovementType`,`ExperienceModifier`,`RacialLeader`,`movementId`,`WidgetSetID`,`WidgetSetUnitConditionID`,`RegenHealth`,`CreatureImmunitiesId`,`flags_extra`,`ScriptName`,`StringId`,`VerifiedBuild`)
SELECT 6110030,`KillCredit1`,`KillCredit2`,'Murgen Flintlock',`femaleName`,`subname`,`TitleAlt`,`IconName`,`RequiredExpansion`,`VignetteID`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`Classification`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`unit_flags3`,`family`,`trainer_class`,`type`,`VehicleId`,`AIName`,`MovementType`,`ExperienceModifier`,`RacialLeader`,`movementId`,`WidgetSetID`,`WidgetSetUnitConditionID`,`RegenHealth`,`CreatureImmunitiesId`,`flags_extra`,`ScriptName`,`StringId`,`VerifiedBuild`
FROM `creature_template` WHERE `entry`=6110000;

DROP TEMPORARY TABLE IF EXISTS `tmp_sellsword`;
CREATE TEMPORARY TABLE `tmp_sellsword` SELECT * FROM `creature_template_difficulty` WHERE `Entry`=6110000 AND `DifficultyID`=0;
UPDATE `tmp_sellsword` SET `Entry`=6110030,
  `ContentTuningID`=COALESCE((SELECT d.`ContentTuningID` FROM `creature_template_difficulty` d WHERE d.`Entry`=8931 AND d.`DifficultyID`=0), `ContentTuningID`);
INSERT INTO `creature_template_difficulty` SELECT * FROM `tmp_sellsword`;
DROP TEMPORARY TABLE IF EXISTS `tmp_sellsword`;

INSERT INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(6110030,0,1598,1,1,0);

INSERT INTO `creature_template_gossip` (`CreatureID`,`MenuID`,`VerifiedBuild`) VALUES
(6110030,6110000,0);

INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(61100039,6110030,0,0,0,'0',0,0,0,-1,0,0,-10509.899,1026.5471,60.5227,0.527376,300,0,0,100,0,NULL,NULL,NULL,NULL,'',NULL,0);
