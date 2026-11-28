-- Zephras Isle: Ventaari Brightwish <Windshapers> (251487) and Falorne Fallwind <High Order> (251371) gave every Skyborne the
-- druid's greeting (Discord, DapperTetu 2026-11-25): the sniff only saw a druid, so each menu has only that text. A mage now gets
-- the High Order texts the client has: Ventaari 304013 ("...members of the High Order find very little common cause..."),
-- Falorne 304014 ("Greetings to you, fellow High Order initiate."). The druid texts stay the default. Safe to run again.
DELETE FROM `npc_text` WHERE `ID` IN (10141424, 10141425);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`, `VerifiedBuild`) VALUES
(10141424, 1, 304013, 0),
(10141425, 1, 304014, 0);
DELETE FROM `gossip_menu` WHERE (`MenuID` = 41424 AND `TextID` = 10141424) OR (`MenuID` = 41425 AND `TextID` = 10141425);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`, `VerifiedBuild`) VALUES
(41424, 10141424, 0),
(41425, 10141425, 0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND ((`SourceGroup` = 41424 AND `SourceEntry` = 10141424)
    OR (`SourceGroup` = 41425 AND `SourceEntry` = 10141425));
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`,
    `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(14, 41424, 10141424, 0, 0, 15, 0, 128, 0, 0, 0, 'Ventaari Brightwish - High Order greeting for a mage'),
(14, 41425, 10141425, 0, 0, 15, 0, 128, 0, 0, 0, 'Falorne Fallwind - High Order greeting for a mage');
