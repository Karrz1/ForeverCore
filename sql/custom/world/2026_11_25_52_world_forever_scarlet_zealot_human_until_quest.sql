-- Fields of Grief (407): the Captured Scarlet Zealot (1931) in the Gallow's End Tavern cellar was a ghoul before anyone gave him
-- the pumpkin (Discord, lin 2026-11-25). His template addon kept Ghoul Form (3287) on him all the time; he should be a living
-- Scarlet Crusader until the quest is handed in, when his quest end script (VMaNGOS quest_end_scripts 407, actionlist 950000013)
-- says his lines, casts Ghoul Form on himself and dies. He respawns human. Safe to run again.
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 1931 AND `auras` = '3287';
