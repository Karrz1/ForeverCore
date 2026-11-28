-- WoW Forever quest order from Questie (Questie team, Questie/QuestieDB, GPL-3.0), commits 5b857c29 to 9921e9bf (21 and 22 Nov):
-- its Forever hand corrections (src/corrections/Forever/foreverQuestFixes.lua). Checked against EG Link's quest prerequisite scan
-- (Efficient Games, https://efficient.games, CC BY 4.0, JIVESCORP/eg-link-output-wowf 1bf749b, every client folder): none of the
-- prerequisites below is contradicted by a character EG Link saw. Changed: compared with our world and written as our own rows,
-- only where ours differs from the new corrections. Quests our world does not have are left out of each rule.
-- One previous quest: PrevQuestID. All of several, or any one of several: quest-available conditions (one group for all,
-- one group each for any). Every change is matched on the old value, so a row someone else changed is left alone.
-- Safe to run more than once.

-- Every quest below gets a quest_template_addon row if it has none (all values default).
INSERT INTO `quest_template_addon` (`ID`) SELECT `q`.`ID` FROM `quest_template` `q` WHERE `q`.`ID` IN (339,340,341,342,465,480,615,1085,1122,1799,1842,3450,4485,4486,8105,8120,8152,8166,8167,8168,8169,8170,8171,8234,8414,8554,79360,79361,92457,92754,92811,92812,93066,93072,93227,93443,94483,94727,94744,94745,94841,94872,94873,94895,94963,95122,95285,95293,95294,95417,95428,95431,95601,96015,96125,96779,96812,96983,97171,97287,97446,98042,98166,98230,98291,98341,98362,98394,98397,98405)
  AND NOT EXISTS (SELECT 1 FROM `quest_template_addon` `a` WHERE `a`.`ID`=`q`.`ID`);

-- 1) Previous quests
-- 339 Chapter I: Questie none, ours 583.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=339 AND `PrevQuestID`=583;
-- 340 Chapter II: Questie none, ours 583.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=340 AND `PrevQuestID`=583;
-- 341 Chapter III: Questie none, ours 583.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=341 AND `PrevQuestID`=583;
-- 342 Chapter IV: Questie none, ours 583.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=342 AND `PrevQuestID`=583;
-- 465 Nek'rosh's Gambit: Questie 464+98221, ours none.
--   written as conditions below.
-- 480 The Weaver: Questie 479+95981, ours none.
--   written as conditions below.
-- 615 The Captain's Cutlass: Questie 8552, ours 620.
UPDATE `quest_template_addon` SET `PrevQuestID`=8552 WHERE `ID`=615 AND `PrevQuestID`=620;
-- 1085 On Guard in Stonetalon: Questie none, ours 1070.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=1085 AND `PrevQuestID`=1070;
-- 1122 Report Back to Fizzlebub: Questie 1120 or 1121, ours 1120 or 1121 or 1119.
UPDATE `quest_template_addon` SET `NextQuestID`=0 WHERE `ID`=1119 AND `NextQuestID`=1122;
-- 1799 Fragments of the Orb of Orahil: Questie none, ours 4965 or 4969 or 4968 or 4967.
UPDATE `quest_template_addon` SET `NextQuestID`=0 WHERE `ID`=4965 AND `NextQuestID`=1799;
UPDATE `quest_template_addon` SET `NextQuestID`=0 WHERE `ID`=4967 AND `NextQuestID`=1799;
UPDATE `quest_template_addon` SET `NextQuestID`=0 WHERE `ID`=4968 AND `NextQuestID`=1799;
UPDATE `quest_template_addon` SET `NextQuestID`=0 WHERE `ID`=4969 AND `NextQuestID`=1799;
-- 1842 Satyr Hooves: Questie 1848, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=1848 WHERE `ID`=1842 AND `PrevQuestID`=0;
-- 3450 An Easy Pickup: Questie none, ours 3448.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=3450 AND `PrevQuestID`=3448;
-- 8152 REUSE: Questie 7790, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=7790 WHERE `ID`=8152 AND `PrevQuestID`=0;
-- 8234 Sealed Azure Bag: Questie none, ours 8233.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=8234 AND `PrevQuestID`=8233;
-- 8414 Dispelling Evil: Questie none, ours 8415.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=8414 AND `PrevQuestID`=8415;
-- 8554 Facing Negolash: Questie 615 or 8553, ours none.
--   written as conditions below.
-- 79360 Elemental Aid: Questie 1531 or 1532, ours none.
--   written as conditions below.
-- 79361 Storm, Earth, and Fire: Questie 79364, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=79364 WHERE `ID`=79361 AND `PrevQuestID`=0;
-- 92457 Starving Arcane: Questie 92432, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=92432 WHERE `ID`=92457 AND `PrevQuestID`=0;
-- 92754 A New Need for Shadow Protection: Questie 1369, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=1369 WHERE `ID`=92754 AND `PrevQuestID`=0;
-- 92811 Economic Warfare: Questie 94872, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=94872 WHERE `ID`=92811 AND `PrevQuestID`=0;
-- 92812 Economic Warfare: Questie 93227 or 94873, ours none.
--   written as conditions below.
-- 93066 Bristleback Retreat: Questie 92893, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=92893 WHERE `ID`=93066 AND `PrevQuestID`=0;
-- 93072 Long-Term Solutions: Questie 93066, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=93066 WHERE `ID`=93072 AND `PrevQuestID`=0;
-- 93227 Buying Friendship: Gelkis: Questie 93224 or 93225, ours 93224.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=93227 AND `PrevQuestID`=93224;
--   written as conditions below.
-- 94483 Show Them How It's Done: Questie 93786, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=93786 WHERE `ID`=94483 AND `PrevQuestID`=0;
-- 94727 Digging for Answers: Questie 94672+94680, ours none.
--   written as conditions below.
-- 94744 The Wayward Warrior: Questie 95428, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=95428 WHERE `ID`=94744 AND `PrevQuestID`=0;
-- 94745 Carving a Path: Questie 94744, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=94744 WHERE `ID`=94745 AND `PrevQuestID`=0;
-- 94872 Buying Friendship: Magram: Questie 93224 or 93225, ours 93225.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=94872 AND `PrevQuestID`=93225;
--   written as conditions below.
-- 94873 Buying Friendship: Gelkis: Questie 93224 or 93225, ours 93225.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=94873 AND `PrevQuestID`=93225;
--   written as conditions below.
-- 94963 Biting the Hand: Questie 94961, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=94961 WHERE `ID`=94963 AND `PrevQuestID`=0;
-- 95122 Unchecked Expansion: Questie 95119, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=95119 WHERE `ID`=95122 AND `PrevQuestID`=0;
-- 95285 Right Place, Wrong Time: Questie 95284, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=95284 WHERE `ID`=95285 AND `PrevQuestID`=0;
-- 95293 Smuggler's Special: Questie 95288, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=95288 WHERE `ID`=95293 AND `PrevQuestID`=0;
-- 95294 Smuggler's Bargain: Questie 95293, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=95293 WHERE `ID`=95294 AND `PrevQuestID`=0;
-- 95417 The Purple Ones: Questie 94727, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=94727 WHERE `ID`=95417 AND `PrevQuestID`=0;
-- 95428 Clugfist's Decree: Questie 95424, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=95424 WHERE `ID`=95428 AND `PrevQuestID`=0;
-- 95431 Rumblings of Discontent: Questie 94744, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=94744 WHERE `ID`=95431 AND `PrevQuestID`=0;
-- 95601 The Purple Ones: Questie 95417, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=95417 WHERE `ID`=95601 AND `PrevQuestID`=0;
-- 96015 A Miner Problem: Questie 94886, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=94886 WHERE `ID`=96015 AND `PrevQuestID`=0;
-- 96125 In Need of Relief: Questie 94924, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=94924 WHERE `ID`=96125 AND `PrevQuestID`=0;
-- 96779 Syndicate Sabotage: Questie 6681, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=6681 WHERE `ID`=96779 AND `PrevQuestID`=0;
-- 96812 Thicker Than Water: Questie 96799, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=96799 WHERE `ID`=96812 AND `PrevQuestID`=0;
-- 96983 Yashiro's Windwalk: Questie 96959, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=96959 WHERE `ID`=96983 AND `PrevQuestID`=0;
-- 97287 Shrewd Negotiations: Questie 92458 or 96984, ours 96984.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=97287 AND `PrevQuestID`=96984;
--   written as conditions below.
-- 98042 It's All Fun and Games Until...: Questie 949, ours none.
UPDATE `quest_template_addon` SET `PrevQuestID`=949 WHERE `ID`=98042 AND `PrevQuestID`=0;
-- 98230 This Land Was Their Land: Questie 474+98223, ours none.
--   written as conditions below.
-- 98291 Death to the Dragonmaw: Questie 98245+98246, ours none.
--   written as conditions below.
-- 98341 The Great Windborne Cat Spirit: Questie 98340 or 98393, ours 98340.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=98341 AND `PrevQuestID`=98340;
--   written as conditions below.
-- 98362 To Thunder Bluff: Questie 98731 or 98738 or 98739, ours 98739.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=98362 AND `PrevQuestID`=98739;
--   written as conditions below.
-- 98394 The Great Cat Spirit: Questie 98340 or 98393, ours 98393.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=98394 AND `PrevQuestID`=98393;
--   written as conditions below.
-- 98397 To Darnassus: Questie 98731 or 98738 or 98739, ours 98731.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=98397 AND `PrevQuestID`=98731;
--   written as conditions below.
-- 98405 The Great Cat Spirit: Questie 98340 or 98393, ours 98340.
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=98405 AND `PrevQuestID`=98340;
--   written as conditions below.

