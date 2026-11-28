-- Questie's Forever fixes of 27 Nov (QuestieDB 5c145e3e) that our world lacked.
-- Source: QuestieDB Forever corrections (Questie team, GPL-3.0), which follow its traces of the live realm.
-- Each change only applies while the quests are in our world and the field still has its old value. Safe to run more than once.

-- 1. Daily Delivery (469) is an optional lead-in for Young Crocolisk Skins (484): James Halloran gives 484 to anyone, and he no
--    longer takes 469 once 484 is taken or done. Ours made 469 a must for 484.
INSERT INTO `quest_template_addon` (`ID`) SELECT t.`ID` FROM `quest_template` t
WHERE t.`ID` IN (469,84319) AND NOT EXISTS (SELECT 1 FROM `quest_template_addon` a WHERE a.`ID` = t.`ID`);
UPDATE `quest_template_addon` SET `BreadcrumbForQuestId` = 484 WHERE `ID` = 469 AND `BreadcrumbForQuestId` = 0
  AND EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 484);
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 484 AND `PrevQuestID` = 469;

-- 2. Oh No Ye Don't! (84319) follows Oi! (84318), whose hand-in already offers it.
UPDATE `quest_template_addon` SET `PrevQuestID` = 84318 WHERE `ID` = 84319 AND `PrevQuestID` = 0
  AND EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 84318);
