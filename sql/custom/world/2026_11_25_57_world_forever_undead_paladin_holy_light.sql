-- Undead paladins never learned Holy Light (Discord VempirE row 382, lin's Forsaken paladin audit row 401). Holy Light rank 1
-- (635) comes on its own at level 1 only for humans and dwarves (its skill line ability for them is automatic); the undead
-- one is "learned", so an undead paladin has to buy it. No trainer sold it: Aramis Hammerhand (244808, Deathknell, trainer 28)
-- and every other paladin trainer had Holy Light 639 and up, each needing 635. So an undead paladin could not do
-- Rediscovering the Light (90902, the Injured Deathguards give credit only for a Holy Light 635 hit) and never got a Holy
-- Light rank until Flash of Light at 20. Every trainer that sells 639 now sells 635 too, at level 1 for 10 copper (like
-- Devotion Aura 465 on trainer 28). A human or dwarf already knows it, so they see it as known.
-- Safe to run again.
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`)
SELECT ts.`TrainerId`, 635, 10, 0, 0, 0, 0, 0, 1, 0
FROM `trainer_spell` ts
WHERE ts.`SpellId` = 639 AND ts.`ReqAbility1` = 635
  AND NOT EXISTS (SELECT 1 FROM `trainer_spell` x WHERE x.`TrainerId` = ts.`TrainerId` AND x.`SpellId` = 635);
