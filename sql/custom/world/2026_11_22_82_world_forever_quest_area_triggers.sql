-- WoW Forever: the area spots three Forever quests count, so they can be finished.
-- 92914 Strange Pylons (Western 39990, Eastern 39991, Temple 39992), 93341 Forlorn Gardens (pedestal 40275), 95770 Locating the
-- Lost City (Vile Reef cavern 42153). Their objectives (type 19, enter area trigger) count server-side AreaTrigger objects by
-- template id; none of these ids is in AreaTrigger.db2 or any live hotfix push, so on live they are spawned AreaTriggers.
-- Spots: Eastern = Shen'dralar Pylon 577960; Western = the pylon 577959 the quest starts from; Temple, pedestal and cavern =
-- where players got the credit (Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
-- (https://creativecommons.org/licenses/by/4.0/); github.com/JIVESCORP/eg-link-output-wowf objectives, build 70938/70959;
-- changed: picked and converted to our tables). Heights from the dev realm's ground at each spot.
-- ESTIMATED: shape (upright cylinder from the given z), radius and height. Safe to run again.

DELETE FROM `areatrigger_template` WHERE `IsCustom`=1 AND `Id` IN (39990,39991,39992,40275,42153);
INSERT INTO `areatrigger_template` (`Id`,`IsCustom`,`Flags`,`ActionSetId`,`ActionSetFlags`,`VerifiedBuild`) VALUES
(39990,1,0,0,0,0),(39991,1,0,0,0,0),(39992,1,0,0,0,0),(40275,1,0,0,0,0),(42153,1,0,0,0,0);

DELETE FROM `areatrigger_create_properties` WHERE `IsCustom`=1 AND `Id` IN (9500300,9500301,9500302,9500303,9500304);
INSERT INTO `areatrigger_create_properties` (`Id`,`IsCustom`,`AreaTriggerId`,`IsAreatriggerCustom`,`Flags`,`MoveCurveId`,`ScaleCurveId`,`MorphCurveId`,`FacingCurveId`,`AnimId`,`AnimKitId`,`DecalPropertiesId`,`SpellForVisuals`,`PositionalSoundKitId`,`TimeToTargetScale`,`Speed`,`SpeedIsTime`,`Shape`,`ShapeData0`,`ShapeData1`,`ShapeData2`,`ShapeData3`,`ShapeData4`,`ShapeData5`,`ShapeData6`,`ShapeData7`,`Roll`,`Pitch`,`Yaw`,`TargetRoll`,`TargetPitch`,`TargetYaw`,`ScriptName`,`VerifiedBuild`) VALUES
(9500300,1,39990,1,0,0,0,0,0,-1,0,0,NULL,0,0,1,0,4,12,12,35,35,0,0,0,0,0,0,0,NULL,NULL,NULL,'',0),
(9500301,1,39991,1,0,0,0,0,0,-1,0,0,NULL,0,0,1,0,4,12,12,12,12,0,0,0,0,0,0,0,NULL,NULL,NULL,'',0),
(9500302,1,39992,1,0,0,0,0,0,-1,0,0,NULL,0,0,1,0,4,15,15,12,12,0,0,0,0,0,0,0,NULL,NULL,NULL,'',0),
(9500303,1,40275,1,0,0,0,0,0,-1,0,0,NULL,0,0,1,0,4,12,12,10,10,0,0,0,0,0,0,0,NULL,NULL,NULL,'',0),
(9500304,1,42153,1,0,0,0,0,0,-1,0,0,NULL,0,0,1,0,4,25,25,35,35,0,0,0,0,0,0,0,NULL,NULL,NULL,'',0);

DELETE FROM `areatrigger` WHERE `SpawnId` IN (78676300,78676301,78676302,78676303,78676304);
INSERT INTO `areatrigger` (`SpawnId`,`AreaTriggerCreatePropertiesId`,`IsCustom`,`MapId`,`SpawnDifficulties`,`PosX`,`PosY`,`PosZ`,`Orientation`,`PhaseUseFlags`,`PhaseId`,`PhaseGroup`,`ScriptName`,`Comment`,`VerifiedBuild`) VALUES
(78676300,9500300,1,1,'0',-2369.9,1129.6,105.0,0,1,0,0,'','Shen''dralas - Western pylon (92914)',0),
(78676301,9500301,1,1,'0',-2217.2,520.3,173.0,0,1,0,0,'','Shen''dralas - Eastern pylon (92914)',0),
(78676302,9500302,1,1,'0',-2950.8,1050.5,140.0,0,1,0,0,'','Shen''dralas - Temple pylon (92914)',0),
(78676303,9500303,1,1,'0',-2990.4,583.7,150.5,0,1,0,0,'','Forlorn Gardens - pedestal (93341)',0),
(78676304,9500304,1,0,'0',-12344.0,802.0,-73.0,0,1,0,0,'','Vile Reef - cavern entrance (95770)',0);
