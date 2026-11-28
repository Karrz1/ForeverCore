-- Migration: 0065_wailing_caverns_route_to_the_cliff_link
-- Date:    2026-11-24
-- Purpose: Wailing Caverns (map 43): the route from Lord Serpentis' cliff link no longer goes into the pocket under his ledge.
--          0036 ran Skum (crumb 167), then crumbs 168-191 back north-east to the floor under the ledge (-61.6,-15.5), a dead end,
--          and only then the link's lower end (crumb 192). wc_full af69i: the squad walked that pocket in and out, about 540 y in
--          and 800 y back round by the south to the link, and crossed at 3317 s of a 3600 s run. The new crumbs 168-183 go straight
--          from Skum up the west passage to the link's upper end B (-288.23,-6.15,-58.98), about 350 y, the way the tank walked
--          to it in that run. 184 on is 0036's 192-208 (link end A, then the ledge to Serpentis and Verdan) renumbered.
--          Built from the map 43 navmesh: a crumb every 18-32 y, every crumb-to-crumb leg a clean path of at most 7 polygons
--          and at most 1.45x its straight line.
-- Reverts: yes (crumbs 168-208 of map 43 as 0036 has them).

-- @target: shared

DELETE FROM {SHARED}.playerbot_dungeon_routes WHERE map_id = 43 AND difficulty = 0 AND seq >= 168;

INSERT INTO {SHARED}.playerbot_dungeon_routes (map_id, difficulty, seq, position_x, position_y, position_z) VALUES
    (43,0,168,-270.76,-302.58,-68.23),(43,0,169,-263.13,-290.53,-66.93),(43,0,170,-263.73,-269.38,-64.94),(43,0,171,-272.16,-252.00,-62.35),(43,0,172,-274.49,-232.18,-62.23),(43,0,173,-267.57,-204.43,-62.79),
    (43,0,174,-283.13,-193.87,-60.90),(43,0,175,-298.13,-179.91,-61.98),(43,0,176,-306.73,-158.60,-59.46),(43,0,177,-313.01,-136.37,-61.64),(43,0,178,-308.80,-119.91,-61.92),(43,0,179,-307.73,-94.51,-64.11),
    (43,0,180,-315.04,-73.07,-64.08),(43,0,181,-313.67,-51.73,-63.05),(43,0,182,-307.20,-31.69,-61.15),(43,0,183,-288.23,-6.15,-58.98),(43,0,184,-289.07,3.2,-63.96),(43,0,185,-277.57,19.56,-60.51),
    (43,0,186,-266.07,35.93,-55.63),(43,0,187,-253.17,51.14,-52.57),(43,0,188,-233.62,55.38,-48.85),(43,0,189,-213.74,57.04,-49.05),(43,0,190,-193.9,55.52,-47.16),(43,0,191,-174.16,52.3,-41.38),
    (43,0,192,-159.28,40.37,-34.94),(43,0,193,-149.28,23.05,-28.41),(43,0,194,-139.28,5.73,-27.52),(43,0,195,-129.28,-11.59,-27.49),(43,0,196,-120.16,-24.62,-28.58),(43,0,197,-108.08,-8.68,-27.89),
    (43,0,198,-96,7.26,-29.89),(43,0,199,-83.92,23.2,-30.37),(43,0,200,-81.86,32.26,-30.99);
