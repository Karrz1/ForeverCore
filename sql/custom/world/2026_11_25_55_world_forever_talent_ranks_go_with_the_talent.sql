-- Respec: the higher ranks of a talent spell, bought from the class trainer, stayed after the talent was taken out (Discord RU,
-- 2026-11-23: Trueshot Aura kept after Marksmanship -> Beast Mastery; dev: 94 hunters at 40+ have 19506). The trainers sell them
-- with the talent (or the rank before) as ReqAbility, but the Classic data has no rank chain for these spells, so
-- Player::RemoveSpell found nothing to take with the talent. spell_required gives it the link: removing the talent disables each
-- rank bought on it (ApplyTraitEntry removes with disabled = true), and taking the talent again brings them back.
-- Rows: every trainer_spell whose ReqAbility is a talent (TraitDefinition spell) or a rank already in this list; pairs inside a
-- real rank chain (Mortal Strike, Bloodthirst, Shield Slam, ...) are left out, the chain already does it. Safe to run again.
DELETE FROM `spell_required` WHERE (`spell_id`, `req_spell`) IN (
(12505,11366),
(12522,12505),
(12523,12522),
(12524,12523),
(12525,12524),
(12526,12525),
(13018,11113),
(13019,13018),
(13020,13019),
(13021,13020),
(13031,11426),
(13032,13031),
(13033,13032),
(15430,15237),
(15431,15430),
(17311,15407),
(17312,17311),
(17313,17312),
(17314,17313),
(17354,16190),
(17359,17354),
(17962,1293818),
(18807,17314),
(18809,12526),
(18867,17877),
(18868,18867),
(18869,18868),
(18870,18869),
(18871,18870),
(18879,18265),
(18880,18879),
(18881,18880),
(18930,17962),
(18931,18930),
(18932,18931),
(19506,1299348),
(20473,1311606),
(20905,19506),
(20906,20905),
(20909,19306),
(20909,1242634),
(20910,20909),
(20915,20375),
(20918,20915),
(20919,20918),
(20920,20919),
(20927,20925),
(20928,20927),
(20929,20473),
(20930,20929),
(24974,5570),
(24975,24974),
(24976,24975),
(24977,24976),
(27799,15431),
(27800,27799),
(27801,27800),
(400640,1312002),
(1238073,1238070),
(1238214,408120),
(1238215,1238214),
(1238299,408490),
(1238300,1238299),
(1239242,408521),
(1239243,1239242),
(1239696,400574),
(1239697,1239696),
(1239699,1239697),
(1239700,1239699),
(1240044,400640),
(1240045,1240044),
(1240046,1240045),
(1240047,1240046),
(1240720,402174),
(1240721,1240720),
(1240826,401859),
(1240827,1240826),
(1242634,19306),
(1293525,1293241),
(1293526,1293525),
(1293527,1293526),
(1293812,412758),
(1293813,1293812),
(1293818,1293817),
(1299348,1299346),
(1310785,1310687),
(1310786,1310785),
(1311590,1310911),
(1311595,1311590),
(1316995,1240721),
(1325256,17359),
(1326047,1238300),
(1326080,1326079),
(1326081,1326080),
(1326082,1326081));
INSERT INTO `spell_required` (`spell_id`, `req_spell`) VALUES
(12505,11366), -- Pyroblast <- Pyroblast
(12522,12505), -- Pyroblast <- Pyroblast
(12523,12522), -- Pyroblast <- Pyroblast
(12524,12523), -- Pyroblast <- Pyroblast
(12525,12524), -- Pyroblast <- Pyroblast
(12526,12525), -- Pyroblast <- Pyroblast
(13018,11113), -- Blast Wave <- Blast Wave
(13019,13018), -- Blast Wave <- Blast Wave
(13020,13019), -- Blast Wave <- Blast Wave
(13021,13020), -- Blast Wave <- Blast Wave
(13031,11426), -- Ice Barrier <- Ice Barrier
(13032,13031), -- Ice Barrier <- Ice Barrier
(13033,13032), -- Ice Barrier <- Ice Barrier
(15430,15237), -- Holy Nova <- Holy Nova
(15431,15430), -- Holy Nova <- Holy Nova
(17311,15407), -- Mind Flay <- Mind Flay
(17312,17311), -- Mind Flay <- Mind Flay
(17313,17312), -- Mind Flay <- Mind Flay
(17314,17313), -- Mind Flay <- Mind Flay
(17354,16190), -- Mana Tide Totem <- Mana Tide Totem
(17359,17354), -- Mana Tide Totem <- Mana Tide Totem
(17962,1293818), -- Conflagrate <- Conflagrate
(18807,17314), -- Mind Flay <- Mind Flay
(18809,12526), -- Pyroblast <- Pyroblast
(18867,17877), -- Shadowburn <- Shadowburn
(18868,18867), -- Shadowburn <- Shadowburn
(18869,18868), -- Shadowburn <- Shadowburn
(18870,18869), -- Shadowburn <- Shadowburn
(18871,18870), -- Shadowburn <- Shadowburn
(18879,18265), -- Siphon Life <- Siphon Life
(18880,18879), -- Siphon Life <- Siphon Life
(18881,18880), -- Siphon Life <- Siphon Life
(18930,17962), -- Conflagrate <- Conflagrate
(18931,18930), -- Conflagrate <- Conflagrate
(18932,18931), -- Conflagrate <- Conflagrate
(19506,1299348), -- Trueshot Aura <- Trueshot Aura
(20473,1311606), -- Holy Shock <- Holy Shock
(20905,19506), -- Trueshot Aura <- Trueshot Aura
(20906,20905), -- Trueshot Aura <- Trueshot Aura
(20909,19306), -- Counterattack <- Counterattack
(20909,1242634), -- Counterattack <- Counterattack
(20910,20909), -- Counterattack <- Counterattack
(20915,20375), -- Seal of Command <- Seal of Command
(20918,20915), -- Seal of Command <- Seal of Command
(20919,20918), -- Seal of Command <- Seal of Command
(20920,20919), -- Seal of Command <- Seal of Command
(20927,20925), -- Holy Shield <- Holy Shield
(20928,20927), -- Holy Shield <- Holy Shield
(20929,20473), -- Holy Shock <- Holy Shock
(20930,20929), -- Holy Shock <- Holy Shock
(24974,5570), -- Insect Swarm <- Insect Swarm
(24975,24974), -- Insect Swarm <- Insect Swarm
(24976,24975), -- Insect Swarm <- Insect Swarm
(24977,24976), -- Insect Swarm <- Insect Swarm
(27799,15431), -- Holy Nova <- Holy Nova
(27800,27799), -- Holy Nova <- Holy Nova
(27801,27800), -- Holy Nova <- Holy Nova
(400640,1312002), -- Ice Lance <- Ice Lance
(1238073,1238070), -- Primal Bite <- Primal Bite
(1238214,408120), -- Wild Growth <- Wild Growth
(1238215,1238214), -- Wild Growth <- Wild Growth
(1238299,408490), -- Lava Burst <- Lava Burst
(1238300,1238299), -- Lava Burst <- Lava Burst
(1239242,408521), -- Riptide <- Riptide
(1239243,1239242), -- Riptide <- Riptide
(1239696,400574), -- Arcane Blast <- Arcane Blast
(1239697,1239696), -- Arcane Blast <- Arcane Blast
(1239699,1239697), -- Arcane Blast <- Arcane Blast
(1239700,1239699), -- Arcane Blast <- Arcane Blast
(1240044,400640), -- Ice Lance <- Ice Lance
(1240045,1240044), -- Ice Lance <- Ice Lance
(1240046,1240045), -- Ice Lance <- Ice Lance
(1240047,1240046), -- Ice Lance <- Ice Lance
(1240720,402174), -- Penance <- Penance
(1240721,1240720), -- Penance <- Penance
(1240826,401859), -- Prayer of Mending <- Prayer of Mending
(1240827,1240826), -- Prayer of Mending <- Prayer of Mending
(1242634,19306), -- Counterattack <- Counterattack
(1293525,1293241), -- Summon Hawk <- Summon Hawk
(1293526,1293525), -- Summon Hawk <- Summon Hawk
(1293527,1293526), -- Summon Hawk <- Summon Hawk
(1293812,412758), -- Incinerate <- Incinerate
(1293813,1293812), -- Incinerate <- Incinerate
(1293818,1293817), -- Conflagrate <- Conflagrate
(1299348,1299346), -- Trueshot Aura <- Trueshot Aura
(1310785,1310687), -- Sniper Shot <- Sniper Shot
(1310786,1310785), -- Sniper Shot <- Sniper Shot
(1311590,1310911), -- Light's Vigil <- Light's Vigil
(1311595,1311590), -- Light's Vigil <- Light's Vigil
(1316995,1240721), -- Penance <- Penance
(1325256,17359), -- Mana Tide Totem <- Mana Tide Totem
(1326047,1238300), -- Lava Burst <- Lava Burst
(1326080,1326079), -- Arcane Wrath <- Arcane Wrath
(1326081,1326080), -- Arcane Wrath <- Arcane Wrath
(1326082,1326081); -- Arcane Wrath <- Arcane Wrath