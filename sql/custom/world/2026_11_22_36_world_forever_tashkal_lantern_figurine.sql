-- WoW Forever: Ta'shkal <Escaped Experiment> (268231), the tameable level 57-58 cat a hunter calls at the Lonely Lantern
-- (660408) in Malorne's Retreat, Mount Hyjal, with a Corrupted Cat Figurine (item 276909) from the fel pools of the Felblood
-- Scar (object 660432). None of the three was in our world. From Wowhead's WoW Forever pages (read 2026-11-22): name, subname,
-- level 57-58, beast, cat, tameable, 1.00 attack speed, model 9230; lantern model 438, figurine model 127148; the map spots.
-- The lantern casts 1301234 (client spell: send event 104925, the event that brings Ta'shkal); the spell works only with a
-- figurine in the bags (condition below). The figurine object holds the figurine item, settings copied from our own plain
-- chest 629596 without its quest. Health and damage multipliers 1 (ESTIMATED: no live value). The summon itself is the
-- event script, not part of this file (Ta'shkal's spot: 4793.2 -1849.1 1280.53). Spawns: Wowhead map spots turned into world
-- coordinates with a fit on 7 of our Mount Hyjal NPCs (within about 4 yd), heights from groundz on the dev server; the 13
-- figurine sightings merged within 10 yd into 9 spots, at most 2 up at a time (pool). Respawn 120 s, orientation 0 (ESTIMATED).
-- Safe to run again.
DELETE FROM `creature_template` WHERE `entry` = 268231;
DELETE FROM `creature_template_difficulty` WHERE `Entry` = 268231 AND `DifficultyID` = 0;
DELETE FROM `creature_template_model` WHERE `CreatureID` = 268231;
DELETE FROM `creature_classic_level` WHERE `entry` = 268231;
DELETE FROM `creature_classic_stats` WHERE `entry` = 268231;
INSERT INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`name`,`femaleName`,`subname`,`TitleAlt`,`IconName`,`RequiredExpansion`,`VignetteID`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`Classification`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`unit_flags3`,`family`,`trainer_class`,`type`,`VehicleId`,`AIName`,`MovementType`,`ExperienceModifier`,`RacialLeader`,`movementId`,`WidgetSetID`,`WidgetSetUnitConditionID`,`RegenHealth`,`CreatureImmunitiesId`,`flags_extra`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(268231,0,0,'Ta''shkal',NULL,'Escaped Experiment',NULL,NULL,0,0,16,0,1.0,1.14286,1.0,0,0,1000,2000,1.0,1.0,1,0,2048,0,2,0,1,0,'',0,1.0,0,0,0,0,1,0,0,'',NULL,-1);
INSERT INTO `creature_template_difficulty` (`Entry`,`DifficultyID`,`LevelScalingDeltaMin`,`LevelScalingDeltaMax`,`ContentTuningID`,`HealthScalingExpansion`,`HealthModifier`,`ManaModifier`,`ArmorModifier`,`DamageModifier`,`CreatureDifficultyID`,`TypeFlags`,`TypeFlags2`,`TypeFlags3`,`LootID`,`PickPocketLootID`,`SkinLootID`,`GoldMin`,`GoldMax`,`StaticFlags1`,`StaticFlags2`,`StaticFlags3`,`StaticFlags4`,`StaticFlags5`,`StaticFlags6`,`StaticFlags7`,`StaticFlags8`,`VerifiedBuild`) VALUES
(268231,0,0,0,0,0,1.0,1.0,1.0,1.0,0,134217729,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1);
INSERT INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES (268231,0,9230,1.0,1.0,-1);
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (268231,57,58);
INSERT INTO `creature_classic_stats` (`entry`,`health_multiplier`,`mana_multiplier`,`armor_multiplier`,`damage_multiplier`,`damage_variance`) VALUES (268231,1,1,1,1,0.14);

DELETE FROM `gameobject_template` WHERE `entry` IN (660408,660432);
DELETE FROM `gameobject_template_addon` WHERE `entry` IN (660408,660432);
-- Lonely Lantern: goober (type 10), cast on use 1301234 (Data10).
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`Data2`,`Data3`,`Data4`,`Data5`,`Data6`,`Data7`,`Data8`,`Data9`,`Data10`,`Data11`,`Data12`,`Data13`,`Data14`,`Data15`,`Data16`,`Data17`,`Data18`,`Data19`,`Data20`,`Data21`,`Data22`,`Data23`,`Data24`,`Data25`,`Data26`,`Data27`,`Data28`,`Data29`,`Data30`,`Data31`,`Data32`,`Data33`,`Data34`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(660408,10,438,'Lonely Lantern','','','',1,0,0,0,0,0,0,0,0,0,0,1301234,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',NULL,-1);
-- Corrupted Cat Figurine: our plain chest 629596 (lock, open on click, used up) holding item 276909, no quest.
INSERT INTO `gameobject_template` (`entry`,`displayId`,`name`,`size`,`Data1`,`Data8`,`type`,`IconName`,`castBarCaption`,`unk1`,`Data0`,`Data2`,`Data3`,`Data4`,`Data5`,`Data6`,`Data7`,`Data9`,`Data10`,`Data11`,`Data12`,`Data13`,`Data14`,`Data15`,`Data16`,`Data17`,`Data18`,`Data19`,`Data20`,`Data21`,`Data22`,`Data23`,`Data24`,`Data25`,`Data26`,`Data27`,`Data28`,`Data29`,`Data30`,`Data31`,`Data32`,`Data33`,`Data34`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,`VerifiedBuild`)
SELECT 660432,127148,'Corrupted Cat Figurine',1,660432,0,`type`,`IconName`,`castBarCaption`,`unk1`,`Data0`,`Data2`,`Data3`,`Data4`,`Data5`,`Data6`,`Data7`,`Data9`,`Data10`,`Data11`,`Data12`,`Data13`,`Data14`,`Data15`,`Data16`,`Data17`,`Data18`,`Data19`,`Data20`,`Data21`,`Data22`,`Data23`,`Data24`,`Data25`,`Data26`,`Data27`,`Data28`,`Data29`,`Data30`,`Data31`,`Data32`,`Data33`,`Data34`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,-1
FROM `gameobject_template` WHERE `entry` = 629596;
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 660432 AND `Item` = 276909;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(660432,0,276909,100,0,1,0,1,1,'Corrupted Cat Figurine');

-- 1301234 only with a Corrupted Cat Figurine in the bags (condition source 17 = spell, condition 2 = item).
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 1301234;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ConditionStringValue1`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,1301234,0,0,2,0,276909,1,0,'',0,0,0,'','Lonely Lantern: needs a Corrupted Cat Figurine');

DELETE FROM `pool_members` WHERE `type` = 1 AND `spawnId` BETWEEN 47501200 AND 47501212;
DELETE FROM `pool_template` WHERE `entry` = 47501200;
DELETE FROM `gameobject` WHERE `guid` BETWEEN 47501200 AND 47501212;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(47501200,660408,1,0,0,'0',0,0,0,-1,4798.00,-1847.00,1280.42,0,0,0,0,1,300,255,1,'',NULL,-1),
(47501201,660432,1,0,0,'0',0,0,0,-1,4567.30,-2426.40,1098.16,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501202,660432,1,0,0,'0',0,0,0,-1,4567.30,-2436.80,1099.48,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501203,660432,1,0,0,'0',0,0,0,-1,4375.90,-2452.00,1064.86,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501204,660432,1,0,0,'0',0,0,0,-1,4405.90,-2455.30,1062.40,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501205,660432,1,0,0,'0',0,0,0,-1,4554.30,-2470.40,1100.02,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501206,660432,1,0,0,'0',0,0,0,-1,4581.40,-2575.10,1094.94,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501207,660432,1,0,0,'0',0,0,0,-1,4516.80,-2575.60,1094.74,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501208,660432,1,0,0,'0',0,0,0,-1,4394.60,-2599.00,1093.93,0,0,0,0,1,120,255,1,'',NULL,-1),
(47501209,660432,1,0,0,'0',0,0,0,-1,4496.10,-2600.00,1096.13,0,0,0,0,1,120,255,1,'',NULL,-1);
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES (47501200,2,'Corrupted Cat Figurine, Felblood Scar');
INSERT INTO `pool_members` (`type`,`spawnId`,`poolSpawnId`,`chance`,`description`) VALUES
(1,47501201,47501200,0,'Corrupted Cat Figurine'),
(1,47501202,47501200,0,'Corrupted Cat Figurine'),
(1,47501203,47501200,0,'Corrupted Cat Figurine'),
(1,47501204,47501200,0,'Corrupted Cat Figurine'),
(1,47501205,47501200,0,'Corrupted Cat Figurine'),
(1,47501206,47501200,0,'Corrupted Cat Figurine'),
(1,47501207,47501200,0,'Corrupted Cat Figurine'),
(1,47501208,47501200,0,'Corrupted Cat Figurine'),
(1,47501209,47501200,0,'Corrupted Cat Figurine');
