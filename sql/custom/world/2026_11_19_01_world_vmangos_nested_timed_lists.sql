-- VMaNGOS scripts converted to SmartAI that never ran their main part. In VMaNGOS a script can start another one, which then
-- runs beside it; the conversion turned each into a timed action list calling another list on the same creature. The core
-- refuses a list started from inside a running list on the same creature, unless the called list has no delay at all
-- (SmartScript::SetTimedActionList, Server.log: "is trying to overwrite timed action list from a timed action"). Every case
-- below calls a list with delays, so only the caller's own rows ever ran. Same cause as Counterattack! (2026_11_19_00).
--
-- 1. Quest end events: the called list is merged into the caller at its absolute times (both timelines sorted by when they
--    fire, delays recomputed), as VMaNGOS ran them side by side. The called lists stay as they are, now unused.
--      2521 To Serve Kum'isha       Kum'isha the Collector (7363)    950000178 <- 950000177 (rift opening; its own data starts 104 s in)
--      4974 For The Horde!          Thrall (4949)                    950000230 <- 950000229 (speech, Warchief's Blessing)
--      7496 Celebrating Good Times  Major Mattingly (14394)          950000266 <- 950000265 (speech, Rallying Cry of the Dragonslayer)
--      7782 The Lord of Blackrock   Field Marshal Stonebridge (14721) 950000270 <- 950000269 (speech, Rallying Cry of the Dragonslayer)
--    Same for two waypoint scripts:
--      Tiev Mordune (7007), waypoint 5       950001346 <- 950001345 (the sapta spirit 5895 comes 15 s after his last line)
--      Andrea Halloran (1482), waypoint 7    950001032 <- 950001031 (Jesse on the wind tower). The called list was Jesse's own
--      script (VMaNGOS generic_scripts 144502) and its two lines are his ("I can't come down. I am scared.", "Whoa...
--      Aaaaahhh!", BroadcastText 304/305), filed under Andrea by the conversion: Jesse Halloran (1445) gets them as his groups
--      1 and 2 and says them himself.
-- 2. Eastvale Peasant (11328) waypoint scripts 950000804/808/813/905/909 called 950000802 (VMaNGOS 1061601) on the peasant:
--    Supervisor Raelen's "back to work" line and point. TDB already has Raelen say it (smart event 10616/0, peasant in range),
--    so the refused call is dropped and its delay moved onto the next row; the peasant's timing is unchanged.
-- Not touched: quest 5862 Scarlet Subterfuge (950000252 calls four lists whose lines belong to the guards around Highlord
-- Taelan Fordring, not to him: needs the VMaNGOS source to say who speaks), and 950000244 (quest 5541), which nothing calls.
-- Generated from the world database of 2026-11-19. Safe to run again.

-- 950000178
DELETE FROM `smart_scripts` WHERE `entryorguid` = 950000178 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(950000178,9,0,0,'',0,0,100,0,105000,105000,0,0,0,'',83,2,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 105 s in)'),
(950000178,9,1,0,'',0,0,100,0,7000,7000,0,0,0,'',1,5,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 112 s in)'),
(950000178,9,2,0,'',0,0,100,0,1000,1000,0,0,0,'',12,7364,1,15797,0,0,0,0,'',8,0,0,0,0,'',-11366.7998046875,-2979.60009765625,-0.1979999989271164,0.628000020980835,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 113 s in)'),
(950000178,9,3,0,'',0,0,100,0,2000,2000,0,0,0,'',5,51,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 115 s in)'),
(950000178,9,4,0,'',0,0,100,0,0,0,0,0,0,'',1,6,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 115 s in)'),
(950000178,9,5,0,'',0,0,100,0,0,0,0,0,0,'',86,10387,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 115 s in)'),
(950000178,9,6,0,'',0,0,100,0,1000,1000,0,0,0,'',12,7365,1,1609,0,0,0,0,'',8,0,0,0,0,'',-11364.7998046875,-2978.080078125,0.20999999344348907,0.5239999890327454,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 116 s in)'),
(950000178,9,7,0,'',0,0,100,0,2000,2000,0,0,0,'',12,7365,1,3235,0,0,0,0,'',8,0,0,0,0,'',-11365.2001953125,-2981.10009765625,0.7229999899864197,1.0119999647140503,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 118 s in)'),
(950000178,9,8,0,'',0,0,100,0,4000,4000,0,0,0,'',12,7365,1,2828,0,0,0,0,'',8,0,0,0,0,'',-11367.900390625,-2980.550048828125,1.253000020980835,0.6110000014305115,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 122 s in)'),
(950000178,9,9,0,'',0,0,100,0,3000,3000,0,0,0,'',12,7365,1,2438,0,0,0,0,'',8,0,0,0,0,'',-11367.900390625,-2977.97998046875,0.8320000171661377,0.22699999809265137,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 125 s in)'),
(950000178,9,10,0,'',0,0,100,0,8000,8000,0,0,0,'',1,7,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 133 s in)'),
(950000178,9,11,0,'',0,0,100,0,2000,2000,0,0,0,'',12,7401,1,21641,0,0,0,0,'',8,0,0,0,0,'',-11283.2998046875,-2978.300048828125,21.770000457763672,3.3269999027252197,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,12,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,21641,0,0,0,0,'',8,0,0,0,0,'',-11281.2001953125,-2979.60009765625,21.702999114990234,3.671999931335449,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,13,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,21641,0,0,0,0,'',8,0,0,0,0,'',-11278.900390625,-2978.77001953125,22.04599952697754,3.690999984741211,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,14,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,21641,0,0,0,0,'',8,0,0,0,0,'',-11283,-2977.419921875,21.756999969482422,3.2809998989105225,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,15,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,23250,0,0,0,0,'',8,0,0,0,0,'',-11326.5,-2940.199951171875,26.239999771118164,4.565000057220459,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,16,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,23250,0,0,0,0,'',8,0,0,0,0,'',-11326.900390625,-2945.389892578125,22.836000442504883,5.498000144958496,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,17,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,19610,0,0,0,0,'',8,0,0,0,0,'',-11346.900390625,-2926.889892578125,20.131000518798828,3.9700000286102295,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,18,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,19610,0,0,0,0,'',8,0,0,0,0,'',-11350,-2927.8701171875,19.972000122070312,4.739999771118164,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,19,0,'',0,0,100,0,0,0,0,0,0,'',12,7401,1,19610,0,0,0,0,'',8,0,0,0,0,'',-11353.099609375,-2930.60009765625,19.08799934387207,4.998000144958496,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 135 s in)'),
(950000178,9,20,0,'',0,0,100,0,13000,13000,0,0,0,'',1,8,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 148 s in)'),
(950000178,9,21,0,'',0,0,100,0,15000,15000,0,0,0,'',12,7409,1,10890,0,0,0,0,'',8,0,0,0,0,'',-11366.099609375,-2979.030029296875,1.0520000457763672,0.5410000085830688,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 163 s in)'),
(950000178,9,22,0,'',0,0,100,0,0,0,0,0,0,'',86,10451,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 163 s in)'),
(950000178,9,23,0,'',0,0,100,0,10000,10000,0,0,0,'',90,7,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 173 s in)'),
(950000178,9,24,0,'',0,0,100,0,2000,2000,0,0,0,'',1,9,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 175 s in)'),
(950000178,9,25,0,'',0,0,100,0,3000,3000,0,0,0,'',90,0,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 178 s in)'),
(950000178,9,26,0,'',0,0,100,0,0,0,0,0,0,'',82,2,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 2521 (merged from list 950000177, 178 s in)');

-- 950000230
DELETE FROM `smart_scripts` WHERE `entryorguid` = 950000230 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(950000230,9,0,0,'',0,0,100,0,0,0,0,0,0,'',12,10719,3,30000,0,0,0,0,'',8,0,0,0,0,'',-484.72198486328125,-2604.820068359375,127.947998046875,3.1679999828338623,'VMaNGOS generic_scripts 4974 (merged from list 950000229, 0 s in)'),
(950000230,9,1,0,'',0,0,100,0,0,0,0,0,0,'',83,3,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 4974 (merged from list 950000229, 0 s in)'),
(950000230,9,2,0,'',0,0,100,0,3000,3000,0,0,0,'',1,0,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 4974 (merged from list 950000229, 3 s in)'),
(950000230,9,3,0,'',0,0,100,0,10000,10000,0,0,0,'',1,1,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 4974 (merged from list 950000229, 13 s in)'),
(950000230,9,4,0,'',0,0,100,0,2000,2000,0,0,0,'',11,16609,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 4974 (merged from list 950000229, 15 s in)'),
(950000230,9,5,0,'',0,0,100,0,15000,15000,0,0,0,'',82,3,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 4974 (merged from list 950000229, 30 s in)');

-- 950000266
DELETE FROM `smart_scripts` WHERE `entryorguid` = 950000266 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(950000266,9,0,0,'',0,0,100,0,0,0,0,0,0,'',83,3,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7496 (merged from list 950000265, 0 s in)'),
(950000266,9,1,0,'',0,0,100,0,3000,3000,0,0,0,'',5,22,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7496 (merged from list 950000265, 3 s in)'),
(950000266,9,2,0,'',0,0,100,0,0,0,0,0,0,'',1,0,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7496 (merged from list 950000265, 3 s in)'),
(950000266,9,3,0,'',0,0,100,0,9000,9000,0,0,0,'',1,1,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7496 (merged from list 950000265, 12 s in)'),
(950000266,9,4,0,'',0,0,100,0,0,0,0,0,0,'',5,22,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7496 (merged from list 950000265, 12 s in)'),
(950000266,9,5,0,'',0,0,100,0,8000,8000,0,0,0,'',11,22888,2,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7496 (merged from list 950000265, 20 s in)'),
(950000266,9,6,0,'',0,0,100,0,5000,5000,0,0,0,'',82,3,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7496 (merged from list 950000265, 25 s in)');

-- 950000270
DELETE FROM `smart_scripts` WHERE `entryorguid` = 950000270 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(950000270,9,0,0,'',0,0,100,0,0,0,0,0,0,'',83,3,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7782 (merged from list 950000269, 0 s in)'),
(950000270,9,1,0,'',0,0,100,0,3000,3000,0,0,0,'',5,22,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7782 (merged from list 950000269, 3 s in)'),
(950000270,9,2,0,'',0,0,100,0,0,0,0,0,0,'',1,0,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7782 (merged from list 950000269, 3 s in)'),
(950000270,9,3,0,'',0,0,100,0,11000,11000,0,0,0,'',1,1,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7782 (merged from list 950000269, 14 s in)'),
(950000270,9,4,0,'',0,0,100,0,0,0,0,0,0,'',5,22,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7782 (merged from list 950000269, 14 s in)'),
(950000270,9,5,0,'',0,0,100,0,6000,6000,0,0,0,'',11,22888,2,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7782 (merged from list 950000269, 20 s in)'),
(950000270,9,6,0,'',0,0,100,0,5000,5000,0,0,0,'',82,3,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 7782 (merged from list 950000269, 25 s in)');

-- Eastvale Peasant: drop the refused call of 950000802, its delay goes to the next row.
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `action_type` = 80 AND `action_param1` = 950000802 AND `entryorguid` IN (950000804,950000808,950000813,950000905,950000909);
UPDATE `smart_scripts` SET `event_param1` = 6000, `event_param2` = 6000 WHERE `entryorguid` = 950000804 AND `source_type` = 9 AND `id` = 4;
UPDATE `smart_scripts` SET `event_param1` = 7000, `event_param2` = 7000 WHERE `entryorguid` IN (950000808,950000813,950000905,950000909) AND `source_type` = 9 AND `id` = 3;

-- 950001032
DELETE FROM `smart_scripts` WHERE `entryorguid` = 950001032 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(950001032,9,0,0,'',0,0,100,0,0,0,0,0,0,'',1,0,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS creature_movement_scripts 148201'),
(950001032,9,1,0,'',0,0,100,0,3000,3000,0,0,0,'',1,1,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 144502 (merged from list 950001031, 3 s in)'),
(950001032,9,2,0,'',0,0,100,0,2000,2000,0,0,0,'',1,2,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS generic_scripts 144502 (merged from list 950001031, 5 s in)'),
(950001032,9,3,0,'',0,0,100,0,2000,2000,0,0,0,'',1,3,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS creature_movement_scripts 148201');

-- 950001346
DELETE FROM `smart_scripts` WHERE `entryorguid` = 950001346 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`Difficulties`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`event_param_string`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`action_param7`,`action_param_string`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_param_string`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(950001346,9,0,0,'',0,0,100,0,0,0,0,0,0,'',66,0,0,0,0,0,0,0,'',21,10,0,0,0,'',0,0,0,0,'VMaNGOS creature_movement_scripts 700701'),
(950001346,9,1,0,'',0,0,100,0,0,0,0,0,0,'',1,2,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS creature_movement_scripts 700701'),
(950001346,9,2,0,'',0,0,100,0,2000,2000,0,0,0,'',5,16,0,0,0,0,0,0,'',1,0,0,0,0,'',0,0,0,0,'VMaNGOS creature_movement_scripts 700701'),
(950001346,9,3,0,'',0,0,100,0,3000,3000,0,0,0,'',1,3,0,1,0,0,0,0,'',7,0,0,0,0,'',0,0,0,0,'VMaNGOS creature_movement_scripts 700701'),
(950001346,9,4,0,'',0,0,100,0,16000,16000,0,0,0,'',12,5895,1,360000,0,0,0,0,'',8,0,0,0,0,'',417.0400085449219,1822.6600341796875,12.609999656677246,1.4830000400543213,'VMaNGOS generic_scripts 100 (merged from list 950001345, 21 s in)');

-- Andrea Halloran's list: Jesse says his two lines (the target creature talks when useTalkTarget is 0).
UPDATE `smart_scripts` SET `target_type` = 10, `target_param1` = 20009566, `target_param2` = 1445, `action_param3` = 0
  WHERE `entryorguid` = 950001032 AND `source_type` = 9 AND `action_type` = 1 AND `comment` LIKE '%merged from list 950001031%';
DELETE FROM `creature_text` WHERE `CreatureID` = 1445 AND `GroupID` IN (1,2);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundPlayType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(1445,1,0,'I can''t come down.  I am scared.',12,7,100,0,0,0,0,304,0,'Jesse Halloran - on the wind tower (VMaNGOS generic_scripts 144502)'),
(1445,2,0,'Whoa...Whoa..Aaaaahhh!',12,7,100,0,0,0,0,305,0,'Jesse Halloran - falls from the wind tower (VMaNGOS generic_scripts 144502)');
