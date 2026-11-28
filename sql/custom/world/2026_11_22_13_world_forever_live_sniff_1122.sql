-- WoW Forever: live capture of 21 Nov 23:55 (client 71037; Wetlands, Stormwind, Darkshore). Only what the world DB lacked or had
-- different from live. The items are in the hotfixes file of this kit. Safe to run again.

-- 1. Weapons as live shows them: the Wetlands Dragonmaw Infiltrator 271346, Soulbinder 271348 and Reclaimer 271351 and
--    Sylessa Duskwhisper 270844 held nothing on our realm; the Stormwind City Patroller 1976 carries 2715, not 1899.
DELETE FROM `creature_equip_template` WHERE `ID`=1 AND `CreatureID` IN (270844,271346,271348,271351);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES
(270844, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 71037),
(271346, 1, 5282, 0, 0, 19987, 0, 0, 0, 0, 0, 71037),
(271348, 1, 2559, 0, 0, 0, 0, 0, 0, 0, 0, 71037),
(271351, 1, 12951, 0, 0, 0, 0, 0, 0, 0, 0, 71037);
UPDATE `creature` SET `equipment_id`=1 WHERE `equipment_id`=0 AND `id` IN (270844,271346,271348,271351);
UPDATE `creature_equip_template` SET `ItemID1`=2715, `AppearanceModID1`=0, `ItemVisual1`=0 WHERE `ID`=1 AND `CreatureID`=1976 AND `ItemID1`=1899;

-- 2. Russian turn-in and progress texts live sends that we had none of: Seeking Caitlin 95737, Return the Statuette 98189,
--    Bloom of the Heavens 98208, Razormaw Needling 98245, Trying Times 98246 and A Lack of Virtue 98459. Only where missing.
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (95737,'ruRU','Ллану наверняка интересует, что там с семенами той травы, что я обещала ей и которые должен был принести с собой мой муж! Ее, как и меня, тоже что-то тревожит. Наверняка это как-то связано с местом раскопок – мы обе это чувствуем.',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (98189,'ruRU','У тебя получилось забрать у чудовищ пропажу! Сейчас осталось довольно мало артефактов покойного короля.',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (98246,'ruRU','Они не для самого плана – они нужны, чтобы покормить Глухоклюв. Уж поверь на слово, от нее голодной совсем толку не будет. Эта зверюга может быть опаснее орков, если ее разозлить!\r\n\r\nВ последнее время в этих землях трудно найти неиспорченную еду...',71037);
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (98459,'ruRU','<Барт разворачивает подарок.>\r\n\r\nАх этот никчемный селедкин сын...\r\n\r\nНебось не говорил тебе, что это он жульничает в покере?! Я выиграл достаточно денег для покупки \"Девичьей Чести\" только после того, как мы отвадили его садиться за наш стол!\r\n\r\nКлянусь, в следующий раз, как увижу эту никчемную скумбрию...\r\n\r\nПрости, не сдержался. С гонца спроса нет. От имени команды \"Девичьей Чести\" – лучшего корабля во всем Великом море – приветствую тебя в Гавани Менетилов!',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98189,'ruRU','Что это тут у тебя? Дай-ка взглянуть.',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98208,'ruRU','Ты $gбыл:была; на месте крушения? Печальное зрелище.',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98245,'ruRU','Удалось насобирать зубов? Они мне нужны целыми – иначе чешуйки не проколют.',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98246,'ruRU','Острозубы просто так тебе яйца отдавать не станут, так что готовься к потасовке.',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98459,'ruRU','А ну-ка поживее! Отчаливаем по моей команде!\r\n\r\nЧто это у тебя там, $gпутешественник:путешественница;?',71037);
