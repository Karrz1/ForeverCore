-- WoW Forever: vendor items players saw these vendors sell in Forever that ours did not (Data from ForeverDB.net,
-- https://foreverdb.net, GPL-3.0, addon data 2026-11-22.f7a53319, build 1.60.1.71037). Money items only (items with no money
-- price, which cost currency or reputation, are left out). Only Forever item ids or Forever vendors, so none of it is Classic
-- data. Limited stock as seen; restock 2.5 h ESTIMATED (as 2026_11_21_55). Rows go in only if the vendor exists in our world.
-- Rows are replaced by key. Safe to run again.
-- Belandiel Farflight (254360)
DELETE FROM `npc_vendor` WHERE `entry`=254360 AND `item`=2321 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 254360,200,2321,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=254360;
DELETE FROM `npc_vendor` WHERE `entry`=254360 AND `item`=2605 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 254360,201,2605,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=254360;
DELETE FROM `npc_vendor` WHERE `entry`=254360 AND `item`=2692 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 254360,202,2692,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=254360;
DELETE FROM `npc_vendor` WHERE `entry`=254360 AND `item`=6530 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 254360,203,6530,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=254360;
-- Kerelle (255705)
DELETE FROM `npc_vendor` WHERE `entry`=255705 AND `item`=260629 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 255705,200,260629,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=255705;
DELETE FROM `npc_vendor` WHERE `entry`=255705 AND `item`=260631 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 255705,201,260631,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=255705;
DELETE FROM `npc_vendor` WHERE `entry`=255705 AND `item`=260632 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 255705,202,260632,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=255705;
DELETE FROM `npc_vendor` WHERE `entry`=255705 AND `item`=260633 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 255705,203,260633,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=255705;
-- Nioma (8160)
DELETE FROM `npc_vendor` WHERE `entry`=8160 AND `item`=252783 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 8160,200,252783,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=8160;
DELETE FROM `npc_vendor` WHERE `entry`=8160 AND `item`=252784 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 8160,201,252784,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=8160;
DELETE FROM `npc_vendor` WHERE `entry`=8160 AND `item`=252811 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 8160,202,252811,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=8160;
DELETE FROM `npc_vendor` WHERE `entry`=8160 AND `item`=252812 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 8160,203,252812,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=8160;
DELETE FROM `npc_vendor` WHERE `entry`=8160 AND `item`=252942 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 8160,204,252942,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=8160;
-- Flakk (3168)
DELETE FROM `npc_vendor` WHERE `entry`=3168 AND `item`=277716 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 3168,200,277716,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=3168;
-- Baelann Swiftcurrent (257008)
DELETE FROM `npc_vendor` WHERE `entry`=257008 AND `item`=6365 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 257008,200,6365,1,9000,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=257008;
-- Na'zok (256728)
DELETE FROM `npc_vendor` WHERE `entry`=256728 AND `item`=274977 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 256728,200,274977,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=256728;
-- Abigail Sawyer (4604)
DELETE FROM `npc_vendor` WHERE `entry`=4604 AND `item`=287063 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 4604,200,287063,1,9000,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=4604;
-- Frederick Stover (1298)
DELETE FROM `npc_vendor` WHERE `entry`=1298 AND `item`=287063 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 1298,200,287063,1,9000,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=1298;
-- Jin'sora (3410)
DELETE FROM `npc_vendor` WHERE `entry`=3410 AND `item`=287063 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 3410,200,287063,0,0,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=3410;
-- Kuna Thunderhorn (3015)
DELETE FROM `npc_vendor` WHERE `entry`=3015 AND `item`=287063 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 3015,200,287063,1,9000,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=3015;
-- Rallic Finn (1198)
DELETE FROM `npc_vendor` WHERE `entry`=1198 AND `item`=287063 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 1198,200,287063,1,9000,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=1198;
-- Skolmin Goldfury (5122)
DELETE FROM `npc_vendor` WHERE `entry`=5122 AND `item`=287063 AND `ExtendedCost`=0 AND `type`=1;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`,`type`,`BonusListIDs`,`PlayerConditionID`,`IgnoreFiltering`,`VerifiedBuild`) SELECT 5122,200,287063,1,9000,0,1,NULL,0,0,0 FROM `creature_template` WHERE `entry`=5122;
-- they must show as vendors (no change where the flag is already set)
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry` IN (254360,255705,8160,3168,257008,256728,4604,1298,3410,3015,1198,5122) AND (`npcflag`&128)=0;
