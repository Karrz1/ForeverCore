-- The Shamed Lieutenant (98219) leads to Down the Coast (536), as on live.
-- Source: QuestieDB Forever corrections (Questie team, GPL-3.0), commit e3c3bc43:
--   98219 breadcrumbForQuestId 536, nextQuestInChain 536; 536 breadcrumbs {98219}.
-- 98219 is handed in to Lieutenant Farren Orinelle (2228), who also gives 536.
-- As a lead-in, 98219 is no longer offered once 536 is taken or done, and at
-- hand-in Farren offers 536 straight away.
-- Each change only applies while the field still has its old value.

UPDATE `quest_template_addon` SET `BreadcrumbForQuestId` = 536 WHERE `ID` = 98219 AND `BreadcrumbForQuestId` = 0;
UPDATE `quest_template` SET `RewardNextQuest` = 536 WHERE `ID` = 98219 AND `RewardNextQuest` = 0;
