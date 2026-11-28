-- WoW Forever: Blackmaw Hold (map 2974): Varrox Bleakhoof moves to the end of the hold.
-- 2026_11_22_78 kept him at the spot of 2026_11_19_70, (3556.27,2819.47,176.63), which that file meant as "past the Behemoth"; on the
-- navmesh it is the narrow way from the Unbound Spirit's pool into the east cave, where every way to the Behemoth shorter than 850 y passes,
-- so a group walking to the Behemoth met the last boss there first (blackmaw_full chain69b, 23 Nov: Varrox killed fifth, the
-- Behemoth and Bloodmane left standing). He now waits in the high north room of the east cave, off every way between the other bosses, 212 y on from the Behemoth:
-- on the walkable mesh joined to the entrance, at the floor's height (navmesh detail height), 8 y from the nearest wall, 119 y from
-- every other spawn. HAND-PLACED, like the rest of the layout, until a sniff of the dungeon comes.
-- The bot route's last leg is the bot migration 0062_blackmaw_hold_route_varrox_room. Safe to run again.

UPDATE `creature` SET `position_x` = 3660.47, `position_y` = 3060.67, `position_z` = 189.15, `orientation` = 1.029
WHERE `guid` = 48130006 AND `id` = 247234 AND `map` = 2974;
