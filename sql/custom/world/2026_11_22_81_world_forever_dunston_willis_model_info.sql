-- WoW Forever: Dunston Willis (259057, file 2026_11_22_75) did not load: his display 141307 is in the client data but had no
-- creature_model_info row, so the core dropped him ("No model data exist for CreatureDisplayID = 141307").
-- ESTIMATED: bounding radius 0.306 and combat reach 1.5, the human male values Watcher Cornelius's display 141460 has
-- (141307 is a human male warrior too). No live capture has him. VerifiedBuild -1 marks the row as estimated. Safe to run again.
DELETE FROM `creature_model_info` WHERE `DisplayID`=141307;
INSERT INTO `creature_model_info` (`DisplayID`,`BoundingRadius`,`CombatReach`,`DisplayID_Other_Gender`,`VerifiedBuild`) VALUES
(141307,0.306,1.5,0,-1);
