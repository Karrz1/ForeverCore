-- Zone weather nearer live (client 71037). Live captures 11-10 to 11-24 (36 files) show which zones rain or snow:
--   Stormwind City 1519: rain in 7 of 15 captures (579/580, overcast 581 first). Ours had no row, so it never rained there.
--   Loch Modan 38: snow 628 in 16 weather updates over 6 captures, rain twice. Ours had rain only.
--   Wetlands 11: rain in 11 of 24 updates over 7 captures (625/579/580). Ours 25%.
--   Darkshore 148: rain 11-24 (581, 579, 580 over 25 min), clear in the other captures. Ours 20% fall.
-- Dun Morogh 1 (snow) already matches live and is left alone. Rows are chances (percent) per season, rolled every
-- ChangeWeatherInterval. Needs ActivateWeather = 1 (default). Safe to run again.
DELETE FROM `game_weather` WHERE `zone` IN (1519,38,11,148);
INSERT INTO `game_weather` (`zone`,
  `spring_rain_chance`,`spring_snow_chance`,`spring_storm_chance`,
  `summer_rain_chance`,`summer_snow_chance`,`summer_storm_chance`,
  `fall_rain_chance`,`fall_snow_chance`,`fall_storm_chance`,
  `winter_rain_chance`,`winter_snow_chance`,`winter_storm_chance`,`ScriptName`) VALUES
(1519, 20,0,0, 15,0,0, 25,0,0, 25,0,0, ''),  -- Stormwind City (same as Elwynn, a bit wetter in fall/winter)
(38,   15,0,0, 15,0,0, 10,15,0, 5,25,0, ''), -- Loch Modan: TDB rain, plus snow in fall and winter
(11,   35,0,0, 25,0,0, 40,0,0, 40,0,0, ''),  -- Wetlands
(148,  20,0,0, 10,0,0, 30,0,0, 25,0,0, '');  -- Darkshore
