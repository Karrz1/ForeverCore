-- Durotar: the Corrupted Mottled Boar (3225, Rocktusk Farm and Thunder Ridge) attacked players but could not be targeted and had no
-- nameplate (Discord, Slader 2026-11-25). Its template came from retail data with pacified (0x20000) and uninteractible
-- (0x2000000) unit flags; in vanilla it is a plain hostile beast (VMaNGOS EventAI 322501/322502 charges and casts in combat).
-- Safe to run again.
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~(0x00020000 | 0x02000000) WHERE `entry` = 3225;
