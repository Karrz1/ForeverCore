-- A Sampling of Putrescence (86577, Kelek Skykeeper 10920, Felwood): the Putrescent Wolf Organs 277959 dropped from Felpaw
-- Scavengers 8960 for everyone. The drop came with the Everlake live drops of 2026_11_15_97, which wrote every row as a plain
-- drop; on live only players on the quest get it, like the Putrescent Bear Organs 277958 its other objective (2026_11_22_83).
-- Discord (БудьМужиком) 11-28. Safe to run more than once.
UPDATE `creature_loot_template` SET `QuestRequired`=1 WHERE `ItemType`=0 AND `Item` IN (277958,277959);
