-- WoW Forever: BroadcastText 318392, the Manifest Clerk Philmor greeting (menu 43808, world 2026_11_22_18) that live sends
-- on request; the client lacks it. Seen in the 22 Nov 22:17 capture (client 71037). hotfix_data 2105950 (ours).
-- Safe to run again.
DELETE FROM `broadcast_text` WHERE `ID`=318392;
INSERT INTO `broadcast_text` (`ID`,`Text`,`Text1`,`LanguageID`,`ConditionID`,`EmotesID`,`Flags`,`ChatBubbleDurationMs`,`VoiceOverPriorityID`,`SoundKitID1`,`SoundKitID2`,`EmoteID1`,`EmoteID2`,`EmoteID3`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`VerifiedBuild`) VALUES
(318392,'Harbor work is open to everyone, but your personal safety is your own responsibility.','Harbor work is open to everyone, but your personal safety is your own responsibility.',0,0,0,256,0,4,0,0,0,0,0,0,0,0,71037);
DELETE FROM `hotfix_data` WHERE `Id`=2105950;
DELETE FROM `hotfix_data` WHERE `TableHash`=35137211 AND `RecordId`=318392;
INSERT INTO `hotfix_data` (`Id`,`UniqueId`,`TableHash`,`RecordId`,`Status`,`VerifiedBuild`) VALUES
(2105950,1397825950,35137211,318392,1,71037);
