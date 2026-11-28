-- Saving Yenniku 592 / Filling the Soul Gem 593 (Stranglethorn, Horde; Discord Gefest 11-27 "the quest item can't be used on the
-- mob"): the Soul Gem 3912 casts Yenniku's Release 3607, a 1-damage hit on an enemy target (client SpellEffect: SCHOOL_DAMAGE,
-- TARGET_UNIT_TARGET_ENEMY) that stuns Yenniku and makes him friendly for 60 s (classic_mob_yenniku), so his quest 593 can be
-- handed in for the Filled Soul Gem 3913. Our template has the retail flags (VerifiedBuild 69497) with UNIT_FLAG_IMMUNE_TO_PC 0x100,
-- so a player can never hit him and the gem is refused. Classic: he is a hostile Bloodscalp captive the gem can hit.
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~256 WHERE `entry` = 2530;
