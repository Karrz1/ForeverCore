-- WoW Forever: Escape Plan (287026, gun) could only be shot from melee range (forever-bugs #539). Our row is the live record of build
-- 70862 (2026_11_09_41) with ItemRange 0, as live had before Blizzard's hotfix of 17 Nov ("Escape Plan now has correct range and damage
-- values"). Live sends no newer record for it in the public hotfix file, so ItemRange takes 100, the value of every other ranged weapon
-- row we hold (223 rows) and what live's own push 70888 gave the two wands of the same report, 287004 and 287036 (2026_11_12_50). The
-- damage is already Forever's 54-102 (classic_item_damage). Credit: Everlake (buildthehomelab, GPL-3) found it first.
-- New hotfix_data row so clients holding the 70862 record take this one. Safe to run again.
UPDATE `item_sparse` SET `ItemRange` = 100 WHERE `ID` = 287026;
DELETE FROM `hotfix_data` WHERE `Id` = 2106504 OR (`TableHash` = 2442913102 AND `RecordId` = 287026 AND `VerifiedBuild` = 71037);
INSERT INTO `hotfix_data` (`Id`,`UniqueId`,`TableHash`,`RecordId`,`Status`,`VerifiedBuild`) VALUES
(2106504,1397826504,2442913102,287026,1,71037);
