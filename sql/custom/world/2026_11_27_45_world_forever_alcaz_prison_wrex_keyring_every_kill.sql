-- Alcaz Prison: Overseer Wrex drops the Overseer's Keyring 263992 on every kill, one for the group (was 10.15%, 2026_11_22_70).
-- The keyring opens the Maximum Security Door 649547 (lock 4295: the keyring, or Lockpicking 250), the only way from Wrex to
-- Katerina the Cleaner, Blazeroar and The Questioner. At 10% a group without a rogue stood at that door nine runs in ten.
-- Live: on Karrz's capture (26 Nov, a group of 5) the keyring dropped on the one kill and went to a groupmate. Wowhead's 10.15% is
-- drops over kills counted for every player at the kill; one keyring per group of five reads as 20% or less there, so the two agree.
-- Safe to run again.
UPDATE `creature_loot_template` SET `Chance` = 100, `Comment` = 'Overseer Wrex: Overseer''s Keyring, every kill (live 26 Nov: 1 of 1; opens 649547)'
WHERE `Entry` = 255391 AND `ItemType` = 0 AND `Item` = 263992;
