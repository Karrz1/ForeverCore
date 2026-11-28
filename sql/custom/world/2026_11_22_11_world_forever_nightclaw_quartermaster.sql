-- Vayn Moongaze (254151), the Nightclaw quartermaster on map 2991, has 50 npc_vendor rows but no vendor flag (npcflag 3 =
-- gossip + quest giver), so nobody could open her shop. Add UNIT_NPC_FLAG_VENDOR (0x80). The placed spawn (guid 21101362)
-- takes the template's flags (its npcflag is NULL). The matching reputation condition is hotfixes 2026_11_22_11.
-- From Sm0sher/TrinityCore-1 4557704257. Safe to run twice.
UPDATE `creature_template`
SET `npcflag` = `npcflag` | 0x80
WHERE `entry` = 254151
  AND (`npcflag` & 0x80) = 0
  AND EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry` = 254151);
