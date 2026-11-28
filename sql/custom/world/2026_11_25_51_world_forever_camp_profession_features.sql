-- Camping: the Sharpening Wheel and the profession camp features (Anvil, Alchemy Laboratory, Arcane Forge, Anarchist's Workbench,
-- Rock Garden, Tanning Rack, Sewing Machine, Spinning Wheel, Trapper's Workbench, Toxin Study) did not count against the campfire's
-- limit, and one placed over its basic feature ("May be placed over a ... to replace it") left the old one standing
-- (Discord, Sagiroth 2026-11-25). classic_go_scripts.cpp CampPlacements lists them now; this binds the spells to the script.
-- Safe to run again.
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'classic_spell_camp_feature_placement'
    AND `spell_id` IN (1307392,1307174,1307175,1307172,1307176,1307386,1307395,1307391,1307393,1307397,1307396);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(1307392,'classic_spell_camp_feature_placement'),(1307174,'classic_spell_camp_feature_placement'),
(1307175,'classic_spell_camp_feature_placement'),(1307172,'classic_spell_camp_feature_placement'),
(1307176,'classic_spell_camp_feature_placement'),(1307386,'classic_spell_camp_feature_placement'),
(1307395,'classic_spell_camp_feature_placement'),(1307391,'classic_spell_camp_feature_placement'),
(1307393,'classic_spell_camp_feature_placement'),(1307397,'classic_spell_camp_feature_placement'),
(1307396,'classic_spell_camp_feature_placement');
