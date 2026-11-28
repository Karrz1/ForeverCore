-- Migration: 0061_drowned_city_marrow_crumb
-- Date:    2026-11-23
-- Purpose: The Drowned City (map 2970) route crumb 107 stood on Deathless Marrow's dais (-13322.97,3073.15,-6.07), a bump of
--          navmesh 3 y high and 3 y wide. drowned_full af63: after Marrow every route step that landed on the dais sent the tank
--          back south; it paced y 3040-3060 for 2100 s and never came nearer the crumb than 13 y. The crumb moves to the floor
--          east of the dais, 8.8 y from Marrow's spot (still the crumb nearest her, where the walk to the next boss starts);
--          the walks 106 -> 107 -> 108 stay on the flat floor (navmesh polygons 5973, 5978, 5980, 5979, z -7.8 to -7.2).
-- Reverts: UPDATE ... SET position_x = -13322.97, position_y = 3073.15, position_z = -6.07 for the same row.

-- @target: shared

UPDATE {SHARED}.playerbot_dungeon_routes SET position_x = -13316.50, position_y = 3079.00, position_z = -7.80
    WHERE map_id = 2970 AND difficulty = 0 AND seq = 107;
