-- WoW Forever: the Craftsman's Writ Coin Pouches opened empty ("No loot"). Every Journeyman writ rewards Coin Pouch 284584 and
-- every Expert writ Coin Pouch 284585 (2026_11_19_99, 2026_11_21_91, 2026_11_21_97); neither had loot or money here.
-- The pouches hold only money: Wowhead's WoW Forever items 284584 and 284585 have no "Contains" list (read 23 Nov 2026), and its
-- writ guide ("Craftsman's Writs: Recipes, Rewards & Routes", Looter data) gives Journeyman 5s to 19s and Expert an average
-- of 36s. Expert 15s to 57s is INFERRED: the Journeyman spread scaled to the Expert average (the guide notes Expert may pay
-- more than recorded). Artisan writs reward no pouch item here (reputation and the treasure picker). Safe to run again.
INSERT INTO `item_template_addon` (`Id`,`MinMoneyLoot`,`MaxMoneyLoot`) VALUES
(284584,500,1900),
(284585,1500,5700)
ON DUPLICATE KEY UPDATE `MinMoneyLoot`=VALUES(`MinMoneyLoot`),`MaxMoneyLoot`=VALUES(`MaxMoneyLoot`);
