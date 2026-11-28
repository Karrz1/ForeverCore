-- The Binding (1795), follow-up to 2026_11_26_10: Strahad Farsan does not summon the felhunter himself (the player's Tome of the
-- Cabal does, at his summoning circle), so his "summoned unit died / despawned" events never fired. The Summoned Felhunter 6268
-- already tells him on death: Set Data 0 = 3 on Strahad Farsan. He now listens to that: quest giver again and back to his spot.
-- If the summoning never ends in a kill, his start action list gives the flag back and sends him home 3 minutes after the summon.
DELETE FROM `smart_scripts` WHERE `entryorguid`=6251 AND `source_type`=0 AND `id` IN (1,2,3,4);
DELETE FROM `smart_scripts` WHERE `entryorguid`=950000148 AND `source_type`=9 AND `id` IN (6,7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6251,0,1,2,38,0,100,0,0,3,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Strahad Farsan - On data 0 = 3 (felhunter slain) - Quest giver again'),
(6251,0,2,0,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-785.912,-3723.26,40.5152,2.05949,'Strahad Farsan - Linked - Walk back to his spot'),
(950000148,9,6,0,0,0,100,0,180000,180000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Strahad Farsan - 3 min after the summon - Quest giver again'),
(950000148,9,7,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-785.912,-3723.26,40.5152,2.05949,'Strahad Farsan - Walk back to his spot');
