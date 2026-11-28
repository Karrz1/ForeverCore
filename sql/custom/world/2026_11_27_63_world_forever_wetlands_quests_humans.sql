-- Razormaw Needling (98245) and Bloom of the Heavens (98209), Wetlands: AllowableRaces 0x10000004C left out Humans.
-- Wowhead Forever lists both as Side: Alliance with no race requirement; the zone's other 1.60 quests use 0x10000004D.
UPDATE `quest_template` SET `AllowableRaces` = 0x10000004D WHERE `ID` IN (98209, 98245) AND `AllowableRaces` = 0x10000004C;
