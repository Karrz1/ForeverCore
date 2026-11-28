-- The Strange Orb 409289 comes back (2026_11_26_71 held it): its load errors were not its own. The dev log lines for 78088 are
-- creature 78088's (an old template, unrelated) and quest 78088's StartItem 209836 with ProvidedItemCount 0. The quest now hands
-- out its one Althalaxx Orb, and the orb stands on the top floor of the Tower of Althalaxx again (Everlake world data, GPL-3.0).
UPDATE `quest_template_addon` SET `ProvidedItemCount` = 1 WHERE `ID` = 78088 AND `ProvidedItemCount` = 0;
-- no addon row yet: a paladin quest (Everlake, Icy Veins) that hands out the one orb
INSERT IGNORE INTO `quest_template_addon` (`ID`, `AllowableClasses`, `ProvidedItemCount`) VALUES (78088, 2, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `StringId`, `VerifiedBuild`)
SELECT 920019100, 409289, 1, 0, 0, '0', 0, 0, 0, -1, 7178.79, -740.74, 94.12, 0, 0, 0, 0, 1, 120, 255, 1, '', NULL, 0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `gameobject_template` WHERE `entry` = 409289)
  AND NOT EXISTS (SELECT 1 FROM `gameobject` WHERE `id` = 409289);
INSERT INTO `gameobject_queststarter` (`id`, `quest`, `VerifiedBuild`) SELECT 409289, 78088, 0 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `gameobject_template` WHERE `entry` = 409289) AND EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 78088)
  AND NOT EXISTS (SELECT 1 FROM `gameobject_queststarter` WHERE `id` = 409289 AND `quest` = 78088);
-- Safe to run again.
