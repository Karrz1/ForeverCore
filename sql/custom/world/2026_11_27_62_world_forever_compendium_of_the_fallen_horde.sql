-- Compendium of the Fallen (1049, Sage Truthseeker): AllowableRaces 0xA2 (Orc, Tauren, Troll). Wowhead Forever lists it
-- as Side: Horde with no race requirement; use the Horde mask of the other Horde Scarlet Monastery quests.
UPDATE `quest_template` SET `AllowableRaces` = 0xAA2AAAAA4E0AB3B2 WHERE `ID` = 1049 AND `AllowableRaces` = 0xA2;
