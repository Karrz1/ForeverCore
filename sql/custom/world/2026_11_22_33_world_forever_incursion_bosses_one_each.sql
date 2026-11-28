-- WoW Forever: the Nightmare Incursion mission bosses come once each, not three times. 2026_11_21_22 placed a boss at every spot
-- Wowhead shows for it, but those spots are sightings of one roaming boss (Larsera: 10 spots in and around Forest Song, Ylanthrius:
-- 72 spots across Twilight Grove), so three copies stood together (3 Ylanthrius in Duskwood, 2 Larsera next to each other in
-- Forest Song). Each boss keeps the middle one of its spawns and roams a little wider (10 yards); the other two go.
-- Live has these bosses and the Terror Whelps (level 41, 27 spots) in Forest Song itself and hostile to both factions (Wowhead
-- WoW Forever NPC pages 221265, 221204, 221260), so the one boss and the whelp stay. Boss levels stay as 2026_11_21_22 set them
-- (ESTIMATED: Wowhead shows no level for them). Safe to run again.
DELETE FROM `creature` WHERE `guid` IN (47600450,47600452,47600454,47600455,47600456,47600458,47600459,47600461,47600462,47600464,
 47600465,47600467,47600468,47600470,47600471,47600473,47600474,47600475) AND `id` IN (221204,221206,221207,221265,221266,221267,221331,221334,221391);
UPDATE `creature` SET `wander_distance` = 10 WHERE `guid` IN (47600451,47600453,47600457,47600460,47600463,47600466,47600469,47600472,47600476)
 AND `id` IN (221204,221206,221207,221265,221266,221267,221331,221334,221391) AND `MovementType` = 1;
