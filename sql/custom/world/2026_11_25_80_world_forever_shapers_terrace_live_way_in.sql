-- The Shaper's Terrace (map 3001): the way in as live has it, replacing the INFERRED spots of 2026_11_19_72.
-- Source: a live capture made on 25 November 2026 (client 1.60.1.71139) of a full walk through the dungeon, about 20 minutes,
-- no boss killed. Positions are where each creature and object was first seen.
--  * the landing: live puts a player who walks in at (-5921.34, -975.49, 63.26), facing 5.209, on the terrace above the
--    first camp (ours was at the client's exit trigger 10556 down by the tar, about 320 yards away).
--  * the entrance in Un'Goro Crater: the player walked east along y -1251 at z -143.25 and was sent in at (-6098.36, -1250.33),
--    with no client area trigger message (the trigger is server side). Ours is a sphere of 5 yards at (-6117.1, -1246.4),
--    which a player coming from that side only reaches 14 yards later. Its middle moves 5 yards east of where live fired
--    (INFERRED: live's own trigger size and middle are not in the capture). The exit (trigger 10556) is unchanged.
-- Safe to run again.
UPDATE `world_safe_locs` SET `LocX` = -5921.34, `LocY` = -975.49, `LocZ` = 63.26, `Facing` = 5.209,
  `Comment` = 'The Shaper''s Terrace (dungeon) - entrance inside (live capture 25 Nov 2026)' WHERE `ID` = 1104128;
UPDATE `areatrigger` SET `PosX` = -6093.4, `PosY` = -1250.3, `PosZ` = -143.25,
  `Comment` = 'The Shaper''s Terrace - dungeon entrance (Un''Goro Crater; live sends players in at -6098.4 -1250.3)' WHERE `SpawnId` = 38;
UPDATE `game_tele` SET `position_x` = -5921.34, `position_y` = -975.49, `position_z` = 63.26, `orientation` = 5.209 WHERE `name` = 'ShapersTerrace';
UPDATE `game_tele` SET `position_x` = -6105.0, `position_y` = -1251.0, `position_z` = -143.25, `orientation` = 0.0 WHERE `name` = 'ShapersTerraceEntrance';
