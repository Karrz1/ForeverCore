-- Silverpine Forest: Old Fire-Eye (259897) one at a time instead of six (Discord, lin "bugs 6+4" Silverpine 1, 2026-11-23: six copies
-- within 90 yards). The Forever quest data restore (2026_11_05_99) put one on each of six map pins (guids 25989700-25989705, random
-- movement, in no pool). The pins stay as the places it can turn up, in one pool with one up at a time (same as the Nightveiled
-- Rotheap of 2026_11_21_67). INFERRED: one at a time is the report's; no sniff of it is in hand. Safe to run again.
DELETE FROM `pool_members` WHERE `type` = 0 AND `spawnId` BETWEEN 25989700 AND 25989705;
DELETE FROM `pool_template` WHERE `entry` = 2598970;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES (2598970,1,'Silverpine Forest - Old Fire-Eye, one of 6 spots');
INSERT INTO `pool_members` (`type`,`spawnId`,`poolSpawnId`,`chance`,`description`) VALUES
(0,25989700,2598970,0,'Old Fire-Eye'),
(0,25989701,2598970,0,'Old Fire-Eye'),
(0,25989702,2598970,0,'Old Fire-Eye'),
(0,25989703,2598970,0,'Old Fire-Eye'),
(0,25989704,2598970,0,'Old Fire-Eye'),
(0,25989705,2598970,0,'Old Fire-Eye');
