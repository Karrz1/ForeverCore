-- Mount Hyjal: the Lonely Lantern (660408) calls Ta'shkal (268231). Needs 2026_11_22_36 (the templates) first.
-- 1. The lantern's spell 1301234 is cast by the player who uses it (goober playerCast, Data23): the spell takes the Corrupted
--    Cat Figurine 276909 as its reagent and is allowed only with one in the bags (condition on the caster), so the object
--    itself must not be the caster. Its 3 s cast bar is the player's.
-- 2. The spell only sends event 104925; the event script (classic_winterspring.cpp) calls Ta'shkal beside the lantern.
-- Safe to run again.
UPDATE `gameobject_template` SET `Data23`=1 WHERE `entry`=660408 AND `type`=10;
DELETE FROM `event_script_names` WHERE `Id`=104925;
INSERT INTO `event_script_names` (`Id`,`ScriptName`) VALUES (104925,'classic_event_lonely_lantern_tashkal');
