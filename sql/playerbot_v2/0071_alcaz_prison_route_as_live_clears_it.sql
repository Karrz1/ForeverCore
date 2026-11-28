-- Migration: 0071_alcaz_prison_route_as_live_clears_it
-- Date:    2026-11-27
-- Purpose: Alcaz Prison (map 2994): the route for live's layout (world 2026_11_27_40..43, from Karrz's capture of a full clear on
--          26 Nov) in live's kill order: Overseer Wrex, Katerina the Cleaner, Blazeroar, The Questioner. From live's landing
--          (-8796.59, 2838.67, 28.77) only Wrex's wing is open: with live's doors shut, the 2994 navmesh joins the landing to Wrex
--          and to the Maximum Security Door 649547 (-8791.3, 2932.4), and nothing else. Legs 21-22 go through that door (the rogue
--          picks its lock, as on live) to Katerina and Blazeroar, legs 39-40 come back out through it, legs 43-44 go through the
--          Prison Gate 649552 (-8763.4, 2871.3), which shuts 3 s after each use, to The Questioner. No other leg crosses a door.
--          Crumbs 10, 26, 31 and 46 are the bosses' spots. 47 crumbs, 789 y, every leg is a navmesh path of at most 26 y.
--          Tidemistress Ca'zass is not spawned (live has her nowhere), so the route does not go down to her old room.
-- Reverts: run 0066 again.

-- @target: shared

DELETE FROM {SHARED}.playerbot_dungeon_routes WHERE map_id = 2994;

INSERT INTO {SHARED}.playerbot_dungeon_routes (map_id, difficulty, seq, position_x, position_y, position_z) VALUES
    (2994,0,0,-8796.59,2838.67,28.77),
    (2994,0,1,-8796.73,2858.93,21.55),
    (2994,0,2,-8797.60,2876.21,19.33),
    (2994,0,3,-8801.53,2887.93,19.35),
    (2994,0,4,-8823.64,2889.60,15.58),
    (2994,0,5,-8836.62,2886.40,15.13),
    (2994,0,6,-8852.40,2889.38,14.02),
    (2994,0,7,-8873.15,2887.47,14.20),
    (2994,0,8,-8889.24,2901.42,15.04),
    (2994,0,9,-8886.00,2904.93,14.69),
    (2994,0,10,-8885.80,2921.30,14.91),
    (2994,0,11,-8885.97,2902.29,14.85),
    (2994,0,12,-8873.15,2887.47,14.20),
    (2994,0,13,-8853.60,2886.67,14.33),
    (2994,0,14,-8836.62,2886.40,15.13),
    (2994,0,15,-8823.64,2889.60,15.58),
    (2994,0,16,-8802.58,2886.67,19.49),
    (2994,0,17,-8780.13,2888.00,17.29),
    (2994,0,18,-8762.13,2893.16,14.86),
    (2994,0,19,-8761.78,2910.89,10.64),
    (2994,0,20,-8764.98,2932.00,6.73),
    (2994,0,21,-8783.91,2932.31,6.46),
    (2994,0,22,-8802.40,2932.40,6.42),
    (2994,0,23,-8807.47,2933.53,7.09),
    (2994,0,24,-8807.93,2949.00,7.22),
    (2994,0,25,-8797.13,2966.40,6.89),
    (2994,0,26,-8808.50,2971.10,6.01),
    (2994,0,27,-8825.07,2966.27,7.22),
    (2994,0,28,-8847.73,2968.53,7.40),
    (2994,0,29,-8858.47,2966.20,7.22),
    (2994,0,30,-8875.82,2975.38,6.15),
    (2994,0,31,-8901.20,2971.50,5.89),
    (2994,0,32,-8875.82,2975.38,6.15),
    (2994,0,33,-8858.47,2966.20,7.22),
    (2994,0,34,-8837.60,2968.53,7.04),
    (2994,0,35,-8825.07,2966.27,7.22),
    (2994,0,36,-8811.67,2955.53,6.55),
    (2994,0,37,-8807.93,2949.00,7.22),
    (2994,0,38,-8806.40,2929.16,6.86),
    (2994,0,39,-8802.40,2932.40,6.42),
    (2994,0,40,-8780.13,2932.13,6.82),
    (2994,0,41,-8762.13,2926.49,6.78),
    (2994,0,42,-8764.98,2906.27,12.15),
    (2994,0,43,-8764.98,2887.64,15.13),
    (2994,0,44,-8763.13,2869.33,14.35),
    (2994,0,45,-8771.84,2863.52,13.57),
    (2994,0,46,-8773.00,2854.20,13.86);
