-- Blackrock Depths: only the four dormant Warbringer Constructs (8905) in the Black Vault are untouchable statues.
-- The template carried the dormant state for every 8905: unit_flags 0x02000100 (UNIT_FLAG_UNINTERACTIBLE | UNIT_FLAG_IMMUNE_TO_PC).
-- So the eight constructs without the Stoned aura (10255), which are ordinary active mobs, fought players who could not
-- target or hit them, and players stayed in combat (DoctorSun, 22 Nov, bots could not hit them either).
-- The dormant state now sits on the four Stoned spawns (the ones with creature_addon aura 10255 beside Watchman Doomgrip 9476);
-- classic_npc_watchman_doomgrip wakes them by clearing those flags (and, since this kit, IMMUNE_TO_PC too).
-- Safe to run again.

UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~(0x00000100 | 0x02000000) WHERE `entry` = 8905;

UPDATE `creature` SET `unit_flags` = 0x02000100
WHERE `id` = 8905 AND `guid` IN (SELECT `guid` FROM (SELECT `a`.`guid` FROM `creature_addon` `a` JOIN `creature` `c` ON `c`.`guid` = `a`.`guid`
    WHERE `c`.`id` = 8905 AND FIND_IN_SET('10255', REPLACE(`a`.`auras`, ' ', ',')) > 0) AS `dormant`);
