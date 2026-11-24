-- Nibbled-On Book (247857) starts Nibbled-On Book (91741), the first quest of Brother Paxton's Northshire chain
-- (91741 -> Rascally Rodents 91743 -> Mining Consultant 91745 -> The Big Picture 91752 -> ...), but nothing drops it,
-- so the chain can't be started. The kobold drops came from each creature's quest-item list, which holds the chain's
-- Stolen Books (247839, 40%) but not this quest starter.
-- Source: Wowhead Forever (https://www.wowhead.com/forever/quest=91741/nibbled-on-book): "Book to begin quest dropped of
-- the kobolds Kobold Worker", "You will find this book doing the kobold quest chain in Northshire Valley". Wowhead has no
-- drop statistics for item 247857, so the chance (15%) is an estimate for a starting-zone quest found while doing the
-- kobold quests. Loot.cpp stops offering it once the player has the quest or has finished it.
DELETE FROM `creature_loot_template` WHERE `Entry` IN (6, 80, 257) AND `ItemType` = 0 AND `Item` = 247857;
INSERT INTO `creature_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6,   0, 247857, 15, 0, 1, 0, 1, 1, 'Kobold Vermin - Nibbled-On Book (starts 91741)'),
(80,  0, 247857, 15, 0, 1, 0, 1, 1, 'Kobold Laborer - Nibbled-On Book (starts 91741)'),
(257, 0, 247857, 15, 0, 1, 0, 1, 1, 'Kobold Worker - Nibbled-On Book (starts 91741)');