-- 2) Quest-available conditions for the quests with more than one way in, or more than one quest needed
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=98397 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionValue1`=98731 AND `NegativeCondition`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=98397 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionValue1`=98738 AND `NegativeCondition`=0;
DROP TEMPORARY TABLE IF EXISTS `forever_q39_cond`;
CREATE TEMPORARY TABLE `forever_q39_cond` (`SourceEntry` INT NOT NULL, `ElseGroup` INT NOT NULL, `Quest` INT NOT NULL, `Comment` VARCHAR(255) NOT NULL);
INSERT INTO `forever_q39_cond` (`SourceEntry`,`ElseGroup`,`Quest`,`Comment`) VALUES
(465,0,464,'Nek''rosh''s Gambit: needs 464 and 98221'),
(465,0,98221,'Nek''rosh''s Gambit: needs 464 and 98221'),
(480,0,479,'The Weaver: needs 479 and 95981'),
(480,0,95981,'The Weaver: needs 479 and 95981'),
(8554,0,615,'Facing Negolash: after 615'),
(8554,1,8553,'Facing Negolash: or after 8553'),
(79360,0,1531,'Elemental Aid: after 1531'),
(79360,1,1532,'Elemental Aid: or after 1532'),
(92812,0,93227,'Economic Warfare: after 93227'),
(92812,1,94873,'Economic Warfare: or after 94873'),
(93227,0,93224,'Buying Friendship: Gelkis: after 93224'),
(93227,1,93225,'Buying Friendship: Gelkis: or after 93225'),
(94727,0,94672,'Digging for Answers: needs 94672 and 94680'),
(94727,0,94680,'Digging for Answers: needs 94672 and 94680'),
(94872,0,93224,'Buying Friendship: Magram: after 93224'),
(94872,1,93225,'Buying Friendship: Magram: or after 93225'),
(94873,0,93224,'Buying Friendship: Gelkis: after 93224'),
(94873,1,93225,'Buying Friendship: Gelkis: or after 93225'),
(97287,0,92458,'Shrewd Negotiations: after 92458'),
(97287,1,96984,'Shrewd Negotiations: or after 96984'),
(98230,0,474,'This Land Was Their Land: needs 474 and 98223'),
(98230,0,98223,'This Land Was Their Land: needs 474 and 98223'),
(98291,0,98245,'Death to the Dragonmaw: needs 98245 and 98246'),
(98291,0,98246,'Death to the Dragonmaw: needs 98245 and 98246'),
(98341,0,98340,'The Great Windborne Cat Spirit: after 98340'),
(98341,1,98393,'The Great Windborne Cat Spirit: or after 98393'),
(98362,0,98731,'To Thunder Bluff: after 98731'),
(98362,1,98738,'To Thunder Bluff: or after 98738'),
(98362,2,98739,'To Thunder Bluff: or after 98739'),
(98394,0,98340,'The Great Cat Spirit: after 98340'),
(98394,1,98393,'The Great Cat Spirit: or after 98393'),
(98397,0,98731,'To Darnassus: after 98731'),
(98397,1,98738,'To Darnassus: or after 98738'),
(98397,2,98739,'To Darnassus: or after 98739'),
(98405,0,98340,'The Great Cat Spirit: after 98340'),
(98405,1,98393,'The Great Cat Spirit: or after 98393');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ConditionStringValue1`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`)
SELECT 19,0,`s`.`SourceEntry`,0,`s`.`ElseGroup`,8,0,`s`.`Quest`,0,0,'',0,0,0,'',`s`.`Comment` FROM `forever_q39_cond` `s`
WHERE EXISTS (SELECT 1 FROM `quest_template` `q` WHERE `q`.`ID`=`s`.`SourceEntry`) AND EXISTS (SELECT 1 FROM `quest_template` `p` WHERE `p`.`ID`=`s`.`Quest`)
  AND NOT EXISTS (SELECT 1 FROM `conditions` `c` WHERE `c`.`SourceTypeOrReferenceId`=19 AND `c`.`SourceGroup`=0 AND `c`.`SourceEntry`=`s`.`SourceEntry` AND `c`.`SourceId`=0
    AND `c`.`ElseGroup`=`s`.`ElseGroup` AND `c`.`ConditionTypeOrReference`=8 AND `c`.`ConditionTarget`=0 AND `c`.`ConditionValue1`=`s`.`Quest` AND `c`.`ConditionValue2`=0 AND `c`.`ConditionValue3`=0);
