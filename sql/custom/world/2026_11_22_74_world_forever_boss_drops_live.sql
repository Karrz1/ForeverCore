-- Classic dungeon bosses: drops live WoW Forever has and we did not. Source (read as data): drop rates from players' addons on
-- live WoW Forever, as listed by a WoW Forever fan database (drops at 20% or more; kills per boss in brackets, so a rate is
-- rough). Rows are deleted by key first and only added while the boss uses its own loot id: safe to run again.
--   Odo the Blindwatcher 4279 (13): Haunting Blade 6641 23%, Phantom Armor 6642 23% (Deathsworn Captain 3872 keeps them too).
--   Fenrus the Devourer 4274 (12): 15223 33%.
--   Overlord Ramtusk 4420 (16): Armor Piercer 6679 44% (Razorfen Spearhide 4438 keeps it too).
--   Sneed 643 (27): Buzz Saw 1937 48%, Buzzer Blade 2169 22%, 285292 30%. On live these drop from Sneed, and Sneed's Shredder
--     642 shows no drop at 20% or more, so they move from the Shredder (reference 30066 and its own 285292 row) to Sneed.
--   Quest drops (only while the quest is taken), as live bosses drop them:
--     Red Wool Bandana 2909 (The Color of Blood 388): Kam Deepfury 1666, Targorr the Dread 1696, Hamhock 1717, 25%;
--     Deviate Hide 6443 (1486): Lord Cobrahn 3669 46%, Lady Anacondra 3671 36%; Kraul Guano 5801 (1109): Roogug 6168 27%.
-- Not taken: Arugal's 276561 (a plain white item we know nothing about yet), and the plain trade goods and leather the list
-- shows (Light/Medium/Heavy Leather, Shadowgem, meat, mushrooms, Deviate Scale): those come from the creature kind's
-- ordinary loot and skinning, not from the boss.

DROP TEMPORARY TABLE IF EXISTS `boss_drops_live`;
CREATE TEMPORARY TABLE `boss_drops_live` (`Entry` INT UNSIGNED NOT NULL, `Item` INT UNSIGNED NOT NULL, `Chance` FLOAT NOT NULL,
  `QuestRequired` TINYINT NOT NULL, `Comment` VARCHAR(255) NOT NULL, PRIMARY KEY (`Entry`,`Item`));
INSERT INTO `boss_drops_live` (`Entry`,`Item`,`Chance`,`QuestRequired`,`Comment`) VALUES
(4279,6641,23,0,'Odo the Blindwatcher: Haunting Blade (live WoW Forever rate)'),
(4279,6642,23,0,'Odo the Blindwatcher: Phantom Armor (live WoW Forever rate)'),
(4274,15223,33,0,'Fenrus the Devourer: 15223 (live WoW Forever rate)'),
(4420,6679,44,0,'Overlord Ramtusk: Armor Piercer (live WoW Forever rate)'),
(643,1937,48,0,'Sneed: Buzz Saw (live WoW Forever rate, moved from the Shredder)'),
(643,2169,22,0,'Sneed: Buzzer Blade (live WoW Forever rate, moved from the Shredder)'),
(643,285292,30,0,'Sneed: 285292 (live WoW Forever rate, moved from the Shredder)'),
(1666,2909,25,1,'Kam Deepfury: Red Wool Bandana for 388 (live WoW Forever rate)'),
(1696,2909,25,1,'Targorr the Dread: Red Wool Bandana for 388 (live WoW Forever rate)'),
(1717,2909,25,1,'Hamhock: Red Wool Bandana for 388 (live WoW Forever rate)'),
(3669,6443,46,1,'Lord Cobrahn: Deviate Hide for 1486 (live WoW Forever rate)'),
(3671,6443,36,1,'Lady Anacondra: Deviate Hide for 1486 (live WoW Forever rate)'),
(6168,5801,27,1,'Roogug: Kraul Guano for 1109 (live WoW Forever rate)');

-- Sneed's Shredder gives its saws and 285292 to Sneed
DELETE FROM `creature_loot_template` WHERE `Entry` = 642 AND ((`ItemType` = 1 AND `Item` = 30066) OR (`ItemType` = 0 AND `Item` = 285292));

-- a boss without a loot id gets its own (only while no other creature uses that id)
UPDATE `creature_template_difficulty` d SET d.`LootID` = d.`Entry`
WHERE d.`DifficultyID` = 0 AND d.`LootID` = 0 AND d.`Entry` IN (SELECT DISTINCT `Entry` FROM `boss_drops_live`)
  AND NOT EXISTS (SELECT 1 FROM (SELECT `Entry`,`LootID` FROM `creature_template_difficulty` WHERE `DifficultyID` = 0) o WHERE o.`LootID` = d.`Entry` AND o.`Entry` <> d.`Entry`);

DELETE l FROM `creature_loot_template` l JOIN `boss_drops_live` b ON l.`Entry` = b.`Entry` AND l.`ItemType` = 0 AND l.`Item` = b.`Item`;
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT b.`Entry`, 0, b.`Item`, b.`Chance`, b.`QuestRequired`, 1, 0, 1, 1, b.`Comment` FROM `boss_drops_live` b
WHERE EXISTS (SELECT 1 FROM `creature_template_difficulty` d WHERE d.`Entry` = b.`Entry` AND d.`DifficultyID` = 0 AND d.`LootID` = b.`Entry`);
DROP TEMPORARY TABLE `boss_drops_live`;
