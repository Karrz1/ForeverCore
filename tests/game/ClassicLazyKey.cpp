/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "tc_catch2.h"

#include "../../src/modules/PlayerbotV2/Combat/LazyKey.h"

using namespace Playerbot::LazyKey;

namespace
{
// A level 60 character of the class with every spell of its rules known and ready, in combat with a fresh target in melee and in range,
// full mana and energy, 50 rage, no combo points, nobody hurt.
Input Fresh(uint8_t cls, Role role = Role::Dps)
{
    Input in;
    in.cls = cls;
    in.role = role;
    in.known = Spells(cls);
    in.ready = Spells(cls);
    in.in_combat = true;
    in.has_target = true;
    in.target_in_melee = true;
    in.target_in_range = true;
    in.target_on_me = true;
    in.target_attacking = true;
    in.rage = 50;
    in.has_healee = true;
    in.healee_is_self = true;
    in.healee_hp_pct = 100;
    return in;
}

void Drop(std::vector<uint32_t>& v, uint32_t id) { v.erase(std::remove(v.begin(), v.end(), id), v.end()); }
}

TEST_CASE("Nothing happens while a cast is going", "[ClassicLazyKey]")
{
    Input in = Fresh(kMage);
    in.casting = true;
    CHECK(Pick(in).spell == 0);
}

TEST_CASE("A warrior tank goes into Defensive Stance, then taunts a target that hits someone else", "[ClassicLazyKey]")
{
    Input in = Fresh(kWarrior, Role::Tank);
    in.form = Form::Battle;
    CHECK(Pick(in).spell == Id::DefensiveStance);
    in.form = Form::Defensive;
    in.target_on_me = false;
    CHECK(Pick(in).spell == Id::Taunt);
    in.target_on_me = true;
    CHECK(Pick(in).spell == Id::ShieldBlock);
    Drop(in.ready, Id::ShieldBlock);
    CHECK(Pick(in).spell == Id::Revenge);
}

TEST_CASE("A damage warrior executes, uses procs, then its strike, and dumps rage into Heroic Strike", "[ClassicLazyKey]")
{
    Input in = Fresh(kWarrior);
    in.form = Form::Battle;
    in.on_self.push_back(Id::BattleShout);
    in.target_hp_pct = 15;
    CHECK(Pick(in).spell == Id::Execute);
    in.target_hp_pct = 80;
    CHECK(Pick(in).spell == Id::Overpower);
    in.blocked.push_back(Id::Overpower);              // no dodge to overpower: refused, left out
    CHECK(Pick(in).spell == Id::MortalStrike);
    Drop(in.ready, Id::MortalStrike);
    Drop(in.ready, Id::Bloodthirst);
    Drop(in.ready, Id::Whirlwind);
    in.rage = 70;
    CHECK(Pick(in).spell == Id::HeroicStrike);
    CHECK(OffGlobalCooldown(Id::HeroicStrike));
}

TEST_CASE("A low level warrior keeps Rend up and spends rage on Heroic Strike", "[ClassicLazyKey]")
{
    Input in = Fresh(kWarrior);
    in.known = { Id::HeroicStrike, Id::Rend, Id::BattleShout, Id::Charge };
    in.ready = in.known;
    in.form = Form::Battle;
    in.on_self.push_back(Id::BattleShout);
    in.rage = 20;
    CHECK(Pick(in).spell == Id::Rend);
    in.on_target.push_back(Id::Rend);
    CHECK(Pick(in).spell == Id::HeroicStrike);
}

TEST_CASE("A paladin seals, judges, and saves Exorcism for undead and demons", "[ClassicLazyKey]")
{
    Input in = Fresh(kPaladin);
    Drop(in.known, Id::SealOfCommand);
    CHECK(Pick(in).spell == Id::SealOfRighteousness);
    in.on_self.push_back(Id::SealOfRighteousness);
    CHECK(Pick(in).spell == Id::Judgement);
    in.target_undead_or_demon = true;
    CHECK(Pick(in).spell == Id::Exorcism);
}

TEST_CASE("A hunter starts Auto Shot, marks, stings, and goes to melee strikes up close", "[ClassicLazyKey]")
{
    Input in = Fresh(kHunter);
    in.on_self.push_back(Id::AspectOfTheHawk);
    in.target_in_melee = false;
    in.target_boss = true;
    Drop(in.ready, Id::BestialWrath);
    Drop(in.ready, Id::RapidFire);
    CHECK(Pick(in).spell == Id::AutoShot);
    in.auto_shooting = true;
    CHECK(Pick(in).spell == Id::HuntersMark);
    in.on_target.push_back(Id::HuntersMark);
    CHECK(Pick(in).spell == Id::SerpentSting);
    in.target_in_melee = true;
    CHECK(Pick(in).spell == Id::MongooseBite);
}

