-- Two quest objects of Horde quests had the Stormwind faction 12 from the Forever quest data restore (2026_11_05_99), so a Horde
-- player could not use them (the same as the Stepping Stones planks of 2026_11_16_11 and the Sleeping Bag chain of 2026_11_20_64):
--   Charred Remains 566037 (Fenris Isle, Silverpine): the only ender of A Grim Fate 91860 (undead only) and starter of Into Fenris
--   Keep 91861. Clicking it did nothing, so the chain stopped (Discord, lin "bugs 6+4" Silverpine 4, 2026-11-23).
--   Ritual Fire 660739 (Mulgore): starter of Grace of An'she and Mu'sha 95805 (Horde races only).
-- Both made neutral. Safe to run again.
UPDATE `gameobject_template_addon` SET `faction` = 0 WHERE `entry` IN (566037, 660739) AND `faction` = 12;
