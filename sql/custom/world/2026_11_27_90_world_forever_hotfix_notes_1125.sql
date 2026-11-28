-- WoW Forever: server side of Blizzard's hotfix notes of 25 November 2026. Safe to run again.
--   Blackblade of Shahram: "will now correctly perform its haste buff, but only to the wielder of the Blackblade." Fist of Shahram
--     (16601, cast by Shahram 10718) targets the caster's master on live (spell effect 693406 in 2026_11_27_20); Shahram has no owner,
--     so classic_spell_fist_of_shahram points it at the player who summoned him.
--   Hunter: "Summoned Hawks are now dismissed when the Dismiss Pet spell is completed." classic_spell_hun_dismiss_pet_hawks on 2641.
-- Both scripts from Everlake (buildthehomelab/wow-trinitycore-everlake 1a1afed3 / acedfc2a, GPL-3.0), with thanks.
DELETE FROM `spell_script_names` WHERE `spell_id` = 16601 AND `ScriptName` = 'classic_spell_fist_of_shahram';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (16601, 'classic_spell_fist_of_shahram');
DELETE FROM `spell_script_names` WHERE `spell_id` = 2641 AND `ScriptName` = 'classic_spell_hun_dismiss_pet_hawks';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (2641, 'classic_spell_hun_dismiss_pet_hawks');
