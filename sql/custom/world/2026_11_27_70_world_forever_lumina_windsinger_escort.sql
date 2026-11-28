-- The Windshaper's Wrath 96204 (player audit of the Forsaken paladin chain, row 401): Lumina Windsinger 248755 has her route out of
-- Fenris Keep (path 1100248755, 2026_11_05_99), but it was started on Lumina herself, so the escort never knew who it was escorting,
-- and the credit at the end of the route reached only players within 40 yd of her. A player held up by a gnoll on the bridge lost the
-- credit with no sign of it, and The Debt 95034 with the whole Moonsilver Blade block stayed locked. Same fault as Pal'juh
-- (2026_11_12_10). Now the route is started for the player who took the quest (it fails with the quest failed message when that player
-- and the group are more than 60 yd away, as every SmartAI escort), and the credit at the end reaches every player within those 60 yd.
-- She came back only after 5 minutes (spawn time 300 s); now after 60 s. INFERRED: no sniff of this escort exists, the respawn time
-- is a guess. Safe to run again.
UPDATE `smart_scripts` SET `target_type`=7, `target_param1`=0, `target_param2`=0
WHERE `entryorguid`=248755 AND `source_type`=0 AND `id`=11 AND `action_type`=53;
UPDATE `smart_scripts` SET `target_param2`=60, `comment`='escort 96204 - Route ended - Escort credit to players within 60 yd'
WHERE `entryorguid`=248755 AND `source_type`=0 AND `id`=12 AND `action_type`=33;
UPDATE `creature` SET `spawntimesecs`=60 WHERE `guid`=24875500 AND `id`=248755;
