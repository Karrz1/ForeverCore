-- WoW Forever: boss loot of the Drowned City, Krol'dok Stronghold and the Excavation Site set to what the bosses drop on
-- live. Each boss drops one of its own items a kill; which items, and how often each one comes, is the live count on
-- Wowhead WoW Forever (drops over kills). Before, several bosses had only two of their three or four items, and the
-- Primeval Elemental also had Var'Taka's cloak and Deathless Marrow's ring.
-- Safe to run again: each boss's one-per-kill group is replaced as a whole.

-- Var'Taka (258924), 2675 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=258924 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=258924 AND `GroupId`=0 AND `Item` IN (274601,274602,274613);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(258924,0,274601,33.43,0,1,1,1,1,'Var''Taka: boss item, one each kill (Wowhead WoW Forever 893 of 2675 kills)'),
(258924,0,274602,32.03,0,1,1,1,1,'Var''Taka: boss item, one each kill (Wowhead WoW Forever 856 of 2675 kills)'),
(258924,0,274613,34.53,0,1,1,1,1,'Var''Taka: boss item, one each kill (Wowhead WoW Forever 923 of 2675 kills)');

-- Primeval Elemental (263886), 1951 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=263886 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=263886 AND `GroupId`=0 AND `Item` IN (274611,274612,274615);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(263886,0,274611,31.3,0,1,1,1,1,'Primeval Elemental: boss item, one each kill (Wowhead WoW Forever 611 of 1951 kills)'),
(263886,0,274612,32.8,0,1,1,1,1,'Primeval Elemental: boss item, one each kill (Wowhead WoW Forever 640 of 1951 kills)'),
(263886,0,274615,35.9,0,1,1,1,1,'Primeval Elemental: boss item, one each kill (Wowhead WoW Forever 700 of 1951 kills)');

-- Deathless Marrow (260202), 2856 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=260202 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=260202 AND `GroupId`=0 AND `Item` IN (274606,274607,274614);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(260202,0,274606,31.95,0,1,1,1,1,'Deathless Marrow: boss item, one each kill (Wowhead WoW Forever 811 of 2856 kills)'),
(260202,0,274607,31.38,0,1,1,1,1,'Deathless Marrow: boss item, one each kill (Wowhead WoW Forever 797 of 2856 kills)'),
(260202,0,274614,36.67,0,1,1,1,1,'Deathless Marrow: boss item, one each kill (Wowhead WoW Forever 931 of 2856 kills)');

-- Nar'gurk (258964), 1836 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=258964 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=258964 AND `GroupId`=0 AND `Item` IN (275004,275005,275006);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(258964,0,275004,39.78,0,1,1,1,1,'Nar''gurk: boss item, one each kill (Wowhead WoW Forever 657 of 1836 kills)'),
(258964,0,275005,29.0,0,1,1,1,1,'Nar''gurk: boss item, one each kill (Wowhead WoW Forever 479 of 1836 kills)'),
(258964,0,275006,31.22,0,1,1,1,1,'Nar''gurk: boss item, one each kill (Wowhead WoW Forever 516 of 1836 kills)');

-- Overlord Mugg (258968), 2069 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=258968 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=258968 AND `GroupId`=0 AND `Item` IN (275007,275008,275009,275010);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(258968,0,275007,27.11,0,1,1,1,1,'Overlord Mugg: boss item, one each kill (Wowhead WoW Forever 517 of 2069 kills)'),
(258968,0,275008,23.75,0,1,1,1,1,'Overlord Mugg: boss item, one each kill (Wowhead WoW Forever 453 of 2069 kills)'),
(258968,0,275009,22.78,0,1,1,1,1,'Overlord Mugg: boss item, one each kill (Wowhead WoW Forever 434 of 2069 kills)'),
(258968,0,275010,26.36,0,1,1,1,1,'Overlord Mugg: boss item, one each kill (Wowhead WoW Forever 503 of 2069 kills)');

-- Twilight Commander Zarmok (258972), 2032 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=258972 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=258972 AND `GroupId`=0 AND `Item` IN (274998,274999,275000);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(258972,0,274998,32.93,0,1,1,1,1,'Twilight Commander Zarmok: boss item, one each kill (Wowhead WoW Forever 658 of 2032 kills)'),
(258972,0,274999,32.22,0,1,1,1,1,'Twilight Commander Zarmok: boss item, one each kill (Wowhead WoW Forever 644 of 2032 kills)'),
(258972,0,275000,34.86,0,1,1,1,1,'Twilight Commander Zarmok: boss item, one each kill (Wowhead WoW Forever 697 of 2032 kills)');

-- War Handler Ashka (259281), 1644 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=259281 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=259281 AND `GroupId`=0 AND `Item` IN (275001,275002,275003);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(259281,0,275001,36.4,0,1,1,1,1,'War Handler Ashka: boss item, one each kill (Wowhead WoW Forever 598 of 1644 kills)'),
(259281,0,275002,34.4,0,1,1,1,1,'War Handler Ashka: boss item, one each kill (Wowhead WoW Forever 566 of 1644 kills)'),
(259281,0,275003,29.2,0,1,1,1,1,'War Handler Ashka: boss item, one each kill (Wowhead WoW Forever 480 of 1644 kills)');

-- Bossman Toof (264773), 1577 kills on live
DELETE FROM `creature_loot_template` WHERE `Entry`=264773 AND `GroupId`=1;
DELETE FROM `creature_loot_template` WHERE `Entry`=264773 AND `GroupId`=0 AND `Item` IN (286428,286429,286430);
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(264773,0,286428,31.6,0,1,1,1,1,'Bossman Toof: boss item, one each kill (Wowhead WoW Forever 498 of 1577 kills)'),
(264773,0,286429,32.2,0,1,1,1,1,'Bossman Toof: boss item, one each kill (Wowhead WoW Forever 508 of 1577 kills)'),
(264773,0,286430,36.2,0,1,1,1,1,'Bossman Toof: boss item, one each kill (Wowhead WoW Forever 571 of 1577 kills)');

-- Overlord Mugg: Krol'dok Ogre Key, a separate drop (Wowhead WoW Forever 279 of 2069 kills).
DELETE FROM `creature_loot_template` WHERE `Entry`=258968 AND `Item`=271721;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (258968,0,271721,13.5,0,1,0,1,1,'Overlord Mugg: Krol''dok Ogre Key (Wowhead WoW Forever 279 of 2069 kills)');

-- Elder Shaman Bloodmane: Blackmaw Ritual Totem for Blackmaw Magic (97198), party loot on live; it did not drop here at all.
DELETE FROM `creature_loot_template` WHERE `Entry`=247209 AND `Item`=276893;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES (247209,0,276893,100,1,1,0,1,1,'Elder Shaman Bloodmane: Blackmaw Ritual Totem (Blackmaw Magic), party loot, every kill while on the quest');
