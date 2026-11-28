-- WoW Forever, Duskwood: Grant's Shield 79362 and Silvia's Sword 79363 (Valor family, start items 281147 / 281145, turn-in Sirra
-- Von'Indi 268). 2026_11_21_73 opened them to every class but left the race mask of the old shaman quests that used these ids,
-- so the server refused both quests to Alliance players (TestPlayer, human warrior, dev 2026-11-21: "quest refused, reason 6").
-- Live mask (EG Link, quests.enUS 1.60.1.70959, CC BY 4.0, github.com/JIVESCORP/eg-link-output-wowf): raceMask 55155555b1354c4d,
-- the same as the other two Valor quests 96137/96138 and The Valor Family 96139. Unsigned, as the column is. Safe to run again.
UPDATE `quest_template` SET `AllowableRaces`=6130900294268439629 WHERE `ID` IN (79362,79363);
