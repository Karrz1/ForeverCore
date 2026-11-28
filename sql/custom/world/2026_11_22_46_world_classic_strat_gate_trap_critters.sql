-- Stratholme gate trap: the Plagued Rats (10441) and Plagued Maggots (10536) it summons can be targeted and fight.
-- The trap (classic_instance_stratholme DoGateTrap, VMaNGOS) closes two portcullises and summons 30 Plagued Rats, Maggots or
-- Insects that swarm the players. Both templates carried retail ambient-critter flags: unit_flags 0x02000200
-- (UNIT_FLAG_UNINTERACTIBLE | UNIT_FLAG_IMMUNE_TO_NPC) and unit_flags3 0x1, so players could not click them and they never
-- fought (DoctorSun, 22 Nov). Plagued Insect 10461, the third critter of the same trap, has 0 for both and works; the rat and
-- the maggot now match it. Neither has a static spawn: the trap is their only source.
-- Safe to run again.

UPDATE `creature_template` SET `unit_flags` = 0, `unit_flags3` = 0 WHERE `entry` IN (10441, 10536);
