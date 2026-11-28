-- Vayn Moongaze's (254151) honored items use PlayerCondition 160975, which is missing from our data, so the vendor load
-- dropped those rows. Server-side condition: Honored (rank 5) with the Nightclaw faction 2758. No hotfix_data row: only
-- the server needs it.
-- From Sm0sher/TrinityCore-1 4557704257. Safe to run twice.
INSERT INTO `player_condition` (`ID`, `FailureDescription`, `Flags`, `MinFactionID1`, `MinReputation1`,
  `Gender`, `NativeGender`, `MinExpansionLevel`, `MaxExpansionLevel`, `MinExpansionTier`,
  `MaxExpansionTier`, `ChrSpecializationIndex`, `ChrSpecializationRole`, `PowerType`, `VerifiedBuild`)
SELECT 160975, '', 1, 2758, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, 70959
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `player_condition` WHERE `ID` = 160975);
