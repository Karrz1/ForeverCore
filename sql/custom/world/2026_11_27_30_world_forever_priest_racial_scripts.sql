-- Classic 1.60 priest racials and Holy Nova: classic_spells_priest.cpp has the scripts, but no row bound them, so they never ran.
--   Touch of Weakness (Undead): the aura's proc names a dummy, so a melee hit on the priest did no Shadow damage back and no attack
--   power cut (player report). The script casts the rank's damage spell at the attacker and is used up by that hit.
--   Shadowguard (Troll): the same, its shadow damage spell at the attacker.
--   Holy Nova: the heal of the same rank (23455, 23458, 23459, 27803-27805) is cast with the damage.
-- Safe to run again.
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('classic_spell_pri_touch_of_weakness', 'classic_spell_pri_shadowguard', 'classic_spell_pri_holy_nova');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(2652, 'classic_spell_pri_touch_of_weakness'),
(19261, 'classic_spell_pri_touch_of_weakness'),
(19262, 'classic_spell_pri_touch_of_weakness'),
(19264, 'classic_spell_pri_touch_of_weakness'),
(19265, 'classic_spell_pri_touch_of_weakness'),
(19266, 'classic_spell_pri_touch_of_weakness'),
(18137, 'classic_spell_pri_shadowguard'),
(19308, 'classic_spell_pri_shadowguard'),
(19309, 'classic_spell_pri_shadowguard'),
(19310, 'classic_spell_pri_shadowguard'),
(19311, 'classic_spell_pri_shadowguard'),
(19312, 'classic_spell_pri_shadowguard'),
(15237, 'classic_spell_pri_holy_nova'),
(15430, 'classic_spell_pri_holy_nova'),
(15431, 'classic_spell_pri_holy_nova'),
(27799, 'classic_spell_pri_holy_nova'),
(27800, 'classic_spell_pri_holy_nova'),
(27801, 'classic_spell_pri_holy_nova');
