-- Follow-up to 2026_11_22_39 (Questie team, Questie/QuestieDB, GPL-3.0, Forever corrections at 9921e9bf). Three quests already had a
-- single previous quest in our world besides the conditions that file added, and both rules apply together:
-- Facing Negolash (8554) takes The Captain's Cutlass (615) or Facing Negolash's other way in (8553), but still asked for 8553 alone,
-- so anyone who came through 615 could never get it. Nek'rosh's Gambit (465) and The Weaver (480) need both their quests through the
-- conditions already, so their single previous quest only repeats one of them; it goes too, so each quest has one rule.
-- Safe to run more than once.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=8554 AND `PrevQuestID`=8553
  AND (SELECT COUNT(*) FROM `conditions` `c` WHERE `c`.`SourceTypeOrReferenceId`=19 AND `c`.`SourceEntry`=8554 AND `c`.`ConditionTypeOrReference`=8 AND `c`.`ConditionValue1` IN (615,8553))=2;
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=465 AND `PrevQuestID`=464
  AND (SELECT COUNT(*) FROM `conditions` `c` WHERE `c`.`SourceTypeOrReferenceId`=19 AND `c`.`SourceEntry`=465 AND `c`.`ElseGroup`=0 AND `c`.`ConditionTypeOrReference`=8 AND `c`.`ConditionValue1` IN (464,98221))=2;
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=480 AND `PrevQuestID`=479
  AND (SELECT COUNT(*) FROM `conditions` `c` WHERE `c`.`SourceTypeOrReferenceId`=19 AND `c`.`SourceEntry`=480 AND `c`.`ElseGroup`=0 AND `c`.`ConditionTypeOrReference`=8 AND `c`.`ConditionValue1` IN (479,95981))=2;
