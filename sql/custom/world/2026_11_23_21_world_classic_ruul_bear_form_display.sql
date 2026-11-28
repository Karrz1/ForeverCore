-- Freedom to Ruul (6482): Ruul Snowhoof (12818) was invisible, in his cage and during the escort.
-- His Shapechange aura (20514, from creature_template_addon) transforms him into Ruul Snowhoof Bear Form (12819), whose only
-- model was the retail display 29421. The Forever client has no such display, so the server skips it at startup
-- ("Creature (Entry: 12819) does not have any existing display id in creature_template_model") and the transform falls
-- back to the invisible model.
-- 145266 is the client's white skin of the tauren druid bear (model 214, texture 305432), the white bear live WoW Forever
-- shows. Retail's 29421 is the same model with a white texture (1336663), and 2289 is the brown default skin.
-- 145266 has no creature_model_info row: it gets 2289's, the same model at the same scale.
-- Safe to run again.

DELETE FROM `creature_template_model` WHERE `CreatureID` = 12819;
INSERT INTO `creature_template_model` (`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) VALUES
(12819,0,145266,1,100,0);

DELETE FROM `creature_model_info` WHERE `DisplayID` = 145266;
INSERT INTO `creature_model_info` (`DisplayID`,`BoundingRadius`,`CombatReach`,`DisplayID_Other_Gender`,`VerifiedBuild`) VALUES
(145266,1.18427,1.2,0,0);
