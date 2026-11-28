-- Call of Fire (Alliance, Braldir Ashmantle 257808): a Fire Sapta thrown away could not be had again (Discord 11-22, RU general,
-- TemaBlack22, dwarf shaman). Quest 94473 "Fire Sapta" ("Speak to Braldir Ashmantle for another Fire Sapta") is the Alliance copy of
-- Telf Joolam's 1464, but it lacked what makes 1464 work: 1464 is repeatable (SpecialFlags 1) and shows only while Call of Fire 1526 is
-- in the log and the player has no Fire Sapta. 94473 was a one-time quest with no such rule, so a second lost sapta was gone for good.
-- Same rule for 94473 against its own step, 94467 (the step that needs the sapta). Safe to run again.

UPDATE `quest_template_addon` SET `SpecialFlags` = `SpecialFlags` | 1 WHERE `ID` = 94473;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceGroup` = 0 AND `SourceEntry` = 94473;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 94473, 0, 0, 2, 0, 6636, 1, 1, '', 1, 0, 0, '', 'Quest ''Fire Sapta'' (Braldir) can only be taken if player does not have item ''Fire Sapta'''),
(19, 0, 94473, 0, 0, 9, 0, 94467, 0, 0, '', 0, 0, 0, '', 'Show quest ''Fire Sapta'' (Braldir) only if quest ''Call of Fire'' 94467 is accepted but not completed');
