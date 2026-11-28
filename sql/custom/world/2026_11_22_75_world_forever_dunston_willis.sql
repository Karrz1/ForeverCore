-- WoW Forever: Dunston Willis (259057), the captive explorer in Bolder'ok, Riverglades.
-- Live: In Need of Relief (96125) is handed in to Dunston Willis "somewhere among the ogres in Bolder'ok" (Wowhead Forever,
-- quest 96125: End Dunston Willis). Ours had no template or spawn for him and handed the quest back to Watcher Cornelius.
-- His follow-ups An Ogre's Captive (96126) and Dunston Checks Out (94927, escort) are not in our world yet; this file only
-- puts him in the world and moves the 96125 hand-in to him.
-- Template data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
-- (https://creativecommons.org/licenses/by/4.0/). Source: github.com/JIVESCORP/eg-link-output-wowf creature_details
-- (build 1.60.1.70938: name, display 141307, type humanoid, warrior class, health x2.0, difficulty id 342237, type flags 4096).
-- Changed: picked and converted to our tables.
-- Level 44 and the spot: Wowhead Forever (npc 259057, 17 sightings; this is the densest group, about 50 yd north of
-- Gronok the Butcher). Height from the dev realm's ground at that spot.
-- ESTIMATED: faction 11 like Watcher Cornelius (Alliance friendly, Horde hostile, as Wowhead shows), damage modifier 1.0,
-- attack speed 2000. VerifiedBuild -1 marks these rows as estimated. Safe to run again.

DELETE FROM `creature_template` WHERE `entry`=259057;
INSERT INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`name`,`femaleName`,`subname`,`TitleAlt`,`IconName`,`RequiredExpansion`,`VignetteID`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`Classification`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`unit_flags3`,`family`,`trainer_class`,`type`,`VehicleId`,`AIName`,`MovementType`,`ExperienceModifier`,`RacialLeader`,`movementId`,`WidgetSetID`,`WidgetSetUnitConditionID`,`RegenHealth`,`CreatureImmunitiesId`,`flags_extra`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(259057,0,0,'Dunston Willis',NULL,NULL,NULL,NULL,0,0,11,2,1.0,1.14286,1.0,0,0,2000,2000,1.0,1.0,1,0,2048,0,0,0,7,0,'',0,1.0,0,0,0,0,1,0,0,'',NULL,-1);

DELETE FROM `creature_template_difficulty` WHERE `Entry`=259057 AND `DifficultyID`=0;
INSERT INTO `creature_template_difficulty` (`Entry`,`DifficultyID`,`LevelScalingDeltaMin`,`LevelScalingDeltaMax`,`ContentTuningID`,`HealthScalingExpansion`,`HealthModifier`,`ManaModifier`,`ArmorModifier`,`DamageModifier`,`CreatureDifficultyID`,`TypeFlags`,`TypeFlags2`,`TypeFlags3`,`LootID`,`PickPocketLootID`,`SkinLootID`,`GoldMin`,`GoldMax`,`StaticFlags1`,`StaticFlags2`,`StaticFlags3`,`StaticFlags4`,`StaticFlags5`,`StaticFlags6`,`StaticFlags7`,`StaticFlags8`,`VerifiedBuild`) VALUES
(259057,0,0,0,0,0,2.0,1.0,1.0,1.0,342237,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1);

DELETE FROM `creature_template_model` WHERE `CreatureID`=259057;
INSERT INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(259057,0,141307,1.0,1.0,-1);

DELETE FROM `creature_classic_level` WHERE `entry`=259057;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (259057,44,44);

DELETE FROM `creature` WHERE `guid`=47600490;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(47600490,259057,0,0,0,'0',0,0,0,-1,0,0,-7087.5,-5116.9,78.47,4.72,120,0,0,NULL,0,NULL,NULL,NULL,NULL,'',NULL,-1);

-- 96125 In Need of Relief: hand in to Dunston Willis, not back to Watcher Cornelius.
DELETE FROM `creature_questender` WHERE `quest`=96125;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259057,96125,0);
