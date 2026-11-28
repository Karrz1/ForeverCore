-- WoW Forever: the Lonely Lantern (660408) and the Corrupted Cat Figurine (660432) from 2026_11_22_36 get the values of the live
-- client cache (enUS, build 70938): lantern goober with lock 43, auto close 300, cooldown 300, cast 1301234 by the player (Data23,
-- as the event script 2026_11_22_37 expects), multi interact, no open animation; figurine chest with live loot id 142104 (holds
-- item 276909), chest flags 4097 and content tuning 5841. Their player conditions (159074, 133994) are not in our data and are left
-- out; the conditions row of 2026_11_22_36 keeps the lantern's figurine check. Safe to run again.
DELETE FROM `gameobject_template` WHERE `entry` IN (660408,660432);
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`size`,`Data0`,`Data1`,`Data2`,`Data3`,`Data4`,`Data5`,`Data6`,`Data7`,`Data8`,`Data9`,`Data10`,`Data11`,`Data12`,`Data13`,`Data14`,`Data15`,`Data16`,`Data17`,`Data18`,`Data19`,`Data20`,`Data21`,`Data22`,`Data23`,`Data24`,`Data25`,`Data26`,`Data27`,`Data28`,`Data29`,`Data30`,`Data31`,`Data32`,`Data33`,`Data34`,`ContentTuningId`,`RequiredLevel`,`AIName`,`ScriptName`,`StringId`,`VerifiedBuild`) VALUES
(660408,10,438,'Lonely Lantern','','','',1,43,0,0,300,0,0,300,0,0,0,1301234,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,'','',NULL,70938),
(660432,3,127148,'Corrupted Cat Figurine','','','',1,0,142104,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4097,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5841,0,'','',NULL,70938);
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (660432,142104) AND `Item` = 276909;
INSERT INTO `gameobject_loot_template` (`Entry`,`ItemType`,`Item`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(142104,0,276909,100,0,1,0,1,1,'Corrupted Cat Figurine');
