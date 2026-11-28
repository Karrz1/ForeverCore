-- WoW Forever: Zephras Isle has one Malfunctioning Cyclone Construct (250929), not two.
-- 2026_10_01_03 (sniff 70124) spawned two, 18 yards apart (guids 21100151 and 21100152). The construct is a quest giver
-- (92698) that rests between its lines "THREAT DETECTED" / "RESUMING REST MODE"; a player (Guard3259, 22 Nov) saw both
-- standing side by side. Which of the two the sniff caught as a second copy is not recorded: we keep the first one
-- (21100151) and remove 21100152 (INFERRED).
-- Safe to run again.

DELETE FROM `creature_addon` WHERE `guid` = 21100152;
DELETE FROM `creature` WHERE `guid` = 21100152 AND `id` = 250929;
