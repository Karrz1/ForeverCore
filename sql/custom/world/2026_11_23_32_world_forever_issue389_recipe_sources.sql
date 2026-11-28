-- WoW Forever: sources of Forever recipes that our world did not have (ForeverCore issue #389, reported by Jay Oliver). These are
-- the sources 2026_11_22_93 (PR #388) lists as "not in our world database"; that file must be in first.
--   New creatures, spawned where Wowhead's WoW Forever map shows them:
--     Dala Fairmaw 256629, Barkskin Burrow vendor in Hyjal (next to Thobon Sapclaw): sells Recipe: Sweetpaw Jam 274415, Pattern:
--       Mooncloth Reagent Bag 254134, Formula: Enchant Gloves - Lotus Claw 274424 and the other Deadwood Tribal Bead goods (bead
--       prices are the client's ItemExtendedCost rows for item 263439).
--     Child of Tortolla 249224 (Hyjal, 23 spots): Recipe: Savory Turtle Stew 250176.
--     Ghostfang Alpha 249225 (Hyjal): Recipe: Flank au Poivre 250177.
--     Ravasaur Juvenile 262689 and 262696 (Un'Goro): Recipe: Prehistoric Pulled Raptor 250183. Wowhead shows no level for them,
--       so level, gold and spell list are copied from our Ravasaur Juvenile 261898.
--   Drops are Wowhead's player loot counts (www.wowhead.com/forever, read 23 Nov 2026): items seen at least twice, plus the
--   recipes, chance = count over kills. Quest items only drop while on the quest.
--   Blessed Plate Chest 251446 added to the Wormwings (it drops from them live).
--   Recipe: Raw Plated Armorfish 694054 (Deadwind Pass, the supply cart at Ariden's Camp): spawned, and its personal loot 144443
--     (the live record's Data30; it was empty) holds Recipe: Plated Armorfish 286153, one for every player.
--   Ortak Lomgok 244512 and Zet'gan 244511 (Hyjal Horde camp) were faction 12 / 35; Wowhead shows them Horde only, so 29.
--   Quests 92433 and 97119 Now We're Cooking (Hyjal; Savory Stag Sliders, recipe sold by Qia from 2026_11_22_93) and
--   91608 Gettin' Buzzed (Horde side of 89013; Kurll, Azshara):
--     Quest records and lines: Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
--     (https://creativecommons.org/licenses/by/4.0/). Source: github.com/JIVESCORP/eg-link-output-wowf quests.enUS.
--     Changed: picked and converted to our tables. Givers and progress/reward lines: Wowhead Forever quest pages.
-- Spawn guids 47611000-47611099. Safe to run again.
DELETE FROM `creature` WHERE `guid` BETWEEN 47611000 AND 47611099;
DELETE FROM `gameobject` WHERE `guid` BETWEEN 47611000 AND 47611099;
DELETE FROM `creature_template` WHERE `entry` IN (256629,249224,249225,262689,262696);
DELETE FROM `creature_template_difficulty` WHERE `DifficultyID`=0 AND `Entry` IN (256629,249224,249225,262689,262696);
DELETE FROM `creature_template_model` WHERE `CreatureID` IN (256629,249224,249225,262689,262696);
DELETE FROM `creature_classic_level` WHERE `entry` IN (256629,249224,249225,262689,262696);
INSERT INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`name`,`femaleName`,`subname`,`TitleAlt`,`IconName`,`RequiredExpansion`,`VignetteID`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`Classification`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`unit_flags3`,`family`,`trainer_class`,`type`,`VehicleId`,`AIName`,`MovementType`,`ExperienceModifier`,`RacialLeader`,`movementId`,`WidgetSetID`,`WidgetSetUnitConditionID`,`RegenHealth`,`CreatureImmunitiesId`,`flags_extra`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(256629,0,0,'Dala Fairmaw',NULL,NULL,NULL,NULL,0,0,3569,4224,1.0,1.14286,1.0,0,0,2000,2000,1.0,1.0,1,0,2048,0,0,0,7,0,'',0,1.0,0,0,0,0,1,0,0,'',NULL,-1),
(249224,0,0,'Child of Tortolla',NULL,NULL,NULL,NULL,0,0,16,0,1.0,1.14286,1.0,0,0,2000,2000,1.0,1.0,1,0,2048,0,21,0,1,0,'',0,1.0,0,0,0,0,1,0,0,'',NULL,-1),
(249225,0,0,'Ghostfang Alpha',NULL,NULL,NULL,NULL,0,0,16,0,1.0,1.14286,1.0,0,0,2000,2000,1.0,1.0,1,0,2048,0,1,0,1,0,'',0,1.0,0,0,0,0,1,0,0,'',NULL,-1),
(262689,0,0,'Ravasaur Juvenile',NULL,NULL,NULL,NULL,0,0,16,0,1.0,1.14286,1.0,0,0,2000,2000,1.0,1.0,1,0,2048,0,11,0,1,0,'SmartAI',0,1.0,0,0,0,0,1,0,0,'',NULL,-1),
(262696,0,0,'Ravasaur Juvenile',NULL,NULL,NULL,NULL,0,0,16,0,1.0,1.14286,1.0,0,0,2000,2000,1.0,1.0,1,0,2048,0,11,0,1,0,'SmartAI',0,1.0,0,0,0,0,1,0,0,'',NULL,-1);
INSERT INTO `creature_template_difficulty` (`Entry`,`DifficultyID`,`LevelScalingDeltaMin`,`LevelScalingDeltaMax`,`ContentTuningID`,`HealthScalingExpansion`,`HealthModifier`,`ManaModifier`,`ArmorModifier`,`DamageModifier`,`CreatureDifficultyID`,`TypeFlags`,`TypeFlags2`,`TypeFlags3`,`LootID`,`PickPocketLootID`,`SkinLootID`,`GoldMin`,`GoldMax`,`StaticFlags1`,`StaticFlags2`,`StaticFlags3`,`StaticFlags4`,`StaticFlags5`,`StaticFlags6`,`StaticFlags7`,`StaticFlags8`,`VerifiedBuild`) VALUES
(256629,0,0,0,0,0,1.0,1.0,1.0,1.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1),
(249224,0,0,0,0,0,1.0,1.0,1.0,1.0,0,0,0,0,249224,0,249224,0,0,0,0,0,0,0,0,0,0,-1),
(249225,0,0,0,0,0,1.0,1.0,1.0,1.0,0,0,0,0,249225,0,0,0,0,0,0,0,0,0,0,0,0,-1),
(262689,0,0,0,0,0,1.0,1.0,1.0,1.0,0,0,0,0,262689,0,0,500,1300,0,0,0,0,0,0,0,0,-1),
(262696,0,0,0,0,0,1.0,1.0,1.0,1.0,0,0,0,0,262696,0,0,500,1300,0,0,0,0,0,0,0,0,-1);
INSERT INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(256629,0,6826,1.0,1.0,-1),
(249224,0,7840,1.0,1.0,-1),
(249225,0,776,1.0,1.0,-1),
(262689,0,11316,1.0,1.0,-1),
(262696,0,143345,1.0,1.0,-1);
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES
(256629,61,61),
(249224,57,58),
(249225,56,57),
(262689,58,59),
(262696,58,59);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (262689,262696) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) SELECT 262689,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment` FROM `smart_scripts` WHERE `entryorguid`=261898 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) SELECT 262696,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment` FROM `smart_scripts` WHERE `entryorguid`=261898 AND `source_type`=0;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(47611000,256629,1,0,0,'0',0,0,0,-1,0,0,4486.80,-1656.10,1376.76,0.70,120,0,0,NULL,0,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611001,249224,1,0,0,'0',0,0,0,-1,0,0,5324.20,-2016.10,1297.48,0.70,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611002,249224,1,0,0,'0',0,0,0,-1,0,0,5284.80,-2047.30,1282.49,2.00,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611003,249224,1,0,0,'0',0,0,0,-1,0,0,5319.70,-2064.60,1281.03,3.30,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611004,249224,1,0,0,'0',0,0,0,-1,0,0,5259.30,-2064.50,1277.35,4.60,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611005,249224,1,0,0,'0',0,0,0,-1,0,0,5280.30,-2085.30,1272.56,5.90,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611006,249224,1,0,0,'0',0,0,0,-1,0,0,5271.00,-2106.10,1264.72,0.92,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611007,249224,1,0,0,'0',0,0,0,-1,0,0,5247.80,-2106.10,1264.77,2.22,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611008,249224,1,0,0,'0',0,0,0,-1,0,0,5229.30,-2116.40,1263.25,3.52,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611009,249224,1,0,0,'0',0,0,0,-1,0,0,5208.50,-2147.60,1267.10,4.82,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611010,249224,1,0,0,'0',0,0,0,-1,0,0,5299.10,-2151.10,1260.60,6.12,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611011,249224,1,0,0,'0',0,0,0,-1,0,0,5301.40,-2164.90,1260.50,1.14,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611012,249224,1,0,0,'0',0,0,0,-1,0,0,5201.60,-2178.70,1265.03,2.44,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611013,249224,1,0,0,'0',0,0,0,-1,0,0,5159.80,-2178.70,1282.07,3.74,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611014,249224,1,0,0,'0',0,0,0,-1,0,0,5164.50,-2185.60,1278.50,5.04,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611015,249224,1,0,0,'0',0,0,0,-1,0,0,5213.30,-2189.10,1260.91,0.06,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611016,249224,1,0,0,'0',0,0,0,-1,0,0,5213.30,-2196.00,1261.80,1.36,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611017,249224,1,0,0,'0',0,0,0,-1,0,0,5176.10,-2196.00,1272.23,2.66,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611018,249224,1,0,0,'0',0,0,0,-1,0,0,5185.40,-2202.90,1268.37,3.96,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611019,249224,1,0,0,'0',0,0,0,-1,0,0,5283.00,-2216.80,1262.63,5.26,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611020,249224,1,0,0,'0',0,0,0,-1,0,0,5271.50,-2223.70,1263.73,0.28,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611021,249224,1,0,0,'0',0,0,0,-1,0,0,5255.20,-2227.20,1266.11,1.58,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611022,249224,1,0,0,'0',0,0,0,-1,0,0,5225.00,-2230.60,1259.27,2.88,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611023,249224,1,0,0,'0',0,0,0,-1,0,0,5232.00,-2234.10,1261.83,4.18,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611024,249225,1,0,0,'0',0,0,0,-1,0,0,5335.10,-1808.50,1373.05,0.70,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611025,262689,1,0,0,'0',0,0,0,-1,0,0,-5673.60,-1112.60,10.32,0.70,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611026,262689,1,0,0,'0',0,0,0,-1,0,0,-5624.50,-1370.20,41.15,2.00,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611027,262689,1,0,0,'0',0,0,0,-1,0,0,-5698.10,-1591.00,38.10,3.30,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611028,262689,1,0,0,'0',0,0,0,-1,0,0,-5722.70,-1591.00,37.10,4.60,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611029,262696,1,0,0,'0',0,0,0,-1,0,0,-5771.70,-707.80,38.28,0.70,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611030,262696,1,0,0,'0',0,0,0,-1,0,0,-5747.20,-928.60,21.15,2.00,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1),
(47611031,262696,1,0,0,'0',0,0,0,-1,0,0,-5575.50,-1039.00,10.42,3.30,300,5,0,NULL,1,NULL,NULL,NULL,NULL,'',NULL,-1);
DELETE FROM `gameobject_loot_template` WHERE `Entry`=144443 AND `ItemType`=0 AND `Item`=286153;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (144443,0,286153,100,0,1,0,1,1,'Recipe: Raw Plated Armorfish (personal loot)');
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(47611000,694054,0,0,0,'0',0,0,0,-1,-10440.00,-2143.30,90.78,0.70,0,0,0.342898,0.939373,300,255,1,'',NULL,-1);
DELETE FROM `creature_loot_template` WHERE `Entry` IN (249224,249225,262689,262696) AND `Comment` LIKE 'Wowhead Forever %';
DELETE FROM `creature_loot_template` WHERE `Entry` IN (249220,249221,249222,260826) AND `ItemType`=0 AND `Item`=251446;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(249224,0,3712,35.68,1,1,0,1,1,'Wowhead Forever 314/880'),
(249224,0,4555,56.82,0,1,0,1,1,'Wowhead Forever 500/880'),
(249224,0,4556,15.68,0,1,0,1,1,'Wowhead Forever 138/880'),
(249224,0,5759,0.34,0,1,0,1,1,'Wowhead Forever 3/880'),
(249224,0,7973,13.3,0,1,0,1,1,'Wowhead Forever 117/880'),
(249224,0,8170,11.59,1,1,0,1,1,'Wowhead Forever 102/880'),
(249224,0,8171,0.68,0,1,0,1,1,'Wowhead Forever 6/880'),
(249224,0,8959,8.41,0,1,0,1,1,'Wowhead Forever 74/880'),
(249224,0,248698,0.23,0,1,0,1,1,'Wowhead Forever 2/880'),
(249224,0,248824,0.45,0,1,0,1,1,'Wowhead Forever 4/880'),
(249224,0,248825,10.11,0,1,0,1,1,'Wowhead Forever 89/880'),
(249224,0,249428,0.68,0,1,0,2,3,'Wowhead Forever 6/880'),
(249224,0,250176,3.98,0,1,0,1,1,'Wowhead Forever 35/880'),
(249224,0,262890,0.23,0,1,0,1,1,'Wowhead Forever 2/880'),
(249225,0,4583,24.24,0,1,0,1,1,'Wowhead Forever 8/33'),
(249225,0,4584,9.09,0,1,0,1,1,'Wowhead Forever 3/33'),
(249225,0,8146,6.06,0,1,0,1,1,'Wowhead Forever 2/33'),
(249225,0,12203,42.42,0,1,0,1,1,'Wowhead Forever 14/33'),
(249225,0,12208,30.3,0,1,0,1,1,'Wowhead Forever 10/33'),
(249225,0,250177,12.12,0,1,0,1,1,'Wowhead Forever 4/33'),
(262689,0,4304,3.82,1,1,0,1,1,'Wowhead Forever 5/131'),
(262689,0,4587,10.69,0,1,0,1,2,'Wowhead Forever 14/131'),
(262689,0,4588,12.21,0,1,0,1,1,'Wowhead Forever 16/131'),
(262689,0,8146,6.87,0,1,0,1,1,'Wowhead Forever 9/131'),
(262689,0,8170,32.06,1,1,0,1,1,'Wowhead Forever 42/131'),
(262689,0,8171,2.29,0,1,0,1,1,'Wowhead Forever 3/131'),
(262689,0,12184,12.98,0,1,0,1,1,'Wowhead Forever 17/131'),
(262689,0,14800,1.53,0,1,0,1,1,'Wowhead Forever 2/131'),
(262689,0,20015,11.45,0,1,0,1,1,'Wowhead Forever 15/131'),
(262689,0,20016,3.82,0,1,0,1,1,'Wowhead Forever 5/131'),
(262689,0,249428,3.05,0,1,0,2,3,'Wowhead Forever 4/131'),
(262689,0,250183,0.76,0,1,0,1,1,'Wowhead Forever 1/131'),
(262696,0,4304,3.18,1,1,0,1,1,'Wowhead Forever 10/314'),
(262696,0,4587,9.24,0,1,0,1,2,'Wowhead Forever 29/314'),
(262696,0,4588,6.05,0,1,0,1,1,'Wowhead Forever 19/314'),
(262696,0,7909,0.64,0,1,0,1,1,'Wowhead Forever 2/314'),
(262696,0,8146,2.55,0,1,0,1,1,'Wowhead Forever 8/314'),
(262696,0,8170,24.52,1,1,0,1,1,'Wowhead Forever 77/314'),
(262696,0,8171,1.27,0,1,0,1,1,'Wowhead Forever 4/314'),
(262696,0,12184,9.55,0,1,0,1,1,'Wowhead Forever 30/314'),
(262696,0,15666,1.27,0,1,0,1,1,'Wowhead Forever 4/314'),
(262696,0,20015,11.78,0,1,0,1,1,'Wowhead Forever 37/314'),
(262696,0,20016,1.91,0,1,0,1,1,'Wowhead Forever 6/314'),
(262696,0,250183,0.32,0,1,0,1,1,'Wowhead Forever 1/314'),
(262696,0,262890,0.64,0,1,0,1,1,'Wowhead Forever 2/314'),
(262696,0,271972,32.48,0,1,0,1,1,'Wowhead Forever 102/314'),
(249220,0,251446,1.48,0,1,0,1,1,'Wowhead Forever 19/1282'),
(249221,0,251446,1.45,0,1,0,1,1,'Wowhead Forever 21/1451'),
(249222,0,251446,2.11,0,1,0,1,1,'Wowhead Forever 11/522'),
(260826,0,251446,1.32,0,1,0,1,1,'Wowhead Forever 4/304');
DELETE FROM `skinning_loot_template` WHERE `Entry`=249224;
INSERT INTO `skinning_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(249224,0,8170,46.39,0,1,0,1,1,'Wowhead Forever 405/873'),
(249224,0,8171,2.29,0,1,0,1,1,'Wowhead Forever 20/873'),
(249224,0,248824,2.41,0,1,0,1,1,'Wowhead Forever 21/873'),
(249224,0,248825,47.08,0,1,0,1,1,'Wowhead Forever 411/873'),
(249224,0,249428,1.83,0,1,0,2,3,'Wowhead Forever 16/873');
DELETE FROM `npc_vendor` WHERE `entry`=256629;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) VALUES
(256629,1,2130,0,0,0,1,0,0,-1),
(256629,2,2320,0,0,0,1,0,0,-1),
(256629,3,2321,0,0,0,1,0,0,-1),
(256629,4,2678,0,0,0,1,0,0,-1),
(256629,5,2901,0,0,0,1,0,0,-1),
(256629,6,3371,0,0,0,1,0,0,-1),
(256629,7,3372,0,0,0,1,0,0,-1),
(256629,8,3713,0,0,0,1,0,0,-1),
(256629,9,4289,0,0,0,1,0,0,-1),
(256629,10,4291,0,0,0,1,0,0,-1),
(256629,11,4399,0,0,0,1,0,0,-1),
(256629,12,4400,0,0,0,1,0,0,-1),
(256629,13,6530,0,0,0,1,0,0,-1),
(256629,14,6532,0,0,0,1,0,0,-1),
(256629,15,13517,0,0,11562,1,0,0,-1),
(256629,16,254134,0,0,11562,1,0,0,-1),
(256629,17,256036,0,0,0,1,0,0,-1),
(256629,18,262801,0,0,11567,1,0,0,-1),
(256629,19,268873,0,0,11566,1,0,0,-1),
(256629,20,274415,0,0,11563,1,0,0,-1),
(256629,21,274417,0,0,11562,1,0,0,-1),
(256629,22,274418,0,0,11562,1,0,0,-1),
(256629,23,274419,0,0,11565,1,0,0,-1),
(256629,24,274420,0,0,11565,1,0,0,-1),
(256629,25,274424,0,0,11562,1,0,0,-1);
UPDATE `creature_template` SET `faction`=29 WHERE `entry` IN (244511,244512) AND `faction` IN (12,35);

-- 92433 Now We're Cooking (level 57, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=92433;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (92433,2,616,0,0,3,1.0,0,1.0,0,0,3145728,0,0,0,6130900294268439629,250179,1,250071,2,'Now We''re Cooking','Bring $1oa Savory Stag Sliders to Hnaz Blunderflame in Elderwild.','Hey! I''m pretty busy trying to turn these scraps into something edible. You wanna help out? I could really use some more variety for this meal! It sure would be nice to have something different on the menu.

There''s a goblin in Everlook who has this recipe for Savory Stag Sliders... perfect for tiny hands like mine. If you could cook up some of those, that would be great! You can get stag meat from the stags here on the mountain.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=92433;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (464701,92433,1,0,0,250065,6,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=92433;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (92433,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=92433;
DELETE FROM `quest_classic_level` WHERE `ID`=92433;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (92433,57,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=92433;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (92433,2,57);
DELETE FROM `quest_offer_reward` WHERE `ID`=92433;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (92433,0,0,0,0,0,0,0,0,'Hey, this is great! Thanks! We''re gonna eat well today!

Usually I just heat up some stag steaks over a bucket of water. Here, I''ll give you the recipe.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=92433;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (92433,0,0,0,0,'How goes the hunt? You got some Savory Stag Sliders for me?',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=92433;
DELETE FROM `gameobject_queststarter` WHERE `quest`=92433;
DELETE FROM `creature_questender` WHERE `quest`=92433;
DELETE FROM `gameobject_questender` WHERE `quest`=92433;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (249968,92433,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (249968,92433,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (249968);

-- 97119 Now We're Cooking (level 57, min 54, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97119;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97119,2,616,0,0,3,1.0,0,1.0,0,0,3145736,0,0,0,12261800583900083122,250179,1,250071,2,'Now We''re Cooking','Bring $1oa Savory Stag Sliders to Ortak Lomgok in Elderwild.','In addition to seeing to the spiritual needs of the people here, I feed them as well. I''m not exactly a trained cook, but after five years, I''ve learned a thing or two about preparing food!

I''m sure that folks here would love a taste of something different. I remember, before we assembled on the mountain, there was a goblin from Everlook who was serving platters of tiny, Savory Stag Sliders... I would love to taste one of those again. We have plenty of stags up here, too! Think you can cook some up?','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97119;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (475123,97119,1,0,0,250065,6,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=97119;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (97119,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97119;
DELETE FROM `quest_classic_level` WHERE `ID`=97119;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97119,57,54,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97119;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97119,2,57);
DELETE FROM `quest_offer_reward` WHERE `ID`=97119;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97119,0,0,0,0,0,0,0,0,'They''re so small, but so delicious. Thank you for this. I''ll make sure to share them!

In exchange I have something for you: my cooking notes about preparing the stag meat that''s our most common meal up here.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97119;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (97119,0,0,0,0,'I feel like I can already smell those Savory Stag Sliders.',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=97119;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97119;
DELETE FROM `creature_questender` WHERE `quest`=97119;
DELETE FROM `gameobject_questender` WHERE `quest`=97119;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (244512,97119,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (244512,97119,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (244512);

-- 91608 Gettin' Buzzed (level 48, min 45, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=91608;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`ItemDrop1`,`ItemDropQuantity1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (91608,2,16,0,0,5,1.0,0,1.0,0,238501,36700160,0,0,0,12261800583900083122,290333,1,250999,1,250955,5,76,5,0,238501,1,'Gettin'' Buzzed','Gather $1oa Wild Honey from Wasp Nests using Kurll''s Pellet Gun.','There are few luxuries out here on the frontier. A barrel of good drink would surely boost the camp''s morale.

In my younger days, I took a recipe for a delicious brew off the corpse of a dwarf I killed. All I need is some honey. Fortunately, the wasp nests to the west are overflowing with it.

Take my pellet gun. This will allow you to knock the nests out of the trees. Be warned, however, it will do little against the wasps themselves.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=91608;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`Flags`,`Visible`,`Description`,`VerifiedBuild`) VALUES (463106,91608,1,0,2,238503,5,0,1,NULL,71037);
DELETE FROM `quest_template_addon` WHERE `ID`=91608;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (91608,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=91608;
DELETE FROM `quest_classic_level` WHERE `ID`=91608;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (91608,48,45,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=91608;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (91608,2,48);
DELETE FROM `quest_offer_reward` WHERE `ID`=91608;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (91608,0,0,0,0,0,0,0,0,'Ha ha! Fetch us a barrel, $n. We will drink well tonight.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=91608;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`EmoteOnCompleteDelay`,`EmoteOnIncompleteDelay`,`CompletionText`,`VerifiedBuild`) VALUES (91608,0,0,0,0,'If the wasps swarm you, do not run back here. Ag''tor would have my hide!',71037);
DELETE FROM `creature_queststarter` WHERE `quest`=91608;
DELETE FROM `gameobject_queststarter` WHERE `quest`=91608;
DELETE FROM `creature_questender` WHERE `quest`=91608;
DELETE FROM `gameobject_questender` WHERE `quest`=91608;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (3621,91608,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (3621,91608,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (3621);

