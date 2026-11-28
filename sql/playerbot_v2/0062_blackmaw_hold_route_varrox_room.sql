-- Migration: 0062_blackmaw_hold_route_varrox_room
-- Date:    2026-11-23
-- Purpose: Blackmaw Hold (map 2974): the route's last leg, from Elder Shaman Bloodmane to Varrox Bleakhoof's new spot in the high north
--          room of the east cave (world SQL 2026_11_23_24_world_forever_blackmaw_varrox_room). Varrox stood on the only short way from
--          the Unbound Spirit to the Behemoth: the old crumbs 131-132 passed 10 y from him, and the tank pulled him fifth, before the
--          Behemoth and Bloodmane (blackmaw_full chain69b, 23 Nov: both left standing when the goal fell). Crumbs 0-155 stay; 156-178
--          replace the old 156-167. Built on the 2974 navmesh: the shortest path from crumb 155 (by Bloodmane) to the new spot, a crumb
--          about every 15-30 y, each leg a straight line on the walkable mesh (checked every yard), each crumb at least 4.8 y from a
--          wall. The way passes route pack 44 and two Blackmaw Shaman / Grizzly packs north of the shrine.
-- Reverts: no (0044 has the old tail).

-- @target: shared

DELETE FROM {SHARED}.playerbot_dungeon_routes WHERE map_id = 2974 AND difficulty = 0 AND seq >= 156;

INSERT INTO {SHARED}.playerbot_dungeon_routes (map_id, difficulty, seq, position_x, position_y, position_z) VALUES
    (2974,0,156,3506.58,2995.78,145.90),
    (2974,0,157,3501.31,3010.93,145.41),
    (2974,0,158,3482.27,3031.40,149.97),
    (2974,0,159,3471.87,3037.51,156.28),
    (2974,0,160,3467.73,3051.82,162.82),
    (2974,0,161,3472.87,3064.80,165.70),
    (2974,0,162,3498.04,3076.02,166.11),
    (2974,0,163,3506.67,3081.33,167.07),
    (2974,0,164,3507.80,3090.80,166.41),
    (2974,0,165,3518.87,3093.80,166.00),
    (2974,0,166,3536.93,3099.67,167.68),
    (2974,0,167,3544.48,3102.24,169.02),
    (2974,0,168,3559.13,3113.60,171.36),
    (2974,0,169,3568.71,3125.91,172.30),
    (2974,0,170,3582.62,3131.09,174.86),
    (2974,0,171,3599.78,3126.31,176.19),
    (2974,0,172,3629.80,3120.53,178.47),
    (2974,0,173,3643.11,3124.53,179.49),
    (2974,0,174,3660.91,3122.35,180.66),
    (2974,0,175,3671.80,3115.87,182.09),
    (2974,0,176,3673.33,3088.67,189.49),
    (2974,0,177,3668.78,3074.49,189.22),
    (2974,0,178,3660.47,3060.67,189.15);
