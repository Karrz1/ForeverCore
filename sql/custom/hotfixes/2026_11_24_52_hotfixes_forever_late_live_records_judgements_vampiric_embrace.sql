-- WoW Forever: late-published live hotfix records of older pushes that our hotfixes lacked (live hotfix cache mirror, 24 Nov 2026 04:31 UTC,
-- build 71037; the cache-sniff thread's list cache-sniff-1113-0047-late-records-to-decide). Blizzard's values unchanged.
--   Push 113887 (hotfixes of 11 and 13 Nov): every rank of Judgement of Righteousness, Fury, Light, Wisdom, Justice and the Crusader is a
--     ranged attack, SpellCategories DefenseType 3 (29 rows; already so in the 70959 client files, these rows bring older clients and
--     an older server data folder in step). Judgement of Command stays melee. Spell.cpp keeps their melee item procs off.
--   Push 114093 (hotfix of 16 Nov): Vampiric Embrace 15286 heals the party for 10% of the Shadow damage (effect 0, was 20) and the priest
--     gets 100% more from it (new effect 1, 1372611). classic_spell_pri_vampiric_embrace / _heal read both.
--   Push 114097: Unbridled Wrath 12322 and Flurry 12966 proc on melee abilities too (ProcTypeMask 4 -> 20); their scripts keep the
--     on-next-swing abilities only, Heroic Strike and Cleave (wowsims/forever, MIT, docs/evidence EV-0148, EV-0138).
-- Thanks to Everlake (buildthehomelab, GPL-3) for spotting the Vampiric Embrace and judgement records first.
-- hotfix_data 2106471-2106503 (ours, after the cache-sniff thread's kit 0048, 2106329-2106470). Safe to run again.
DELETE FROM `spell_categories` WHERE `ID` IN (187639,187641,76027,76028,76053,76065,76158,76203,76246,76253,76285,76315,76316,76317,76330,76334,76345,76369,76375,76518,76533,76556,76573,76574,76575,76611,76612,76738,76739);
INSERT INTO `spell_categories` (`ID`,`DifficultyID`,`Category`,`DefenseType`,`DiminishType`,`DispelType`,`Mechanic`,`PreventionType`,`StartRecoveryCategory`,`ChargeCategory`,`SpellID`,`VerifiedBuild`) VALUES
(187639,0,0,3,0,0,0,1,0,0,1311650,71037),
(187641,0,0,3,0,0,0,1,0,0,1311655,71037),
(76027,0,0,3,0,1,0,1,0,0,20345,71037),
(76028,0,0,3,0,1,0,1,0,0,20346,71037),
(76053,0,0,3,0,1,0,1,0,0,20185,71037),
(76065,0,0,3,0,1,0,1,0,0,20344,71037),
(76158,0,0,3,0,1,0,1,0,0,20184,71037),
(76203,0,0,3,0,1,0,1,0,0,21183,71037),
(76246,0,0,3,0,1,0,1,0,0,20186,71037),
(76253,0,0,3,0,0,0,1,0,0,20286,71037),
(76285,0,0,3,0,1,0,1,0,0,20188,71037),
(76315,0,0,3,0,1,0,1,0,0,20354,71037),
(76316,0,0,3,0,1,0,1,0,0,20355,71037),
(76317,0,0,3,0,0,0,1,0,0,20411,71037),
(76330,0,0,3,0,0,0,1,0,0,20187,71037),
(76334,0,0,3,0,0,0,1,0,0,20183,71037),
(76345,0,0,3,0,0,0,1,0,0,20414,71037),
(76369,0,0,3,0,1,0,1,0,0,20302,71037),
(76375,0,0,3,0,1,0,1,0,0,20300,71037),
(76518,0,0,3,0,0,0,1,0,0,20280,71037),
(76533,0,0,3,0,0,0,1,0,0,20281,71037),
(76556,0,0,3,0,0,0,1,0,0,20285,71037),
(76573,0,0,3,0,0,0,1,0,0,20282,71037),
(76574,0,0,3,0,0,0,1,0,0,20283,71037),
(76575,0,0,3,0,0,0,1,0,0,20284,71037),
(76611,0,0,3,0,0,0,1,0,0,20412,71037),
(76612,0,0,3,0,0,0,1,0,0,20413,71037),
(76738,0,0,3,0,1,0,1,0,0,20301,71037),
(76739,0,0,3,0,1,0,1,0,0,20303,71037);
DELETE FROM `spell_effect` WHERE `ID` IN (694156,1372611);
INSERT INTO `spell_effect` (`ID`,`EffectAura`,`DifficultyID`,`EffectIndex`,`Effect`,`EffectAmplitude`,`EffectAttributes`,`EffectAuraPeriod`,`EffectBonusCoefficient`,`EffectChainAmplitude`,`EffectChainTargets`,`EffectItemType`,`EffectMechanic`,`EffectPointsPerResource`,`EffectPosFacing`,`EffectRealPointsPerLevel`,`EffectTriggerSpell`,`BonusCoefficientFromAP`,`PvpMultiplier`,`Coefficient`,`Variance`,`ResourceCoefficient`,`GroupSizeBasePointsCoefficient`,`EffectBasePoints`,`ScalingClass`,`TargetNodeGraph`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectSpellClassMask1`,`EffectSpellClassMask2`,`EffectSpellClassMask3`,`EffectSpellClassMask4`,`ImplicitTarget1`,`ImplicitTarget2`,`SpellID`,`VerifiedBuild`) VALUES
(694156,4,0,0,6,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,1,10,0,0,0,0,0,0,0,0,0,0,6,0,15286,71037),
(1372611,4,0,1,6,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,1,100,0,0,0,0,0,0,0,0,0,0,6,0,15286,71037);
DELETE FROM `spell_aura_options` WHERE `ID` IN (124699,126501);
INSERT INTO `spell_aura_options` (`ID`,`DifficultyID`,`CumulativeAura`,`ProcCategoryRecovery`,`ProcChance`,`ProcCharges`,`SpellProcsPerMinuteID`,`ProcTypeMask1`,`ProcTypeMask2`,`SpellID`,`VerifiedBuild`) VALUES
(124699,0,0,0,100,0,0,20,0,12322,71037),
(126501,0,0,0,100,3,0,20,0,12966,71037);
DELETE FROM `hotfix_data` WHERE `Id` BETWEEN 2106471 AND 2106503;
INSERT INTO `hotfix_data` (`Id`,`UniqueId`,`TableHash`,`RecordId`,`Status`,`VerifiedBuild`) VALUES
(2106471,1397826471,3689412649,187639,1,71037),
(2106472,1397826472,3689412649,187641,1,71037),
(2106473,1397826473,3689412649,76027,1,71037),
(2106474,1397826474,3689412649,76028,1,71037),
(2106475,1397826475,3689412649,76053,1,71037),
(2106476,1397826476,3689412649,76065,1,71037),
(2106477,1397826477,3689412649,76158,1,71037),
(2106478,1397826478,3689412649,76203,1,71037),
(2106479,1397826479,3689412649,76246,1,71037),
(2106480,1397826480,3689412649,76253,1,71037),
(2106481,1397826481,3689412649,76285,1,71037),
(2106482,1397826482,3689412649,76315,1,71037),
(2106483,1397826483,3689412649,76316,1,71037),
(2106484,1397826484,3689412649,76317,1,71037),
(2106485,1397826485,3689412649,76330,1,71037),
(2106486,1397826486,3689412649,76334,1,71037),
(2106487,1397826487,3689412649,76345,1,71037),
(2106488,1397826488,3689412649,76369,1,71037),
(2106489,1397826489,3689412649,76375,1,71037),
(2106490,1397826490,3689412649,76518,1,71037),
(2106491,1397826491,3689412649,76533,1,71037),
(2106492,1397826492,3689412649,76556,1,71037),
(2106493,1397826493,3689412649,76573,1,71037),
(2106494,1397826494,3689412649,76574,1,71037),
(2106495,1397826495,3689412649,76575,1,71037),
(2106496,1397826496,3689412649,76611,1,71037),
(2106497,1397826497,3689412649,76612,1,71037),
(2106498,1397826498,3689412649,76738,1,71037),
(2106499,1397826499,3689412649,76739,1,71037),
(2106500,1397826500,4030871717,694156,1,71037),
(2106501,1397826501,4030871717,1372611,1,71037),
(2106502,1397826502,4096770149,124699,1,71037),
(2106503,1397826503,4096770149,126501,1,71037);
