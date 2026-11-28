-- WoW Forever: the bears that teach Swipe (Pet - Bear, new in 1.60.1) kept no Swipe when tamed. Our tame list
-- (2026_11_10_70, classic_pet_tame_spell) is vanilla only and no beast in it had any Swipe rank.
-- Ranks and teachers from Wowhead's WoW Forever Swipe pages (spell 1264494 and its "Ability ranks", read 24 Nov 2026):
--   rank 1 1264494 (level 12): Grizzled Black Bear 1188, Giant Grizzled Bear 1797, Old Vicejaw 12432, Mystmane 259388
--   rank 2 1264497 (level 24): Elder Gray Bear 2356, Big Samras 14280, Maddened Rotclaw 271334
--   rank 3 1264498 (level 36): Ironfur Bear 5268, Grizzled Ironfur Bear 5272, Angerclaw Bear 8956
--   rank 4 1264501 (level 48): Angerclaw Mauler 8958, Hyjal Bear 244525, Tainted Hyjal Bear 244530
--   rank 5 1264502 (level 60): Rabid Shardtooth 7446, Ursius 10806, Head Scratcher 251199
-- Ursol'lok 12037 is not a Swipe teacher on live (Maul and Dazed only), so it stays without it. Rows are added next to the
-- vanilla abilities these bears already have. Safe to run again.
DELETE FROM `classic_pet_tame_spell` WHERE `SpellId` IN (1264494,1264497,1264498,1264501,1264502);
INSERT INTO `classic_pet_tame_spell` (`CreatureEntry`,`SpellId`) VALUES
(1188,1264494),(1797,1264494),(12432,1264494),(259388,1264494),
(2356,1264497),(14280,1264497),(271334,1264497),
(5268,1264498),(5272,1264498),(8956,1264498),
(8958,1264501),(244525,1264501),(244530,1264501),
(7446,1264502),(10806,1264502),(251199,1264502);