DROP TEMPORARY TABLE IF EXISTS `forever_q39_cond`;

-- 3) One of a set: only one of these can be done
-- The Tome of Nobility (4485,4486): Questie makes each one rule out the others.
UPDATE `quest_template_addon` SET `ExclusiveGroup`=4485 WHERE `ID` IN (4485,4486) AND `ExclusiveGroup`=0;
-- Buying Friendship: Gelkis (93227,94872,94873): Questie makes each one rule out the others.
UPDATE `quest_template_addon` SET `ExclusiveGroup`=93227 WHERE `ID` IN (93227,94872,94873) AND `ExclusiveGroup`=0;
-- Lost Shipping Crate (93443,94841,94895): Questie makes each one rule out the others.
UPDATE `quest_template_addon` SET `ExclusiveGroup`=93443 WHERE `ID` IN (93443,94841,94895) AND `ExclusiveGroup`=0;
-- Your First Horse (97171,97446,98166): Questie makes each one rule out the others.
UPDATE `quest_template_addon` SET `ExclusiveGroup`=97171 WHERE `ID` IN (97171,97446,98166) AND `ExclusiveGroup`=0;

-- 4) The quest offered straight after turn-in (RewardNextQuest), Questie's nextQuestInChain. 0 = none.
UPDATE `quest_template` SET `RewardNextQuest`=79360 WHERE `ID`=1531 AND `RewardNextQuest`=0; -- Call of Air: Elemental Aid
UPDATE `quest_template` SET `RewardNextQuest`=79360 WHERE `ID`=1532 AND `RewardNextQuest`=0; -- Call of Air: Elemental Aid
UPDATE `quest_template` SET `RewardNextQuest`=0 WHERE `ID`=1638 AND `RewardNextQuest`=1639; -- A Warrior's Training: none (was Bartleby the Drunk)
UPDATE `quest_template` SET `RewardNextQuest`=0 WHERE `ID`=2300 AND `RewardNextQuest`=2281; -- SI:7: none (was Redridge Rendezvous)
UPDATE `quest_template` SET `RewardNextQuest`=1661 WHERE `ID`=4485 AND `RewardNextQuest`=0; -- The Tome of Nobility: The Tome of Nobility
UPDATE `quest_template` SET `RewardNextQuest`=1661 WHERE `ID`=4486 AND `RewardNextQuest`=0; -- The Tome of Nobility: The Tome of Nobility
UPDATE `quest_template` SET `RewardNextQuest`=8152 WHERE `ID`=7790 AND `RewardNextQuest`=0; -- REUSE: REUSE
UPDATE `quest_template` SET `RewardNextQuest`=78092 WHERE `ID`=78091 AND `RewardNextQuest`=0; -- Earning Your Salt: It Must Be Destroyed
UPDATE `quest_template` SET `RewardNextQuest`=79236 WHERE `ID`=79235 AND `RewardNextQuest`=0; -- On the Lam: Cherry for Your Thoughts?
UPDATE `quest_template` SET `RewardNextQuest`=79242 WHERE `ID`=79236 AND `RewardNextQuest`=0; -- Cherry for Your Thoughts?: No Honor Among Thieves
UPDATE `quest_template` SET `RewardNextQuest`=0 WHERE `ID`=92514 AND `RewardNextQuest`=92517; -- Welcome to Shen'dar Village: none (was The Criminal Element)
UPDATE `quest_template` SET `RewardNextQuest`=0 WHERE `ID`=92679 AND `RewardNextQuest`=92682; -- Blood Tithe: none (was Make Yourself Useful)
UPDATE `quest_template` SET `RewardNextQuest`=0 WHERE `ID`=92840 AND `RewardNextQuest`=92834; -- Catching Wind: none (was Avenged Tenfold)
UPDATE `quest_template` SET `RewardNextQuest`=0 WHERE `ID`=93461 AND `RewardNextQuest`=92517; -- Welcome to Shen'dar Village: none (was The Criminal Element)
UPDATE `quest_template` SET `RewardNextQuest`=94843 WHERE `ID`=94842 AND `RewardNextQuest`=0; -- Unsavory Plant Food: From Seed to Sprout
UPDATE `quest_template` SET `RewardNextQuest`=95329 WHERE `ID`=94877 AND `RewardNextQuest`=0; -- Saving Sunnyglade: Out in the Field
UPDATE `quest_template` SET `RewardNextQuest`=95184 WHERE `ID`=95156 AND `RewardNextQuest`=0; -- Stuff 'Em and Stick 'Em: The Sharpest of Blades
UPDATE `quest_template` SET `RewardNextQuest`=95294 WHERE `ID`=95293 AND `RewardNextQuest`=0; -- Smuggler's Special: Smuggler's Bargain
UPDATE `quest_template` SET `RewardNextQuest`=96009 WHERE `ID`=95943 AND `RewardNextQuest`=0; -- Foreman's Plight: High Stakes
UPDATE `quest_template` SET `RewardNextQuest`=98297 WHERE `ID`=98291 AND `RewardNextQuest`=0; -- Death to the Dragonmaw: Stopping the Cycle
UPDATE `quest_template` SET `RewardNextQuest`=98300 WHERE `ID`=98297 AND `RewardNextQuest`=0; -- Stopping the Cycle: Word to Ironforge
UPDATE `quest_template` SET `RewardNextQuest`=98404 WHERE `ID`=98341 AND `RewardNextQuest`=98342; -- The Great Windborne Cat Spirit: The Great Windborne Cat Spirit
UPDATE `quest_template` SET `RewardNextQuest`=305 WHERE `ID`=98461 AND `RewardNextQuest`=0; -- Unrequited Love: In Search of the Excavation Team
