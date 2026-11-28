-- WoW Forever Incubus: Summon Incubus 713 summons 185317 (client DB2 SpellEffect), the male Sayaad (family 302). Our world data and core
-- only knew the Succubus 1863 (the core's PET_INCUBUS was 184600, a creature no spell summons), so the Incubus had no pet_levelstats
-- (Pet::InitStatsForLevel fell back to the creature's expected health and mana), no Lash of Pain and none of the Succubus's multipliers
-- or stamina-to-health factor. The core now treats 185317 as the Sayaad wherever 1863 is special-cased (TemporarySummon.h, StatSystem.cpp,
-- spell_pet.cpp). Credit: Everlake (buildthehomelab, GPL-3) found it first.
-- Copied from the Succubus as it stands in the world database when this runs:
--  * pet_levelstats: every level of 1863 (2026_10_11_15 holds the vanilla values).
--  * creature_template_spell: Lash of Pain 7814 first (2026_10_11_27 gives it to 1863 only).
--  * creature_template_difficulty (difficulty 0): health, mana, armor and damage modifiers (1863's from 2026_10_05_14).
-- Safe to run again.
DELETE FROM `pet_levelstats` WHERE `creature_entry` = 185317;
INSERT INTO `pet_levelstats` (`creature_entry`,`level`,`hp`,`mana`,`armor`,`str`,`agi`,`sta`,`inte`,`spi`)
SELECT 185317, `level`, `hp`, `mana`, `armor`, `str`, `agi`, `sta`, `inte`, `spi` FROM `pet_levelstats` WHERE `creature_entry` = 1863;

DELETE FROM `creature_template_spell` WHERE `CreatureID` = 185317;
INSERT INTO `creature_template_spell` (`CreatureID`,`Index`,`Spell`,`VerifiedBuild`) VALUES
(185317,0,7814,0);

UPDATE `creature_template_difficulty` i JOIN `creature_template_difficulty` s ON s.`Entry` = 1863 AND s.`DifficultyID` = 0
SET i.`HealthModifier` = s.`HealthModifier`, i.`ManaModifier` = s.`ManaModifier`, i.`ArmorModifier` = s.`ArmorModifier`, i.`DamageModifier` = s.`DamageModifier`
WHERE i.`Entry` = 185317 AND i.`DifficultyID` = 0;
