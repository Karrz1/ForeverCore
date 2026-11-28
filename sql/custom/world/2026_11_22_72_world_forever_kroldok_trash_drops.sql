-- Krol'dok Stronghold: the trash drops its own items again. Since 2026_11_19_66 the dungeon's trash stands on its live entries
-- at the live kill spots, but 12 of those kinds had no loot at all (loot id 0) and the other four only quest items, so
-- the stronghold's eight trash items (Stretched Footpads 287007, Ogre Magi's Mantle 287008, Twilight Enforcer's Legs 287009,
-- Outrider's Gloves 287010, Guise of Battle 287011, Krol'dok Warplate Gauntlets 287012, Krol'dok Warplate Legplates 287013,
-- Supreme Smasher 287015; all in our hotfixes) dropped from nothing.
-- Source (read as data): Everlake's world data (buildthehomelab, GPL-3.0), 2026_11_21_95_world_everlake_kroldok_trash_drops.sql:
-- 68 rows on 12 creatures, the chance is Wowhead's WoW Forever drops over kills for that creature, or Icy Veins' WoW
-- Forever rate (players' addons on live) where Wowhead does not list the creature (9 rows, marked so). Written as our own rows.
-- Not taken from Everlake: its Krol'dok spawns and templates (2026_11_21_80/82/83 in its core). Ours already use the same live
-- entries and stand at the live kill spots from EG Link's combat logs; Everlake's still stand at the old placeholder spots.
-- A creature with loot id 0 gets loot id = its entry, only while no other creature uses that id. Safe to run again.

DROP TEMPORARY TABLE IF EXISTS `kroldok_trash_drops`;
CREATE TEMPORARY TABLE `kroldok_trash_drops` (`Entry` INT UNSIGNED NOT NULL, `Item` INT UNSIGNED NOT NULL, `Chance` FLOAT NOT NULL,
  `Comment` VARCHAR(255) NOT NULL, PRIMARY KEY (`Entry`,`Item`));
INSERT INTO `kroldok_trash_drops` (`Entry`,`Item`,`Chance`,`Comment`) VALUES
(257885,287007,0.17,'Krol''dok Centurion: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257885,287008,0.29,'Krol''dok Centurion: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257885,287011,0.11,'Krol''dok Centurion: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257885,287012,1.14,'Krol''dok Centurion: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257885,287013,0.8,'Krol''dok Centurion: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257885,287015,0.11,'Krol''dok Centurion: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257888,287007,0.28,'Krol''dok Shaman: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257888,287009,0.19,'Krol''dok Shaman: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257888,287012,0.75,'Krol''dok Shaman: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257888,287013,1.22,'Krol''dok Shaman: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257900,287007,0.36,'Redridge Prisoner: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257900,287008,0.3,'Redridge Prisoner: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257900,287009,0.18,'Redridge Prisoner: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257900,287011,0.12,'Redridge Prisoner: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257900,287012,1.21,'Redridge Prisoner: Krol''dok trash item (Wowhead WoW Forever rate)'),
(257900,287013,1.57,'Redridge Prisoner: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258038,287007,0.24,'Shadowhide Bully: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(258038,287008,0.33,'Shadowhide Bully: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258038,287009,0.41,'Shadowhide Bully: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258038,287011,0.33,'Shadowhide Bully: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258038,287012,0.49,'Shadowhide Bully: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258038,287013,1.48,'Shadowhide Bully: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258040,287007,0.45,'Shadowhide Curseweaver: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(258040,287011,0.45,'Shadowhide Curseweaver: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(258040,287012,2.22,'Shadowhide Curseweaver: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258040,287013,0.74,'Shadowhide Curseweaver: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258042,287007,0.23,'Twilight Grunt: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258042,287008,0.1,'Twilight Grunt: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258042,287009,0.23,'Twilight Grunt: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258042,287011,0.1,'Twilight Grunt: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258042,287012,0.93,'Twilight Grunt: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258042,287013,0.85,'Twilight Grunt: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258042,287015,0.08,'Twilight Grunt: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258100,287007,0.41,'Twilight Warlock: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258100,287009,0.24,'Twilight Warlock: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258100,287011,0.24,'Twilight Warlock: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258100,287012,0.97,'Twilight Warlock: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258100,287013,1.22,'Twilight Warlock: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258100,287015,0.16,'Twilight Warlock: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258102,287008,0.18,'Twilight Outrider: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258102,287009,0.14,'Twilight Outrider: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258102,287010,5.44,'Twilight Outrider: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258102,287011,0.09,'Twilight Outrider: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258102,287012,0.88,'Twilight Outrider: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258102,287013,1.11,'Twilight Outrider: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258104,287007,0.23,'Twilight Lieutenant: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(258104,287009,0.08,'Twilight Lieutenant: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258104,287011,0.23,'Twilight Lieutenant: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258104,287012,1.03,'Twilight Lieutenant: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258104,287013,0.84,'Twilight Lieutenant: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258104,287015,0.15,'Twilight Lieutenant: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258687,287007,0.27,'Krol''dok Brute: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258687,287008,0.26,'Krol''dok Brute: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258687,287009,0.15,'Krol''dok Brute: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258687,287011,0.18,'Krol''dok Brute: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258687,287012,1.35,'Krol''dok Brute: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258687,287013,1.57,'Krol''dok Brute: Krol''dok trash item (Wowhead WoW Forever rate)'),
(258687,287015,0.22,'Krol''dok Brute: Krol''dok trash item (Wowhead WoW Forever rate)'),
(262065,287011,0.82,'Riding Wolf: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(262065,287012,0.68,'Riding Wolf: Krol''dok trash item (Wowhead WoW Forever rate)'),
(262065,287013,0.82,'Riding Wolf: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(262065,287015,0.82,'Riding Wolf: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(262067,287007,0.34,'Twilight Peon: Krol''dok trash item (Wowhead WoW Forever rate)'),
(262067,287009,0.31,'Twilight Peon: Krol''dok trash item (Icy Veins WoW Forever rate)'),
(262067,287011,0.57,'Twilight Peon: Krol''dok trash item (Wowhead WoW Forever rate)'),
(262067,287012,0.57,'Twilight Peon: Krol''dok trash item (Wowhead WoW Forever rate)'),
(262067,287013,0.68,'Twilight Peon: Krol''dok trash item (Wowhead WoW Forever rate)'),
(262067,287015,0.31,'Twilight Peon: Krol''dok trash item (Icy Veins WoW Forever rate)');

UPDATE `creature_template_difficulty` d SET d.`LootID` = d.`Entry`
WHERE d.`DifficultyID` = 0 AND d.`LootID` = 0 AND d.`Entry` IN (257885,257888,257900,258038,258040,258042,258100,258102,258104,258687,262065,262067)
  AND NOT EXISTS (SELECT 1 FROM (SELECT `Entry`,`LootID` FROM `creature_template_difficulty` WHERE `DifficultyID` = 0) o WHERE o.`LootID` = d.`Entry` AND o.`Entry` <> d.`Entry`);

DELETE l FROM `creature_loot_template` l JOIN `kroldok_trash_drops` k ON l.`Entry` = k.`Entry` AND l.`ItemType` = 0 AND l.`Item` = k.`Item`;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT k.`Entry`, 0, k.`Item`, k.`Chance`, 0, 1, 0, 1, 1, k.`Comment` FROM `kroldok_trash_drops` k
WHERE EXISTS (SELECT 1 FROM `creature_template_difficulty` d WHERE d.`Entry` = k.`Entry` AND d.`DifficultyID` = 0 AND d.`LootID` = k.`Entry`);
DROP TEMPORARY TABLE `kroldok_trash_drops`;
