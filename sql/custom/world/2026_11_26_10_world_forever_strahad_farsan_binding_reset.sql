-- The Binding (1795, Horde warlock felhunter quest, Ratchet): Strahad Farsan 6251 starts the summoning when the quest is
-- accepted (action list 950000148): he takes off his quest giver flag, walks out and summons the felhunter. Nothing gave
-- the flag back or sent him home, so after the felhunter died he stood there with no quest giver flag and the quest could
-- not be handed in until he reset (left the area and came back).
-- Now, when his summoned felhunter dies or despawns, he is a quest giver again and walks back to his spot.
DELETE FROM `smart_scripts` WHERE `entryorguid`=6251 AND `source_type`=0 AND `id` IN (1,2,3,4);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6251,0,1,2,82,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Strahad Farsan - On summoned felhunter died - Quest giver again'),
(6251,0,2,0,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-785.912,-3723.26,40.5152,2.05949,'Strahad Farsan - Linked - Walk back to his spot'),
(6251,0,3,4,35,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Strahad Farsan - On summoned felhunter despawned - Quest giver again'),
(6251,0,4,0,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-785.912,-3723.26,40.5152,2.05949,'Strahad Farsan - Linked - Walk back to his spot');
