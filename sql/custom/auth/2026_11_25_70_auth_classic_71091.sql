-- WoW Forever client 1.60.1.71091 (Battle.net update of 24 November 2026, buildConfig 3cd52a7a64f9bad078020b1e95af8a00; first seen in
-- the US, queued, at 17:29Z). Realm 70 stays on gamebuild 70707. A 71091 client sees and joins it when bnetserver.conf and
-- worldserver.conf have 71091 in Realm.AlsoAcceptBuilds (the repack's start script writes it from repack\client-builds.txt); this row
-- lets bnetserver and worldserver accept that client. Its message numbers are handled per connection: 71091 clients get the 70790
-- numbering (Classic.Build70790.FirstBuild = 70790 covers every later build) until a 71091 change is known.
-- No auth key is known for 71091: keep Network.SkipBuildAuthKeyCheck = 1 in worldserver.conf.
-- Every older build stays accepted. bnetserver and worldserver read build_info only at startup: restart both once after this update.
-- Safe to run again.
DELETE FROM `build_info` WHERE `build`=71091;
INSERT INTO `build_info` (`build`,`majorVersion`,`minorVersion`,`bugfixVersion`,`hotfixVersion`) VALUES
(71091,1,60,1,NULL);
