-- Classic 1.60: talents whose proc chance was rolled twice, so they procced at the chance squared (10% became 1%, 15% became 2.25%).
-- 2026_11_12_02 bound classic_spell_proc_chance_from_effect (roll the effect value) to talents that already roll that same value in
-- their own script, or whose proc row already carries the chance. Every check of a proc must pass, so both rolls had to succeed.
-- Found with Elemental Focus (BUGS-ALL row 330: 0 Clearcastings from 60 Lightning Bolts on dev; that one is fixed in 2026_11_23_40).
--   own script rolls the effect value, so the extra binding goes:
--     11071 Frostbite                  classic_spell_mage_frostbite (2026_10_24_00)
--     16850 Improved Starfire          classic_spell_dru_improved_starfire (2026_10_21_43)
--     13976 Initiative                 classic_spell_rog_initiative (2026_10_21_41)
--     13754 Improved Kick              classic_spell_rog_improved_kick (2026_10_21_41)
--     12289 Improved Hamstring         classic_spell_talent_ability_proc_chance (2026_11_12_17)
--     12311 Improved Shield Bash       classic_spell_talent_ability_proc_chance (2026_11_12_17)
--     19228 Improved Wing Clip         classic_spell_talent_ability_proc_chance (2026_11_12_17)
--     19407 Improved Concussive Shot   classic_spell_talent_ability_proc_chance (2026_11_12_17)
--   proc row chance 10 and the script's roll of the effect value (10):
--     11103 Impact                     the row keeps Fire spell damage hits, its chance goes to 100 so the script's roll is the only one
-- Safe to run again.
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'classic_spell_proc_chance_from_effect'
AND `spell_id` IN (11071, 16850, 13976, 13754, 12289, 12311, 19228, 19407);

UPDATE `spell_proc` SET `Chance` = 100 WHERE `SpellId` = 11103;
