-- Blackrock Depths, Tomb of the Seven: the six brothers' "reached home" (evade) SmartAI rows
-- ported from VMaNGOS EventAI 903401/903508/903601/903705/903803/904008 set instance data 4 = FAIL.
-- On the Classic BRD script (VMaNGOS numbering) 4 is TYPE_LYCEUM, not TYPE_TOMB_OF_SEVEN (3).
-- After the Lyceum torches were lit (TYPE_LYCEUM DONE, golem room doors open), a brother that evades
-- turned the Lyceum back to FAIL: the golem doors stay shut on the next door load and a torch relight
-- no longer completes it. A brother that evades should fail the Tomb of the Seven event instead,
-- which the Doomrel script (classic_boss_tomb_of_seven.cpp) then resets.
UPDATE smart_scripts SET action_param1 = 3
WHERE source_type = 0 AND entryorguid IN (9034, 9035, 9036, 9037, 9038, 9040)
  AND event_type = 21 AND action_type = 34 AND action_param1 = 4 AND action_param2 = 2;
