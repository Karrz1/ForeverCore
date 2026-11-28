-- WoW Forever client 1.60.1.71139 (Battle.net update seen 25 November 2026; a live capture made with it that evening reads with the
-- 71037/71091 message numbers and update fields, nothing unknown). Realm 70 stays on gamebuild 70707. A 71139 client sees and joins it
-- when bnetserver.conf and worldserver.conf have 71139 in Realm.AlsoAcceptBuilds (the repack's start script writes it from
-- repack\client-builds.txt); this row lets bnetserver and worldserver accept that client. 71139 clients get the 70790 numbering
-- (Classic.Build70790.FirstBuild = 70790 covers every later build) until a 71139 change is known.
-- No auth key is known for 71139: keep Network.SkipBuildAuthKeyCheck = 1 in worldserver.conf.
-- Every older build stays accepted. bnetserver and worldserver read build_info only at startup: restart both once after this update.
-- Safe to run again.
DELETE FROM `build_info` WHERE `build`=71139;
INSERT INTO `build_info` (`build`,`majorVersion`,`minorVersion`,`bugfixVersion`,`hotfixVersion`) VALUES
(71139,1,60,1,NULL);
