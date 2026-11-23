-- Counterattack! (4021, the Barrens): accepting the quest from Regthar Deathgate (3389), or his gossip 1882, started nothing.
-- Both went through a wrapper timed list (950000216 quest, 950000301 gossip) that said Regthar's line and then called the event
-- list 950000215. A list called from inside a running list is only run in place when it has no delays, and 950000215 has some
-- (Lanti'gah's gossip and move, Krom'zar 16 s in), so the core refused it:
--   "Entry 950000216 SourceType 9 Event 60 Action 80 is trying to overwrite timed action list from a timed action"
-- Regthar now says his line and starts 950000215 himself, from linked creature events, and the wrappers go.
-- The "no Kolkar alive within 200 yards" conditions on smart events 1 and 3 (SourceGroup 2 and 4) still gate both starts.
-- Safe to run again.

DELETE FROM `smart_scripts` WHERE `entryorguid` = 3389 AND `source_type` = 0 AND `id` IN (1,3,4,5);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3389,0,1,4,'',19,0,100,0,4021,0,0,0,0,'',1,0,0,0,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Quest Counterattack! accepted - Say Line 0 (VMaNGOS quest_start_scripts 4021)'),
(3389,0,4,0,'',61,0,100,0,0,0,0,0,0,'',80,950000215,2,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Quest Counterattack! accepted - Start the event (VMaNGOS quest_start_scripts 4021)'),
(3389,0,3,5,'',61,0,100,0,0,0,0,0,0,'',1,1,0,0,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Gossip 1882/0 - Say Line 1 (VMaNGOS gossip_scripts 1882)'),
(3389,0,5,0,'',61,0,100,0,0,0,0,0,0,'',80,950000215,2,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Gossip 1882/0 - Start the event (VMaNGOS gossip_scripts 1882)');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (950000216,950000301) AND `source_type` = 9;
