-- BUGS-ALL row 330 (Discord, Vondragon, 2026-11-23): Elemental Focus never gives Clearcasting, and Siphon the Grave comes up at full mana.
--
-- Elemental Focus (16164, shaman talent): "a 10% chance to enter a Clearcasting state after casting any Fire, Frost, or Nature damage
-- spell". In the 1.60 data the 10% is only the effect's value (EffectBasePoints 10) and the aura's own proc chance is 100, with a very
-- broad proc type mask (helpful spells and abilities too). This row says what the text says: shaman damage spells of the three schools
-- (SchoolMask 28 = Fire 4 + Nature 8 + Frost 16), when they hit. Clearcasting 16246 itself already works (the reporter's .aura test).
-- The 10% is rolled once, from the effect value, by classic_spell_proc_chance_from_effect (2026_11_12_02), so the row's own chance is 100.
-- With 10 here as well (as 2026_10_27_90 set it) the two rolls made it 1%: 0 Clearcastings from 60 Lightning Bolts on dev.
DELETE FROM `spell_proc` WHERE `SpellId` = 16164;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `SpellFamilyMask3`,
`ProcFlags`, `ProcFlags2`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(16164, 28, 11, 0, 0, 0, 0, 0x10000, 0, 0x1, 0x2, 0, 0, 0, 0, 100, 0, 0);

-- Siphon the Grave (1321560, 4-piece bonus of item set 2133): only below 15% mana (classic_spell_item_siphon_the_grave). Safe to run again.
DELETE FROM `spell_script_names` WHERE `spell_id` = 1321560 AND `ScriptName` = 'classic_spell_item_siphon_the_grave';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (1321560, 'classic_spell_item_siphon_the_grave');
