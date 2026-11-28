-- WoW Forever: the Forsaken paladin steed quests, Report to Danitha (97022) and A Paladin's Steed (94971), which our world did not
-- have (reported on Discord). Paladins only; 97022 from Garen Largo (Undercity) or Alodan the Hopeful, both end at Danitha Morr.
-- Quest records: Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
-- (https://creativecommons.org/licenses/by/4.0/). Source: github.com/JIVESCORP/eg-link-output-wowf quests.enUS. Changed: converted.
-- Givers, turn-in, chain, paladin-only and reward lines: Icy Veins WoW Forever database and Wowhead Forever (both agree).
-- Safe to run again: every row is replaced by key.


-- 97022 Report to Danitha (level 40, min 40, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=97022;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (97022,2,0,0,94971,2,1.0,0,1.0,0,0,0,0,0,0,16,68,5,0,'Report to Danitha','Speak with Danitha Morr at Bandarion Keep.','Danitha Morr has ordered you to report back to Bandarion Keep to receive additional training. Please make your way back to the keep as quickly as you are able.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=97022;
DELETE FROM `quest_template_addon` WHERE `ID`=97022;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (97022,0,2,0,0);
DELETE FROM `quest_classic_money` WHERE `ID`=97022;
DELETE FROM `quest_classic_level` WHERE `ID`=97022;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (97022,40,40,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=97022;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (97022,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=97022;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (97022,0,2,0,0,0,0,0,0,'Glad you made it, $n. You''ve seen much and traveled far, and you are now ready for the next step on your journey as a paladin.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=97022;
DELETE FROM `creature_queststarter` WHERE `quest`=97022;
DELETE FROM `gameobject_queststarter` WHERE `quest`=97022;
DELETE FROM `creature_questender` WHERE `quest`=97022;
DELETE FROM `gameobject_questender` WHERE `quest`=97022;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (246344,97022,0),(260093,97022,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (246378,97022,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (246344,246378,260093);

-- 94971 A Paladin's Steed (level 40, min 40, live build 71037)
DELETE FROM `quest_template` WHERE `ID`=94971;
INSERT INTO `quest_template` (`ID`,`QuestType`,`QuestSortID`,`QuestInfoID`,`RewardNextQuest`,`RewardXPDifficulty`,`RewardXPMultiplier`,`RewardMoneyDifficulty`,`RewardMoneyMultiplier`,`RewardSpell`,`StartItem`,`Flags`,`FlagsEx`,`FlagsEx2`,`TimeAllowed`,`AllowableRaces`,`RewardFactionID1`,`RewardFactionValue1`,`RewardFactionOverride1`,`LogTitle`,`LogDescription`,`QuestDescription`,`AreaDescription`,`QuestCompletionLog`,`VerifiedBuild`) VALUES (94971,2,0,0,0,2,1.0,0,1.0,1279400,0,2097152,0,0,0,16,68,5,0,'A Paladin''s Steed','Speak with Danitha Morr to learn to summon your Warhorse.','One of the most important parts of a paladin''s arsenal has always been their warhorse. These specially consecrated animals bear paladins and their arms into battle, and are as fearless and bold as the best of us.

While our situation has changed, our need for steeds to bear us into battle has not. It''s time that you had such a mount for yourself.','','',71037);
DELETE FROM `quest_objectives` WHERE `QuestID`=94971;
DELETE FROM `quest_template_addon` WHERE `ID`=94971;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`,`ProvidedItemCount`) VALUES (94971,0,2,97022,0);
DELETE FROM `quest_classic_money` WHERE `ID`=94971;
DELETE FROM `quest_classic_level` WHERE `ID`=94971;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) VALUES (94971,40,40,0);
DELETE FROM `quest_template_classic_level` WHERE `ID`=94971;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) VALUES (94971,2,40);
DELETE FROM `quest_offer_reward` WHERE `ID`=94971;
INSERT INTO `quest_offer_reward` (`ID`,`Emote1`,`Emote2`,`Emote3`,`Emote4`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`EmoteDelay4`,`RewardText`,`VerifiedBuild`) VALUES (94971,0,2,0,0,0,0,0,0,'The bestowing of a steed is a key rite of passage for all paladins. I am pleased to present you now with your very own warhorse.

May this warhorse serve you well, paladin of the Forsaken.',71037);
DELETE FROM `quest_request_items` WHERE `ID`=94971;
DELETE FROM `creature_queststarter` WHERE `quest`=94971;
DELETE FROM `gameobject_queststarter` WHERE `quest`=94971;
DELETE FROM `creature_questender` WHERE `quest`=94971;
DELETE FROM `gameobject_questender` WHERE `quest`=94971;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) VALUES (246378,94971,0);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) VALUES (246378,94971,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (246378);


-- the reward shows Summon Warhorse (1279399); the reward spell 1279400 teaches it
DELETE FROM `quest_reward_display_spell` WHERE `QuestID`=94971;
INSERT INTO `quest_reward_display_spell` (`QuestID`,`Idx`,`SpellID`,`PlayerConditionID`,`Type`,`VerifiedBuild`) VALUES (94971,0,1279399,0,0,71037);
