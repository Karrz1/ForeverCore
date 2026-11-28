-- Krol'dok Stronghold: "Krol'dok No More!" (94969, Alliance), escort Marcus Tilwell (259253) out of the stronghold.
-- Quest record from EG Link (Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0), client build 71037.
-- Marcus's display (139863) and creature type are from Wowhead. No sniff of the dungeon exists: his spot beside Slavecrusher
-- Grox, the walk to the entrance, his lines and the turn-in text are OURS (INFERRED). The Horde copy 95056 is not in the
-- live game yet (no title), so it is not added.
-- Script classic_npc_kds_marcus_tilwell: he can be spoken to once Grox is dead, walks the cleared way back to the entrance,
-- completes the quest for the group there and waits a few minutes for the turn-in.

DELETE FROM `creature_template` WHERE `entry`=259253;
INSERT INTO `creature_template` (`entry`,`KillCredit1`,`KillCredit2`,`name`,`femaleName`,`subname`,`TitleAlt`,`IconName`,`RequiredExpansion`,`VignetteID`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`Classification`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`unit_flags3`,`family`,`trainer_class`,`type`,`VehicleId`,`AIName`,`MovementType`,`ExperienceModifier`,`RacialLeader`,`movementId`,`WidgetSetID`,`WidgetSetUnitConditionID`,`RegenHealth`,`CreatureImmunitiesId`,`flags_extra`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(259253,0,0,'Marcus Tilwell',NULL,NULL,NULL,NULL,0,0,35,2,1,1.14286,1,0,0,2000,2000,1,1,1,0,2048,0,0,0,7,0,'',0,1,0,0,0,0,1,0,0,'classic_npc_kds_marcus_tilwell',NULL,0);
DELETE FROM `creature_template_difficulty` WHERE `Entry`=259253;
INSERT INTO `creature_template_difficulty` (`Entry`,`DifficultyID`,`HealthModifier`,`ManaModifier`,`ArmorModifier`,`DamageModifier`,`CreatureDifficultyID`,`TypeFlags`,`VerifiedBuild`) VALUES
(259253,0,1,1,1,1,0,0,0);
DELETE FROM `creature_template_model` WHERE `CreatureID`=259253;
INSERT INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(259253,0,139863,1,1,0);
DELETE FROM `creature_classic_level` WHERE `entry`=259253;
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES (259253,42,42);

-- beside Slavecrusher Grox, facing him (a point of the navmesh-checked bot route 0046)
DELETE FROM `creature` WHERE `guid`=48159000;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curHealthPct`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(48159000,259253,3039,0,0,'1,201',0,0,0,-1,0,0,-7501.40,-3857.13,126.12,5.34,300,0,0,100,0,NULL,NULL,NULL,NULL,'',NULL,0);

-- his lines (OURS)
DELETE FROM `creature_text` WHERE `CreatureID`=259253;
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(259253,0,0,'Right behind you, $n. Let''s get out of this pit before more of them turn up.',12,7,100,0,0,0,0,0,0,'Marcus Tilwell - escort start (ours)'),
(259253,1,0,'Watch out, they''re on us!',12,7,100,0,0,0,0,0,0,'Marcus Tilwell - attacked on the way (ours)'),
(259253,2,0,'Fresh air at last! I owe you one, $n. Speak to me before I slip away.',12,7,100,0,0,0,0,0,0,'Marcus Tilwell - safe at the entrance (ours)');

-- 94969 Krol'dok No More! (level 42, min 40, live build 71037); escort, script classic_npc_kds_marcus_tilwell
DELETE FROM `quest_template` WHERE `ID`=94969;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardChoiceItemID1`,`RewardChoiceItemQuantity1`,`RewardChoiceItemID2`,`RewardChoiceItemQuantity2`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94969,2,16842,81,0,5,1.0,0,1.0,0,0,3145730,0,0,0,6130900294268439629,279851,1,279929,1,'Krol''dok No More!','Escort Marcus Tilwell to safety.','Don''t ask. You wouldn''t believe me if I told you.
Let''s just focus on getting me out of here! Oh, and you as well, of course.','Escort Marcus Tilwell to safety','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94969;
DELETE FROM `quest_template_addon` WHERE `ID`=94969;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) VALUES (94969,0,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94969;
DELETE FROM `quest_classic_level` WHERE `ID`=94969;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94969,42,40,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94969;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94969,2,42);
DELETE FROM `quest_offer_reward` WHERE `ID`=94969;
DELETE FROM `quest_request_items` WHERE `ID`=94969;
DELETE FROM `creature_queststarter` WHERE `quest`=94969;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94969;
DELETE FROM `creature_questender` WHERE `quest`=94969;
DELETE FROM `gameobject_questender` WHERE `quest`=94969;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (259253,94969,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (259253,94969,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (259253);
-- the quest is done by his script for the group (escort event); the turn-in text is OURS
UPDATE `quest_template_addon` SET `SpecialFlags`=`SpecialFlags`|2 WHERE `ID`=94969;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES
(94969,0,0,0,0,0,0,0,0,'I really thought that was the end of me. Take this, it''s the least I can do. And if anyone asks, you never saw me down there.',0);
