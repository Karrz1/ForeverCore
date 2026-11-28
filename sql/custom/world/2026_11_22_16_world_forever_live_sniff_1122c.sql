-- WoW Forever: live capture of 22 Nov 15:45-16:24 (client 71037; Stormwind, Elwynn, Westfall). Only what the world DB had
-- different from live. Safe to run again.

-- Stormwind City Patroller 1976 carries two weapon looks on live (2715 and 1899, each with shield 143); ours had only 2715.
-- Add the second set and let the spawns that used set 1 pick one at random.
DELETE FROM `creature_equip_template` WHERE `CreatureID`=1976 AND `ID`=2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`,
  `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES
(1976, 2, 1899, 0, 0, 143, 0, 0, 0, 0, 0, 71037);
UPDATE `creature` SET `equipment_id`=-1 WHERE `id`=1976 AND `equipment_id`=1;
