-- Aquatic creatures swim. 13 Classic water-only creatures (fish schools, frenzies, sharks, Nessy, Rippa, Meridith) have the
-- AQUATIC static flag (0x00040000) but not CAN_SWIM (0x10000000), so ObjectMgr never gave them UNIT_FLAG_CAN_SWIM.
-- Data from Sm0sher/TrinityCore-1 2145c55ac0 (adapted from buildthehomelab/wow-everlake-world-data 8520a1a45a), Classic
-- entries only (their three Forever creatures 254588/259005/259175 are left out until someone looks at them in game).
-- Only rows that still have AQUATIC and neither CAN_SWIM nor FLOATING (0x20000000) change, so it is safe to run twice.
UPDATE `creature_template_difficulty`
SET `StaticFlags1` = `StaticFlags1` | 0x10000000
WHERE `DifficultyID` = 0
  AND (`StaticFlags1` & 0x00040000) <> 0
  AND (`StaticFlags1` & 0x30000000) = 0
  AND `Entry` IN (6033, 6145, 8236, 10942, 11374, 12123, 12124, 12125, 14356, 14357, 14490, 15505, 15526);
