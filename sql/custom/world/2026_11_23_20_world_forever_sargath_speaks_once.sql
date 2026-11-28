-- The Tower of Althalaxx (970, Ashenvale): after Delgren the Purifier (3663) takes the Glowing Soul Gem, the spirit Sargath (4509)
-- told his story twice. Delgren's quest end list (950000080, VMaNGOS quest_end_scripts 970) summons Sargath and has him say his six
-- lines (text groups 6-11, with Delgren's answer in between and "fades into the mist" at the end), and Sargath also had his own
-- out-of-combat talk events saying the same six lines (groups 0-5) on their own timers. Sargath is never spawned other than by this
-- list, so his own events go and the list tells the story once, in order. Safe to run again.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 4509 AND `source_type` = 0;
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 4509;
