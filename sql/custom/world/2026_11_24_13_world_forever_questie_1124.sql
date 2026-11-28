-- Questie's Forever fixes of 23 Nov (QuestieDB 47a4756b), the two our world lacked.
-- Source: QuestieDB Forever corrections (Questie team, GPL-3.0); races checked against the live client's quest record
-- (EG Link, Efficient Games, CC BY 4.0, eg-link-output-wowf 423d6c9, build 71037).
-- Each change only applies while the old value is still there. Safe to run more than once.

-- Compendium of the Fallen (1049): every Horde race but Undead, Skyborne Horde included. Live race mask 0x2000000a2;
-- ours lacked the Skyborne Horde bit.
UPDATE `quest_template` SET `AllowableRaces` = 8589934754 WHERE `ID` = 1049 AND `AllowableRaces` = 162;

-- Parts of the Swarm (1148), started from the Cracked Silithid Carapace: only while The Swarm Grows (1147) is in the log
-- (complete or not) or turned in. Ours had no gate at all. Quest state mask 74 = complete (2) + in progress (8) + rewarded (64).
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,
  `ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`)
SELECT 19,0,1148,0,0,47,0,1147,74,0,0,0,0,'','Parts of the Swarm: The Swarm Grows taken or done'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 1148);
