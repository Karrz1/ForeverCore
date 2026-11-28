-- WoW Forever hotfix of 16 Nov 2026: Vampiric Embrace's heal 15290 heals the party for 15286's effect 0 share of the Shadow damage and
-- the priest for that share raised by 15286's effect 1 (live: party 10%, the priest's own heal +100%; the records are in
-- 2026_11_24_52_hotfixes). classic_spell_pri_vampiric_embrace_heal raises the priest's heal. Safe to run again.
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'classic_spell_pri_vampiric_embrace_heal';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(15290, 'classic_spell_pri_vampiric_embrace_heal');
