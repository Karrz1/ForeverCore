-- Hillsbrad Foothills: the Shadowy Assassins 2434 belong to the Southshore Crier's event only. The crier runs into Southshore,
-- calls out the attack and summons them (smart script 243500); they are not standing spawns. The AnoCore spawn restore of
-- 11-02 (file 2026_11_02_29) took six of them from sniffs taken during that event and made them permanent, 300 s respawn,
-- in the middle of Southshore, so they kept coming back. Player report on Discord (Voldemar, bugs 10).
-- The event itself is unchanged. Safe to run again.
DELETE FROM `creature` WHERE `guid` BETWEEN 91524001 AND 91524006 AND `id`=2434;
