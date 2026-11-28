-- WoW Forever: fixes after the first test of the held quests (Kit A, 2026_11_25_41).
-- 1) Felflick (263757) was faction 7, so nearby fights killed it and its quests (95318, 95319, 95378, 95379, 96255) could not
--    be handed in. Wowhead Forever lists it as friendly to Alliance and Horde, and every one of its quests is open to all races.
-- 2) Five Kit A quests are started by an item whose spell needs a spell focus object that our world does not have yet:
--    92872 Dutiful Steps (focus 2314), 95611 Rites of Respect (2287, Druidic Shrine 642518), 96084 Something's in the Water
--    (2329, Freshwater Spout 649370), 96302 Arch Absolution (2293) and 96979 Sacred Refreshment (2301). No source we may use
--    gives where these objects stand, so the quests are not offered until the focus objects can be placed. The quest rows stay.
-- Safe to run again.

UPDATE `creature_template` SET `faction`=35 WHERE `entry`=263757;

DELETE FROM `creature_queststarter` WHERE (`id`,`quest`) IN ((2782,92872),(256222,95611),(262031,96084),(264795,96302),(267109,96979));
