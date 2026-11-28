// BotSwim - pure rules for a bot in deep water. A player's own client swims it: it sets the swimming flag and floats the character
// with its head out of the water. A bot has no client, so nothing did either. Its z came from whatever made its last move: the
// navmesh's water polygons lie on the surface (it stood and ran on top of the water), the ground probes of a goal hit the lake
// floor (it walked down and stood under the water until it drowned). idle:surface_to_breathe then lifted it back onto the top,
// the next goal took it down again, and it went up and down for as long as it stayed in the lake (Discord 2026-11-08, Joy, alexia and
// others: "on the water, then under it, forever", "some stay down until they drown", "they run on the water").
// Tested in tests/game/ClassicBotSwim.cpp.

#pragma once

#include <algorithm>
#include <cmath>

namespace Playerbot::BotMovement::Swim {

// How far under the surface a swimming bot floats: its head stays out (the core reads LIQUID_MAP_IN_WATER for 0 < depth <=
// collision height, UNDER_WATER past it, WATER_WALK at 0). Over half the body under, and never deeper than 1.6 y, which keeps
// it out of the snapshot's drowning check (DEFAULT_COLLISION_HEIGHT 2.03) whatever its race.
constexpr float kSwimFrac = 0.6f;
constexpr float kSwimMinDepth = 0.5f;
constexpr float kSwimMaxDepth = 1.6f;

inline float SwimDepth(float collision_height)
{
    return std::clamp(collision_height * kSwimFrac, kSwimMinDepth, kSwimMaxDepth);
}

// The z a bot swims at over water with this surface.
inline float SwimZ(float level, float collision_height)
{
    return level - SwimDepth(collision_height);
}

// Deep water: a bot standing on the floor would have its head under (the floor lies more than its height below the surface).
// Shallower water is waded on the floor, as before.
inline bool IsDeep(float level, float floor_z, float collision_height)
{
    return level - floor_z > collision_height;
}

// The asked z is from above the water (a bridge, a pier, a deck, a ledge over a pool): not a goal in the water.
constexpr float kAboveSurfaceAsk = 3.0f;
inline bool AskedFromAbove(float ask_z, float level)
{
    return ask_z > level + kAboveSurfaceAsk;
}

// A goal in deep water goes to the swim z, unless the caller asked on purpose for a point well under it that is not the bot's own
// level: an object or a creature on the lake floor (the bot dives for it, and idle:surface_to_breathe brings it up for air). A walk
// step at the bot's own z, a wander point or a surface ask all swim.
constexpr float kDiveMargin = 1.5f;
inline bool IsPurposefulDive(float ask_z, float bot_z, float swim_z)
{
    return ask_z < swim_z - kDiveMargin && std::fabs(ask_z - bot_z) > kDiveMargin;
}

// A bot standing still in deep water is moved to its swim z when it is this far off it (on the floor, or on top of the water).
constexpr float kSettleTolerance = 0.75f;
inline bool NeedsSettle(float bot_z, float swim_z)
{
    return std::fabs(bot_z - swim_z) > kSettleTolerance;
}

// A point of a route over deep water that lies above the swim z goes down to it. The navmesh holds deep water as polygons on its
// surface, so a route over it ran on top of the water: a moving or following bot ran on the lake and only sank in once it stood
// still (NeedsSettle), and a follower that kept moving never did. A point at or under the swim z (a dive to something on the floor,
// the lake bed) keeps its depth, and so does a point lowered before: a second pass changes nothing.
constexpr float kRouteLowerSlack = 0.05f;
inline bool RoutePointNeedsLowering(float point_z, float swim_z)
{
    return point_z > swim_z + kRouteLowerSlack;
}

// A leg of the route whose sample at this z lies this far under the ground there runs through the ground (a lowered point next to
// a bank: the straight line from the shore down to the swim z can cut into the slope between them).
constexpr float kRouteGroundSlack = 0.3f;
inline bool UnderGround(float z, float ground_z)
{
    return z < ground_z - kRouteGroundSlack;
}

// A follower's settle to (dx, dy, dz) from its leader keeps it inside the follow generator's 3D range (combat reaches + follow
// distance), with a margin so the next leader step does not tip it out at once. Out of range, the generator would path it back up
// to the surface by the leader at his next step, and the settle would start again.
constexpr float kFollowRangeMargin = 0.5f;
inline bool SettleKeepsFollowRange(float dx, float dy, float dz, float follow_range)
{
    float const limit = follow_range - kFollowRangeMargin;
    return limit > 0.0f && dx * dx + dy * dy + dz * dz < limit * limit;
}

// A goal under the water: well under the swim z. The navmesh holds deep water as polygons on its surface only, so the polygon nearest
// such a goal is the surface right over it, not ground a stride off. The far-end snap put a rogue's melee spot by a murloc on the
// Vile Reef floor 57 y up on the surface (vile_reef_fight af60), and the rogue swam up and down at the surface for the whole fight.
inline bool IsUnderwaterGoal(float goal_z, float swim_z)
{
    return goal_z < swim_z - kDiveMargin;
}

// One straight swim (no route through the water): across no more than a pool or a flooded hall, longer trips are the router's; down
// or up as deep as the water goes there. The 40 y cap on the whole leg kept a bot on the surface 57 y over the fight it was ordered to.
constexpr float kMaxSwimLegAcross = 40.0f;
constexpr float kMaxSwimLegLength = 90.0f;
inline bool SwimLegFits(float dxy, float len)
{
    return len >= 1.0f && dxy <= kMaxSwimLegAcross && len <= kMaxSwimLegLength;
}

// A bot under the water by what it is down there for (its fight, or the player who leads its group, himself under the water) stays at
// that depth: the settle lifted a rogue that catch-up had set beside his leader on the reef floor straight back to the surface, 59 y
// up (vile_reef_fight af60). Its breath is BreathGoesUp's.
constexpr float kHoldDepthYards = 12.0f;
inline bool HoldsDepth(float bot_z, float swim_z, float anchor_dist, float anchor_z)
{
    return bot_z < swim_z && anchor_dist <= kHoldDepthYards && IsUnderwaterGoal(anchor_z, swim_z);
}

// Breath, from the server's own timer (Player::HandleDrowning: it runs down while the head is under water, comes back ten times as fast
// above it, and stops, -1, once full or for a bot that cannot drown: water breathing, undead's longer breath counted in). A player under
// water keeps fighting or swimming and goes up when the bar runs short, then stays up until it is full before he dives again. The bot's
// own 35 s clock counted only the time out of combat: a mage fought on the Vile Reef, sat down to eat at 25 y deep once the fight ended,
// and drowned before the clock got to 35 s (vile_reef_fight af64). Up with 25 s left: from the reef 60 y down that is 13 s of swimming.
// `refilling` is the bot's latch across ticks: true from the moment it goes up until the timer stops.
constexpr int BreathUpAtLeftMs = 25000;
inline bool BreathGoesUp(int breath_left_ms, bool& refilling)
{
    if (breath_left_ms < 0)
    {
        refilling = false;
        return false;
    }
    if (breath_left_ms <= BreathUpAtLeftMs)
        refilling = true;
    return refilling;
}

} // namespace Playerbot::BotMovement::Swim
