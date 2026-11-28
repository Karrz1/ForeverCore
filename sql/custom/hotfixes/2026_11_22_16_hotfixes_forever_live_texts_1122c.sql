-- WoW Forever: two BroadcastText records live sends as hotfixes (push 112709, seen in the 22 Nov 15:45 capture) that our
-- hotfixes lacked: 324740 and 324742, the Arcanum of Binding and blade ritual texts. hotfix_data 2105726-2105727 (ours).
-- Safe to run again.
DELETE FROM `broadcast_text` WHERE `ID` IN (324740,324742);
INSERT INTO `broadcast_text` (`ID`,`Text`,`Text1`,`LanguageID`,`ConditionID`,`EmotesID`,`Flags`,`ChatBubbleDurationMs`,`VoiceOverPriorityID`,`SoundKitID1`,`SoundKitID2`,`EmoteID1`,`EmoteID2`,`EmoteID3`,`EmoteDelay1`,`EmoteDelay2`,`EmoteDelay3`,`VerifiedBuild`) VALUES
(324740,'Ah, the Arcanum of Binding! I thought it would be the cornerstone of the ritual to bind--never mind. Such knowledge would melt an inferior intellect.\r\n\r\nConnecting it to Luminarian''s works... yes, it makes sense. How did we not see it before? He did not earn the title of Magesmith merely by his arcane acumen, notable as it was; each of his masterworks involves powerful magic running through the very fibres of the metal. Truly unparalleled craftsmanship!\r\n\r\nThe power to make what never was, mine...','',0,0,0,256,0,4,0,0,5,1143,1143,0,1000,1000,71037),
(324742,'Silence, mortal. You would do well to know the punishment for interrupting the ruler of this kingdom.\r\n\r\nHow fortunate--I do possess the passage containing the ritual for the blade, taken from a series of... talks... I had with Luminarian many, many eons ago. The joy of seeing the shift in their eyes as they realize who they contend with. But I digress. It reads:\r\n\r\nAs night dances on, so must day wake\r\nTo rejoin one, its pair must await\r\nSo only pure of heart may wield\r\nBlade high or perfect dark must yield\r\n\r\nIn flames born of air it must be cast\r\nOnly then will the spirit bind last\r\n\r\n-L','',0,0,0,256,0,4,0,0,0,0,0,0,0,0,71037);
DELETE FROM `hotfix_data` WHERE `Id` BETWEEN 2105726 AND 2105799;
DELETE FROM `hotfix_data` WHERE (`TableHash`,`RecordId`) IN ((35137211,324740),(35137211,324742));
INSERT INTO `hotfix_data` (`Id`,`UniqueId`,`TableHash`,`RecordId`,`Status`,`VerifiedBuild`) VALUES
(2105726,1397825726,35137211,324740,1,71037),
(2105727,1397825727,35137211,324742,1,71037);
