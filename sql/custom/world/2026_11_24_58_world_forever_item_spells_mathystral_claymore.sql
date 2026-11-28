-- WoW Forever: item spells whose dummy effect nothing ran (C++ in classic_spell_scripts.cpp; Libram of Light 28851 and Idol of Synthesis
-- 1291075 are read by the Flash of Light and Swiftmend scripts and need no row). Credit: Everlake (buildthehomelab, GPL-3) found them first.
--   1306410 Restore Mathystral Amulet: 20 Mathystral Amulet Fragments make the amulet 279277.
--   1309550 Claymore of Two Moons: Waxing Moon 1319378 or Waning Moon 1319382 on a proc, 1.35 a minute on landed melee hits
--           (wowsims/forever, MIT, docs/evidence EV-0163; the client row would proc on every hit).
-- Safe to run again.
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('classic_spell_item_restore_mathystral_amulet', 'classic_spell_item_claymore_of_two_moons');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(1306410, 'classic_spell_item_restore_mathystral_amulet'),
(1309550, 'classic_spell_item_claymore_of_two_moons');

DELETE FROM `spell_proc` WHERE `SpellId` = 1309550;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `SpellFamilyMask3`,
`ProcFlags`, `ProcFlags2`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(1309550, 0, 0, 0, 0, 0, 0, 0x14, 0, 0x1, 0x2, 0, 0, 0, 1.35, 0, 0, 0); -- landed melee swings and abilities, 1.35 a minute
