-- WoW Forever: the Goblin and Gnome Engineer's Renewal Gift 11422/11423 ItemSparse rows were pushed twice: by 2026_11_21_11
-- (live push, hotfix_data 2105458/2105459) and by 2026_11_21_95 (hotfix_data 26113830/26113831). The rows only differ in Flags2:
-- live sends 24576, the second kit has 24580 (adds the old "don't ignore buy price" flag, which these mail gifts never had).
-- Keep live's row and its push, remove the second push. Safe to run again.
UPDATE `item_sparse` SET `Flags2`=24576, `VerifiedBuild`=71037 WHERE `ID` IN (11422,11423);
DELETE FROM `hotfix_data` WHERE (`Id`,`TableHash`,`RecordId`) IN ((26113830,2442913102,11422),(26113831,2442913102,11423));
