-- Alcaz Prison: the Blood Red Bandana (274028, quest Blood Red Bandanas) dropped from 40-60% of the Defias and jailer kills here;
-- those chances were a guess. Live (Wowhead WoW Forever) has it at 13.45% on the Alcaz Chaplain (113 of 840 kills) and 14.79% on the
-- Renegade Conjurer (67 of 453); together 180 of 1293 kills, 13.9%. The six guessed rows take that live rate. It still drops only
-- while the quest is held. Safe to run again.
UPDATE `creature_loot_template` SET `Chance`=13.9,
    `Comment`=CONCAT(SUBSTRING_INDEX(`Comment`,':',1),': Blood Red Bandana (Blood Red Bandanas), quest drop (live rate of the Chaplain and Conjurer, Wowhead WoW Forever 180 of 1293 kills)')
WHERE `Item`=274028 AND `Entry` IN (255271,255276,271780,255309,255377,271784);
