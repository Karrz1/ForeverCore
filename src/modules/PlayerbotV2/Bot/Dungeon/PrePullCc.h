#pragma once
// Pre-pull crowd control for a bot-led dungeon squad: before the tank pulls a pack of 3+, it asks for one mob of the pack
// to be held by the group's mage. The tank (a bot rule, never touches the group) opens a request here; the
// PveGroupCoordinator (world thread) answers it: the group's moon icon goes on the mob, and the mage is released for that
// mark (MarksNeedOrder: crowd control on an idle mob is otherwise the owner's call, and a bot-led squad has no owner order).
// The mage's autonomous marked CC (idle:dungeon_auto_cc_marked) does the Polymorph. The tank waits for the mob to read
// is_cc_locked (or a refusal / the wait cap), then runs its pull back (BotAI::PullBackPlan).
// A mob whose formation comes with it (NearbyUnit::engage_calls_formation) is asked for "on the pull": the sheep on it would
// be the pull, with the tank not yet in it. The moon goes on the mob, the mage is not released for an idle mob, the tank
// pulls as soon as the moon is on, and the mage holds the mob once it is in the fight, as it runs in (the in-combat marked CC).
// The coordinator ends such a request when the mob reads held.
#include "ObjectGuid.h"

#include <mutex>
#include <unordered_map>

namespace Playerbot::PrePullCc {

enum class State : uint8 { Pending, Marked, Refused };

struct Request
{
    ObjectGuid mob;
    uint64     caster_low = 0;      // the mage (guid counter)
    uint32     requested_ms = 0;
    uint32     done_ms = 0;         // the tank stopped waiting (0 = still waiting)
    State      state = State::Pending;
    bool       on_pull = false;     // held once it is in the fight, never before the pull (its formation comes with it)
};

inline constexpr uint32 kWaitCapMs = 8000;    // the tank waits this long for the mob to be held ...
inline constexpr uint32 kWaitHardCapMs = 20000; // ... and up to this long while the mage casts on it or walks into range
inline constexpr float  kSpellReachY = 30.0f;   // Polymorph's range: a mage farther out is still walking in
inline constexpr uint32 kLifeMs    = 35000;   // a request is dropped this long after it was opened (> hard cap + kAfterDoneMs)
inline constexpr uint32 kAfterDoneMs = 12000; // the mark and the mage's release outlast the tank's wait by this
inline constexpr uint32 kMarkWaitMs = 2000;   // an on-pull request: the tank waits this long at most for the moon to go on

namespace detail {
inline std::mutex& Mutex() { static std::mutex m; return m; }
inline std::unordered_map<uint64, Request>& Map() { static std::unordered_map<uint64, Request> m; return m; }
}

// A live request of the group (expired ones are dropped), false when none.
inline bool Get(uint64 group_low, uint32 now_ms, Request& out)
{
    std::lock_guard<std::mutex> lk(detail::Mutex());
    auto& m = detail::Map();
    auto it = m.find(group_low);
    if (it == m.end()) return false;
    if (uint32(now_ms - it->second.requested_ms) > kLifeMs) { m.erase(it); return false; }
    out = it->second;
    return true;
}

// Open a request unless the group has a live one. True when opened.
inline bool Open(uint64 group_low, ObjectGuid mob, uint64 caster_low, uint32 now_ms, bool on_pull = false)
{
    Request cur;
    if (Get(group_low, now_ms, cur)) return false;
    std::lock_guard<std::mutex> lk(detail::Mutex());
    Request r;
    r.mob = mob; r.caster_low = caster_low; r.requested_ms = now_ms ? now_ms : 1u; r.on_pull = on_pull;
    detail::Map()[group_low] = r;
    return true;
}

inline void SetState(uint64 group_low, State st)
{
    std::lock_guard<std::mutex> lk(detail::Mutex());
    if (auto it = detail::Map().find(group_low); it != detail::Map().end()) it->second.state = st;
}

// The tank is done waiting.
inline void Done(uint64 group_low, uint32 now_ms)
{
    std::lock_guard<std::mutex> lk(detail::Mutex());
    if (auto it = detail::Map().find(group_low); it != detail::Map().end() && !it->second.done_ms)
        it->second.done_ms = now_ms ? now_ms : 1u;
}

inline void Erase(uint64 group_low)
{
    std::lock_guard<std::mutex> lk(detail::Mutex());
    detail::Map().erase(group_low);
}

} // namespace Playerbot::PrePullCc
