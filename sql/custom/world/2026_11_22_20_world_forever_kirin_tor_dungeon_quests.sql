-- WoW Forever: four of the Kirin Tor dungeon quests live gives Alliance players (reputation with the Kirin Tor, faction 2740).
-- Archmage Timear (31439): Ancient Gurubashi Secrets 97130 (the Drowned City). Archmage Lan'dalock (20735): The Witch Doctor's
-- Head 96770 (Zul'Farrak), The Dragon's Journal 96772 (Alcaz Prison). Magus Olvek (264265): Past Due 96800 (Scarlet Monastery
-- Library), added only where the book it asks for (object 650929, The Lost Magic of the Runemasters) is spawned.
-- Their givers are spawned in our world already (2026_11_05_99), and the items they ask for already drop: 276894 (Deathless
-- Marrow, 2026_11_11_30), 277112 (Zum'rah, 2026_11_19_68), 276890 (Blazeroar, 2026_11_14_41), 273169 (object 650929).
-- Sources (read as data): quest text, levels, objectives, rewards and races are Blizzard's records as players' clients got them
-- on the live realm: Efficient Games' EG Link export (github.com/JIVESCORP/eg-link-output-wowf 1bf749b, quests.enUS.json, builds
-- 1.60.1.70959 and 71037). Data from Efficient Games (https://efficient.games), licensed under CC BY 4.0
-- (https://creativecommons.org/licenses/by/4.0/). Changed: converted to our quest rows.
-- Givers and turn-ins: Wowhead's WoW Forever quest pages (read 2026-11-21).
-- Reward and completion texts: Everlake's world data (github.com/buildthehomelab/wow-everlake-world-data, GPL-3.0), Forge import
-- files 00035 and 00196: the texts only, written here as our own rows.
-- Held (need data we lack): The Coldbringer's Eye 96773 (its eye comes from object 660624, not in our world), Vengeance of the
-- Highborne 96771 (its kill target 268423 is not spawned), Blackmaw Magic 97173 (Blackmaw Hold's boss drop 276893 is held).
-- Safe to run again: every key is deleted first.

-- 97130 Ancient Gurubashi Secrets (live record, EG Link): giver and turn-in 31439 Archmage Timear (Wowhead)
DELETE FROM `quest_template` WHERE `ID`=97130;
DELETE FROM `quest_classic_level` WHERE `ID`=97130;
DELETE FROM `quest_template_classic_level` WHERE `ID`=97130;
DELETE FROM `quest_template_addon` WHERE `ID`=97130;
DELETE FROM `quest_offer_reward` WHERE `ID`=97130;
DELETE FROM `quest_request_items` WHERE `ID`=97130;
DELETE FROM `quest_classic_money` WHERE `ID`=97130;
DELETE FROM `creature_queststarter` WHERE `quest`=97130;
DELETE FROM `creature_questender` WHERE `quest`=97130;
DELETE FROM `quest_objectives` WHERE `QuestID`=97130;
INSERT INTO `quest_template` (`ID`,`QuestType`,`LogTitle`,`VerifiedBuild`) SELECT 97130,2,'Ancient Gurubashi Secrets',-1;
UPDATE `quest_template` SET `QuestDescription`='Lan''dalock and I have been discussing a recent development in the south seas involving an ancient Gurubashi ruin that has suddenly appeared off the coast of Stranglethorn Vale.\n\nSuch a site has significant archeological value. We''d be highly interested in obtaining one of the idols that certain witch doctors amongst the ancient Gurubashi would use as a ritual focus for their blood magic.\n\nEnter this "Drowned City" and recover one of these idols for us.', `LogDescription`='Recover an Ancient Gurubashi Idol from the Drowned City.', `AreaDescription`='', `QuestCompletionLog`='', `QuestSortID`=16550, `QuestInfoID`=81, `RewardNextQuest`=0, `RewardXPDifficulty`=6, `RewardXPMultiplier`=2.675, `RewardSpell`=0, `StartItem`=0, `Flags`=8, `FlagsEx`=0, `AllowableRaces`=6130900294268439629, `TimeAllowed`=0, `VerifiedBuild`=70959, `RewardChoiceItemID1`=0, `RewardChoiceItemQuantity1`=0, `RewardChoiceItemID2`=0, `RewardChoiceItemQuantity2`=0, `RewardChoiceItemID3`=0, `RewardChoiceItemQuantity3`=0, `RewardChoiceItemID4`=0, `RewardChoiceItemQuantity4`=0, `RewardChoiceItemID5`=0, `RewardChoiceItemQuantity5`=0, `RewardChoiceItemID6`=0, `RewardChoiceItemQuantity6`=0, `RewardFactionID1`=2740, `RewardFactionValue1`=7, `RewardFactionOverride1`=30000, `RewardFactionID2`=72, `RewardFactionValue2`=6, `RewardFactionOverride2`=0, `RewardFactionID3`=0, `RewardFactionValue3`=0, `RewardFactionOverride3`=0, `RewardFactionID4`=0, `RewardFactionValue4`=0, `RewardFactionOverride4`=0, `RewardFactionID5`=0, `RewardFactionValue5`=0, `RewardFactionOverride5`=0 WHERE `ID`=97130;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT 97130,40,34,0;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT 97130,2,40;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) SELECT 97130,0,0,0;
INSERT INTO `quest_offer_reward` (`ID`,`RewardText`,`VerifiedBuild`) SELECT 97130,'Thank you for recovering this. Lan''dalock and I have long debated the nature of Gurubashi blood magic. An artifact such as this should be invaluable in helping us better understand this primal magic.',0;
INSERT INTO `quest_request_items` (`ID`,`CompletionText`,`VerifiedBuild`) SELECT 97130,'Gurubashi blood magic is most distasteful, but still highly fascinating. Did you know that the ancient troll empires would periodically initiate a ritual known as the "Blood Moon" that would deliberately induce an insatiable madness and bloodlust on their entire population?$B$BWhy deliberately inflict a period of merciless bedlam and carnage on your people? To what end? It''s deeply fascinating in an academic sense, but I shudder to think of how brutal life must have been in such a culture.',0;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT 97130,5000,0;
DELETE FROM `quest_objectives` WHERE `ID`=475166;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`) SELECT 475166,97130,1,0,0,276894,1,0,0,0,0.0,0,1,NULL,70959;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) SELECT 31439,97130,0;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) SELECT 31439,97130,0;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=31439;

-- 96770 The Witch Doctor's Head (live record, EG Link): giver and turn-in 20735 Archmage Lan'dalock (Wowhead)
DELETE FROM `quest_template` WHERE `ID`=96770;
DELETE FROM `quest_classic_level` WHERE `ID`=96770;
DELETE FROM `quest_template_classic_level` WHERE `ID`=96770;
DELETE FROM `quest_template_addon` WHERE `ID`=96770;
DELETE FROM `quest_offer_reward` WHERE `ID`=96770;
DELETE FROM `quest_request_items` WHERE `ID`=96770;
DELETE FROM `quest_classic_money` WHERE `ID`=96770;
DELETE FROM `creature_queststarter` WHERE `quest`=96770;
DELETE FROM `creature_questender` WHERE `quest`=96770;
DELETE FROM `quest_objectives` WHERE `QuestID`=96770;
INSERT INTO `quest_template` (`ID`,`QuestType`,`LogTitle`,`VerifiedBuild`) SELECT 96770,2,'The Witch Doctor''s Head',-1;
UPDATE `quest_template` SET `QuestDescription`='There exists a troll witch doctor that goes by the name of Zum''rah. I have history with this particular troll, and I''d like you to kill him for me.\n\nGo to the Sandfury stronghold of Zul''Farrak, deep in the deserts of Tanaris. Find Zum''rah inside and destroy him. Bring his head to me--intact--and I''ll see that you are fairly compensated.', `LogDescription`='Slay Witch Doctor Zum''rah and bring Zum''rah''s Head to Archmage Lan''dalock in Dalaran.', `AreaDescription`='', `QuestCompletionLog`='', `QuestSortID`=1176, `QuestInfoID`=81, `RewardNextQuest`=0, `RewardXPDifficulty`=6, `RewardXPMultiplier`=2.0, `RewardSpell`=0, `StartItem`=0, `Flags`=8, `FlagsEx`=0, `AllowableRaces`=6130900294268439629, `TimeAllowed`=0, `VerifiedBuild`=70959, `RewardChoiceItemID1`=0, `RewardChoiceItemQuantity1`=0, `RewardChoiceItemID2`=0, `RewardChoiceItemQuantity2`=0, `RewardChoiceItemID3`=0, `RewardChoiceItemQuantity3`=0, `RewardChoiceItemID4`=0, `RewardChoiceItemQuantity4`=0, `RewardChoiceItemID5`=0, `RewardChoiceItemQuantity5`=0, `RewardChoiceItemID6`=0, `RewardChoiceItemQuantity6`=0, `RewardFactionID1`=2740, `RewardFactionValue1`=7, `RewardFactionOverride1`=30000, `RewardFactionID2`=0, `RewardFactionValue2`=0, `RewardFactionOverride2`=0, `RewardFactionID3`=0, `RewardFactionValue3`=0, `RewardFactionOverride3`=0, `RewardFactionID4`=0, `RewardFactionValue4`=0, `RewardFactionOverride4`=0, `RewardFactionID5`=0, `RewardFactionValue5`=0, `RewardFactionOverride5`=0 WHERE `ID`=96770;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT 96770,46,39,0;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT 96770,2,46;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) SELECT 96770,0,0,0;
INSERT INTO `quest_offer_reward` (`ID`,`RewardText`,`VerifiedBuild`) SELECT 96770,'Thank you for your service to the Kirin Tor, $N. Here is your reward.$B$B<After handing you your reward, Archmage Lan''dalock holds up the severed troll head and begins speaking to it.>$B$BYou and I are going to have a long conversation now, Zum''rah. I''m afraid you may not enjoy it.',0;
INSERT INTO `quest_request_items` (`ID`,`CompletionText`,`VerifiedBuild`) SELECT 96770,'Troll necromancy is an insidious art and only those trolls with a particularly sick and twisted disposition practice it. Little does Zum''rah know that he isn''t the only one who can animate the dead, and losing his head is only the beginning of his troubles.',0;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT 96770,13000,0;
DELETE FROM `quest_objectives` WHERE `ID`=475429;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`) SELECT 475429,96770,1,0,0,277112,1,0,0,0,0.0,0,1,NULL,70959;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) SELECT 20735,96770,0;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) SELECT 20735,96770,0;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=20735;

