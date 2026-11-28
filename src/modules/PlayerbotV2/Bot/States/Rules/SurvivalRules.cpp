// SurvivalRules - Refactor #3 pass 8. Migrates the three survival
// hazard rules (`idle:flee_hazard`, `idle:flee_damaging_liquid`,
// `idle:surface_to_breathe`) out of the State_Idle linear cascade.
// All three sit at the top of dispatch priority â€” a bot in lava or
// drowning is more urgent than any utility rule.

#include "../../WanderRule.h"
#include "Bot/IdleRule.h"
#include "Group/GroupSnapshot.h"
#include "Bot/BotAI.h"
#include "Bot/BotSnapshotView.h"
#include "Bot/BotIntentEmitter.h"
#include "Bot/States/MaintainHelpers.h"   // BreathDue / SurfaceForAir
#include "Log.h"

#include <cmath>

namespace Playerbot {

namespace {

// ---------- idle:flee_hazard ----------
// Inside a hazard as the core tests it: a trap fires on a unit within its radius in 3D (GameObject::Update, IsWithinDist), so a
// bonfire on the floor below a ledge is no hazard to a bot standing on the ledge. The flat test ignored the height
// (lbrs_full af58: on the ledge above the lower hall the tank walked back and forth, the route stepping it south and this
// rule sending it north; the [flee_hazard] line names the object a bot leaves).
bool InsideHazard(float bx, float by, float bz, BotSnapshot::NearbyObject const& obj, float& out_d)
{
    if (!obj.is_hazard || obj.hazard_radius <= 0.0f) return false;
    const float dx = bx - obj.x, dy = by - obj.y, dz = bz - obj.z;
    const float d2 = dx*dx + dy*dy + dz*dz;
    if (d2 >= obj.hazard_radius * obj.hazard_radius) return false;
    out_d = std::sqrt(d2);
    return true;
}

bool FleeHazardGate(BotSnapshotView const& s, BotAI&, GroupSnapshotView const&,uint32)
{
    float bx, by, bz; s.position(bx, by, bz);
    float d = 0.0f;
    for (auto const& obj : s.raw().world_objects.nearby_objects)
        if (InsideHazard(bx, by, bz, obj, d))
            return true;
    return false;
}

bool FleeHazardFire(BotSnapshotView const& s, BotAI& ai, GroupSnapshotView const&,BotIntentEmitter& emit, uint32)
{
    float bx, by, bz; s.position(bx, by, bz);
    BotSnapshot::NearbyObject const* worst = nullptr;
    float worst_overlap = 0.0f;
    for (auto const& obj : s.raw().world_objects.nearby_objects)
    {
        float d3 = 0.0f;
        if (!InsideHazard(bx, by, bz, obj, d3)) continue;
        const float overlap = obj.hazard_radius - d3;
        if (overlap > worst_overlap) { worst_overlap = overlap; worst = &obj; }
    }
    if (!worst) return false;
    const float dx = bx - worst->x;
    const float dy = by - worst->y;
    const float d  = std::max(0.5f, std::sqrt(dx*dx + dy*dy));
    const float scale = (worst->hazard_radius + 5.0f) / d;
    const float fx = worst->x + dx * scale, fy = worst->y + dy * scale;
    emit.move_to(fx, fy, bz);
    ai.set_last_rule_fired("idle:flee_hazard");
    static uint32 s_flee_hazard_log_ms = 0;   // all bots, one line per 2 s
    if (s.published_at_ms() - s_flee_hazard_log_ms > 2000u)
    {
        s_flee_hazard_log_ms = s.published_at_ms();
        TC_LOG_INFO("playerbot.v2", "[flee_hazard] {} at ({:.1f},{:.1f},{:.1f}) leaves entry {} at ({:.1f},{:.1f},{:.1f}) radius {:.1f} -> ({:.1f},{:.1f})",
            s.name(), bx, by, bz, worst->entry, worst->x, worst->y, worst->z, worst->hazard_radius, fx, fy);
    }
    return true;
}

// ---------- idle:flee_damaging_liquid ----------
bool FleeDamagingLiquidGate(BotSnapshotView const& s, BotAI&, GroupSnapshotView const&,uint32)
{
    return s.is_in_damaging_liquid();
}

bool FleeDamagingLiquidFire(BotSnapshotView const& s, BotAI& ai, GroupSnapshotView const&,BotIntentEmitter& emit, uint32)
{
    // The nearest dry ground the builder found (EnvironmentState::water_escape_*, set in a burning liquid too). A random heading from
    // the middle of the Tar Pits ended in tar again and the move gate refused it as Magma (shapers_full af51, 20 Nov).
    if (s.water_escape_valid())
    {
        emit.move_to(s.water_escape_x(), s.water_escape_y(), s.water_escape_z(), /*run*/ true);
        ai.set_last_rule_fired("idle:flee_damaging_liquid");
        return true;
    }
    float bx, by, bz; s.position(bx, by, bz);
    // No dry ground within 60 y: one heading per 8 s window. A new random heading every second zig-zagged the bot inside the liquid.
    const uint32 epoch = s.published_at_ms() / 8000u;
    const uint64 mixed = (uint64(s.bot_id()) * 0x9E3779B97F4A7C15ULL)
                       ^ (uint64(epoch) * 0xBF58476D1CE4E5B9ULL);
    const float angle = (float(mixed & 0xFFFFu) / 65536.0f) * 6.2831853f;
    constexpr float kFleeStep = 25.0f;
    emit.move_to(bx + std::cos(angle) * kFleeStep,
                 by + std::sin(angle) * kFleeStep,
                 bz, /*run*/ true);
    ai.set_last_rule_fired("idle:flee_damaging_liquid");
    return true;
}

// ---------- idle:surface_to_breathe ----------
// A player swimming under water to the shore, or fighting there, keeps going and comes up only when the breath runs short; the rule
// used to lift every submerged bot to the surface at once, and the swim to dry land (idle:water_escape, idle:leave_water), whose path
// runs along the bottom, took it under again the next tick: r10 12 Nov, 23 leave_water and 14 water_escape flips, bots bobbing in place
// instead of reaching the bank. It went on a 35 s clock of its own after that, which counted only the time out of combat: a mage that
// fought on the Vile Reef sat down to eat 25 y deep afterwards and drowned (vile_reef_fight af64). Now the server's own breath timer
// decides, in every state (SurfaceForAir): up with 25 s left, and up there until the bar is full.
bool SurfaceToBreatheGate(BotSnapshotView const& s, BotAI& ai, GroupSnapshotView const&, uint32)
{
    return States::BreathDue(s, ai);
}

bool SurfaceToBreatheFire(BotSnapshotView const& s, BotAI& ai, GroupSnapshotView const&,BotIntentEmitter& emit, uint32)
{
    return States::SurfaceForAir(s, ai, emit, "idle:surface_to_breathe");
}

// ---------- idle:res_sick_wait ----------
// Resurrection Sickness (spell 15007, applied by a spirit-healer rez) cripples
// the bot (~-75% stats). A real player NEVER quests, grinds, or pulls while sick
// — they wait it out where it's safe (the graveyard) or do a quick local vendor/
// repair run. Without this, a freshly spirit-rezzed bot immediately walks back
// into a fight it now CANNOT win -> dies -> spirit-rezzes -> sick again: the
// resurrection-sickness death spiral (observed: Morthan, L9 warlock, XP frozen).
//
// Priority 709 sits BELOW critical_repair (735) and bags_full_recover (710) — so a
// local repair/vendor run is still allowed while sick — but ABOVE the quest funnel
// (698-705), grind-engage, wander and travel rules, so a sick bot otherwise just
// holds position (usually safe at the graveyard) until the aura expires, then
// resumes normally. Combat is reactive (FSM routes attacks to the combat state),
// so this can't prevent a mob that aggros the waiting bot — but it stops the bot
// from SEEKING fights, which is what sustains the spiral.
bool ResSickWaitGate(BotSnapshotView const& s, BotAI&, GroupSnapshotView const&, uint32)
{
    return s.is_alive() && s.has_aura(15007 /*Resurrection Sickness*/);
}

bool ResSickWaitFire(BotSnapshotView const& s, BotAI& ai, GroupSnapshotView const&, BotIntentEmitter& emit, uint32)
{
    // Consume the tick: no quests, no pulls while crippled. Higher-priority
    // repair/vendor rules still run; everything below is suppressed. A world bot
    // does not freeze for the whole sickness though: every few seconds it takes a
    // short step (6-14 y, a different heading each time) where it stands.
    uint32 const now_ms = s.published_at_ms();
    if (::Playerbot::V2::ResSickStepNow(s.has_owner_character() || s.in_group(), s.is_moving(), now_ms, uint32(s.bot_id())))
    {
        uint64 const mixed = (uint64(s.bot_id()) * 0x9E3779B97F4A7C15ULL) ^ (uint64(now_ms / 6000u) * 0xBF58476D1CE4E5B9ULL);
        float const angle = (float(mixed & 0xFFFFu) / 65536.0f) * 6.2831853f;
        float const step = 6.0f + float((mixed >> 16) & 0xFFu) / 255.0f * 8.0f;
        float bx, by, bz; s.position(bx, by, bz);
        emit.move_to(bx + std::cos(angle) * step, by + std::sin(angle) * step, bz, /*run*/ false);
    }
    ai.set_last_rule_fired("idle:res_sick_wait");
    return true;
}

} // anonymous namespace

void RegisterSurvivalRules(IdleRuleRegistry& r)
{
    // Hazards are the highest-priority idle rules â€” survival precedes
    // every utility behavior. flee_damaging_liquid out-ranks surface_
    // to_breathe (lava > drowning), flee_hazard slightly below those.
    {
        IdleRule rule;
        rule.name     = "idle:flee_damaging_liquid";
        rule.priority = 900;
        rule.gate     = &FleeDamagingLiquidGate;
        rule.fire     = &FleeDamagingLiquidFire;
        r.register_rule(std::move(rule));
    }
    {
        IdleRule rule;
        rule.name     = "idle:surface_to_breathe";
        rule.priority = 890;
        rule.gate     = &SurfaceToBreatheGate;
        rule.fire     = &SurfaceToBreatheFire;
        r.register_rule(std::move(rule));
    }
    {
        IdleRule rule;
        rule.name     = "idle:flee_hazard";
        rule.priority = 880;
        rule.gate     = &FleeHazardGate;
        rule.fire     = &FleeHazardFire;
        r.register_rule(std::move(rule));
    }
    {
        // Wait out Resurrection Sickness. 709: below critical_repair(735) /
        // bags_full_recover(710) so a local repair/vendor run is still allowed,
        // above the quest funnel / grind-engage / travel so the bot doesn't seek
        // fights while crippled (the res-sickness death spiral).
        IdleRule rule;
        rule.name     = "idle:res_sick_wait";
        rule.priority = 709;
        rule.gate     = &ResSickWaitGate;
        rule.fire     = &ResSickWaitFire;
        r.register_rule(std::move(rule));
    }
}

} // namespace Playerbot
