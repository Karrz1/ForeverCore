-- Summon Hawk (hunter, 1293241 / 1293525 / 1293526 / 1293527): the dive's missile 1312639 only has a dummy effect, so no hawk stayed
-- for the 18 s assault. classic_spell_hun_summon_hawk_missile casts 1293248 (summon Hawk 264850) at the struck enemy, and
-- classic_spell_hun_summon_hawk_assault sends the new hawk at that enemy.
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('classic_spell_hun_summon_hawk_missile', 'classic_spell_hun_summon_hawk_assault');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(1312639, 'classic_spell_hun_summon_hawk_missile'),
(1293248, 'classic_spell_hun_summon_hawk_assault');
