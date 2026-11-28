// One-button rotation for every class but the warlock (which keeps its own Combat/LazyLock.h): the decision, on plain numbers.
//
// `.playerbot lazy` (the add-on's "Lazy key") gives the single next spell for the player's class, role and target, from what the
// player knows, what is ready, what is already on the target and the resources. Session/LazyKey.cpp gathers those facts from the live
// Player and casts the answer; this header holds no game objects, so the order of the rules is unit-tested (tests/game/ClassicLazyKey.cpp).
//
// Spell ids are rank 1 of the vanilla (1.12) spells; the caller casts and checks the highest rank the player knows.
// Roles: the player's spec decides (tank / healer spec), `.playerbot lazy dps|tank|heal` overrides it for that press.
//   heal  the most hurt group member in reach (or the player) gets the heal that fits the gap; with nobody hurt the press fights.
//   tank  stance / form first, a taunt when the target is on someone else, the threat spells, then the rage dump.
//   dps   procs and executes, cooldowns on fights that last (bosses, players), dots kept up, the filler.
// Out of combat with nothing selected a press keeps the class's self buffs up.
// `blocked` lets the caller take a spell out of the choice for a while (it was refused): the rest of the list moves up.
#pragma once

#include <algorithm>
#include <cstdint>
#include <initializer_list>
#include <vector>

