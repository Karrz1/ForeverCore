-- Small Sack of Gems (280567), the reward of Crest of Lordaeron (95189 / 95204), opened empty: it had no item loot.
-- Contents from Wowhead's WoW Forever item page (www.wowhead.com/forever/item=280567, "Contains", read 23 Nov 2026; 5153 opened):
-- Lesser Moonstone 2475, Tigerseye 2434, Malachite 2397, Jade 2373, Moss Agate 2367, Shadowgem 2348, one of each at a time.
-- That is 2.79 gems per sack and about 47% for each gem: two picks from the six (equal chance) every time, and a third pick
-- in 79% of sacks (13.2% each), so a sack never opens empty. The split into picks is INFERRED from the counts. Safe to run again.
DELETE FROM `item_loot_template` WHERE `Entry`=280567;
INSERT INTO `item_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(280567,0,1705,0,0,1,1,1,1,'Small Sack of Gems: Lesser Moonstone (Wowhead Forever 2475/5153)'),
(280567,0,818,0,0,1,1,1,1,'Small Sack of Gems: Tigerseye (Wowhead Forever 2434/5153)'),
(280567,0,774,0,0,1,1,1,1,'Small Sack of Gems: Malachite (Wowhead Forever 2397/5153)'),
(280567,0,1529,0,0,1,1,1,1,'Small Sack of Gems: Jade (Wowhead Forever 2373/5153)'),
(280567,0,1206,0,0,1,1,1,1,'Small Sack of Gems: Moss Agate (Wowhead Forever 2367/5153)'),
(280567,0,1210,0,0,1,1,1,1,'Small Sack of Gems: Shadowgem (Wowhead Forever 2348/5153)'),
(280567,0,1705,0,0,1,2,1,1,'Small Sack of Gems: second pick'),
(280567,0,818,0,0,1,2,1,1,'Small Sack of Gems: second pick'),
(280567,0,774,0,0,1,2,1,1,'Small Sack of Gems: second pick'),
(280567,0,1529,0,0,1,2,1,1,'Small Sack of Gems: second pick'),
(280567,0,1206,0,0,1,2,1,1,'Small Sack of Gems: second pick'),
(280567,0,1210,0,0,1,2,1,1,'Small Sack of Gems: second pick'),
(280567,0,1705,13.2,0,1,3,1,1,'Small Sack of Gems: third pick (79%)'),
(280567,0,818,13.2,0,1,3,1,1,'Small Sack of Gems: third pick (79%)'),
(280567,0,774,13.2,0,1,3,1,1,'Small Sack of Gems: third pick (79%)'),
(280567,0,1529,13.2,0,1,3,1,1,'Small Sack of Gems: third pick (79%)'),
(280567,0,1206,13.2,0,1,3,1,1,'Small Sack of Gems: third pick (79%)'),
(280567,0,1210,13.2,0,1,3,1,1,'Small Sack of Gems: third pick (79%)');
