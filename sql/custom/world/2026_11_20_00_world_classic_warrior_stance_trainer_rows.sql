-- Classic 1.60: no warrior trainer offers Defensive Stance (71), Taunt (355) or Sunder Armor (7386); the protection kit
-- needs the stance (in trainer 23's list Revenge 6572 and Shield Block 2565 sit behind ReqAbility1=71).
-- Every trainer that teaches Bloodrage (2687) -- trainer 23 and the 22 city clones that still have a full list -- now
-- teaches all three at level 10 for 6 silver, the level and price of each trainer's other level-10 rows (Bloodrage 2687
-- and Rend rank 2, 6546). Taunt needs Defensive Stance (ReqAbility1=71); Sunder Armor has no prerequisite. The sniffed
-- trainer lists do not carry the spells (2026_10_15_00 rebuilds trainer 23 from the official lists without them), so these
-- are the classic values, not sniffed. VerifiedBuild 0. Safe to run again.

DELETE FROM `trainer_spell` WHERE `SpellId` IN (71, 355, 7386);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`)
SELECT DISTINCT `TrainerId`, 71, 600, 0, 0, 0, 0, 0, 10, 0 FROM `trainer_spell` WHERE `SpellId` = 2687;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`)
SELECT DISTINCT `TrainerId`, 355, 600, 0, 0, 71, 0, 0, 10, 0 FROM `trainer_spell` WHERE `SpellId` = 2687;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`)
SELECT DISTINCT `TrainerId`, 7386, 600, 0, 0, 0, 0, 0, 10, 0 FROM `trainer_spell` WHERE `SpellId` = 2687;
