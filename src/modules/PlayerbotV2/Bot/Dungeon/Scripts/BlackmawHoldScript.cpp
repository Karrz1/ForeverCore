// BlackmawHoldScript - per-dungeon advice for Blackmaw Hold (map 2974, Classic 1.60 Forever, levels 55-60).
// The boss fights are in classic_instance_blackmaw_hold.cpp, the creatures where live has them in 2026_11_26_41 (a live capture of
// 25-26 Nov 2026); the route (playerbot_dungeon_routes, 0069_blackmaw_hold_route_from_the_live_landing.sql) and this file follow
// the same boss order: Withermaw, Bonesnout the Unbroken, Impaan the Imprisoner, the Unbound Spirit, Elder Shaman Bloodmane, the
// Blackmaw Behemoth, Varrox Bleakhoof (the shortest walk from live's landing that ends with the Behemoth; every leg was path-checked
// on the 2974 navmesh). Varrox waits in a chamber 200 y below the Behemoth's hall: the way down is a one-way fall into a pool
// (0069's nav link) with no way back up, so he is last.
// The Unbound Spirit cannot be hit until Elder Bramblesnap's ritual has run; it starts when the group comes near him, so
// walking to the Spirit's spot is enough.

#include "../DungeonScript.h"

namespace Playerbot {

namespace {

class BlackmawHoldScript final : public DungeonScript
{
public:
    uint32_t  map_id() const override { return 2974; }   // Blackmaw Hold
    char const* name() const override { return "blackmaw_hold"; }

    DungeonAdvice get_advice(BotSnapshotView const& /*s*/) const override
    {
        DungeonAdvice a;
        // Every living Ritualist takes a quarter off the damage Bonesnout takes (all four: none), and Clawbert heals the
        // Behemoth to full: they die first. Then the healers of the packs.
        a.high_priority_kill_entries = {
            258668,   // Legashi Ritualist (Bonesnout's shield)
            247996,   // Clawbert (Restore on the Behemoth)
            277474,   // Blackmaw Devotee (Healing Wave; they join Bloodmane)
            258508,   // Blackmaw Shaman (Healing Wave)
            258516,   // Blackmaw Druid (Healing Wave)
        };
        a.cc_priority_entries = {
            258508,   // Blackmaw Shaman
            258516,   // Blackmaw Druid
            268864,   // Legashi Plaguebringer (Shadow Bolt, Curse of Weakness)
        };
        a.mandatory_interrupt_spells = {
            1244951,   // Restore (Clawbert: heals the Behemoth to full)
            1283422,   // Healing Wave (Shamans, Druids, Devotees)
        };
        // Elder Bramblesnap is friendly: he runs the ritual that frees the Unbound Spirit.
        a.ignore_entries = {
            248765,   // Elder Bramblesnap
        };
        a.bosses = {
            247195,   // Withermaw
            247198,   // Bonesnout the Unbroken
            247206,   // Impaan the Imprisoner
            247231,   // Unbound Spirit
            247209,   // Elder Shaman Bloodmane
            247207,   // Blackmaw Behemoth
            247234,   // Varrox Bleakhoof
        };
        // 1:1 with `bosses`: live's spawn spots (2026_11_26_41_world_forever_blackmaw_hold_live_spawns.sql).
        a.progression_waypoints = {
            { 3734.3f, 3369.2f, 284.2f },      // Withermaw (by her grotto; the Tunnelweb Matriarch stands 98 y north-west)
            { 3297.8f, 3409.8f, 250.0f },      // Bonesnout the Unbroken
            { 3348.1f, 3641.9f, 342.9f },      // Impaan the Imprisoner
            { 3249.1f, 2911.5f, 204.9f },      // Unbound Spirit (Elder Bramblesnap stands 45 y away)
            { 3681.3f, 2868.8f, 172.2f },      // Elder Shaman Bloodmane (the east cave)
            { 3479.6f, 2962.0f, 136.6f },      // Blackmaw Behemoth (low in the west hall, Clawbert with him)
            { 3482.4f, 3001.0f, -62.5f },      // Varrox Bleakhoof (the chamber below the hall, by the Instance Portal)
        };
        return a;
    }
};

} // anonymous

std::unique_ptr<DungeonScript> MakeBlackmawHoldScript()
{
    return std::make_unique<BlackmawHoldScript>();
}

} // namespace Playerbot
