-- WoW Forever: the Alcaz Prison entrance moves to where players find the dungeon door on Alcaz Island.
-- 2026_11_14_41 placed the entrance trigger (areatrigger spawn 34, template 324) at a guessed spot (-2558.3,-4912.5,33.0) and
-- the .tele AlcazPrisonEntrance (2361) beside it. A player (Fox, 22 Nov) stood at the door in the basement and sent its .gps:
-- map 1, zone 15, area 2079, X -2523.0557 Y -4931.3198 Z 24.6393 O 2.3603. The trigger keeps its 5 yard sphere.
-- Safe to run again.

UPDATE `areatrigger` SET `PosX` = -2523.0557, `PosY` = -4931.3198, `PosZ` = 24.6393, `Orientation` = 2.3603,
    `Comment` = 'Alcaz Prison - dungeon entrance (Alcaz Island basement, player .gps 2026-11-22)'
WHERE `SpawnId` = 34 AND `IsCustom` = 1 AND `AreaTriggerCreatePropertiesId` = 324;

-- .tele AlcazPrisonEntrance: 6 yards back from that spot along his facing, so the tele lands outside the trigger (INFERRED: open floor)
UPDATE `game_tele` SET `position_x` = -2518.6, `position_y` = -4935.4, `position_z` = 24.64, `orientation` = 2.36
WHERE `id` = 2361 AND `name` = 'AlcazPrisonEntrance';
