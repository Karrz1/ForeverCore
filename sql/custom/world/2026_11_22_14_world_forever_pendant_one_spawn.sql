-- WoW Forever: the Gleaming Crescent Pendant 669176 (starts 98027) was spawned twice: by 2026_11_21_72 (guid 66917600) and by
-- 2026_11_21_33 (guid 46130134, live's spot 3 yd away). Keep 2026_11_21_72's spawn and remove the second one. Safe to run again.
DELETE FROM `gameobject` WHERE `guid`=46130134 AND `id`=669176;
