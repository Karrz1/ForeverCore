-- WoW Forever: fixes for 2026_11_23_32 (issue #389 recipe sources) and 2026_11_23_33 (Barkskin Burrow chain) after their test.
--   Ravasaur Juvenile 262696 never spawned: its display 143345 had no creature_model_info row on dev (the cloud world had one,
--   so the file was built without it). Bounding and reach from display 11316, the same model at the same scale (Ravasaur
--   Juvenile 262689 uses it).
--   Gettin' Buzzed 91608 starts from an item (238501), so the quest hands it over: ProvidedItemCount 1.
--   Barkskin Burrow: Open Season (91696, 500 reputation, Wowhead Forever) leaves a player Unfriendly (base -3400, so -2900),
--   and its next quest Of Friend and Fur (92111) ends at Osi Mistpaw, so live lets players talk to the Barkskin furbolgs
--   before Neutral. INFERRED (no live sniff of them): the Barkskin Burrow NPCs (faction template 3569) get "interact while
--   hostile" (unit_flags2 0x4000), as the goblin town NPCs like Gazlowe and Marin Noggenfogger have in our world:
--   Osi Mistpaw 256646, Elder Pinespeaker 256650, Suma Mossmane 260661, Dala Fairmaw 256629.
--   Thark Gorax 266802 (Orgrimmar) and Quintus Wainworth 266803 (Stormwind) stand 9 yards apart and fought each other, so
--   Thark never offered Farsight Guided (96830). INFERRED: both immune to NPCs (unit_flags 0x200), as many paired
--   cross-faction Forever NPCs in our world are.
--   Hyjal Owl 249053: its loot id is set whatever it was before (2026_11_23_33 only set it where it was 0), so Intact Owl Body
--   262816 drops on Wicked Wisdom (93833).
-- Running it again changes nothing.
INSERT IGNORE INTO `creature_model_info` (`DisplayID`,`BoundingRadius`,`CombatReach`,`DisplayID_Other_Gender`,`VerifiedBuild`) VALUES (143345,1.234,1.725,0,-1);
UPDATE `quest_template_addon` SET `ProvidedItemCount`=1 WHERE `ID`=91608;
UPDATE `creature_template` SET `unit_flags2`=`unit_flags2`|0x4000 WHERE `entry` IN (256646,256650,260661,256629);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x200 WHERE `entry` IN (266802,266803);
UPDATE `creature_template_difficulty` SET `LootID`=249053 WHERE `Entry`=249053 AND `DifficultyID`=0;
