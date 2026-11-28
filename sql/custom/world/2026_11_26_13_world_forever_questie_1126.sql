-- Questie's Forever fixes up to 25 Nov (QuestieDB 498734b1) that our world lacked.
-- Source: QuestieDB Forever corrections and traces (Questie team, GPL-3.0). Race masks are the live client's quest records
-- (EG Link, Efficient Games, CC BY 4.0, eg-link-output-wowf f25e0ef, builds 70938-71091).
-- Each change only applies while the quests are in our world and the field still has its old value. Safe to run more than once.

-- 1. Theldurin the Lost (687) follows Myzrael's Allies: 653 (Alliance) or 688 (Horde) turned in. Ours had no gate at all.
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,
  `ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`)
SELECT 19,0,687,0,v.eg,8,0,v.q,0,0,0,0,0,'',CONCAT('Theldurin the Lost: Myzrael''s Allies ',v.q,' done')
FROM (SELECT 0 AS eg, 653 AS q UNION ALL SELECT 1, 688) v
WHERE NOT EXISTS (SELECT 1 FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 687)
  AND EXISTS (SELECT 1 FROM `quest_template_addon` WHERE `ID` = 687 AND `PrevQuestID` = 0)
  AND (SELECT COUNT(*) FROM `quest_template` WHERE `ID` IN (653,688)) = 2;

-- 2. Bartleby the Drunk (1639) follows A Warrior's Training (1638); 1638 is not an optional lead-in.
UPDATE `quest_template_addon` SET `PrevQuestID` = 1638 WHERE `ID` = 1639 AND `PrevQuestID` = 0;
UPDATE `quest_template_addon` SET `BreadcrumbForQuestId` = 0 WHERE `ID` = 1638 AND `BreadcrumbForQuestId` = 1639;

-- 3. Previous quests: To Serve The Draenei (93572) after To Serve Kum'isha (93685); Violence Into Verdure (93747) after
--    Seeds for a New Season (95568).
INSERT INTO `quest_template_addon` (`ID`) SELECT t.`ID` FROM `quest_template` t
WHERE t.`ID` IN (93572,93747,1203,81570,86611,86612,89001,91488,92345,92346,96376,96377,96379)
  AND NOT EXISTS (SELECT 1 FROM `quest_template_addon` a WHERE a.`ID` = t.`ID`);
UPDATE `quest_template_addon` SET `PrevQuestID` = 93685 WHERE `ID` = 93572 AND `PrevQuestID` = 0
  AND EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 93685);
UPDATE `quest_template_addon` SET `PrevQuestID` = 95568 WHERE `ID` = 93747 AND `PrevQuestID` = 0
  AND EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 95568);

-- 4. Only one of each set (ExclusiveGroup): Jarl Needs a Blade 1203/81570, Stag Lord's Bauble 86611/86612, Home on the Range
--    89001/91488, Beneath Nordrassil 92345/92346, State Secrets 96376/96377/96379. Set only when every quest of the set is here.
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 1203 WHERE `ID` IN (1203,81570) AND `ExclusiveGroup` = 0
  AND (SELECT COUNT(*) FROM `quest_template` WHERE `ID` IN (1203,81570)) = 2;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 86611 WHERE `ID` IN (86611,86612) AND `ExclusiveGroup` = 0
  AND (SELECT COUNT(*) FROM `quest_template` WHERE `ID` IN (86611,86612)) = 2;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 89001 WHERE `ID` IN (89001,91488) AND `ExclusiveGroup` = 0
  AND (SELECT COUNT(*) FROM `quest_template` WHERE `ID` IN (89001,91488)) = 2;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 92345 WHERE `ID` IN (92345,92346) AND `ExclusiveGroup` = 0
  AND (SELECT COUNT(*) FROM `quest_template` WHERE `ID` IN (92345,92346)) = 2;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 96376 WHERE `ID` IN (96376,96377,96379) AND `ExclusiveGroup` = 0
  AND (SELECT COUNT(*) FROM `quest_template` WHERE `ID` IN (96376,96377,96379)) = 3;

-- 5. Races as the live records have them. Economic Warfare (92811) was Alliance only in ours; live it is open to everyone.
UPDATE `quest_template` SET `AllowableRaces` = 18446744073709551615
WHERE `ID` IN (92811,93572,93644,93747,96379) AND `AllowableRaces` NOT IN (0,18446744073709551615);
UPDATE `quest_template` SET `AllowableRaces` = 12884901888                 -- Skyborne Alliance + Skyborne Horde
WHERE `ID` IN (94013,94050,94978,94979,97205,99203) AND `AllowableRaces` <> 12884901888;
UPDATE `quest_template` SET `AllowableRaces` = 12261800583900083122 WHERE `ID` = 95183 AND `AllowableRaces` <> 12261800583900083122;  -- Horde
UPDATE `quest_template` SET `AllowableRaces` = 2  WHERE `ID` = 96994 AND `AllowableRaces` <> 2;   -- Your First Riding Wolf: Orc
UPDATE `quest_template` SET `AllowableRaces` = 4  WHERE `ID` = 97017 AND `AllowableRaces` <> 4;   -- Your First Riding Ram: Dwarf
UPDATE `quest_template` SET `AllowableRaces` = 64 WHERE `ID` = 97046 AND `AllowableRaces` <> 64;  -- Your First Mechanostrider: Gnome
UPDATE `quest_template` SET `AllowableRaces` = 16 WHERE `ID` = 97203 AND `AllowableRaces` <> 16;  -- Learning to Ride: Undead