namespace Playerbot::LazyKey {

enum class Role : uint8_t { Dps, Tank, Heal };
enum class Form : uint8_t { None, Bear, Cat, Moonkin, Battle, Defensive, Berserker, Shadow, Stealth };
enum class At : uint8_t { Target, Self, Healee };

// Vanilla classes (ChrClasses ids).
constexpr uint8_t kWarrior = 1, kPaladin = 2, kHunter = 3, kRogue = 4, kPriest = 5, kShaman = 7, kMage = 8, kDruid = 11;

namespace Id {
// Shared
constexpr uint32_t Shoot = 5019, AutoShot = 75, WeakenedSoul = 6788;
// Warrior
constexpr uint32_t HeroicStrike = 78, Rend = 772, Charge = 100, ThunderClap = 6343, Overpower = 7384, Revenge = 6572,
                   SunderArmor = 7386, ShieldBlock = 2565, Execute = 5308, Bloodthirst = 23881, MortalStrike = 12294, Whirlwind = 1680,
                   Cleave = 845, ShieldSlam = 23922, DemoralizingShout = 1160, BattleShout = 6673, Bloodrage = 2687, Taunt = 355,
                   ShieldBash = 72, Pummel = 6552, SweepingStrikes = 12292, LastStand = 12975, BattleStance = 2457,
                   DefensiveStance = 71;
// Paladin
constexpr uint32_t SealOfRighteousness = 21084, SealOfCommand = 20375, SealOfTheCrusader = 21082, Judgement = 20271,
                   HolyLight = 635, FlashOfLight = 19750, HolyShock = 20473, Consecration = 26573, HolyShield = 20925, Exorcism = 879,
                   HammerOfWrath = 24275, HammerOfJustice = 853, BlessingOfMight = 19740, BlessingOfWisdom = 19742,
                   DevotionAura = 465, RetributionAura = 7294, RighteousFury = 25780, DivineShield = 642, LayOnHands = 633;
// Hunter
constexpr uint32_t HuntersMark = 1130, SerpentSting = 1978, ArcaneShot = 3044, MultiShot = 2643, AimedShot = 19434,
                   RaptorStrike = 2973, MongooseBite = 1495, WingClip = 2974, RapidFire = 3045, BestialWrath = 19574,
                   AspectOfTheHawk = 13165, AspectOfTheMonkey = 13163, TrueshotAura = 19506;
// Rogue
constexpr uint32_t SinisterStrike = 1752, Eviscerate = 2098, SliceAndDice = 5171, Backstab = 53, Kick = 1766, Hemorrhage = 16511,
                   AdrenalineRush = 13750, BladeFlurry = 13877, ColdBlood = 14177, Riposte = 14251, GhostlyStrike = 14278,
                   Evasion = 5277, Ambush = 8676, CheapShot = 1833;
// Priest
constexpr uint32_t Smite = 585, ShadowWordPain = 589, MindBlast = 8092, PowerWordShield = 17, Renew = 139, LesserHeal = 2050,
                   Heal = 2054, FlashHeal = 2061, GreaterHeal = 2060, MindFlay = 15407, Shadowform = 15473, InnerFire = 588,
                   PowerWordFortitude = 1243, VampiricEmbrace = 15286, HolyFire = 14914, PrayerOfHealing = 596, PsychicScream = 8122,
                   Silence = 15487;
// Shaman
constexpr uint32_t LightningBolt = 403, EarthShock = 8042, FlameShock = 8050, LightningShield = 324, RockbiterWeapon = 8017,
                   FlametongueWeapon = 8024, WindfuryWeapon = 8232, HealingWave = 331, LesserHealingWave = 8004, ChainHeal = 1064,
                   ChainLightning = 421, Stormstrike = 17364, ElementalMastery = 16166, ShamanSwiftness = 16188;
// Mage
constexpr uint32_t Fireball = 133, Frostbolt = 116, ArcaneMissiles = 5143, FireBlast = 2136, ArcaneExplosion = 1449, FrostNova = 122,
                   ArcaneIntellect = 1459, FrostArmor = 168, IceArmor = 7302, MageArmor = 6117, Combustion = 11129,
                   ArcanePower = 12042, PresenceOfMind = 12043, IceBarrier = 11426, Counterspell = 2139;
// Druid
constexpr uint32_t Wrath = 5176, Moonfire = 8921, Rejuvenation = 774, HealingTouch = 5185, Regrowth = 8936, MarkOfTheWild = 1126,
                   Thorns = 467, BearForm = 5487, DireBearForm = 9634, CatForm = 768, Maul = 6807, Swipe = 779,
                   DemoralizingRoar = 99, Claw = 1082, Rake = 1822, Rip = 1079, FerociousBite = 22568, Shred = 5221,
                   FaerieFire = 770, FaerieFireFeral = 16857, InsectSwarm = 5570, Starfire = 2912, Enrage = 5229, Growl = 6795,
                   Bash = 5211, Swiftmend = 18562, DruidSwiftness = 17116, FrenziedRegeneration = 22842;
} // namespace Id

// Every spell a class's rules look at: the caller fills known / ready / auras for these only.
inline std::vector<uint32_t> const& Spells(uint8_t cls)
{
    using namespace Id;
    static std::vector<uint32_t> const none;
    static std::vector<uint32_t> const warrior = { HeroicStrike, Rend, Charge, ThunderClap, Overpower, Revenge, SunderArmor, ShieldBlock,
        Execute, Bloodthirst, MortalStrike, Whirlwind, Cleave, ShieldSlam, DemoralizingShout, BattleShout, Bloodrage, Taunt, ShieldBash,
        Pummel, SweepingStrikes, LastStand, BattleStance, DefensiveStance };
    static std::vector<uint32_t> const paladin = { SealOfRighteousness, SealOfCommand, SealOfTheCrusader, Judgement, HolyLight,
        FlashOfLight, HolyShock, Consecration, HolyShield, Exorcism, HammerOfWrath, HammerOfJustice, BlessingOfMight, BlessingOfWisdom,
        DevotionAura, RetributionAura, RighteousFury, DivineShield, LayOnHands };
    static std::vector<uint32_t> const hunter = { AutoShot, HuntersMark, SerpentSting, ArcaneShot, MultiShot, AimedShot, RaptorStrike,
        MongooseBite, WingClip, RapidFire, BestialWrath, AspectOfTheHawk, AspectOfTheMonkey, TrueshotAura };
    static std::vector<uint32_t> const rogue = { SinisterStrike, Eviscerate, SliceAndDice, Backstab, Kick, Hemorrhage, AdrenalineRush,
        BladeFlurry, ColdBlood, Riposte, GhostlyStrike, Evasion, Ambush, CheapShot };
    static std::vector<uint32_t> const priest = { Shoot, Smite, ShadowWordPain, MindBlast, PowerWordShield, Renew, LesserHeal, Heal,
        FlashHeal, GreaterHeal, MindFlay, Shadowform, InnerFire, PowerWordFortitude, VampiricEmbrace, HolyFire, PrayerOfHealing,
        PsychicScream, Silence };
    static std::vector<uint32_t> const shaman = { LightningBolt, EarthShock, FlameShock, LightningShield, RockbiterWeapon,
        FlametongueWeapon, WindfuryWeapon, HealingWave, LesserHealingWave, ChainHeal, ChainLightning, Stormstrike, ElementalMastery,
        ShamanSwiftness };
    static std::vector<uint32_t> const mage = { Shoot, Fireball, Frostbolt, ArcaneMissiles, FireBlast, ArcaneExplosion, FrostNova,
        ArcaneIntellect, FrostArmor, IceArmor, MageArmor, Combustion, ArcanePower, PresenceOfMind, IceBarrier, Counterspell };
    static std::vector<uint32_t> const druid = { Wrath, Moonfire, Rejuvenation, HealingTouch, Regrowth, MarkOfTheWild, Thorns, BearForm,
        DireBearForm, CatForm, Maul, Swipe, DemoralizingRoar, Claw, Rake, Rip, FerociousBite, Shred, FaerieFire, FaerieFireFeral,
        InsectSwarm, Starfire, Enrage, Growl, Bash, Swiftmend, DruidSwiftness, FrenziedRegeneration };
    switch (cls)
    {
        case kWarrior: return warrior;
        case kPaladin: return paladin;
        case kHunter:  return hunter;
        case kRogue:   return rogue;
        case kPriest:  return priest;
        case kShaman:  return shaman;
        case kMage:    return mage;
        case kDruid:   return druid;
        default:       return none;
    }
}

// Cast without the global cooldown (or on the next swing): the caller casts it and picks again in the same press.
// Not the wand's Shoot: any spell cast after it stops the wand, so the press that starts it ends there (a priest dry of mana started
// the wand and the same press went on to Vampiric Embrace or Shadow Word: Pain, which stopped it again). Auto Shot runs beside the shots.
constexpr bool OffGlobalCooldown(uint32_t id)
{
    using namespace Id;
    return id == HeroicStrike || id == Cleave || id == Maul || id == RaptorStrike || id == Bloodrage || id == LastStand ||
           id == ColdBlood || id == PresenceOfMind || id == ArcanePower || id == Combustion || id == ElementalMastery ||
           id == ShamanSwiftness || id == DruidSwiftness || id == BestialWrath || id == RapidFire || id == AutoShot ||
           id == Enrage || id == Evasion;
}

// The talent tree (1-3, 0 = unknown) of a ChrSpecialization id; a druid's Guardian (104) plays the Feral tree.
constexpr int TreeOfSpec(uint8_t cls, uint32_t spec)
{
    switch (cls)
    {
        case kWarrior: return spec == 71 ? 1 : spec == 72 ? 2 : spec == 73 ? 3 : 0;
        case kPaladin: return spec == 65 ? 1 : spec == 66 ? 2 : spec == 70 ? 3 : 0;
        case kHunter:  return spec == 253 ? 1 : spec == 254 ? 2 : spec == 255 ? 3 : 0;
        case kRogue:   return spec == 259 ? 1 : spec == 260 ? 2 : spec == 261 ? 3 : 0;
        case kPriest:  return spec == 256 ? 1 : spec == 257 ? 2 : spec == 258 ? 3 : 0;
        case kShaman:  return spec == 262 ? 1 : spec == 263 ? 2 : spec == 264 ? 3 : 0;
        case kMage:    return spec == 62 ? 1 : spec == 63 ? 2 : spec == 64 ? 3 : 0;
        case kDruid:   return spec == 102 ? 1 : (spec == 103 || spec == 104) ? 2 : spec == 105 ? 3 : 0;
        default:       return 0;
    }
}

struct Input
{
    std::vector<uint32_t> known;        // in the spellbook (any rank)
    std::vector<uint32_t> ready;        // off cooldown and global cooldown
    std::vector<uint32_t> blocked;      // refused lately (no mana, wrong state, ...): leave it out
    std::vector<uint32_t> on_target;    // this player's aura of the spell is on the target (dots, debuffs)
    std::vector<uint32_t> on_self;      // the aura is on the player (buffs, seals, shields; Weakened Soul from anyone)
    std::vector<uint32_t> on_healee;    // on the heal target: this player's HoTs, Weakened Soul from anyone

