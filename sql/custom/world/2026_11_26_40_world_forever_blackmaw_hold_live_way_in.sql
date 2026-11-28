-- Blackmaw Hold (map 2974): the way in and out as live has it, replacing the INFERRED spots of 2026_11_19_70.
-- Source: a live capture made on 25-26 November 2026 (client 1.60.1.71139): three runs into the dungeon, one a full clear
-- (Withermaw, Tunnelweb Matriarch, Bonesnout, Blackmaw Behemoth, then Varrox Bleakhoof last). Positions are where each creature
-- and object was first seen.
--  * the landing: live puts a player who walks in at (3375.09, 3822.24, 306.98), facing 4.788 (ours was at (3470, 3690), about
--    160 yards south-east).
--  * the exit: live's way out is the Blackmaw Hold portal (object 661120) 7 yards north of the landing; the player walked onto it
--    and was sent out to (4545.41, -5048.42, 166.21), facing 2.50. Our exit trigger moves onto the portal (its size, 4 yards, is
--    kept: INFERRED, live's own size is not in the capture), and the spot outside moves to live's.
--  * the entrance in the furbolg tunnel in Azshara: on all three runs the player walked south-east and was sent in at about
--    (4552.0, -5053.4, 164.5). Ours is a sphere of 5 yards at (4541.9, -5048.0), which live never fired at (the player was 10
--    yards past its middle). Its middle moves 5 yards past where live fired, so its edge is where live fired (INFERRED: live's
--    trigger is server side, its size and middle are not in the capture).
-- Safe to run again.
UPDATE `world_safe_locs` SET `LocX` = 3375.09, `LocY` = 3822.24, `LocZ` = 306.979, `Facing` = 4.788,
  `Comment` = 'Blackmaw Hold (dungeon) - entrance inside (live capture 26 Nov 2026)' WHERE `ID` = 1104126;
UPDATE `world_safe_locs` SET `LocX` = 4545.41, `LocY` = -5048.42, `LocZ` = 166.214, `Facing` = 2.50,
  `Comment` = 'Blackmaw Hold (dungeon) - exit outside, the furbolg tunnel in Azshara (live capture 26 Nov 2026)' WHERE `ID` = 1104127;
UPDATE `areatrigger` SET `PosX` = 4555.4, `PosY` = -5057.1, `PosZ` = 164.0,
  `Comment` = 'Blackmaw Hold - dungeon entrance (the furbolg tunnel, Azshara; live sends players in at 4552.0 -5053.4)' WHERE `SpawnId` = 36;
UPDATE `areatrigger` SET `PosX` = 3374.33, `PosY` = 3829.27, `PosZ` = 306.61,
  `Comment` = 'Blackmaw Hold (dungeon) - exit (the Blackmaw Hold portal by the landing, live capture 26 Nov 2026)' WHERE `SpawnId` = 37;
UPDATE `game_tele` SET `position_x` = 3375.09, `position_y` = 3822.24, `position_z` = 306.979, `orientation` = 4.788 WHERE `name` = 'BlackmawHold';
UPDATE `game_tele` SET `position_x` = 4545.41, `position_y` = -5048.42, `position_z` = 166.214, `orientation` = 2.50 WHERE `name` = 'BlackmawHoldEntrance';
