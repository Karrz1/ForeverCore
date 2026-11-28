-- The Alcaz Prison note was made as gameobject entry 29940001. An object guid only carries 23 bits of entry (up to
-- 8388607), so the client got the guid of entry 4774177, which does not exist, and never showed the note. Move the
-- note to entry 8380300 (the forever 8380xxx object range) with the same template, script, spawn and quest links.
DELETE FROM `gameobject_template` WHERE `entry` IN (29940001,8380300);
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(8380300,2,82080,'Note','','','',1,0,0,0,0,'SmartGameObjectAI','',NULL,0);
DELETE FROM `gameobject_template_addon` WHERE `entry` IN (29940001,8380300);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29940001,8380300) AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(8380300,1,0,0,64,0,100,0,1,33,264861,7,'Note (Alcaz Prison) - On use - Give Read the note credit');

UPDATE `gameobject` SET `id`=8380300 WHERE `guid`=48161020;

DELETE FROM `gameobject_questender` WHERE `id` IN (29940001,8380300);
INSERT INTO `gameobject_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (8380300,95262,0),(8380300,95454,0);
DELETE FROM `gameobject_queststarter` WHERE `id` IN (29940001,8380300);
INSERT INTO `gameobject_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (8380300,95263,0),(8380300,96369,0);
