-- Raid boss chests follow the group's loot rules again (master loot, group loot), as in vanilla: Cache of the Firelord 179703
-- (Majordomo Executus) and the Four Horsemen Chest 181366. Both had ChestFlags without UseGroupLootRules (0x20), so the
-- player who opened the chest took every item straight into the bags, also with master loot on (Discord 11-22, DoctorSun).
-- Only these two raid chests: the dungeon chests stay single looter (BRD vault and tomb chests match live, see row 302).
-- Safe to run again.
UPDATE `gameobject_template` SET `Data20` = `Data20` | 0x20 WHERE `type` = 3 AND `entry` IN (179703, 181366);
