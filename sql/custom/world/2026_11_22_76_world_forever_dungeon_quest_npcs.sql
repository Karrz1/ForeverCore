-- The two quest NPCs world 2026_11_22_73's quests need, which had no spawn:
--   Deathstalker Agent 13155 (gives 95682 Open the Maw, takes 95663 Dragonmaw Rumors), Wetlands 51.5 59.3 = map 0
--     -3782.4 -2519.3. Ground measured on dev 11-22: z 167.01 (the hilltop; no cave floor under that spot).
--   Zalfan Moonshadow 268423 (the kill target of 96771 Vengeance of the Highborne), inside Krol'dok Stronghold (map 3039) at
--     -7200.02 -4099.14, the first of two points players saw him at (the second is 58 yd off, him walking). Ground measured on
--     dev 11-22: z 262.34. Our live Twilight groups stand 44 yd from there. Everlake put him on map 0, outside: the quest and the
--     points belong to the dungeon map, which uses the same coordinates as the land above it.
-- Points from Wowhead's WoW Forever pages (map pins). INFERRED: facing, respawn times; Zalfan stands still (no live path known).
-- Zalfan's display 145448 (model 7369, scale 1) is in the client but had no creature_model_info row, so the server refused to
-- spawn him: the row gets the size most displays of that model at scale 1 have in our data (271 of 374: 0.389 / 1.5).
-- Guids 48150000-48150001. Safe to run again.

INSERT IGNORE INTO `creature_model_info` (`DisplayID`,`BoundingRadius`,`CombatReach`,`DisplayID_Other_Gender`,`VerifiedBuild`) VALUES
(145448, 0.389, 1.5, 0, 0);

DELETE FROM `creature` WHERE `guid` IN (48150000, 48150001);
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,
  `modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,
  `MovementType`,`VerifiedBuild`) VALUES
(48150000, 13155, 0,    0, 0, '0',     0, 0, 0, -1, 0, 0, -3782.4,  -2519.3,  167.01, 3.14, 300, 0, 0, 0, 0),
(48150001, 268423, 3039, 0, 0, '1,201', 0, 0, 0, -1, 0, 0, -7200.02, -4099.14, 262.34, 3.14, 7200, 0, 0, 0, 0);
