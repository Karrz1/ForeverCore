-- Alcaz Prison (map 2994): the note by Blazeroar is the real object, Perfumed Note 630604, instead of our hand-made
-- stand-in note (29940001 in 2026_11_24_90, moved to 8380300 in 2026_11_24_98). The id and its values come from Everlake (buildthehomelab/wow-trinitycore-everlake
-- ab487577, GPL-3.0, with credit): type 2 (quest giver), display 190, Data1 29555, Data3 42504, from the client's object data
-- (EG Link 1.60.1.71037 object_details, CC BY 4.0) and Icy Veins. It keeps our spawn (guid 48161020) and our use credit
-- (Read the note, 264861, SmartAI as before). The Secret Prison 95262 and The Honor of the Kor'kron 95454 end at it, Somber
-- News 95263 and Bad News for Folkar 96369 start at it, as before. Safe to run again.
DELETE FROM `gameobject_template` WHERE `entry`=630604;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`Data2`,`Data3`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(630604,2,190,'Perfumed Note','','','',1,0,29555,0,42504,0,0,'SmartGameObjectAI','',NULL,71037);
DELETE FROM `gameobject_template_addon` WHERE `entry`=630604;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29940001,8380300,630604) AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(630604,1,0,0,64,0,100,0,1,33,264861,7,'Perfumed Note (Alcaz Prison) - On use - Give Read the note credit');

DELETE FROM `gameobject_questender` WHERE `id` IN (29940001,8380300,630604) AND `quest` IN (95262,95454);
INSERT INTO `gameobject_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (630604,95262,0),(630604,95454,0);
DELETE FROM `gameobject_queststarter` WHERE `id` IN (29940001,8380300,630604) AND `quest` IN (95263,96369);
INSERT INTO `gameobject_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (630604,95263,0),(630604,96369,0);

UPDATE `gameobject` SET `id`=630604 WHERE `guid`=48161020 AND `id` IN (29940001,8380300,630604);
DELETE FROM `gameobject_template` WHERE `entry` IN (29940001,8380300);
