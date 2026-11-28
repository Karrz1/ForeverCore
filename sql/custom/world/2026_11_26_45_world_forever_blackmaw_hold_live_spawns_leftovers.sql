-- Blackmaw Hold (map 2974): what 2026_11_26_41 (live's spawns) leaves behind of the old layout. 41 deletes the creatures
-- 48130000-48130199 and their creature_addon rows, but not what hangs off them: 122 creature_formations rows (packs of the
-- 2026_11_22_78 layout) and its four hand-placed waypoint paths 481300250, 481300270, 481300290 and 481300310. Their creatures
-- are gone, so they only point at nothing.
-- Also the hand-placed quest objects of 2026_11_24_90 in the hold (guids 48161004-48161019: the Totem of Ursol 570888, the Totem
-- of Ursoc 570890 and 14 Nordrassil Root Caps 571511). That file placed them as best guesses, to be replaced from a sniff; 41 now
-- stands live's two totems and 36 Root Caps, so without this the hold has both. The other guids of that range are not in the
-- hold (the Drowned City tablets 48161000-48161003, the Alcaz Prison note 48161020) and stay.
-- Safe to run again.
DELETE FROM `creature_formations` WHERE `leaderGUID` BETWEEN 48130000 AND 48130199 OR `memberGUID` BETWEEN 48130000 AND 48130199;
DELETE FROM `waypoint_path_node` WHERE `PathId` BETWEEN 481300000 AND 481301999;
DELETE FROM `waypoint_path` WHERE `PathId` BETWEEN 481300000 AND 481301999;
DELETE FROM `gameobject_addon` WHERE `guid` BETWEEN 48161004 AND 48161019;
DELETE FROM `gameobject` WHERE `guid` BETWEEN 48161004 AND 48161019 AND `map` = 2974;
