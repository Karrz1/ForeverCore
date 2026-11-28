-- Small Sack of Gems (280567), the reward of Crest of Lordaeron (95189 Alliance, 95204 Horde), opens empty: the item is
-- openable but has no item_loot_template rows. Source: Wowhead Forever item=280567, 5,736 openings: one of each of six gems,
-- Lesser Moonstone 47.8 %, Tigerseye 47.1 %, Malachite 46.4 %, Shadowgem 45.8 %, Jade 45.6 %, Moss Agate 45.4 %, 2.78 gems
-- per sack. Model: two picks from the six (groups 1 and 2, equal chance: one gem each, always) and a third pick 78 % of the
-- time (group 3, 13 % each) = 2.78 gems, each in about 46 % of sacks. Safe to run twice.
DELETE FROM `item_loot_template` WHERE `Entry` = 280567;
INSERT INTO `item_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(280567, 0, 1705, 0, 0, 1, 1, 1, 1, 'Small Sack of Gems - Lesser Moonstone'),
(280567, 0, 818, 0, 0, 1, 1, 1, 1, 'Small Sack of Gems - Tigerseye'),
(280567, 0, 774, 0, 0, 1, 1, 1, 1, 'Small Sack of Gems - Malachite'),
(280567, 0, 1210, 0, 0, 1, 1, 1, 1, 'Small Sack of Gems - Shadowgem'),
(280567, 0, 1529, 0, 0, 1, 1, 1, 1, 'Small Sack of Gems - Jade'),
(280567, 0, 1206, 0, 0, 1, 1, 1, 1, 'Small Sack of Gems - Moss Agate'),
(280567, 0, 1705, 0, 0, 1, 2, 1, 1, 'Small Sack of Gems - Lesser Moonstone'),
(280567, 0, 818, 0, 0, 1, 2, 1, 1, 'Small Sack of Gems - Tigerseye'),
(280567, 0, 774, 0, 0, 1, 2, 1, 1, 'Small Sack of Gems - Malachite'),
(280567, 0, 1210, 0, 0, 1, 2, 1, 1, 'Small Sack of Gems - Shadowgem'),
(280567, 0, 1529, 0, 0, 1, 2, 1, 1, 'Small Sack of Gems - Jade'),
(280567, 0, 1206, 0, 0, 1, 2, 1, 1, 'Small Sack of Gems - Moss Agate'),
(280567, 0, 1705, 13, 0, 1, 3, 1, 1, 'Small Sack of Gems - Lesser Moonstone'),
(280567, 0, 818, 13, 0, 1, 3, 1, 1, 'Small Sack of Gems - Tigerseye'),
(280567, 0, 774, 13, 0, 1, 3, 1, 1, 'Small Sack of Gems - Malachite'),
(280567, 0, 1210, 13, 0, 1, 3, 1, 1, 'Small Sack of Gems - Shadowgem'),
(280567, 0, 1529, 13, 0, 1, 3, 1, 1, 'Small Sack of Gems - Jade'),
(280567, 0, 1206, 13, 0, 1, 3, 1, 1, 'Small Sack of Gems - Moss Agate');
