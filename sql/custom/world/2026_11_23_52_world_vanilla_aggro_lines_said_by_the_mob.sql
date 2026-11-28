-- The aggro lines of the VMaNGOS EventAI port (2026_09_28_15: event 4 aggro -> action 1 talk, 272 rows) had the victim as their
-- target. On aggro a creature often has no victim yet (pulled by a player's attack, it enters combat before it picks its target),
-- and a talk with no target found has no speaker, so the line was never said (Discord, lin "bugs 6+4" Silverpine 3, 2026-11-23:
-- the Rot Hide gnolls at the Dead Fields never say "Grrrr... fresh meat!"). The creature says its own line now (target self); the
-- one it aggroed on is still the line's $n (the event's invoker). Safe to run again.
UPDATE `smart_scripts` SET `target_type` = 1
WHERE `source_type` = 0 AND `event_type` = 4 AND `action_type` = 1 AND `target_type` = 2 AND `comment` LIKE 'VMaNGOS EventAI %';
