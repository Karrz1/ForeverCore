-- WoW Forever: live capture of 22 Nov 11:20-13:39 (client 71037; Wetlands, Menethil Harbor, Stormwind, Hillsbrad, Darkshore).
-- Only what the world DB lacked or had different from live. Safe to run again.

-- 1. NPCs live spawns that we spawn nowhere (guids 46130015-46130021). Their templates are already in the world DB.
--    Menethil Harbor: Aman 3582, Gabrandal Matters 276799, Dwyer 277287. Stormwind: Brother Romulus 205278,
--    Annabella Junelight 274940, Idrieth Mossgrove 276318, Krazore 277721 (wanders, as on live).
DELETE FROM `creature` WHERE `guid` BETWEEN 46130015 AND 46130021;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`,
  `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `ScriptName`, `VerifiedBuild`) VALUES
(46130015, 3582, 0, 11, 150, '0', 0, 0, 0, -1, 0, 1, -3807.6797, -838.6364, 17.1563, 3.176499, 120, 0, 0, 100, 0, '', 71037),
(46130016, 205278, 0, 1519, 0, '0', 0, 0, 0, -1, 0, 1, -8530.5908, 868.8472, 106.6003, 4.088528, 120, 0, 0, 100, 0, '', 71037),
(46130017, 274940, 0, 1519, 0, '0', 0, 0, 0, -1, 0, 1, -8550.0684, 889.4641, 96.7614, 5.390660, 120, 0, 0, 100, 0, '', 71037),
(46130018, 276318, 0, 1519, 17203, '0', 0, 0, 0, -1, 0, 1, -8626.9902, 1271.4681, 5.3174, 5.518487, 120, 0, 0, 100, 0, '', 71037),
(46130019, 276799, 0, 11, 150, '0', 0, 0, 0, -1, 0, 1, -3841.8811, -747.9311, 8.5567, 0.000000, 120, 0, 0, 100, 0, '', 71037),
(46130020, 277287, 0, 11, 150, '0', 0, 0, 0, -1, 0, 1, -3719.8191, -705.4332, 8.0036, 0.728533, 120, 0, 0, 100, 0, '', 71037),
(46130021, 277721, 0, 1519, 0, '0', 0, 0, 0, -1, 0, 1, -8560.9678, 761.5904, 96.8000, 0.621109, 120, 10, 0, 100, 1, '', 71037);

-- 2. Weapons live shows: Southshore Guard 2386 carries the Silver Musket 12523 (ours had 2551). Stormwind Dock Worker 249215
--    comes in two looks on live (1902 and 1911); ours had only 1911 and our three spawns used no weapon set at all, so add
--    the second set and let every spawn pick one at random.
UPDATE `creature_equip_template` SET `ItemID3`=12523, `AppearanceModID3`=0, `ItemVisual3`=0 WHERE `CreatureID`=2386 AND `ID`=1;
DELETE FROM `creature_equip_template` WHERE `CreatureID`=249215 AND `ID`=2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`,
  `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES
(249215, 2, 1902, 0, 0, 0, 0, 0, 0, 0, 0, 71037);
UPDATE `creature` SET `equipment_id`=-1 WHERE `id`=249215;
-- Gabrandal Matters 276799 and Krazore 277721 (spawned above) carry weapons on live.
DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (276799,277721) AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`,
  `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES
(276799, 1, 5281, 0, 0, 5281, 0, 0, 0, 0, 0, 71037),
(277721, 1, 3326, 0, 0, 0, 0, 0, 0, 0, 0, 71037);

-- 3. Russian turn-in and progress texts live sends that we had none of: Crocs of the Sky 98072, Highland Hides 98815.
--    Only where missing.
INSERT IGNORE INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (98072,'ruRU','Да у тебя просто дар от природы! Кстати, если когда-нибудь решишь отдохнуть от приключений, загляни к своему приятелю Джеймсу. Я сразу же подыщу тебе работу!\r\n\r\nХотя, полагаю, к тому времени ты порядком состаришься. Ну и ладно!',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98072,'ruRU','А, $n! $gДобыл:Добыла; чешуйки?',71037);
INSERT IGNORE INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (98815,'ruRU','С возвращением, |3-6($c). Ищешь кожевенное масло, чтобы смазать снаряжение?',71037);
