-- Arcane Concentration (11213), WoW Forever hotfix of 9 Nov 2026: "activation chance now correctly splits across the cast and every bolt".
-- Arcane Missiles never gave Clearcasting here: its missiles are triggered spells, which the row turned away, and the channel start deals
-- no damage. classic_spell_mage_arcane_concentration now rolls each missile at a share of the chance (1 / (missiles + 1), a sixth on a
-- five missile channel) and classic_spell_mage_arcane_missiles_concentration rolls the channel start's share (wowsims/forever, MIT,
-- docs/evidence EV-0098). Credit: Everlake (buildthehomelab, GPL-3) ported the hotfix first.
-- The row: harmful spell damage hits as before, plus PROC_ATTR_TRIGGERED_CAN_PROC (0x2) so the missiles reach the script, which turns away
-- every other triggered spell. Cooldown 0 keeps the client's 1 s. Safe to run again.
DELETE FROM `spell_proc` WHERE `SpellId` = 11213;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `SpellFamilyMask3`,
`ProcFlags`, `ProcFlags2`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(11213, 0, 0, 0, 0, 0, 0, 0x10000, 0, 1, 2, 0, 0x2, 0, 0, 100, 0, 0); -- harmful spell damage hits, the triggered missiles included

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'classic_spell_mage_arcane_missiles_concentration';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(5143, 'classic_spell_mage_arcane_missiles_concentration'),
(5144, 'classic_spell_mage_arcane_missiles_concentration'),
(5145, 'classic_spell_mage_arcane_missiles_concentration'),
(8416, 'classic_spell_mage_arcane_missiles_concentration'),
(8417, 'classic_spell_mage_arcane_missiles_concentration'),
(10211, 'classic_spell_mage_arcane_missiles_concentration'),
(10212, 'classic_spell_mage_arcane_missiles_concentration'),
(25345, 'classic_spell_mage_arcane_missiles_concentration');
