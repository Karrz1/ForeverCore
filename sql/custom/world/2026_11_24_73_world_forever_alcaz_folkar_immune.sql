-- Alcaz Prison: Commander Folkar (260386), the chained Kor'kron in the south cell, gives the Horde quest 95483 and is not a
-- fight. His first spawn (2026_11_14_41) carried unit_flags 768 (immune to players and to creatures); the hand-made layout
-- (2026_11_22_77) placed him again without them, so groups could attack and kill him (dev, 2026-11-24: an Alliance group
-- killed him; he has no loot). Give the layout's spawn the flags back. Safe to run again.
UPDATE `creature` SET `unit_flags`=768 WHERE `guid`=48120005 AND `id`=260386;
