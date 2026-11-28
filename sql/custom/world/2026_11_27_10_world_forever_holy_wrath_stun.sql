-- Holy Wrath stuns the Undead and Demon targets it hits (429147), as its tooltip says
DELETE FROM `spell_script_names` WHERE `spell_id` IN (2812,10318,429145,429146) AND `ScriptName`='classic_spell_pal_holy_wrath_stun';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(2812,'classic_spell_pal_holy_wrath_stun'),
(10318,'classic_spell_pal_holy_wrath_stun'),
(429145,'classic_spell_pal_holy_wrath_stun'),
(429146,'classic_spell_pal_holy_wrath_stun');
