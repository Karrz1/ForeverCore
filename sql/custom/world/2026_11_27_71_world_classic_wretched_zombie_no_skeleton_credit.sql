-- Rattling the Rattlecages 3901 (Deathknell, Discord co-op post, row 341 item 1): "Kill 12 Rattlecage Skeletons", but every Wretched
-- Zombie 1502 killed counted as one, so the quest finished on the zombies around the graveyard. The zombie template came from the
-- retail baseline with KillCredit1 = 1890 (Rattlecage Skeleton); live's objective and vanilla count only the skeletons. No other
-- creature gives credit for 1890. Safe to run again.
UPDATE `creature_template` SET `KillCredit1`=0 WHERE `entry`=1502 AND `KillCredit1`=1890;
