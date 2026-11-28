-- WoW Forever: the mage trainers (list 156) taught Polymorph: Pig 28272 at level 25; the client's SpellLevels (70959) says 60.
-- Credit: Everlake (buildthehomelab, GPL-3) found it first. Safe to run again.
UPDATE `trainer_spell` SET `ReqLevel` = 60 WHERE `TrainerId` = 156 AND `SpellId` = 28272;
