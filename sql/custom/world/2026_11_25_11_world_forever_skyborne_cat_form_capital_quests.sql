-- Skyborne druids never get Cat Form (BUGS-ALL row 380, КРЭК СМИТ 11-24).
-- Every Cat Form chain ends with a capital quest from Dendrite Starblaze 11802 that rewards 1309050 (Cat Form, teaches 768):
-- 98362 "To Thunder Bluff" (races include Horde Skyborne) and 98397 "To Darnassus" (races include Alliance Skyborne).
-- Skyborne druids finish the Windborne chain instead (98340 -> 98341 -> 98404 -> 98738), but both capital quests still had
-- PrevQuestID = the other chain's last quest (98739 / 98731), so Dendrite never offered them after 98738. The quest data
-- already meant "either chain" for To Darnassus (two OR'd quest-available conditions, 2026_11_05_99), but a PrevQuestID is
-- checked on top of conditions, so that OR never worked. Live (Wowhead quest 98738 comment, 20 Oct): Skyborne druids go on to
-- Darnassus / Thunder Bluff after the chain.
-- Fix: the prerequisite moves into the conditions for both quests: either chain's last quest rewarded. Safe to run again.
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` IN (98362, 98397);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceGroup` = 0 AND `SourceEntry` IN (98362, 98397);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ConditionStringValue1`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19,0,98397,0,0,8,0,98731,0,0,'',0,0,0,'','To Darnassus: after Blessings of the Great Cat Spirit 98731'),
(19,0,98397,0,1,8,0,98738,0,0,'',0,0,0,'','To Darnassus: or after Blessings of the Great Windborne Cat Spirit 98738 (Skyborne)'),
(19,0,98362,0,0,8,0,98739,0,0,'',0,0,0,'','To Thunder Bluff: after Blessings of the Great Cat Spirit 98739'),
(19,0,98362,0,1,8,0,98738,0,0,'',0,0,0,'','To Thunder Bluff: or after Blessings of the Great Windborne Cat Spirit 98738 (Skyborne)');
