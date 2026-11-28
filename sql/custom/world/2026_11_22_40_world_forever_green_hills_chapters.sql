-- Chapter II, III and IV of The Green Hills of Stranglethorn (340-342) are taken while The Green Hills of Stranglethorn (338)
-- is in the quest log, like Chapter I (339) already is here (PrevQuestID -338). Questie (Questie team, Questie/QuestieDB, GPL-3.0,
-- data/Forever/foreverQuestDB.lua at 9921e9bf) gives 338 as the parent quest of all four chapters and no other previous quest.
-- 2026_11_22_39 cleared their old Welcome to the Jungle (583) requirement; this sets the parent quest. Safe to run more than once.
UPDATE `quest_template_addon` SET `PrevQuestID`=-338 WHERE `ID` IN (340,341,342) AND `PrevQuestID` IN (0,583);
