-- City of Dalaran (map 2959): a safe location for the sewer landing, so the dungeon finder can send a group in as it does for
-- the other eight Forever dungeons (the client's Group Finder lists City of Dalaran, activity 896). Players still come in
-- through the Sewer Grate (656283) with the Dalaran Sewer Key; this is the spot the grate already puts them on
-- (classic_instance_city_of_dalaran.cpp CodSewerLanding), and the spot outside is the grate itself in Alterac.
-- Safe locations 1104130 (inside) and 1104131 (outside). Safe to run again.
DELETE FROM `world_safe_locs` WHERE `ID` IN (1104130,1104131);
INSERT INTO `world_safe_locs` (`ID`,`MapID`,`LocX`,`LocY`,`LocZ`,`Facing`,`Comment`) VALUES
(1104130,2959,309.8,384.0,67.5,3.90,'City of Dalaran (dungeon) - entrance inside, the sewer landing'),
(1104131,0,388.845,537.441,45.8465,0,'City of Dalaran (dungeon) - exit outside, the Sewer Grate in Alterac');
