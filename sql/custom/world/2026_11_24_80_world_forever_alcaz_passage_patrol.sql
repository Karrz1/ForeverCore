-- Alcaz Prison (map 2994): the flooded lower passage, laid out again so the corner where it meets the Ca'zass passage holds one
-- fight at a time. Hand-placed like 2026_11_22_77 (no sniff of the dungeon exists).
-- af66 bot run (alcaz_full): after Tidemistress Ca'zass the tank died at -8807,2936, the corner where the bot route turns
-- north to Blazeroar. The naga patrol of the lower passage (48120047/48) walked from -8807,2884 right through the middle pack
-- (48120049-51, at 2913) to that corner (2940), and at the corner the middle pack, the pack under the west hall (48120052-54)
-- and the first pack of the Ca'zass passage (48120055-57) all stand within 17-23 y. A pull there brought them together.
-- Now the patrol walks only the south half of the passage (2880 to 2896, 38 y and more from the corner), and the middle pack
-- stands 8 y further south (27-30 y from the corner). Both spots are on the 2994 navmesh at the floor's height, 1.3 y or more
-- from a wall. The pack under the west hall stays, it is the next pull on the route.

UPDATE `waypoint_path_node` SET `PositionX`=-8808.00, `PositionY`=2880.00, `PositionZ`=7.22 WHERE `PathId`=481200470 AND `NodeId`=0;
UPDATE `waypoint_path_node` SET `PositionX`=-8808.00, `PositionY`=2896.00, `PositionZ`=7.22 WHERE `PathId`=481200470 AND `NodeId`=1;
UPDATE `creature` SET `position_x`=-8808.00, `position_y`=2880.00, `position_z`=7.22 WHERE `guid` IN (48120047,48120048);

UPDATE `creature` SET `position_x`=-8807.84, `position_y`=2907.49, `position_z`=7.22 WHERE `guid`=48120049;
UPDATE `creature` SET `position_x`=-8810.36, `position_y`=2905.04, `position_z`=7.22 WHERE `guid`=48120050;
UPDATE `creature` SET `position_x`=-8805.89, `position_y`=2904.57, `position_z`=7.66 WHERE `guid`=48120051;
