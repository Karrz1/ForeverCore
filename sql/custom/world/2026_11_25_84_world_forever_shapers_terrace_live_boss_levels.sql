-- The Shaper's Terrace (map 3001): the seven standing bosses' levels, health and factions as live has them (2026_11_19_72 had
-- INFERRED level 59). Live's are 61-62 with more health. The summoned bosses (Cinder, Snowtalon, Bolt, Vitrix, Nanaya) were not
-- seen and stay as they are.
-- Source: a live capture made on 25 November 2026 (client 1.60.1.71139) of a full walk through the dungeon, about 20 minutes,
-- no boss killed. Positions are where each creature and object was first seen.
-- Health: HealthModifier = health seen on live / the client's expected creature health at that level (ExpectedStat; 4365 at
-- level 60), which is what our server multiplies, so each creature gets live's health. Damage multipliers are not in the capture
-- and stay as they are.
-- Safe to run again.
-- 253201 Titanosaur: faction 16 -> 16, health x12 -> x14.0, levels 59-59 -> 61-61
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 253201;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 14.0 WHERE `Entry` = 253201 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 253201;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (253201,61,61);
-- 253218 Izha'Rel: faction 16 -> 48, health x7 -> x7.9, levels 59-59 -> 61-61
UPDATE `creature_template` SET `faction` = 48 WHERE `entry` = 253218;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 7.9 WHERE `Entry` = 253218 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 253218;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (253218,61,61);
-- 261811 Tor'Rel: faction 16 -> 48, health x7 -> x7.5, levels 59-59 -> 61-61
UPDATE `creature_template` SET `faction` = 48 WHERE `entry` = 261811;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 7.5 WHERE `Entry` = 261811 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261811;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261811,61,61);
-- 261812 Thunderhoof: faction 16 -> 16, health x12 -> x14.0, levels 59-59 -> 61-61
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 261812;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 14.0 WHERE `Entry` = 261812 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261812;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261812,61,61);
-- 261813 Venomridge: faction 16 -> 16, health x12 -> x11.0, levels 59-59 -> 61-61
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 261813;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 11.0 WHERE `Entry` = 261813 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261813;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261813,61,61);
-- 261993 King Op: faction 16 -> 72, health x8 -> x12.0, levels 59-59 -> 62-62
UPDATE `creature_template` SET `faction` = 72 WHERE `entry` = 261993;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 12.0 WHERE `Entry` = 261993 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261993;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261993,62,62);
-- 262127 Direhorn Matriarch: faction 16 -> 16, health x12 -> x13.0, levels 59-59 -> 61-61
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 262127;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 13.0 WHERE `Entry` = 262127 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262127;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262127,61,61);
