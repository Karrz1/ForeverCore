-- Blackmaw Hold (map 2974): levels, health and factions as live has them (2026_11_19_70 had INFERRED 55-57 and 3x health for all
-- trash, 10x for bosses). Live's bosses are faction 168 with less health than ours (6-8x; Varrox 10x); Clawbert is a level 58 boss
-- (ours had him as trash), Elder Bramblesnap 59. Most trash matches; imps, swarmers and Devotees have less health.
-- Source: a live capture made on 25-26 November 2026 (client 1.60.1.71139): three runs into the dungeon, one a full clear
-- (Withermaw, Tunnelweb Matriarch, Bonesnout, Blackmaw Behemoth, then Varrox Bleakhoof last). Positions are where each creature
-- and object was first seen.
-- Health: HealthModifier = health seen on live / the client's expected creature health at that level (ExpectedStat; 4365 at
-- level 60), which is what our server multiplies, so each creature gets live's health. Damage multipliers are not in the capture
-- and stay as they are.
-- Factions kept as ours: the Unbound Spirit 247231 (live 3567) and Elder Bramblesnap 248765 (live 3568). Live's are new faction
-- templates and the spirit fight was not seen on live, so who fights whom there is not in the capture; our script decides it.
-- Safe to run again.
-- 247195 Withermaw: faction 16 -> 168, health x10 -> x7.0, levels 58-58 -> 58-58
UPDATE `creature_template` SET `faction` = 168 WHERE `entry` = 247195;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 7.0 WHERE `Entry` = 247195 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247195;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247195,58,58);
-- 247198 Bonesnout the Unbroken: faction 16 -> 168, health x10 -> x6.5, levels 58-58 -> 58-58
UPDATE `creature_template` SET `faction` = 168 WHERE `entry` = 247198;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.5 WHERE `Entry` = 247198 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247198;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247198,58,58);
-- 247206 Impaan the Imprisoner: faction 16 -> 168, health x10 -> x7.0, levels 58-58 -> 57-57
UPDATE `creature_template` SET `faction` = 168 WHERE `entry` = 247206;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 7.0 WHERE `Entry` = 247206 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247206;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247206,57,57);
-- 247207 Blackmaw Behemoth: faction 16 -> 168, health x10 -> x8.0, levels 58-58 -> 59-59
UPDATE `creature_template` SET `faction` = 168 WHERE `entry` = 247207;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 8.0 WHERE `Entry` = 247207 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247207;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247207,59,59);
-- 247209 Elder Shaman Bloodmane: faction 16 -> 168, health x10 -> x7.0, levels 58-58 -> 59-59
UPDATE `creature_template` SET `faction` = 168 WHERE `entry` = 247209;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 7.0 WHERE `Entry` = 247209 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247209;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247209,59,59);
-- 247231 Unbound Spirit: faction 16 -> 16, health x10 -> x4.0, levels 58-58 -> 59-59
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 247231;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.0 WHERE `Entry` = 247231 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247231;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247231,59,59);
-- 247234 Varrox Bleakhoof: faction 16 -> 168, health x12 -> x10.0, levels 60-60 -> 60-60
UPDATE `creature_template` SET `faction` = 168 WHERE `entry` = 247234;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 10.0 WHERE `Entry` = 247234 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247234;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247234,60,60);
-- 247235 Legashi Subjugator: faction 16 -> 16, health x3 -> x3.0, levels 55-57 -> 55-55
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 247235;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.0 WHERE `Entry` = 247235 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247235;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247235,55,55);
-- 247237 Blackmaw Berserker: faction 16 -> 16, health x3 -> x3.2, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 247237;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.2 WHERE `Entry` = 247237 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247237;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247237,55,57);
-- 247248 Legashi Summoner: faction 16 -> 16, health x3 -> x2.8, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 247248;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.8 WHERE `Entry` = 247248 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247248;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247248,55,57);
-- 247249 Felfire Imp: faction 16 -> 16, health x3 -> x1.0, levels 55-57 -> 55-56
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 247249;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 1.0 WHERE `Entry` = 247249 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247249;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247249,55,56);
-- 247996 Clawbert: faction 16 -> 168, health x3 -> x6.0, levels 55-57 -> 58-58
UPDATE `creature_template` SET `faction` = 168 WHERE `entry` = 247996;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.0 WHERE `Entry` = 247996 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 247996;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (247996,58,58);
-- 248765 Elder Bramblesnap: faction 35 -> 35, health x3 -> x5.0, levels 55-57 -> 59-59
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 248765;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 5.0 WHERE `Entry` = 248765 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 248765;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (248765,59,59);
-- 250023 Blackmaw Thrall: faction 16 -> 16, health x3 -> x3.0, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 250023;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.0 WHERE `Entry` = 250023 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 250023;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (250023,55,57);
-- 250027 Blackmaw Headhunter: faction 16 -> 16, health x3 -> x2.8, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 250027;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.8 WHERE `Entry` = 250027 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 250027;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (250027,55,57);
-- 250034 Tunnelweb Matriarch: faction 16 -> 16, health x4 -> x6.0, levels 55-57 -> 55-55
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 250034;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 6.0 WHERE `Entry` = 250034 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 250034;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (250034,55,55);
-- 255247 Swarming Imp: faction 16 -> 16, health x1 -> x0.8, levels 55-56 -> 55-56
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 255247;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 0.8 WHERE `Entry` = 255247 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 255247;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (255247,55,56);
-- 255347 Legashi Slayer: faction 16 -> 16, health x3 -> x3.0, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 255347;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.0 WHERE `Entry` = 255347 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 255347;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (255347,55,57);
-- 255394 Blackmaw Champion: faction 16 -> 16, health x3 -> x4.0, levels 55-57 -> 57-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 255394;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.0 WHERE `Entry` = 255394 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 255394;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (255394,57,57);
-- 258152 Blackmaw Spearfisher: faction 16 -> 16, health x3 -> x3.0, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 258152;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.0 WHERE `Entry` = 258152 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 258152;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (258152,55,57);
-- 258264 Depraved Owlbeast: faction 16 -> 16, health x3 -> x4.0, levels 55-57 -> 56-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 258264;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.0 WHERE `Entry` = 258264 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 258264;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (258264,56,57);
-- 258329 Bloated Grizzly: faction 16 -> 16, health x3 -> x3.0, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 258329;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.0 WHERE `Entry` = 258329 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 258329;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (258329,55,57);
-- 258508 Blackmaw Shaman: faction 16 -> 16, health x3 -> x3.0, levels 55-57 -> 56-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 258508;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.0 WHERE `Entry` = 258508 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 258508;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (258508,56,57);
-- 258516 Blackmaw Druid: faction 16 -> 16, health x3 -> x2.8, levels 55-57 -> 56-56
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 258516;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.8 WHERE `Entry` = 258516 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 258516;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (258516,56,56);
-- 258668 Legashi Ritualist: faction 16 -> 16, health x3 -> x3.5, levels 55-57 -> 56-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 258668;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.5 WHERE `Entry` = 258668 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 258668;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (258668,56,57);
-- 268834 Bloodstarved Frenzy: faction 16 -> 16, health x3 -> x3.0, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 268834;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 3.0 WHERE `Entry` = 268834 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 268834;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (268834,55,57);
-- 268864 Legashi Plaguebringer: faction 16 -> 16, health x3 -> x2.8, levels 55-57 -> 55-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 268864;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 2.8 WHERE `Entry` = 268864 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 268864;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (268864,55,57);
-- 268865 Festering Swarmer: faction 16 -> 16, health x1 -> x0.8, levels 55-57 -> 55-56
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 268865;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 0.8 WHERE `Entry` = 268865 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 268865;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (268865,55,56);
-- 269104 Moontouched Wanderer: faction 16 -> 16, health x4 -> x4.0, levels 55-57 -> 55-55
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 269104;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 4.0 WHERE `Entry` = 269104 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 269104;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (269104,55,55);
-- 277474 Blackmaw Devotee: faction 16 -> 16, health x1 -> x0.7, levels 55-57 -> 56-57
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` = 277474;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 0.7 WHERE `Entry` = 277474 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` = 277474;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (277474,56,57);
