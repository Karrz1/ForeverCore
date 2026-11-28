-- WoW Forever: Kargra the Blind 256892 (added by 2026_11_24_95) dropped money never and only two items (Everlake kept items seen
-- 10+ times on Wowhead's first 100 kills), so most corpses were empty. Loot now from Wowhead Forever's player counts (197 kills,
-- read 24 Nov 2026): items seen at least twice, chance = count over kills; the world greens from the reference of the matching
-- level band at the rate they were seen. Money: Wowhead's average 234 copper +-50%. Running it again changes nothing.
UPDATE `creature_template_difficulty` SET `GoldMin`=117, `GoldMax`=351 WHERE `Entry`=256892 AND `DifficultyID`=0;
DELETE FROM `creature_loot_template` WHERE `Entry`=256892;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(256892,0,3671,2.03,0,1,0,1,1,'Wowhead Forever: 4 of 197'),
(256892,0,3914,3.55,0,1,0,1,1,'Wowhead Forever: 7 of 197'),
(256892,0,4338,14.72,0,1,0,1,3,'Wowhead Forever: 29 of 197'),
(256892,0,5429,3.05,0,1,0,1,1,'Wowhead Forever: 6 of 197'),
(256892,0,5431,1.02,0,1,0,1,1,'Wowhead Forever: 2 of 197'),
(256892,0,6438,1.52,0,1,0,1,1,'Wowhead Forever: 3 of 197'),
(256892,0,7909,1.02,0,1,0,1,1,'Wowhead Forever: 2 of 197'),
(256892,0,7910,2.03,0,1,0,1,1,'Wowhead Forever: 4 of 197'),
(256892,0,281666,19.8,0,1,0,1,1,'Wowhead Forever: 39 of 197'),
(256892,1,30025,10.15,0,1,0,1,1,'Wowhead Forever: world greens 20 of 197 kills'),
(256892,1,30027,19.8,0,1,0,1,1,'Wowhead Forever: world greens 39 of 197 kills'),
(256892,1,30029,29.44,0,1,0,1,1,'Wowhead Forever: world greens 58 of 197 kills');
