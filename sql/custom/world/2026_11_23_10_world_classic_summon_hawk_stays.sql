-- Summon Hawk (hunter): the 18 s Hawk 264850 left the fight after its first hit (RU Discord, Gire, 11-22). It gets classic_npc_hunter_hawk,
-- which keeps it on the struck enemy, then on the hunter's target, for the whole summon. Safe to run again.
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'classic_npc_hunter_hawk' WHERE `entry` = 264850;