    uint8_t cls = 0;
    Role role = Role::Dps;
    Form form = Form::None;
    int tree = 0;                       // talent tree 1-3 of the player's spec, 0 = unknown

    bool casting = false;               // a cast or channel is going
    bool in_combat = false;
    bool has_target = false;            // a living enemy is selected
    bool target_in_melee = false;       // within melee reach
    bool target_in_range = true;        // within spell range (30y)
    bool target_behind = false;         // the player stands behind the target
    bool target_casting = false;        // the target is casting or channelling
    bool target_boss = false;
    bool target_player = false;
    bool target_on_me = false;          // the target attacks the player
    bool target_undead_or_demon = false;
    bool target_attacking = false;      // the target attacks someone (a tank's taunt check)
    bool stealthed = false;
    bool auto_shooting = false;         // Auto Shot / wand on auto-repeat
    bool wand = false;                  // a wand in the ranged slot
    bool has_pet = false;
    bool weapon_imbued = false;         // a temporary enchant on the main hand (shaman imbues)

    int level = 60;
    int hp_pct = 100;
    int mana_pct = 100;
    int rage = 0;
    int energy = 100;
    int combo = 0;
    int target_hp_pct = 100;
    int attackers_close = 0;            // enemies attacking the player within 8 yards

    // Healing: the most hurt friendly player in reach (the player included).
    bool has_healee = false;
    bool healee_is_self = false;
    int healee_hp_pct = 100;
    int hurt_count = 0;                 // group members in reach below 75 %
};

struct Choice
{
    uint32_t spell = 0;                 // 0 = nothing this press
    At at = At::Target;
    char const* why = "";
    bool cancel_form = false;           // leave the shapeshift form first (a druid healing out of a form)
};

inline bool In(std::vector<uint32_t> const& v, uint32_t id) { return std::find(v.begin(), v.end(), id) != v.end(); }
inline bool Knows(Input const& in, uint32_t id) { return In(in.known, id); }
inline bool Can(Input const& in, uint32_t id) { return Knows(in, id) && In(in.ready, id) && !In(in.blocked, id); }
inline bool OnTarget(Input const& in, uint32_t id) { return In(in.on_target, id); }
inline bool OnSelf(Input const& in, uint32_t id) { return In(in.on_self, id); }

// A fight worth a cooldown or a long dot: a boss, a player, or a target still above half health.
inline bool LongFight(Input const& in) { return in.target_boss || in.target_player || in.target_hp_pct >= 50; }

inline Choice Cast(uint32_t id, At at, char const* why) { Choice c; c.spell = id; c.at = at; c.why = why; return c; }
inline Choice Nothing(char const* why) { Choice c; c.why = why; return c; }

// The first of `ids` that can be cast now, or 0.
inline uint32_t FirstCan(Input const& in, std::initializer_list<uint32_t> ids)
{
    for (uint32_t id : ids)
        if (Can(in, id)) return id;
    return 0;
}

// ---------------------------------------------------------------------------------------------------------------------------- healing

struct HealKit
{
    uint32_t hot = 0;        // kept on the healee
    uint32_t fast = 0;       // emergencies
    uint32_t main = 0;       // the efficient heal
    uint32_t big = 0;        // the large heal, when known
    uint32_t group = 0;      // several hurt
    uint32_t shield = 0;     // absorb, not while Weakened Soul
    uint32_t instant = 0;    // instant emergency heal (Holy Shock, Swiftmend)
};

inline HealKit KitOf(uint8_t cls)
{
    using namespace Id;
    HealKit k;
    switch (cls)
    {
        case kPaladin: k.fast = FlashOfLight; k.main = HolyLight; k.instant = HolyShock; break;
        case kPriest:  k.hot = Renew; k.fast = FlashHeal; k.main = Heal; k.big = GreaterHeal; k.group = PrayerOfHealing; k.shield = PowerWordShield; break;
        case kShaman:  k.fast = LesserHealingWave; k.main = HealingWave; k.group = ChainHeal; break;
        case kDruid:   k.hot = Rejuvenation; k.fast = Regrowth; k.main = HealingTouch; k.instant = Swiftmend; break;
        default: break;
    }
    return k;
}

inline bool CanHeal(uint8_t cls) { return cls == kPaladin || cls == kPriest || cls == kShaman || cls == kDruid; }

// The heal for the most hurt group member, or nothing when nobody needs one.
inline Choice PickHeal(Input const& in)
{
    using namespace Id;
    if (!in.has_healee || !CanHeal(in.cls))
        return Nothing("nobody to heal");
    HealKit const k = KitOf(in.cls);
    int const h = in.healee_hp_pct;
    if (h >= 95)
        return Nothing("everyone is healthy");
    // Heals need the caster form.
    if (in.cls == kDruid && in.form != Form::None && in.form != Form::Moonkin && h <= 70)
    {
        Choice c = Nothing("leave form to heal");
        c.cancel_form = true;
        return c;
    }
    At const at = in.healee_is_self ? At::Self : At::Healee;
    bool const lesser_known = Knows(in, LesserHeal) && !Knows(in, Heal);
    uint32_t const main = Knows(in, k.main) ? k.main : (in.cls == kPriest && lesser_known ? LesserHeal : k.main);

    if (h <= 35)
    {
        if (k.shield && Can(in, k.shield) && !In(in.on_healee, WeakenedSoul) && !In(in.on_healee, k.shield)) return Cast(k.shield, at, "emergency: shield");
        if (k.instant && Can(in, k.instant) && (k.instant != Swiftmend || In(in.on_healee, Rejuvenation) || In(in.on_healee, Regrowth)))
            return Cast(k.instant, at, "emergency: instant heal");
        if (in.cls == kShaman && Can(in, ShamanSwiftness)) return Cast(ShamanSwiftness, At::Self, "emergency: Nature's Swiftness");
        if (in.cls == kDruid && Can(in, DruidSwiftness)) return Cast(DruidSwiftness, At::Self, "emergency: Nature's Swiftness");
        if (k.fast && Can(in, k.fast)) return Cast(k.fast, at, "emergency: fast heal");
        if (Can(in, main)) return Cast(main, at, "emergency: main heal");
    }
    if (in.hurt_count >= 3 && k.group && Can(in, k.group) && in.mana_pct >= 20)
        return Cast(k.group, k.group == ChainHeal ? at : At::Self, "three or more hurt: group heal");
    if (h <= 85 && k.hot && Can(in, k.hot) && !In(in.on_healee, k.hot))
        return Cast(k.hot, at, "HoT missing");
    if (h <= 85 && k.shield && in.cls == kPriest && h <= 60 && Can(in, k.shield) && !In(in.on_healee, WeakenedSoul) && !In(in.on_healee, k.shield))
        return Cast(k.shield, at, "shield before the heal");
    if (h <= 50 && k.big && Can(in, k.big) && in.mana_pct >= 30) return Cast(k.big, at, "big gap: large heal");
    if (h <= 75 && Can(in, main)) return Cast(main, at, "gap: main heal");
    if (h <= 75 && k.fast && Can(in, k.fast)) return Cast(k.fast, at, "gap: fast heal (main not ready)");
    return Nothing("small gap: no heal yet");
}

// ------------------------------------------------------------------------------------------------------------------------- classes

inline Choice Warrior(Input const& in)
{
    using namespace Id;
    bool const tank = in.role == Role::Tank;
    if (tank && in.form != Form::Defensive && Can(in, DefensiveStance)) return Cast(DefensiveStance, At::Self, "tank: Defensive Stance");
    if (!tank && in.form == Form::Defensive && in.rage <= 25 && Can(in, BattleStance)) return Cast(BattleStance, At::Self, "damage: Battle Stance");
    if (!in.has_target)
    {
        if (!in.in_combat && !OnSelf(in, BattleShout) && Can(in, BattleShout)) return Cast(BattleShout, At::Self, "no target: Battle Shout");
        return Nothing("no target");
    }
    if (!in.in_combat && !in.target_in_melee && in.form == Form::Battle && Can(in, Charge)) return Cast(Charge, At::Target, "opener: Charge");
    if (in.target_casting && in.target_in_melee)
    {
        if (Can(in, ShieldBash)) return Cast(ShieldBash, At::Target, "interrupt: Shield Bash");
        if (Can(in, Pummel)) return Cast(Pummel, At::Target, "interrupt: Pummel");
    }
    if (in.in_combat && in.rage < 20 && in.hp_pct >= 40 && Can(in, Bloodrage)) return Cast(Bloodrage, At::Self, "low rage: Bloodrage");
    if (!in.target_in_melee) return Nothing("target out of melee");

    if (tank)
    {
        if (in.hp_pct <= 25 && Can(in, LastStand)) return Cast(LastStand, At::Self, "tank low: Last Stand");
        if (in.in_combat && in.target_attacking && !in.target_on_me && Can(in, Taunt)) return Cast(Taunt, At::Target, "target on someone else: Taunt");
        if (in.target_on_me && in.rage >= 10 && Can(in, ShieldBlock)) return Cast(ShieldBlock, At::Self, "tanking: Shield Block");
        if (Can(in, Revenge)) return Cast(Revenge, At::Target, "Revenge");
        if (in.rage >= 20 && Can(in, ShieldSlam)) return Cast(ShieldSlam, At::Target, "Shield Slam");
        if (in.rage >= 30 && Can(in, Bloodthirst)) return Cast(Bloodthirst, At::Target, "Bloodthirst");
        if (in.attackers_close >= 2 && in.rage >= 20 && Can(in, ThunderClap)) return Cast(ThunderClap, At::Self, "two or more on me: Thunder Clap");
        if (!OnTarget(in, DemoralizingShout) && in.rage >= 10 && in.in_combat && Can(in, DemoralizingShout))
            return Cast(DemoralizingShout, At::Self, "Demoralizing Shout");
        if (in.rage >= 50 && Can(in, HeroicStrike)) return Cast(HeroicStrike, At::Target, "rage to spare: Heroic Strike");
        if (in.rage >= 15 && Can(in, SunderArmor)) return Cast(SunderArmor, At::Target, "threat: Sunder Armor");
        return Nothing("tank: waiting for rage");
    }

    if (in.target_hp_pct <= 20 && in.rage >= 15 && Can(in, Execute)) return Cast(Execute, At::Target, "execute range: Execute");
    if (Can(in, Overpower)) return Cast(Overpower, At::Target, "Overpower");
    if (in.rage >= 30 && Can(in, MortalStrike)) return Cast(MortalStrike, At::Target, "Mortal Strike");
    if (in.rage >= 30 && Can(in, Bloodthirst)) return Cast(Bloodthirst, At::Target, "Bloodthirst");
    if (in.rage >= 25 && Can(in, Whirlwind)) return Cast(Whirlwind, At::Self, "Whirlwind");
    if (in.attackers_close >= 2 && in.rage >= 30 && Can(in, SweepingStrikes)) return Cast(SweepingStrikes, At::Self, "two or more: Sweeping Strikes");
    if (!OnSelf(in, BattleShout) && in.rage >= 10 && Can(in, BattleShout)) return Cast(BattleShout, At::Self, "Battle Shout");
    if (!OnTarget(in, Rend) && !in.target_undead_or_demon && in.target_hp_pct >= 40 && !Knows(in, MortalStrike) && !Knows(in, Bloodthirst) &&
        in.rage >= 10 && Can(in, Rend))
        return Cast(Rend, At::Target, "Rend");
    bool const strike_known = Knows(in, MortalStrike) || Knows(in, Bloodthirst);
    if (in.attackers_close >= 2 && in.rage >= 40 && Can(in, Cleave)) return Cast(Cleave, At::Target, "two or more: Cleave");
    if (in.rage >= (strike_known ? 60 : 15) && Can(in, HeroicStrike)) return Cast(HeroicStrike, At::Target, "rage dump: Heroic Strike");
    return Nothing("waiting for rage");
}

inline Choice Paladin(Input const& in)
{
    using namespace Id;
    bool const tank = in.role == Role::Tank;
    if (in.hp_pct <= 15 && Can(in, LayOnHands)) return Cast(LayOnHands, At::Self, "dying: Lay on Hands");
    if (in.hp_pct <= 20 && in.in_combat && !tank && Can(in, DivineShield)) return Cast(DivineShield, At::Self, "dying: Divine Shield");
    if (tank && !OnSelf(in, RighteousFury) && Can(in, RighteousFury)) return Cast(RighteousFury, At::Self, "tank: Righteous Fury");
    if (!in.in_combat)
    {
        uint32_t const blessing = (in.role == Role::Heal || tank) ? BlessingOfWisdom : BlessingOfMight;
        if (!OnSelf(in, blessing) && Can(in, blessing)) return Cast(blessing, At::Self, "out of combat: blessing");
        uint32_t const aura = (in.role == Role::Dps && Knows(in, RetributionAura)) ? RetributionAura : DevotionAura;
        if (!OnSelf(in, aura) && Can(in, aura)) return Cast(aura, At::Self, "out of combat: aura");
    }
    if (!in.has_target) return Nothing("no target");
    if (in.target_casting && Can(in, HammerOfJustice) && !in.target_boss) return Cast(HammerOfJustice, At::Target, "interrupt: Hammer of Justice");
    if (in.target_hp_pct <= 20 && Can(in, HammerOfWrath)) return Cast(HammerOfWrath, At::Target, "execute range: Hammer of Wrath");
    if (in.target_undead_or_demon && Can(in, Exorcism)) return Cast(Exorcism, At::Target, "undead / demon: Exorcism");
    if (tank && in.in_combat && !OnSelf(in, HolyShield) && Can(in, HolyShield)) return Cast(HolyShield, At::Self, "tank: Holy Shield");
    if (in.in_combat && in.attackers_close >= (tank ? 1 : 3) && in.mana_pct >= 30 && Can(in, Consecration))
        return Cast(Consecration, At::Self, "enemies around me: Consecration");
    bool const seal_up = OnSelf(in, SealOfRighteousness) || OnSelf(in, SealOfCommand) || OnSelf(in, SealOfTheCrusader);
    if (!seal_up)
    {
        uint32_t const seal = (!tank && Knows(in, SealOfCommand)) ? SealOfCommand : SealOfRighteousness;
        if (Can(in, seal)) return Cast(seal, At::Self, "no seal: seal");
    }
    if (seal_up && in.target_in_melee && in.in_combat && Can(in, Judgement)) return Cast(Judgement, At::Target, "seal up: Judgement");
    return Nothing("melee swings");
}

inline Choice Hunter(Input const& in)
{
    using namespace Id;
    bool const hawk_or_monkey = OnSelf(in, AspectOfTheHawk) || OnSelf(in, AspectOfTheMonkey);
    if (!hawk_or_monkey)
    {
        if (Can(in, AspectOfTheHawk)) return Cast(AspectOfTheHawk, At::Self, "no aspect: Aspect of the Hawk");
        if (Can(in, AspectOfTheMonkey)) return Cast(AspectOfTheMonkey, At::Self, "no aspect: Aspect of the Monkey");
    }
    if (!in.in_combat && Knows(in, TrueshotAura) && !OnSelf(in, TrueshotAura) && Can(in, TrueshotAura)) return Cast(TrueshotAura, At::Self, "Trueshot Aura");
    if (!in.has_target) return Nothing("no target");
    if (in.target_in_melee)
    {
        if (Can(in, MongooseBite)) return Cast(MongooseBite, At::Target, "melee: Mongoose Bite");
        if (in.target_on_me && !OnTarget(in, WingClip) && Can(in, WingClip)) return Cast(WingClip, At::Target, "melee: Wing Clip");
        if (Can(in, RaptorStrike)) return Cast(RaptorStrike, At::Target, "melee: Raptor Strike");
        return Nothing("melee swings");
    }
    if (!in.target_in_range) return Nothing("target out of range");
    if (!in.auto_shooting && Can(in, AutoShot)) return Cast(AutoShot, At::Target, "Auto Shot");
    if (!OnTarget(in, HuntersMark) && LongFight(in) && Can(in, HuntersMark)) return Cast(HuntersMark, At::Target, "Hunter's Mark");
    if (in.in_combat && in.has_pet && LongFight(in) && Can(in, BestialWrath)) return Cast(BestialWrath, At::Self, "long fight: Bestial Wrath");
    if (in.in_combat && (in.target_boss || in.target_player) && Can(in, RapidFire)) return Cast(RapidFire, At::Self, "boss: Rapid Fire");
    if (!OnTarget(in, SerpentSting) && in.target_hp_pct >= 30 && in.mana_pct >= 15 && Can(in, SerpentSting))
        return Cast(SerpentSting, At::Target, "Serpent Sting");
    if (in.mana_pct >= 30 && Can(in, AimedShot)) return Cast(AimedShot, At::Target, "Aimed Shot");
    if (in.mana_pct >= 40 && Can(in, MultiShot)) return Cast(MultiShot, At::Target, "Multi-Shot");
    if (in.mana_pct >= 40 && Can(in, ArcaneShot)) return Cast(ArcaneShot, At::Target, "Arcane Shot");
    return Nothing("Auto Shot does the rest");
}

inline Choice Rogue(Input const& in)
{
    using namespace Id;
    if (!in.has_target) return Nothing("no target");
    if (in.stealthed)
    {
        if (in.target_behind && Can(in, Ambush)) return Cast(Ambush, At::Target, "stealth, behind: Ambush");
        if (Can(in, CheapShot)) return Cast(CheapShot, At::Target, "stealth: Cheap Shot");
    }
    if (!in.target_in_melee) return Nothing("target out of melee");
    if (in.target_casting && in.energy >= 25 && Can(in, Kick)) return Cast(Kick, At::Target, "interrupt: Kick");
    if (in.hp_pct <= 40 && in.target_on_me && Can(in, Evasion)) return Cast(Evasion, At::Self, "low health: Evasion");
    if (Can(in, Riposte)) return Cast(Riposte, At::Target, "Riposte");
    if (in.in_combat && (in.target_boss || in.target_player) && Can(in, AdrenalineRush)) return Cast(AdrenalineRush, At::Self, "boss: Adrenaline Rush");
    if (in.attackers_close >= 2 && Can(in, BladeFlurry)) return Cast(BladeFlurry, At::Self, "two or more: Blade Flurry");
    if (in.combo >= 2 && !OnSelf(in, SliceAndDice) && in.target_hp_pct >= 30 && in.energy >= 25 && Can(in, SliceAndDice))
        return Cast(SliceAndDice, At::Self, "Slice and Dice");
    if ((in.combo >= 5 || (in.combo >= 3 && in.target_hp_pct <= 25)))
    {
        if (in.combo >= 4 && Can(in, ColdBlood)) return Cast(ColdBlood, At::Self, "finisher: Cold Blood");
        if (in.energy >= 35 && Can(in, Eviscerate)) return Cast(Eviscerate, At::Target, "finisher: Eviscerate");
        return Nothing("waiting for energy (finisher)");
    }
    if (in.energy >= 40 && Can(in, GhostlyStrike)) return Cast(GhostlyStrike, At::Target, "Ghostly Strike");
    if (in.energy >= 35 && Can(in, Hemorrhage)) return Cast(Hemorrhage, At::Target, "builder: Hemorrhage");
    if (in.target_behind && in.energy >= 60 && Can(in, Backstab)) return Cast(Backstab, At::Target, "behind: Backstab");
    if (in.energy >= 45 && Can(in, SinisterStrike)) return Cast(SinisterStrike, At::Target, "builder: Sinister Strike");
    return Nothing("waiting for energy");
}

inline Choice Priest(Input const& in)
{
    using namespace Id;
    bool const shadow = in.form == Form::Shadow;
    if (!in.in_combat && !shadow)
    {
        if (!OnSelf(in, PowerWordFortitude) && Can(in, PowerWordFortitude)) return Cast(PowerWordFortitude, At::Self, "out of combat: Fortitude");
        if (!OnSelf(in, InnerFire) && Can(in, InnerFire)) return Cast(InnerFire, At::Self, "out of combat: Inner Fire");
    }
    if (in.role == Role::Dps && !shadow && Can(in, Shadowform)) return Cast(Shadowform, At::Self, "Shadowform");
    if (in.hp_pct <= 50 && in.target_on_me && !OnSelf(in, PowerWordShield) && !OnSelf(in, WeakenedSoul) && Can(in, PowerWordShield))
        return Cast(PowerWordShield, At::Self, "hit: Power Word: Shield");
    if (!in.has_target) return Nothing("no target");
    if (!in.target_in_range) return Nothing("target out of range");
    if (in.target_casting && Can(in, Silence)) return Cast(Silence, At::Target, "interrupt: Silence");
    if (in.attackers_close >= 2 && in.hp_pct <= 40 && !in.target_boss && Can(in, PsychicScream))
        return Cast(PsychicScream, At::Self, "surrounded: Psychic Scream");
    if (in.wand && !in.auto_shooting && in.mana_pct < 10 && Can(in, Shoot)) return Cast(Shoot, At::Target, "out of mana: wand");
    if (!OnTarget(in, VampiricEmbrace) && LongFight(in) && Can(in, VampiricEmbrace)) return Cast(VampiricEmbrace, At::Target, "Vampiric Embrace");
    if (!OnTarget(in, ShadowWordPain) && (in.target_hp_pct >= 25 || in.target_boss) && Can(in, ShadowWordPain))
        return Cast(ShadowWordPain, At::Target, "Shadow Word: Pain");
    if (in.mana_pct >= 20 && Can(in, MindBlast)) return Cast(MindBlast, At::Target, "Mind Blast");
    if (in.mana_pct >= 15 && Can(in, MindFlay)) return Cast(MindFlay, At::Target, "Mind Flay");
    if (!shadow)
    {
        if (!OnTarget(in, HolyFire) && in.mana_pct >= 30 && Can(in, HolyFire)) return Cast(HolyFire, At::Target, "Holy Fire");
        if (Can(in, Smite)) return Cast(Smite, At::Target, "Smite");
    }
    if (in.wand && !in.auto_shooting && Can(in, Shoot)) return Cast(Shoot, At::Target, "wand");
    return Nothing("nothing ready");
}

inline Choice Shaman(Input const& in)
{
    using namespace Id;
    if (!in.in_combat)
    {
        if (!OnSelf(in, LightningShield) && Can(in, LightningShield)) return Cast(LightningShield, At::Self, "out of combat: Lightning Shield");
        if (!in.weapon_imbued)
            if (uint32_t const imbue = FirstCan(in, { WindfuryWeapon, FlametongueWeapon, RockbiterWeapon }))
                return Cast(imbue, At::Self, "out of combat: weapon imbue");
    }
    if (!in.has_target) return Nothing("no target");
    if (in.target_casting && Can(in, EarthShock)) return Cast(EarthShock, At::Target, "interrupt: Earth Shock");
    bool const melee = in.tree == 2 || Knows(in, Stormstrike);
    if (melee)
    {
        if (!in.target_in_melee) return Nothing("target out of melee");
        if (Can(in, Stormstrike)) return Cast(Stormstrike, At::Target, "Stormstrike");
        if (!OnTarget(in, FlameShock) && in.target_hp_pct >= 40 && in.mana_pct >= 30 && Can(in, FlameShock)) return Cast(FlameShock, At::Target, "Flame Shock");
        if (in.mana_pct >= 40 && Can(in, EarthShock)) return Cast(EarthShock, At::Target, "Earth Shock");
        return Nothing("melee swings");
    }
    if (!in.target_in_range) return Nothing("target out of range");
    if (in.in_combat && LongFight(in) && Can(in, ElementalMastery)) return Cast(ElementalMastery, At::Self, "Elemental Mastery");
    if (in.attackers_close >= 2 && in.mana_pct >= 30 && Can(in, ChainLightning)) return Cast(ChainLightning, At::Target, "two or more: Chain Lightning");
    if (!OnTarget(in, FlameShock) && in.target_hp_pct >= 30 && in.mana_pct >= 20 && Can(in, FlameShock)) return Cast(FlameShock, At::Target, "Flame Shock");
    if (Can(in, LightningBolt)) return Cast(LightningBolt, At::Target, "Lightning Bolt");
    return Nothing("nothing ready");
}

inline Choice Mage(Input const& in)
{
    using namespace Id;
    if (!in.in_combat)
    {
        if (!OnSelf(in, ArcaneIntellect) && Can(in, ArcaneIntellect)) return Cast(ArcaneIntellect, At::Self, "out of combat: Arcane Intellect");
        bool const armor_up = OnSelf(in, IceArmor) || OnSelf(in, FrostArmor) || OnSelf(in, MageArmor);
        if (!armor_up)
            if (uint32_t const armor = FirstCan(in, { IceArmor, FrostArmor, MageArmor }))
                return Cast(armor, At::Self, "out of combat: armor");
    }
    if (in.target_on_me && in.target_in_melee && Can(in, FrostNova)) return Cast(FrostNova, At::Self, "enemy in melee: Frost Nova");
    if (in.hp_pct <= 40 && in.in_combat && !OnSelf(in, IceBarrier) && Can(in, IceBarrier)) return Cast(IceBarrier, At::Self, "hit: Ice Barrier");
    if (!in.has_target) return Nothing("no target");
    if (in.target_casting && Can(in, Counterspell)) return Cast(Counterspell, At::Target, "interrupt: Counterspell");
    if (in.attackers_close >= 3 && in.mana_pct >= 30 && Can(in, ArcaneExplosion))
        return Cast(ArcaneExplosion, At::Self, "three or more around me: Arcane Explosion");
    if (!in.target_in_range) return Nothing("target out of range");
    if (in.wand && !in.auto_shooting && in.mana_pct < 10 && Can(in, Shoot)) return Cast(Shoot, At::Target, "out of mana: wand");
    if (in.in_combat && (in.target_boss || in.target_player))
    {
        if (Can(in, ArcanePower)) return Cast(ArcanePower, At::Self, "boss: Arcane Power");
        if (Can(in, Combustion)) return Cast(Combustion, At::Self, "boss: Combustion");
        if (Can(in, PresenceOfMind)) return Cast(PresenceOfMind, At::Self, "boss: Presence of Mind");
    }
    if (in.mana_pct >= 15 && Can(in, FireBlast)) return Cast(FireBlast, At::Target, "Fire Blast");
    if (in.tree == 1 && in.mana_pct >= 50 && Can(in, ArcaneMissiles)) return Cast(ArcaneMissiles, At::Target, "Arcane Missiles");
    if (in.tree == 2 && Can(in, Fireball)) return Cast(Fireball, At::Target, "Fireball");
    if (Can(in, Frostbolt)) return Cast(Frostbolt, At::Target, "Frostbolt");
    if (Can(in, Fireball)) return Cast(Fireball, At::Target, "Fireball");
    if (in.wand && !in.auto_shooting && Can(in, Shoot)) return Cast(Shoot, At::Target, "wand");
    return Nothing("nothing ready");
}

inline Choice Druid(Input const& in)
{
    using namespace Id;
    bool const tank = in.role == Role::Tank;
    bool const bear_form = in.form == Form::Bear;
    bool const cat_form = in.form == Form::Cat;
    // The form the role wants.
    if (tank && !bear_form)
        if (uint32_t const bear = FirstCan(in, { DireBearForm, BearForm }))
            return Cast(bear, At::Self, "tank: Bear Form");
    if (in.role == Role::Dps && in.tree == 2 && !cat_form && !bear_form && Can(in, CatForm)) return Cast(CatForm, At::Self, "feral: Cat Form");

    if (bear_form)
    {
        if (!in.has_target) return Nothing("no target");
        if (in.target_casting && in.rage >= 10 && Can(in, Bash)) return Cast(Bash, At::Target, "interrupt: Bash");
        if (in.in_combat && in.target_attacking && !in.target_on_me && Can(in, Growl)) return Cast(Growl, At::Target, "target on someone else: Growl");
        if (in.hp_pct <= 30 && Can(in, FrenziedRegeneration)) return Cast(FrenziedRegeneration, At::Self, "low: Frenzied Regeneration");
        if (in.in_combat && in.rage < 10 && in.hp_pct >= 50 && Can(in, Enrage)) return Cast(Enrage, At::Self, "low rage: Enrage");
        if (!in.target_in_melee) return Nothing("target out of melee");
        if (in.in_combat && !OnTarget(in, DemoralizingRoar) && in.rage >= 10 && Can(in, DemoralizingRoar))
            return Cast(DemoralizingRoar, At::Self, "Demoralizing Roar");
        if (in.attackers_close >= 2 && in.rage >= 20 && Can(in, Swipe)) return Cast(Swipe, At::Target, "two or more: Swipe");
        if (!OnTarget(in, FaerieFireFeral) && Can(in, FaerieFireFeral)) return Cast(FaerieFireFeral, At::Target, "Faerie Fire (Feral)");
        if (in.rage >= 15 && Can(in, Maul)) return Cast(Maul, At::Target, "Maul");
        return Nothing("waiting for rage");
    }
    if (cat_form)
    {
        if (!in.has_target) return Nothing("no target");
        if (!in.target_in_melee) return Nothing("target out of melee");
        if (in.combo >= 5)
        {
            if (!OnTarget(in, Rip) && in.target_hp_pct >= 40 && in.energy >= 30 && Can(in, Rip)) return Cast(Rip, At::Target, "finisher: Rip");
            if (in.energy >= 35 && Can(in, FerociousBite)) return Cast(FerociousBite, At::Target, "finisher: Ferocious Bite");
            if (!Knows(in, FerociousBite) && !OnTarget(in, Rip) && Can(in, Rip)) return Cast(Rip, At::Target, "finisher: Rip");
            return Nothing("waiting for energy (finisher)");
        }
        if (!OnTarget(in, FaerieFireFeral) && in.target_boss && Can(in, FaerieFireFeral)) return Cast(FaerieFireFeral, At::Target, "Faerie Fire (Feral)");
        if (!OnTarget(in, Rake) && in.target_hp_pct >= 30 && in.energy >= 40 && Can(in, Rake)) return Cast(Rake, At::Target, "Rake");
        if (in.target_behind && in.energy >= 60 && Can(in, Shred)) return Cast(Shred, At::Target, "behind: Shred");
        if (in.energy >= 45 && Can(in, Claw)) return Cast(Claw, At::Target, "builder: Claw");
        return Nothing("waiting for energy");
    }
    // Caster or Moonkin.
    if (!in.in_combat && in.form == Form::None)
    {
        if (!OnSelf(in, MarkOfTheWild) && Can(in, MarkOfTheWild)) return Cast(MarkOfTheWild, At::Self, "out of combat: Mark of the Wild");
        if (!OnSelf(in, Thorns) && Can(in, Thorns)) return Cast(Thorns, At::Self, "out of combat: Thorns");
    }
    if (in.form == Form::None && in.hp_pct <= 40 && in.in_combat && !OnSelf(in, Rejuvenation) && Can(in, Rejuvenation))
        return Cast(Rejuvenation, At::Self, "hit: Rejuvenation on me");
    if (!in.has_target) return Nothing("no target");
    if (!in.target_in_range) return Nothing("target out of range");
    if (!OnTarget(in, FaerieFire) && (in.target_boss || in.target_player) && Can(in, FaerieFire)) return Cast(FaerieFire, At::Target, "Faerie Fire");
    if (!OnTarget(in, Moonfire) && in.target_hp_pct >= 20 && Can(in, Moonfire)) return Cast(Moonfire, At::Target, "Moonfire");
    if (!OnTarget(in, InsectSwarm) && in.target_hp_pct >= 30 && Can(in, InsectSwarm)) return Cast(InsectSwarm, At::Target, "Insect Swarm");
    if (in.tree == 1 && in.mana_pct >= 30 && Can(in, Starfire)) return Cast(Starfire, At::Target, "Starfire");
    if (Can(in, Wrath)) return Cast(Wrath, At::Target, "Wrath");
    return Nothing("nothing ready");
}

// The next spell for this press, and in `why` the rule that chose it.
inline Choice Pick(Input const& in)
{
    if (in.casting)
        return Nothing("busy casting");
    if (in.role == Role::Heal && CanHeal(in.cls))
    {
        Choice const heal = PickHeal(in);
        if (heal.spell || heal.cancel_form)
            return heal;
        // Nobody needs a heal: fight, but keep mana for the next heal.
        if (in.in_combat && in.mana_pct < 40 && in.has_target)
            return Nothing("healer: saving mana");
    }
    switch (in.cls)
    {
        case kWarrior: return Warrior(in);
        case kPaladin: return Paladin(in);
        case kHunter:  return Hunter(in);
        case kRogue:   return Rogue(in);
        case kPriest:  return Priest(in);
        case kShaman:  return Shaman(in);
        case kMage:    return Mage(in);
        case kDruid:   return Druid(in);
        default:       return Nothing("class has no lazy rotation");
    }
}

// Melee classes and forms start their swing with the press (the caller turns auto attack on).
inline bool WantsAutoAttack(Input const& in)
{
    switch (in.cls)
    {
        case kWarrior: case kPaladin: case kRogue: return true;
        case kShaman:  return in.tree == 2 || Knows(in, Id::Stormstrike) || in.level < 10;
        case kDruid:   return in.form == Form::Bear || in.form == Form::Cat;
        case kHunter:  return in.target_in_melee;
        default:       return false;
    }
}

} // namespace Playerbot::LazyKey
