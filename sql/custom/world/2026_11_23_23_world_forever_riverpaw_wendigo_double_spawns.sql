-- Double spawns in two camps (BUGS-ALL row 332): the Elwynn Riverpaw camp (26.5, 93.5) and the Dun Morogh wendigo cave.
-- Each had a second set of creatures on top of the base spawns, 4-15 yards from them: 40 gnolls where live shows 11 alive at
-- once in sight, 55 wendigos where live shows 19. Checked against 34 live captures (10-22 Nov): the base spawns (guid 20000000+)
-- sit exactly on the spots where live shows a creature; the extra ones do not.
--  * Riverpaw camp: 11 Runt-or-Outrunner spots and a second Longsnout came in with the spawn restore of 2026_11_02_29 (pools
--    1700015, 1700037-1700046 "Restored AnoCore spot"). Its "nothing of ours within 5 yards" check missed the base gnolls
--    because those stand a few yards away or are the other of the two entries. The base camp (30 gnolls alive at once, Hogger, Longsnout) stays.
--    On live the same spot shows a Runt one time and an Outrunner another, so the base entries stay as they are.
--  * Wendigo cave: 7 wendigos from the same restore, and 12 Elder Wendigos (271530) + 1 Wendigo Shaman (271486) added from a
--    sniff near, not on, the base spots. Live shows one entry per spot, always the same one: 11 base spots are an Elder Wendigo,
--    3 a Wendigo Shaman, 9 a Wendigo, 12 never showed exactly. The 14 Elder/Shaman spots get that entry; the rest stay Wendigo.
--    All three drop Wendigo Mane (2671) for The Grizzled Den, and Frosthowl and Edan the Howler are untouched.
-- Each delete only takes a row that is still the same creature, so it is safe to run again.

-- Riverpaw camp (map 0)
DELETE FROM `pool_members` WHERE `type` = 0 AND `poolSpawnId` IN (1700015,1700037,1700038,1700040,1700041,1700042,1700043,1700044,1700045,1700046)
  AND `spawnId` IN (11414,80503,80507,80511,80516,80527,80528,80530,80532,80538,9100483,9101132,9101136,9101139,9101143,9101153,9101154,9101155,9101156,9101162);
DELETE FROM `creature` WHERE `map` = 0 AND (
     (`id` = 97  AND `guid` IN (11414,80503,80507,80511,80516,80527,80528,80530,80532,80538))
  OR (`id` = 478 AND `guid` IN (9100483,9101132,9101136,9101139,9101143,9101153,9101154,9101155,9101156,9101162))
  OR (`id` = 119 AND `guid` = 170351));
DELETE p FROM `pool_template` p WHERE p.`entry` IN (1700015,1700037,1700038,1700040,1700041,1700042,1700043,1700044,1700045,1700046)
  AND p.`description` LIKE 'Restored AnoCore spot%' AND NOT EXISTS (SELECT 1 FROM `pool_members` m WHERE m.`poolSpawnId` = p.`entry`);

-- Dun Morogh wendigo cave (map 0)
DELETE FROM `creature` WHERE `map` = 0 AND (
     (`id` = 1134 AND `guid` = 3137)
  OR (`id` = 1135 AND `guid` IN (3239,3240,3246,3566,3567,3572))
  OR (`id` = 271530 AND `guid` BETWEEN 27153000 AND 27153011)
  OR (`id` = 271486 AND `guid` = 27148600));
UPDATE `creature` SET `id` = 271530, `modelid` = 0, `equipment_id` = 0
  WHERE `map` = 0 AND `id` = 1135 AND `guid` IN (20003119,20003129,20003135,20003138,20003221,20003230,20003234,20003237,20003241,20003244,20003563);
UPDATE `creature` SET `id` = 271486, `modelid` = 0, `equipment_id` = 0
  WHERE `map` = 0 AND `id` = 1135 AND `guid` IN (20003122,20003133,20003233);
