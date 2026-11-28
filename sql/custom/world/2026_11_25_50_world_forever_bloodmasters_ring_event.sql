-- Bloodmaster's Ring (bmr-1124 follow-up): the six fights never turned ready. The client's quest records carry
-- QUEST_FLAGS_COMPLETION_EVENT (0x2) and no objectives: on retail the fight's end is the event. bmr-1124 gave each fight a kill
-- objective for its contender but nothing raised the event, so the quest showed "Buzzbeak defeated 1/1" and stayed incomplete.
-- The contender's death now raises it (SMART_ACTION_COMPLETE_QUEST, which only touches players who hold the quest) for every
-- player within 40 y, so a party fighting together all get it. The kill objective stays for the tracker.
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (257056,258491,255892,258626,258595) AND `AIName`='' AND `ScriptName`='';
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (257056,258491,255892,258626,258595) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=257059 AND `source_type`=0 AND `id`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`target_type`,`target_param1`,`target_param2`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(257056,0,0,0,6,0,100,0,0,0,0,152,94670,0,0,0,0,17,0,40,0,0,0,0,'Buzzbeak - On death - Complete Bloodmaster''s Ring 94670 for players within 40 y'),
(258491,0,0,0,6,0,100,0,0,0,0,152,94739,0,0,0,0,17,0,40,0,0,0,0,'Kronk - On death - Complete Bloodmaster''s Ring 94739 for players within 40 y'),
(255892,0,0,0,6,0,100,0,0,0,0,152,94962,0,0,0,0,17,0,40,0,0,0,0,'Bonegnaw - On death - Complete Bloodmaster''s Ring 94962 for players within 40 y'),
(258626,0,0,0,6,0,100,0,0,0,0,152,94964,0,0,0,0,17,0,40,0,0,0,0,'Mog''thar - On death - Complete Bloodmaster''s Ring 94964 for players within 40 y'),
(258595,0,0,0,6,0,100,0,0,0,0,152,94965,0,0,0,0,17,0,40,0,0,0,0,'Snufflesnout - On death - Complete Bloodmaster''s Ring 94965 for players within 40 y'),
(257059,0,1,0,6,0,100,0,0,0,0,152,95063,0,0,0,0,17,0,40,0,0,0,0,'Chub''chob - On death - Complete Bloodmaster''s Ring 95063 for players within 40 y');
