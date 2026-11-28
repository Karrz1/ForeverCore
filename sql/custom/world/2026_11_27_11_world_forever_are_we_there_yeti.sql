-- Are We There, Yeti? (5163): using Umi's Mechanical Yeti 12928 (spell 17166, dummy on the nearest Legacki 10978, Sprinkle 7583
-- or Quixxil 10977, plus the yeti summon 10980) did nothing. The vanilla SmartAI import replaced these three NPCs' scripts with their
-- waypoint scripts (ids 0-3), so nothing handled the spell hit any more: no scare credit, no lines, and the yeti never got the data
-- 0 = 1/2/3 its own script waits for to follow its victim. Ids 10-13 put that back next to the waypoint scripts.
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (10978,7583,10977) AND `source_type`=0 AND `id` IN (10,11,12,13);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(10978,0,10,11,8,0,100,0,17166,0,30000,30000,0,33,10978,0,0,0,0,0,7,0,0,0,0,0,0,0,'Legacki - On spellhit Release Umi\'s Yeti - Quest credit'),
(10978,0,11,12,61,0,100,0,0,0,0,0,0,45,0,1,0,0,0,0,19,10980,20,0,0,0,0,0,'Legacki - Linked - Set data 0 = 1 on Umi\'s Mechanical Yeti (it follows Legacki)'),
(10978,0,12,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Legacki - Linked - Say line 0'),
(10978,0,13,0,52,0,100,0,0,10978,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Legacki - On text 0 over - Say line 1'),
(7583,0,10,11,8,0,100,0,17166,0,30000,30000,0,33,7583,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sprinkle - On spellhit Release Umi\'s Yeti - Quest credit'),
(7583,0,11,12,61,0,100,0,0,0,0,0,0,45,0,2,0,0,0,0,19,10980,20,0,0,0,0,0,'Sprinkle - Linked - Set data 0 = 2 on Umi\'s Mechanical Yeti (it follows Sprinkle)'),
(7583,0,12,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sprinkle - Linked - Say line 0'),
(7583,0,13,0,52,0,100,0,0,7583,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sprinkle - On text 0 over - Say line 1'),
(10977,0,10,11,8,0,100,0,17166,0,30000,30000,0,33,10977,0,0,0,0,0,7,0,0,0,0,0,0,0,'Quixxil - On spellhit Release Umi\'s Yeti - Quest credit'),
(10977,0,11,12,61,0,100,0,0,0,0,0,0,45,0,3,0,0,0,0,19,10980,20,0,0,0,0,0,'Quixxil - Linked - Set data 0 = 3 on Umi\'s Mechanical Yeti (it follows Quixxil)'),
(10977,0,12,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Quixxil - Linked - Say line 0'),
(10977,0,13,0,52,0,100,0,0,10977,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Quixxil - On text 0 over - Say line 1');
