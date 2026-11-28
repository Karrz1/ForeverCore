-- Spawn health: clear `curHealthPct` on spawns whose creature regenerates health. The core ignores the value for those (they
-- spawn at full health and regenerate) and writes one DBErrors line per row at every startup: about 83,500 rows with 100
-- (mostly from the 2026_09_27_00 Forever baseline, the rest retail world data) and 122 with 0 (Twilight Shadowmancers from
-- 2026_11_08_96, which also log "invalid curHealthPct 0, set to 1"). NULL is what the core turns them into, so nothing changes
-- in game. Spawns of creatures with health regeneration off (`RegenHealth` = 0) keep their value. Safe to run again.
UPDATE `creature` `c` JOIN `creature_template` `t` ON `t`.`entry`=`c`.`id`
SET `c`.`curHealthPct`=NULL
WHERE `c`.`curHealthPct` IS NOT NULL AND `t`.`RegenHealth`=1;