TEST_CASE("A rogue keeps Slice and Dice and spends five points on Eviscerate", "[ClassicLazyKey]")
{
    Input in = Fresh(kRogue);
    Drop(in.ready, Id::Riposte);
    Drop(in.ready, Id::AdrenalineRush);
    Drop(in.known, Id::GhostlyStrike);
    Drop(in.known, Id::Hemorrhage);
    Drop(in.ready, Id::ColdBlood);
    CHECK(Pick(in).spell == Id::SinisterStrike);
    in.combo = 2;
    CHECK(Pick(in).spell == Id::SliceAndDice);
    in.on_self.push_back(Id::SliceAndDice);
    in.combo = 5;
    CHECK(Pick(in).spell == Id::Eviscerate);
    in.energy = 20;
    CHECK(Pick(in).spell == 0);
}

TEST_CASE("A healer priest shields a dying member, then heals past Weakened Soul, and fights when nobody is hurt", "[ClassicLazyKey]")
{
    Input in = Fresh(kPriest, Role::Heal);
    in.healee_is_self = false;
    in.healee_hp_pct = 30;
    Choice c = Pick(in);
    CHECK(c.spell == Id::PowerWordShield);
    CHECK(c.at == At::Healee);
    in.on_healee.push_back(Id::WeakenedSoul);
    CHECK(Pick(in).spell == Id::FlashHeal);
    in.healee_hp_pct = 80;
    CHECK(Pick(in).spell == Id::Renew);
    in.hurt_count = 3;
    CHECK(Pick(in).spell == Id::PrayerOfHealing);
    in.hurt_count = 0;
    in.healee_hp_pct = 100;
    in.form = Form::None;
    Drop(in.known, Id::Shadowform);
    CHECK(Pick(in).spell == Id::VampiricEmbrace);       // nobody hurt: the healer fights, Vampiric Embrace first on a fresh long fight
}

TEST_CASE("A shaman healer uses Chain Heal on three hurt and Nature's Swiftness in an emergency", "[ClassicLazyKey]")
{
    Input in = Fresh(kShaman, Role::Heal);
    in.healee_is_self = false;
    in.healee_hp_pct = 60;
    in.hurt_count = 3;
    CHECK(Pick(in).spell == Id::ChainHeal);
    in.hurt_count = 1;
    in.healee_hp_pct = 30;
    CHECK(Pick(in).spell == Id::ShamanSwiftness);
    CHECK(OffGlobalCooldown(Id::ShamanSwiftness));
}

TEST_CASE("A mage novas an enemy in melee, then casts its tree's filler and wands when dry", "[ClassicLazyKey]")
{
    Input in = Fresh(kMage);
    in.on_self = { Id::ArcaneIntellect, Id::IceArmor };
    CHECK(Pick(in).spell == Id::FrostNova);
    in.target_on_me = false;
    in.target_in_melee = false;
    Drop(in.ready, Id::FireBlast);
    in.tree = 3;
    CHECK(Pick(in).spell == Id::Frostbolt);
    in.tree = 2;
    CHECK(Pick(in).spell == Id::Fireball);
    in.mana_pct = 5;
    in.wand = true;
    CHECK(Pick(in).spell == Id::Shoot);
}

TEST_CASE("A druid tank goes into Bear Form and growls; a druid healer leaves Cat Form to heal", "[ClassicLazyKey]")
{
    Input in = Fresh(kDruid, Role::Tank);
    CHECK(Pick(in).spell == Id::DireBearForm);
    in.form = Form::Bear;
    in.target_on_me = false;
    CHECK(Pick(in).spell == Id::Growl);

    Input heal = Fresh(kDruid, Role::Heal);
    heal.form = Form::Cat;
    heal.healee_is_self = false;
    heal.healee_hp_pct = 50;
    CHECK(Pick(heal).cancel_form);
    heal.form = Form::None;
    CHECK(Pick(heal).spell == Id::Rejuvenation);
}

TEST_CASE("Out of combat with no target the press keeps the buffs up", "[ClassicLazyKey]")
{
    Input in = Fresh(kShaman);
    in.in_combat = false;
    in.has_target = false;
    CHECK(Pick(in).spell == Id::LightningShield);
    in.on_self.push_back(Id::LightningShield);
    CHECK(Pick(in).spell == Id::WindfuryWeapon);
    in.weapon_imbued = true;
    CHECK(Pick(in).spell == 0);
}

TEST_CASE("Specs map onto the three trees, Guardian onto Feral", "[ClassicLazyKey]")
{
    CHECK(TreeOfSpec(kWarrior, 73) == 3);
    CHECK(TreeOfSpec(kMage, 62) == 1);
    CHECK(TreeOfSpec(kDruid, 104) == 2);
    CHECK(TreeOfSpec(kDruid, 105) == 3);
    CHECK(TreeOfSpec(kPriest, 999) == 0);
    CHECK(Spells(9).empty());                           // the warlock has its own rotation
}
