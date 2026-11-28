-- Alcaz Prison (map 2994): the way in and out, the Prisoners and the levels as live has them.
-- Source: a live capture made on 26 November 2026 (client 1.60.1.71139) of a full clear (Overseer Wrex, Katerina the Cleaner,
-- Blazeroar, then The Questioner), 21:59-22:13.
--  * the entrance on Alcaz Island: the player walked north-west and was sent in at (-2527.83, -4928.87, 22.70). Ours is a sphere of
--    5 yards at (-2558.3, -4912.5, 33.0), 35 yards away and 10 yards higher. Its middle moves 5 yards past where live fired, so its
--    edge is where live fired (INFERRED: live's trigger is server side, its size and middle are not in the capture).
--  * the exit: the player walked south from the landing onto the Alcaz Island Instance Portal and was sent out at (-8795.59, 2825.96,
--    34.17). Ours is a sphere of 4 yards at (-8798, 2806, 40), 20 yards further. Its middle moves 4 yards past where live fired.
--  * the spot outside: live puts the player at (-2521.53, -4932.64, 25.40), facing 5.496 (ours was (-2566, -4905, 32.5)).
--    The landing inside (1104124) already matches live (-8796.59, 2838.67, 28.77) and stays.
--  * the Prisoners (256284) are friendly on live (faction 35); ours were hostile (16) and fought, so they now stand by.
--  * levels: live's are lower than ours. Trash 48-49 (ours 50-52; the three Servitors were seen once each at 48/49, so they take the
--    trash range, INFERRED), Slavering Hound 47, Prisoners 46-50, Mason Connery 46-48; bosses Wrex 50, The Questioner 51,
--    Katerina 52, Blazeroar 53; Commander Folkar 55. Health modifiers already match live's, except Blazeroar (live 10, ours 12).
--    Factions of the trash (live 17 and 74, ours 16, all hostile) are not changed here.
-- Not here (held for the next update with the bot route): live's spawn spots, the prison gates and cell doors, the boss spots.
-- Safe to run again.
UPDATE `areatrigger` SET `PosX` = -2531.7, `PosY` = -4925.8, `PosZ` = 22.7,
  `Comment` = 'Alcaz Prison - dungeon entrance (Alcaz Island; live sends players in at -2527.8 -4928.9 22.7)' WHERE `SpawnId` = 34;
UPDATE `areatrigger` SET `PosX` = -8795.7, `PosY` = 2822.0, `PosZ` = 34.2,
  `Comment` = 'Alcaz Prison (dungeon) - exit (the Alcaz Island Instance Portal; live sends players out at -8795.6 2826.0 34.2)' WHERE `SpawnId` = 35;
UPDATE `world_safe_locs` SET `LocX` = -2521.53, `LocY` = -4932.64, `LocZ` = 25.40, `Facing` = 5.496,
  `Comment` = 'Alcaz Prison (dungeon) - exit outside, Alcaz Island (live capture 26 Nov 2026)' WHERE `ID` = 1104125;
UPDATE `world_safe_locs` SET `Comment` = 'Alcaz Prison (dungeon) - entrance inside, the stair below the door (matches live capture 26 Nov 2026)' WHERE `ID` = 1104124;
UPDATE `game_tele` SET `position_x` = -2521.53, `position_y` = -4932.64, `position_z` = 25.40, `orientation` = 5.496 WHERE `name` = 'AlcazPrisonEntrance';
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` = 256284;
UPDATE `creature_template_difficulty` SET `HealthModifier` = 10 WHERE `Entry` = 255702 AND `DifficultyID` = 0;
DELETE FROM `creature_classic_level` WHERE `entry` IN (255262,255267,255271,255276,255309,255364,255366,255367,255369,255373,255377,255995,256284,264770,255391,256236,257016,255702,260386);
INSERT INTO `creature_classic_level` (`entry`,`level_min`,`level_max`) VALUES
(255262,48,49) /* Alcaz Chaplain: ours 50-52 */,
(255267,47,47) /* Slavering Hound: ours 50-52 */,
(255271,48,49) /* Defias Truthfinder: ours 50-52 */,
(255276,48,49) /* Defias Mercenary: ours 50-52 */,
(255309,48,49) /* Defias Bounty Hunter: ours 50-52 */,
(255364,48,49) /* Renegade Conjurer: ours 50-52 */,
(255366,48,49) /* Molten Servitor: ours 50-52 */,
(255367,48,49) /* Frozen Servitor: ours 50-52 */,
(255369,48,49) /* Arcane Servitor: ours 50-52 */,
(255373,48,49) /* Strashaz Enchantress: ours 50-52 */,
(255377,48,49) /* Alcaz Jailer: ours 50-52 */,
(255995,48,49) /* Strashaz Soldier: ours 50-52 */,
(256284,46,50) /* Prisoner: ours 48 */,
(264770,46,48) /* Mason Connery: ours 50 */,
(255391,50,50) /* Overseer Wrex: ours 53 */,
(256236,51,51) /* The Questioner: ours 54 */,
(257016,52,52) /* Katerina the Cleaner: ours 54 */,
(255702,53,53) /* Blazeroar: ours 55 */,
(260386,55,55) /* Commander Folkar: ours 53 */;
