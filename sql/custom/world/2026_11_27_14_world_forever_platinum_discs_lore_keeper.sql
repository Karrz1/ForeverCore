-- Uldaman, The Platinum Discs 2278 (Discord, Gefest666): accepting the quest at The Discs of Norgannon 131474 must bring out
-- the Lore Keeper of Norgannon 7172. He has no spawn (summoned only) and nothing summoned him, so the quest could not be done.
-- Spot as in the open classic quest data (AzerothCore world, GPL-2): 148.65, 310.073, -52.19, facing 5.124.
-- His gossip and quest credit (SmartAI 7172) are already in place.
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=131474;
DELETE FROM `smart_scripts` WHERE `entryorguid`=131474 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,
`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,
`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,
`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(131474,1,0,0,'',19,0,100,0, 2278,0,0,0,0,'', 12,7172,3,300000,0,0,0,0,'', 8,0,0,0,0,'',148.65,310.073,-52.19,5.124,
 'The Discs of Norgannon - On Quest Accept The Platinum Discs - Summon Lore Keeper of Norgannon (5 min)');
