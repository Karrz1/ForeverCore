-- Molten Core tier 1: 16849-16868 were in hotfix_data twice, once from 2026_11_21_85 (26112237-26112256, the new rows) and
-- once from 2026_11_21_86 (26112720-26112739, their Classic sell price). Both push the same ItemSparse record, so each went
-- out twice. Keep the later push, which carries the sell price, and drop the earlier one.
-- Its comment changed after it was applied (mct1-1121b), so the update tool may run 2026_11_21_85 again; that would set the 20
-- sell prices back to 0. Set them again here, so they hold whichever way the files ran.
DELETE FROM `hotfix_data` WHERE `Id` BETWEEN 26112237 AND 26112256 AND `TableHash`=2442913102 AND `RecordId` BETWEEN 16849 AND 16868;
UPDATE `item_sparse` SET `SellPrice`=41382, `BuyPrice`=165528 WHERE `ID`=16849;
UPDATE `item_sparse` SET `SellPrice`=27564, `BuyPrice`=110256 WHERE `ID`=16850;
UPDATE `item_sparse` SET `SellPrice`=27663, `BuyPrice`=110652 WHERE `ID`=16851;
UPDATE `item_sparse` SET `SellPrice`=27762, `BuyPrice`=111048 WHERE `ID`=16852;
UPDATE `item_sparse` SET `SellPrice`=37144, `BuyPrice`=148576 WHERE `ID`=16853;
UPDATE `item_sparse` SET `SellPrice`=27956, `BuyPrice`=111824 WHERE `ID`=16854;
UPDATE `item_sparse` SET `SellPrice`=33848, `BuyPrice`=135392 WHERE `ID`=16855;
UPDATE `item_sparse` SET `SellPrice`=25485, `BuyPrice`=101940 WHERE `ID`=16856;
UPDATE `item_sparse` SET `SellPrice`=17054, `BuyPrice`=68216 WHERE `ID`=16857;
UPDATE `item_sparse` SET `SellPrice`=17119, `BuyPrice`=68476 WHERE `ID`=16858;
UPDATE `item_sparse` SET `SellPrice`=25778, `BuyPrice`=103112 WHERE `ID`=16859;
UPDATE `item_sparse` SET `SellPrice`=17249, `BuyPrice`=68996 WHERE `ID`=16860;
UPDATE `item_sparse` SET `SellPrice`=17786, `BuyPrice`=71144 WHERE `ID`=16861;
UPDATE `item_sparse` SET `SellPrice`=26778, `BuyPrice`=107112 WHERE `ID`=16862;
UPDATE `item_sparse` SET `SellPrice`=17917, `BuyPrice`=71668 WHERE `ID`=16863;
UPDATE `item_sparse` SET `SellPrice`=17981, `BuyPrice`=71924 WHERE `ID`=16864;
UPDATE `item_sparse` SET `SellPrice`=36095, `BuyPrice`=144380 WHERE `ID`=16865;
UPDATE `item_sparse` SET `SellPrice`=27170, `BuyPrice`=108680 WHERE `ID`=16866;
UPDATE `item_sparse` SET `SellPrice`=36358, `BuyPrice`=145432 WHERE `ID`=16867;
UPDATE `item_sparse` SET `SellPrice`=27364, `BuyPrice`=109456 WHERE `ID`=16868;
