-- Counterattack! (4021, The Barrens): taking the quest from Regthar Deathgate (3389) started nothing.
-- The quest accept ran the timed list 950000216 (say "Beware, $n! Look to the west!", then start the event list 950000215), and the
-- gossip option of menu 1882 ran 950000301 the same way. A timed list can not start another timed list (SmartAI refuses it:
-- "trying to overwrite timed action list from a timed action, this is not allowed"), so the warning came and the attack never did.
-- Now Regthar's own events say the line and start 950000215 through a linked event, and the two wrapper lists go.
-- Also: Warlord Krom'zar came twice, 16 s in (2026_11_14_60, live sniff 70862) and again after 20 Kolkar kills
-- (2026_11_12_32, VMaNGOS). Live shows him with the waves, so the 20-kill summon goes (Regthar 3389 id 13 and list 950001417).
-- 2026_11_14_60 had put him in the place of a Kolkar Invader (950000215 id 36); that Invader comes back and Krom'zar is id 40.
-- Safe to run again.

DELETE FROM `smart_scripts` WHERE `entryorguid` = 3389 AND `source_type` = 0 AND `id` IN (1,3,4,5,13);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3389,0,1,4,'',19,0,100,0,4021,0,0,0,0,'',1,0,0,0,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Quest Counterattack! taken - Say Line 0 (VMaNGOS quest_start_scripts 4021)'),
(3389,0,4,0,'',61,0,100,0,0,0,0,0,0,'',80,950000215,2,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Quest Counterattack! taken - Start the event'),
(3389,0,3,5,'',61,0,100,0,0,0,0,0,0,'',1,1,0,0,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Gossip 1882/0 - Say Line 1 (VMaNGOS gossip_scripts 1882)'),
(3389,0,5,0,'',61,0,100,0,0,0,0,0,0,'',80,950000215,2,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'Regthar Deathgate - Gossip 1882/0 - Start the event');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (950000216,950000301,950001417) AND `source_type` = 9;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 950000215 AND `source_type` = 9 AND `id` IN (36,40);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(950000215,9,36,0,'',0,0,100,0,0,0,0,0,0,'',12,9524,8,60000,0,0,0,0,'',8,0,0,0,0,'',-312.151,-1858.05,94.254,3.50811,'Counterattack - Summon Kolkar Invader (VMaNGOS generic_scripts 402110, manual despawn)'),
(950000215,9,40,0,'',0,0,100,0,16000,16000,0,0,0,'',12,9456,4,120000,0,0,0,0,'',8,0,0,0,0,'',-289.13,-1858.67,92.47,1.57,'Counterattack! - summon Warlord Krom''zar (live 70862)');
