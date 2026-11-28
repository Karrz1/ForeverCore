-- Row 338 (VoldemarGreed "bugs 11", Discord 2026-11-23), two Gnomeregan / Iron Coral items.
-- 1. The Sparklematic 5200: each of the three machines in the Clean Room has its own chain: a first hand-in of a Grime-Encrusted
--    Object 9308 (2951 at 142487, 4601 at 175084, 4602 at 175085), then the box quest that gives the Sparklematic-Wrapped Box 9363
--    (2952, 4605, 4606), then the repeatable More Sparklematic Action (2953, 4603, 4604). Our data had the three box quests in one
--    exclusive group (2952), so once a player had the box from one machine, the other two machines took the first hand-in and then
--    had nothing more to give: "two of them can only be used once, and they don't dispense a box". VMaNGOS (14 June 2021) has no
--    exclusive group on any of them; the starters, enders, objectives and rewards here already match it.
-- 2. Iron Coral 1708 (dwarf/gnome/human warriors, Klockmort Spannerspan): the map showed only the turn-in, never where the coral is.
--    Searing Coral 6848 drops only from the Iron Coral objects 89634 (quest loot 4227), all 13 of ours under the water of the bay south
--    of Menethil Harbor (x -3905..-4156, y -663..-913). The marker is that area, 20 yd wider than the outermost corals, on the
--    Wetlands map (UiMap 1437, as Menethil's own quests use). INFERRED: the shape (live's marker is not sniffed); the place is the data.
-- Safe to run again.

-- 1. Sparklematic box quests: no exclusive group
UPDATE `quest_template_addon` SET `ExclusiveGroup`=0 WHERE `ID` IN (2952,4605,4606) AND `ExclusiveGroup`=2952;

-- 2. Iron Coral: objective marker
DELETE FROM `quest_poi` WHERE `QuestID`=1708 AND `BlobIndex`=0 AND `Idx1`=1;
INSERT INTO `quest_poi` (`QuestID`,`BlobIndex`,`Idx1`,`ObjectiveIndex`,`QuestObjectiveID`,`QuestObjectID`,`MapID`,`UiMapID`,`Priority`,`Flags`,`WorldEffectID`,`PlayerConditionID`,`NavigationPlayerConditionID`,`SpawnTrackingID`,`AlwaysAllowMergingBlobs`,`VerifiedBuild`) VALUES
(1708,0,1,0,90017084,6848,0,1437,0,1,0,0,0,0,0,0);
DELETE FROM `quest_poi_points` WHERE `QuestID`=1708 AND `Idx1`=1;
INSERT INTO `quest_poi_points` (`QuestID`,`Idx1`,`Idx2`,`X`,`Y`,`Z`,`VerifiedBuild`) VALUES
(1708,1,0,-4170,-648,0,0),
(1708,1,1,-4146,-763,0,0),
(1708,1,2,-3891,-927,0,0),
(1708,1,3,-3949,-848,0,0),
(1708,1,4,-3979,-804,0,0);
