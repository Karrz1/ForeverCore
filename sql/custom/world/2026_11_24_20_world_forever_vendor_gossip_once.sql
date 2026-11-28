-- "I want to browse your goods." showed twice at Gordon Wendham (4556, Undercity) and at the vendors of gossip menus 681
-- (Charys Yserian, Owen Vaughn, Wynne Larson, Evan Larson, Ardwyn Cailen, Maria Lumere, Duncan Cullen, Allan Hafgan,
-- Jessara Cordell in Stormwind) and 4325 (Ahanu, Thunder Bluff). Besides the real vendor option 1, each menu had an option 13
-- with the placeholder text GOSSIP_OPTION_ARMORER, also a vendor option with the same broadcast text 3370, from the baseline
-- import. These three are the only placeholder options left in the world. Option 13 goes. Safe to run again.
DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (681,4283,4325) AND `OptionID` = 13 AND `OptionText` = 'GOSSIP_OPTION_ARMORER';
