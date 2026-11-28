-- Migration: 0060_companion_owner_orders
-- Date:    2026-11-21
-- Purpose: The owner's standing orders on a companion, "loot all" and "gather on", were kept in the bot logic only and were gone after
--          every relog, `.bot call` and restart (Alex Black Cat, RU general 11-21: an alt's gather and loot all reset on each relog).
--          They are stored with the companion and given back at its login.
--
--          Columns:
--            owner_orders   bits: 0x01 loot all (rolls on everything, greys included), 0x02 gather on (herbs, ore, skins). 0 = neither.
-- Reverts: yes (DROP COLUMN owner_orders).

ALTER TABLE playerbot_v2_character
    ADD COLUMN owner_orders TINYINT UNSIGNED NOT NULL DEFAULT 0;

INSERT INTO playerbot_v2_schema_version (version, sha256) VALUES
    (60, REPEAT('0', 64))
ON DUPLICATE KEY UPDATE applied_at = CURRENT_TIMESTAMP;
