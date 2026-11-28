-- Bandarion Keep (Tirisfal): Evin Schmidtt (250448), Relreo Emberlight (274912) and his wolf Max (274913) stood three times each
-- (Discord, lin "bugs 6+4" Brill 5, 2026-11-23). The sniff import (2026_10_03_00, build 70170) kept every place it saw them: Evin on
-- the platform, the stairs and the hall, Relreo and Max at three points of the same road. They walk about on live; we have no path
-- for them, so one of each stays: Evin 21200125 (the one that wanders), Relreo 21200450 and Max 21200453 (the middle of the road).
-- Safe to run again.
DELETE FROM `creature_addon` WHERE `guid` IN (21200126, 21200127, 21200449, 21200451, 21200452, 21200454);
DELETE FROM `spawn_group` WHERE `spawnType` = 0 AND `spawnId` IN (21200126, 21200127, 21200449, 21200451, 21200452, 21200454);
DELETE FROM `creature` WHERE (`guid` IN (21200126, 21200127) AND `id` = 250448) OR (`guid` IN (21200449, 21200451) AND `id` = 274912)
    OR (`guid` IN (21200452, 21200454) AND `id` = 274913);
