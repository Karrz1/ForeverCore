-- Deeprun Tram: four of the six cars drove into the station walls.
-- The tram is two trains of three cars (Subway 176080-176085). Each car's path is played relative to its spawn point, so all
-- three cars of a train must be spawned at that train's own end of the tunnel. The rows had the spawn points mixed up: the
-- train facing south (rotation2 -0.707: 176080, 176084, 176085) belongs at the Ironforge end (x -45.4, y 2473-2512), the
-- train facing north (rotation2 +0.707: 176081, 176082, 176083) at the Stormwind end (x 4.5, y -11-28). Only 176080 and
-- 176081 were at their own end; 176082/176083 sat at Ironforge and 176084/176085 at Stormwind. This swaps those four spots.
-- Root cause found by shenkai4257 (TC-foreve, 11-18, fixed by hand in their DB); this file is our own.
-- Each UPDATE only matches the row while it still has the old spot, so it is safe to run twice and does nothing on a DB
-- where the rows were already changed. The car's rotation stays with its entry. No code change (the transport keeps its
-- "no animation, no update" guard).
UPDATE `gameobject` SET `position_x` = -45.4005, `position_y` = 2492.79 WHERE `guid` = 30018806 AND `id` = 176084 AND `map` = 369 AND ABS(`position_y` - 28.2097) < 0.01;
UPDATE `gameobject` SET `position_x` = -45.4007, `position_y` = 2512.15 WHERE `guid` = 30018807 AND `id` = 176085 AND `map` = 369 AND ABS(`position_y` - -11.3475) < 0.01;
UPDATE `gameobject` SET `position_x` = 4.58065, `position_y` = 28.2097 WHERE `guid` = 30018804 AND `id` = 176082 AND `map` = 369 AND ABS(`position_y` - 2492.79) < 0.01;
UPDATE `gameobject` SET `position_x` = 4.49883, `position_y` = -11.3475 WHERE `guid` = 30018805 AND `id` = 176083 AND `map` = 369 AND ABS(`position_y` - 2512.15) < 0.01;
