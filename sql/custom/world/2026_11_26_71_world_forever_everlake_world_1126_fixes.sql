-- Fixes for 2026_11_26_70 (Everlake world data 1126), from the dev run on af84.
-- 1. Seven vendors and trainers did not spawn: their displays had no `creature_model_info` row ("No model data exist"). Each display
--    of these templates that lacks one gets the usual humanoid size (0.306 / 1.5); a later sniff replaces it.
INSERT IGNORE INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`, `VerifiedBuild`)
SELECT DISTINCT m.`CreatureDisplayID`, 0.306, 1.5, 0, 0
FROM `creature_template_model` m
LEFT JOIN `creature_model_info` i ON i.`DisplayID` = m.`CreatureDisplayID`
WHERE m.`CreatureID` IN (255701, 255703, 255721, 255724, 255877, 270278, 270280) AND i.`DisplayID` IS NULL AND m.`CreatureDisplayID` > 0;

-- 2. The five new Ogre Miners had curHealthPct 100 on creatures that regenerate (a load warning): no value, as the realm's others.
UPDATE `creature` SET `curHealthPct` = NULL WHERE `guid` BETWEEN 920018010 AND 920018014 AND `id` = 260995 AND `curHealthPct` = 100;

-- 3. Duke Ragereaver 10820 holds item 45528, which the 1.60 client does not have (load error now that he is spawned): no weapon.
UPDATE `creature_equip_template` SET `ItemID1` = 0 WHERE `CreatureID` = 10820 AND `ItemID1` = 45528;
UPDATE `creature_equip_template` SET `ItemID2` = 0 WHERE `CreatureID` = 10820 AND `ItemID2` = 45528;
UPDATE `creature_equip_template` SET `ItemID3` = 0 WHERE `CreatureID` = 10820 AND `ItemID3` = 45528;

-- 4. The Strange Orb 409289 (start of A Strange Artifact 78088) gave load errors: held until they are looked at. Its spawn and its
--    quest start go; the quest stays as it was before 2026_11_26_70.
DELETE FROM `gameobject` WHERE `guid` = 920019100 AND `id` = 409289;
DELETE FROM `gameobject_queststarter` WHERE `id` = 409289 AND `quest` = 78088;
-- Safe to run again.
