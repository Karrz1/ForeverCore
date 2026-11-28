-- WoW Forever: quest givers and hand-ins players saw in Forever that ours lacked (Data from ForeverDB.net, https://foreverdb.net,
-- GPL-3.0, addon data 2026-11-22.f7a53319). Added beside our own NPC, which stays: nothing is removed.
--  1798 Seeking Strahad: Lago Blackwrench 6120 offers it (5 players; ours had only Gakin the Darkbinder 6122).
--  96381: NPC 260271 offers it and takes it back (8 players; ours had only 260146).
-- Each row goes in only if the quest and the NPC exist in our world. Safe to run again.
DELETE FROM `creature_queststarter` WHERE `id`=6120 AND `quest`=1798;
INSERT INTO `creature_queststarter` (`id`,`quest`) SELECT 6120,1798 FROM `quest_template` q JOIN `creature_template` c ON c.`entry`=6120 WHERE q.`ID`=1798;
DELETE FROM `creature_queststarter` WHERE `id`=260271 AND `quest`=96381;
INSERT INTO `creature_queststarter` (`id`,`quest`) SELECT 260271,96381 FROM `quest_template` q JOIN `creature_template` c ON c.`entry`=260271 WHERE q.`ID`=96381;
DELETE FROM `creature_questender` WHERE `id`=260271 AND `quest`=96381;
INSERT INTO `creature_questender` (`id`,`quest`) SELECT 260271,96381 FROM `quest_template` q JOIN `creature_template` c ON c.`entry`=260271 WHERE q.`ID`=96381;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (6120,260271) AND (`npcflag`&2)=0;
