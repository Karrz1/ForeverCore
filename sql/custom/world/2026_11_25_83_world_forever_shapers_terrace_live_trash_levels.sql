-- The Shaper's Terrace (map 3001): the trash's levels, health and factions as live has them (2026_11_19_72 had INFERRED 58-59 and
-- 3x health for all). Live trash is levels 57-62; most has less health than ours, the dinosaurs more.
-- Source: a live capture made on 25 November 2026 (client 1.60.1.71139) of a full walk through the dungeon, about 20 minutes,
-- no boss killed. Positions are where each creature and object was first seen.
-- Health: HealthModifier = health seen on live / the client's expected creature health at that level (ExpectedStat; 4365 at
-- level 60), which is what our server multiplies, so each creature gets live's health. Damage multipliers are not in the capture
-- and stay as they are.
-- Safe to run again.
-- 253214 Ravasaur Hunter: faction 16 -> 48, health x3 -> x3.3, levels 58-59 -> 60-61
UPDATE `creature_template` SET `faction` = 48 WHERE `entry` = 253214;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.3 WHERE `Entry` = 253214 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 253214;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (253214,60,61);
-- 253215 Ravasaur Matriarch: faction 16 -> 48, health x3 -> x4.5, levels 58-59 -> 59-60
UPDATE `creature_template` SET `faction` = 48 WHERE `entry` = 253215;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.5 WHERE `Entry` = 253215 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 253215;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (253215,59,60);
-- 261749 Devilsaur: faction 16 -> 14, health x3 -> x6.0, levels 58-59 -> 61-61
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 261749;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.0 WHERE `Entry` = 261749 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261749;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261749,61,61);
-- 261750 Tyranosaur: faction 16 -> 14, health x3 -> x10.1, levels 58-59 -> 61-62
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 261750;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 10.1 WHERE `Entry` = 261750 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261750;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261750,61,62);
-- 261752 Devilsaur: faction 16 -> 14, health x3 -> x9.0, levels 58-59 -> 62-62
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 261752;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 9.0 WHERE `Entry` = 261752 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261752;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261752,62,62);
-- 261770 Azurepetal Trapper: faction 16 -> 7, health x3 -> x3.5, levels 58-59 -> 58-59
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 261770;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.5 WHERE `Entry` = 261770 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261770;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261770,58,59);
-- 261771 Diemetradon: faction 16 -> 14, health x3 -> x3.3, levels 58-59 -> 59-59
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 261771;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.3 WHERE `Entry` = 261771 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261771;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261771,59,59);
-- 261773 Tar Lurker: faction 16 -> 16, health x3 -> x4.0, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 261773;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.0 WHERE `Entry` = 261773 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261773;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261773,60,60);
-- 261774 Azurepetal Flayer: faction 16 -> 7, health x3 -> x1.3, levels 58-59 -> 59-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 261774;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.3 WHERE `Entry` = 261774 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261774;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261774,59,60);
-- 261779 Tar Walker: faction 16 -> 16, health x3 -> x8.0, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 261779;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 8.0 WHERE `Entry` = 261779 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261779;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261779,60,60);
-- 261780 Quickpetal Lasher: faction 16 -> 7, health x3 -> x2.2, levels 58-59 -> 58-59
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 261780;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.2 WHERE `Entry` = 261780 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261780;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261780,58,59);
-- 261781 Tar Crawler: faction 16 -> 16, health x3 -> x4.3, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 261781;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.3 WHERE `Entry` = 261781 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261781;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261781,60,60);
-- 261782 Tar Hunter: faction 16 -> 16, health x3 -> x5.0, levels 58-59 -> 57-58
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 261782;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 5.0 WHERE `Entry` = 261782 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261782;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261782,57,58);
-- 261783 Thunderstomp Stegodon: faction 16 -> 14, health x3 -> x6.0, levels 58-59 -> 59-59
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 261783;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.0 WHERE `Entry` = 261783 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261783;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261783,59,59);
-- 261784 Spiked Stegodon: faction 16 -> 14, health x3 -> x6.1, levels 58-59 -> 61-61
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 261784;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.1 WHERE `Entry` = 261784 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261784;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261784,61,61);
-- 261785 Plated Stegodon: faction 16 -> 14, health x3 -> x7.1, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 261785;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 7.1 WHERE `Entry` = 261785 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261785;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261785,60,60);
-- 261786 Ironhide Ravasaur: faction 16 -> 48, health x3 -> x6.0, levels 58-59 -> 59-60
UPDATE `creature_template` SET `faction` = 48 WHERE `entry` = 261786;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.0 WHERE `Entry` = 261786 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261786;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261786,59,60);
-- 261898 Ravasaur Juvenile: faction 16 -> 48, health x1 -> x1.5, levels 58-59 -> 60-61
UPDATE `creature_template` SET `faction` = 48 WHERE `entry` = 261898;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.5 WHERE `Entry` = 261898 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261898;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261898,60,61);
-- 261934 Ravasaur Stalker: faction 16 -> 48, health x3 -> x4.5, levels 58-59 -> 58-59
UPDATE `creature_template` SET `faction` = 48 WHERE `entry` = 261934;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.5 WHERE `Entry` = 261934 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261934;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261934,58,59);
-- 261968 Azurepetal Sporecaller: faction 16 -> 7, health x3 -> x5.0, levels 58-59 -> 59-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 261968;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 5.0 WHERE `Entry` = 261968 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 261968;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (261968,59,60);
-- 262117 Stegodon Young: faction 16 -> 14, health x3 -> x2.75, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` = 262117;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.75 WHERE `Entry` = 262117 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262117;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262117,60,60);
-- 262164 Emerald Flayer: faction 16 -> 7, health x3 -> x2.6, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 262164;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.6 WHERE `Entry` = 262164 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262164;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262164,60,60);
-- 262166 Emerald Overgrowth: faction 16 -> 7, health x3 -> x2.3, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 262166;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.3 WHERE `Entry` = 262166 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262166;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262166,60,60);
-- 262167 Emerald Seedling: faction 16 -> 7, health x1 -> x1.5, levels 58-59 -> 58-59
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 262167;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.5 WHERE `Entry` = 262167 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262167;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262167,58,59);
-- 262168 Emerald Harvester: faction 16 -> 16, health x3 -> x6.0, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 262168;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.0 WHERE `Entry` = 262168 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262168;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262168,60,60);
-- 262188 Emberleaf Flayer: faction 16 -> 7, health x3 -> x2.1, levels 58-59 -> 59-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 262188;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.1 WHERE `Entry` = 262188 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262188;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262188,59,60);
-- 262190 Emberleaf Germinator: faction 16 -> 7, health x3 -> x4.5, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 262190;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.5 WHERE `Entry` = 262190 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262190;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262190,60,60);
-- 262191 Emberleaf Scorcher: faction 16 -> 7, health x3 -> x3.3, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 262191;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.3 WHERE `Entry` = 262191 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262191;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262191,60,60);
-- 262197 Quickpetal Flayer: faction 16 -> 7, health x3 -> x2.2, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 262197;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.2 WHERE `Entry` = 262197 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262197;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262197,60,60);
-- 262299 Eastgrotto Gorilla: faction 16 -> 72, health x3 -> x3.5, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 72 WHERE `entry` = 262299;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.5 WHERE `Entry` = 262299 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262299;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262299,60,60);
-- 262300 Eastgrotto Dweller: faction 16 -> 72, health x3 -> x3.6, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 72 WHERE `entry` = 262300;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.6 WHERE `Entry` = 262300 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262300;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262300,60,60);
-- 262301 Eastgrotto Silverback: faction 16 -> 72, health x3 -> x5.1, levels 58-59 -> 60-60
UPDATE `creature_template` SET `faction` = 72 WHERE `entry` = 262301;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 5.1 WHERE `Entry` = 262301 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 262301;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (262301,60,60);
-- 263277 [DNT] Kill Credit: Drained Crystal: faction 35 -> 35, health x1 -> x1.0, levels 1-1 -> 60-60
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 263277;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.0 WHERE `Entry` = 263277 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 263277;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (263277,60,60);
-- 263458 [DNT] Kill Credit: Pillar of Assimilation: faction 35 -> 35, health x1 -> x1.0, levels 1-1 -> 60-60
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 263458;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.0 WHERE `Entry` = 263458 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 263458;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (263458,60,60);
-- 263460 [DNT] Kill Credit: Regrowth Vestibule: faction 35 -> 35, health x1 -> x1.0, levels 1-1 -> 60-60
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 263460;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.0 WHERE `Entry` = 263460 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 263460;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (263460,60,60);
-- 263461 [DNT] Kill Credit: The Doors: faction 35 -> 35, health x1 -> x1.0, levels 1-1 -> 60-60
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 263461;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.0 WHERE `Entry` = 263461 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 263461;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (263461,60,60);
-- 263462 [DNT] Kill Credit: Destroyed Watcher: faction 35 -> 35, health x1 -> x1.0, levels 1-1 -> 60-60
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 263462;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.0 WHERE `Entry` = 263462 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 263462;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (263462,60,60);
