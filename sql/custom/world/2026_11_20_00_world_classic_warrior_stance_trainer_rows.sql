-- Classic 1.60: no 1.12 trainer sells Defensive Stance (71), Taunt (355) or Sunder Armor (7386). All three come from
-- the level-10 warrior class quest chain, which casts Path of Defense (8121); that spell's three learn-spell effects
-- teach exactly these three spells (server data Spell.db2 / SpellEffect.db2: Effect 36 with EffectTriggerSpell 71,
-- 7386 and 355; classicdb.ch spell 8121). Neither the official trainer lists rebuilt in 2026_10_15_00 (warrior 23:
-- 101 rows for the 28 city trainers, warrior 22: 5 rows for the 7 starting-zone trainers) nor the VMaNGOS 1.12
-- npc_trainer_template rows in the baseline (34,045 trainer_spell rows, build 5875) carries a row for them, so there
-- is no cost, level or prerequisite to confirm and no row is added here.
--
-- The quests that cast 8121 are present in this database (1665 Bartleby's Mug, 1678 Vejrek, 1683 Vorlus Vilehoof,
-- 1498 Path of Defense, 1819 Ulag the Cleaver, 10350 Behomat, 94003 The Skybreaker Bulwark).
--
-- A previous revision of this file inserted 71, 355 and 7386 for every trainer that teaches Bloodrage (2687): trainer
-- 23 and the 26 1000xxx ids left behind by 2026_10_15_00. This file takes exactly those rows back out and adds
-- nothing. Only trainer 23 is still referenced by creature_trainer; the 1000xxx ids are pairs the earlier revision
-- wrote and nothing else reads. No other trainer and no other spell is touched. Safe to run again.
DELETE FROM `trainer_spell`
WHERE (`TrainerId`, `SpellId`) IN
    ((23, 71), (23, 355), (23, 7386),
     (1000913, 71), (1000913, 355), (1000913, 7386),
     (1000914, 71), (1000914, 355), (1000914, 7386),
     (1000985, 71), (1000985, 355), (1000985, 7386),
     (1001229, 71), (1001229, 355), (1001229, 7386),
     (1001901, 71), (1001901, 355), (1001901, 7386),
     (1002131, 71), (1002131, 355), (1002131, 7386),
     (1003041, 71), (1003041, 355), (1003041, 7386),
     (1003042, 71), (1003042, 355), (1003042, 7386),
     (1003043, 71), (1003043, 355), (1003043, 7386),
     (1003063, 71), (1003063, 355), (1003063, 7386),
     (1003169, 71), (1003169, 355), (1003169, 7386),
     (1003353, 71), (1003353, 355), (1003353, 7386),
     (1003354, 71), (1003354, 355), (1003354, 7386),
     (1003408, 71), (1003408, 355), (1003408, 7386),
     (1003598, 71), (1003598, 355), (1003598, 7386),
     (1004087, 71), (1004087, 355), (1004087, 7386),
     (1004089, 71), (1004089, 355), (1004089, 7386),
     (1004593, 71), (1004593, 355), (1004593, 7386),
     (1004594, 71), (1004594, 355), (1004594, 7386),
     (1004595, 71), (1004595, 355), (1004595, 7386),
     (1005113, 71), (1005113, 355), (1005113, 7386),
     (1005114, 71), (1005114, 355), (1005114, 7386),
     (1005479, 71), (1005479, 355), (1005479, 7386),
     (1005480, 71), (1005480, 355), (1005480, 7386),
     (1007315, 71), (1007315, 355), (1007315, 7386),
     (1008141, 71), (1008141, 355), (1008141, 7386));
