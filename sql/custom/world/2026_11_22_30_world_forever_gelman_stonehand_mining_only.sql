-- Stormwind: Gelman Stonehand (5513, "Mining Trainer") also taught 15 blacksmithing plans (Copper Chain Belt, Runed Copper
-- Bracers, ...; Discord, Alex Black Cat 2026-11-21). They came with 2026_11_05_06 (recipe lists per trainer from other world
-- data), which put a blacksmithing list on his trainer list 1005513: the only trainer in that file with two professions. His own
-- mining and smelting spells stay.
DELETE FROM `trainer_spell` WHERE `TrainerId` = 1005513 AND `ReqSkillLine` = 164;
