-- Stratholme, Nerub'enkan: his Crypt Scarabs (10577) never died, so they piled up (BUGS-ALL 277: 6 at 15 s, 12 at 30 s, 17 at 45 s, all at full health).
-- On summon the scarab casts Confuse (16420) on itself and then Suicide Passive (16423), whose hit procs 16424 and the spellhit row kills it.
-- The second cast was refused: the scarab is confused by then, and a confused caster cannot cast (no Spell::prepare for 16423 in Server.log,
-- one for every 16420). Cast as triggered, like the passive aura it is.
UPDATE `smart_scripts` SET `action_param2`=2
WHERE `entryorguid`=10577 AND `source_type`=0 AND `id`=1 AND `event_type`=54 AND `action_type`=11 AND `action_param1`=16423;
