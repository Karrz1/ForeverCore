-- WoW Forever dungeons: three live boss drops we left out, and the giver of Panic at the Digsite.
--  * Overseer Wrex (Alcaz Prison) drops the Overseer's Keyring 263992 (10.15%). The 70938 client has the item (ItemSparse:
--    a key, opens lock 4295 or Lockpicking 250), so it no longer has to wait for our hotfixes. What the keyring opens inside
--    the prison is not in any data we have yet, so for now it is only the drop.
--  * Nanaya (The Shaper's Terrace) drops Blueprint: Arcane Forge 273116 (4.29%) and Maker's Spark 273128 (95.09%); both are
--    in the 70938 client.
--  * Panic at the Digsite 95924 (The Shaper's Terrace) had no giver: Curator Thorius 8256 in Ironforge gives and takes it.
-- Sources (read as data): the drops and chances are Wowhead's WoW Forever NPC pages (drops over kills), as Everlake's world
-- data (buildthehomelab, GPL-3.0) recorded them in 2026_11_19_962 and 2026_11_19_963; the giver is a Questie trace of the live
-- quest, also from Everlake (2026_11_19_980). Written as our own rows. Every other Wowhead drop of Alcaz Prison, Blackmaw Hold
-- and The Shaper's Terrace was already in our loot (checked 22 Nov against all of sql/custom/world).
-- Left out: Blackmaw Ritual Totem 276893 off Bloodmane (quest item for Blackmaw Magic 97198, which has no giver yet).
-- Each drop goes in only where the creature's loot id is its own entry and the item is not there yet. Safe to run again.

DELETE FROM `creature_loot_template` WHERE (`Entry`,`ItemType`,`Item`) IN ((255391,0,263992),(261809,0,273116),(261809,0,273128));
INSERT INTO `creature_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
SELECT s.`Entry`, 0, s.`Item`, s.`Chance`, 0, 1, 0, 1, 1, s.`Comment` FROM (
  SELECT 255391 AS `Entry`, 263992 AS `Item`, 10.15 AS `Chance`, 'Overseer Wrex: Overseer''s Keyring (Wowhead WoW Forever drops over kills)' AS `Comment`
  UNION ALL SELECT 261809, 273116, 4.29, 'Nanaya: Blueprint: Arcane Forge (Wowhead WoW Forever drops over kills)'
  UNION ALL SELECT 261809, 273128, 95.09, 'Nanaya: Maker''s Spark (Wowhead WoW Forever drops over kills)'
) s
WHERE EXISTS (SELECT 1 FROM `creature_template_difficulty` t WHERE t.`Entry` = s.`Entry` AND t.`DifficultyID` = 0 AND t.`LootID` = s.`Entry`)
  AND NOT EXISTS (SELECT 1 FROM `creature_template_difficulty` o WHERE o.`DifficultyID` = 0 AND o.`LootID` = s.`Entry` AND o.`Entry` <> s.`Entry`);

DELETE FROM `creature_queststarter` WHERE `id` = 8256 AND `quest` = 95924;
INSERT INTO `creature_queststarter` (`id`,`quest`) SELECT 8256, 95924 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 95924) AND EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 8256);
DELETE FROM `creature_questender` WHERE `id` = 8256 AND `quest` = 95924;
INSERT INTO `creature_questender` (`id`,`quest`) SELECT 8256, 95924 FROM DUAL
WHERE EXISTS (SELECT 1 FROM `quest_template` WHERE `ID` = 95924) AND EXISTS (SELECT 1 FROM `creature_template` WHERE `entry` = 8256);
