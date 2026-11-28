-- Demonic Brand (warlock talent 1293695, GitHub issue #31): Searing Pain never branded the target, and the brand 1293696 did nothing
-- (its proc aura has no trigger spell). Scripts in classic_talents_warlock_druid.cpp.
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('classic_talent_warl_demonic_brand_searing_pain','classic_talent_warl_demonic_brand_debuff');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(5676,'classic_talent_warl_demonic_brand_searing_pain'),
(17919,'classic_talent_warl_demonic_brand_searing_pain'),
(17920,'classic_talent_warl_demonic_brand_searing_pain'),
(17921,'classic_talent_warl_demonic_brand_searing_pain'),
(17922,'classic_talent_warl_demonic_brand_searing_pain'),
(17923,'classic_talent_warl_demonic_brand_searing_pain'),
(1293696,'classic_talent_warl_demonic_brand_debuff');