-- 96772 The Dragon's Journal (live record, EG Link): giver and turn-in 20735 Archmage Lan'dalock (Wowhead)
DELETE FROM `quest_template` WHERE `ID`=96772;
DELETE FROM `quest_classic_level` WHERE `ID`=96772;
DELETE FROM `quest_template_classic_level` WHERE `ID`=96772;
DELETE FROM `quest_template_addon` WHERE `ID`=96772;
DELETE FROM `quest_offer_reward` WHERE `ID`=96772;
DELETE FROM `quest_request_items` WHERE `ID`=96772;
DELETE FROM `quest_classic_money` WHERE `ID`=96772;
DELETE FROM `creature_queststarter` WHERE `quest`=96772;
DELETE FROM `creature_questender` WHERE `quest`=96772;
DELETE FROM `quest_objectives` WHERE `QuestID`=96772;
INSERT INTO `quest_template` (`ID`,`QuestType`,`LogTitle`,`VerifiedBuild`) SELECT 96772,2,'The Dragon''s Journal',-1;
UPDATE `quest_template` SET `QuestDescription`='Timear and I have been scrying the area on Kalimdor known as Alcaz Island and we''ve all but confirmed the presence of a powerful magic user there. The mage in question was able to dispel our probes, but before she did, I was able to glean an image of a tome of some sort. I believe it was a journal, written in ancient draconic script.\n\nI don''t know what is in that book, but I''d like to study it. We want you to travel to the hidden prison beneath Alcaz Island and recover that book for us.', `LogDescription`='Recover Zarla''s Journal from the depths of Alcaz Prison.', `AreaDescription`='', `QuestCompletionLog`='', `QuestSortID`=16620, `QuestInfoID`=81, `RewardNextQuest`=0, `RewardXPDifficulty`=6, `RewardXPMultiplier`=2.2, `RewardSpell`=0, `StartItem`=0, `Flags`=8, `FlagsEx`=0, `AllowableRaces`=6130900294268439629, `TimeAllowed`=0, `VerifiedBuild`=70959, `RewardChoiceItemID1`=0, `RewardChoiceItemQuantity1`=0, `RewardChoiceItemID2`=0, `RewardChoiceItemQuantity2`=0, `RewardChoiceItemID3`=0, `RewardChoiceItemQuantity3`=0, `RewardChoiceItemID4`=0, `RewardChoiceItemQuantity4`=0, `RewardChoiceItemID5`=0, `RewardChoiceItemQuantity5`=0, `RewardChoiceItemID6`=0, `RewardChoiceItemQuantity6`=0, `RewardFactionID1`=2740, `RewardFactionValue1`=7, `RewardFactionOverride1`=30000, `RewardFactionID2`=72, `RewardFactionValue2`=6, `RewardFactionOverride2`=0, `RewardFactionID3`=0, `RewardFactionValue3`=0, `RewardFactionOverride3`=0, `RewardFactionID4`=0, `RewardFactionValue4`=0, `RewardFactionOverride4`=0, `RewardFactionID5`=0, `RewardFactionValue5`=0, `RewardFactionOverride5`=0 WHERE `ID`=96772;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT 96772,53,46,0;
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT 96772,2,53;
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) SELECT 96772,0,0,0;
INSERT INTO `quest_offer_reward` (`ID`,`RewardText`,`VerifiedBuild`) SELECT 96772,'So the mage we detected was actually a black dragon in disguise? I can''t say I''m terribly surprised. Dragons are ever crafty. $B$BThe fact that you are standing here before me now suggests that you were forced to dispatch the dragon, yes? You''ll get no complaints from me. You recovered the journal and there''s one fewer villain in the world. That''s a good day''s work as far as I am concerned.$B$BThank you, $N.',0;
INSERT INTO `quest_request_items` (`ID`,`CompletionText`,`VerifiedBuild`) SELECT 96772,'Did you recover the journal?',0;
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT 96772,16752,0;
DELETE FROM `quest_objectives` WHERE `ID`=475392;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`) SELECT 475392,96772,1,0,0,276890,1,0,0,0,0.0,0,1,NULL,70959;
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) SELECT 20735,96772,0;
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) SELECT 20735,96772,0;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=20735;

-- 96800 Past Due (live record, EG Link): giver and turn-in 264265 Magus Olvek (Wowhead); only where the book object 650929 is spawned
DELETE FROM `quest_template` WHERE `ID`=96800;
DELETE FROM `quest_classic_level` WHERE `ID`=96800;
DELETE FROM `quest_template_classic_level` WHERE `ID`=96800;
DELETE FROM `quest_template_addon` WHERE `ID`=96800;
DELETE FROM `quest_offer_reward` WHERE `ID`=96800;
DELETE FROM `quest_request_items` WHERE `ID`=96800;
DELETE FROM `quest_classic_money` WHERE `ID`=96800;
DELETE FROM `creature_queststarter` WHERE `quest`=96800;
DELETE FROM `creature_questender` WHERE `quest`=96800;
DELETE FROM `quest_objectives` WHERE `QuestID`=96800;
INSERT INTO `quest_template` (`ID`,`QuestType`,`LogTitle`,`VerifiedBuild`) SELECT 96800,2,'Past Due',-1 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
UPDATE `quest_template` SET `QuestDescription`='You there, $c. I have a matter I could use assistance with.\n\nI just so happen to be writing a thesis on the ancient Wildhammer runemasters of Grim Batol, and there''s a particular tome I need to complete my research. According to our ledgers, a mage by the name of Doan checked the book out of the old Dalaran library before the Third War and never returned it!\n\nArcanist Doan is now holed up in the Scarlet Monastery in Tirisfal Glades. Retrieve this book for me and you''ll be well rewarded.', `LogDescription`='Retrieve the book The Lost Magic of the Runemasters from the Scarlet Monastery.', `AreaDescription`='', `QuestCompletionLog`='', `QuestSortID`=796, `QuestInfoID`=81, `RewardNextQuest`=0, `RewardXPDifficulty`=5, `RewardXPMultiplier`=2.375, `RewardSpell`=0, `StartItem`=0, `Flags`=264, `FlagsEx`=0, `AllowableRaces`=6130900294268439629, `TimeAllowed`=0, `VerifiedBuild`=70959, `RewardChoiceItemID1`=276898, `RewardChoiceItemQuantity1`=1, `RewardChoiceItemID2`=276899, `RewardChoiceItemQuantity2`=1, `RewardChoiceItemID3`=0, `RewardChoiceItemQuantity3`=0, `RewardChoiceItemID4`=0, `RewardChoiceItemQuantity4`=0, `RewardChoiceItemID5`=0, `RewardChoiceItemQuantity5`=0, `RewardChoiceItemID6`=0, `RewardChoiceItemQuantity6`=0, `RewardFactionID1`=2740, `RewardFactionValue1`=5, `RewardFactionOverride1`=0, `RewardFactionID2`=0, `RewardFactionValue2`=0, `RewardFactionOverride2`=0, `RewardFactionID3`=0, `RewardFactionValue3`=0, `RewardFactionOverride3`=0, `RewardFactionID4`=0, `RewardFactionValue4`=0, `RewardFactionOverride4`=0, `RewardFactionID5`=0, `RewardFactionValue5`=0, `RewardFactionOverride5`=0 WHERE `ID`=96800;
INSERT INTO `quest_classic_level` (`ID`,`QuestLevel`,`MinLevel`,`MaxLevel`) SELECT 96800,38,30,0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
INSERT INTO `quest_template_classic_level` (`ID`,`LevelType`,`QuestLevel`) SELECT 96800,2,38 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`PrevQuestID`) SELECT 96800,0,0,0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
INSERT INTO `quest_offer_reward` (`ID`,`RewardText`,`VerifiedBuild`) SELECT 96800,'Oh you had to kill Doan to get the book back? Oh no...$B$B... well anyway, all''s well that ends well! Thank you for returning this to its rightful place and helping me finish my thesis. I''m quite convinced that reviving the lost art of dwarven rune magic is well within our grasp and I intend to prove it!$B$BIf only I could get into Grim Batol and inspect the runecarvings of old for myself...$B$BSomeday, perhaps.',0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
INSERT INTO `quest_request_items` (`ID`,`CompletionText`,`VerifiedBuild`) SELECT 96800,'Sometimes I feel like this thesis is cursed.',0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
INSERT INTO `quest_classic_money` (`ID`,`RewardMoney`,`RewardMoneyMaxLevel`) SELECT 96800,4500,0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
DELETE FROM `quest_objectives` WHERE `ID`=474252;
INSERT INTO `quest_objectives` (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`) SELECT 474252,96800,1,0,0,273169,1,0,0,0,0.0,0,1,NULL,70959 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
INSERT INTO `creature_queststarter` (`id`,`quest`,`VerifiedBuild`) SELECT 264265,96800,0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
INSERT INTO `creature_questender` (`id`,`quest`,`VerifiedBuild`) SELECT 264265,96800,0 FROM DUAL WHERE EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=264265 AND EXISTS (SELECT 1 FROM `gameobject` WHERE `id`=650929);

