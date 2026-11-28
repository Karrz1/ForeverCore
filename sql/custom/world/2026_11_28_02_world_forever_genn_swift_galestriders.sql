-- Genn Fairweather 265756 (Zephras stablemaster) sells the three swift Galestriders again: Swift Umber 274933, Swift Empyrean
-- 269671 and Swift Stormy 269678. Their vendor rows carry live's PlayerCondition 166014, which the 1.60 client data does not
-- have and no server condition defines, so the server dropped the rows at startup (ObjectMgr::IsVendorItemValid: serverside
-- PlayerConditionId without conditions) and only the three level-40 Galestriders were for sale. The items keep their own gate
-- (required level 60, Swift riding to learn). Discord Fox 11-22 (row 287). Safe to run more than once.
UPDATE `npc_vendor` SET `PlayerConditionID`=0 WHERE `entry`=265756 AND `item` IN (274933,269671,269678) AND `PlayerConditionID`=166014;
