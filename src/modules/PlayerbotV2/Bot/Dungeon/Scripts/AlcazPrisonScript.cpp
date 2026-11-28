// AlcazPrisonScript - per-dungeon advice for Alcaz Prison (map 2994, Classic 1.60 Forever, levels 50-55).
// The creatures and the boss fights are in classic_instance_alcaz_prison.cpp and the world SQL (since 2026_11_27_40: live's layout,
// from Karrz's capture of a full clear on 26 Nov); the route (playerbot_dungeon_routes, 0071_alcaz_prison_route_as_live_clears_it.sql)
// and this file follow live's kill order: Overseer Wrex, Katerina the Cleaner, Blazeroar, The Questioner. The doors decide it. From the
// landing only Wrex's wing is open. The Maximum Security Door (649547) to Katerina and Blazeroar takes Wrex's Overseer's Keyring or
// Lockpicking 250: on live the group's rogue picked it, and the bots' rogue does the same (idle:dungeon_open_hand_door, pick_lock).
// The Prison Gate (649552) to The Questioner has no lock and shuts 3 s after each use; every bot opens it for itself (hand_doors).
// Tidemistress Ca'zass is not on live and not spawned.

#include "../DungeonScript.h"

namespace Playerbot {

namespace {

class AlcazPrisonScript final : public DungeonScript
{
public:
    uint32_t  map_id() const override { return 2994; }   // Alcaz Prison
    char const* name() const override { return "alcaz_prison"; }

    DungeonAdvice get_advice(BotSnapshotView const& /*s*/) const override
    {
        DungeonAdvice a;
        // The casters of the packs: their bolts are the spike damage on the group.
        a.high_priority_kill_entries = {
            255373,   // Strashaz Enchantress (Lightning Bolt, Frost Shock)
            255364,   // Renegade Conjurer (Frostbolt, Frost Nova)
            255262,   // Alcaz Chaplain (two of them join Katerina)
        };
        a.cc_priority_entries = {
            255373,   // Strashaz Enchantress
            255364,   // Renegade Conjurer
        };
        a.mandatory_interrupt_spells = {
            12466,   // Fireball (Blazeroar as Zarla Ober)
            17620,   // Drain Life (The Questioner)
        };
        // Commander Folkar is chained (immune to players and creatures) and Mason Connery is a prisoner to free: neither is a target.
        a.ignore_entries = {
            260386,   // Commander Folkar
            264770,   // Mason Connery
        };
        // Live's order (capture 26 Nov, 21:59-22:13).
        a.bosses = {
            255391,   // Overseer Wrex
            257016,   // Katerina the Cleaner
            255702,   // Blazeroar
            256236,   // The Questioner
        };
        // 1:1 with `bosses`: live's spots (2026_11_27_40; the Questioner walks between this spot and (-8762.1, 2845.5)).
        a.progression_waypoints = {
            { -8885.8f, 2921.3f, 14.91f },   // Overseer Wrex
            { -8808.5f, 2971.1f, 6.01f },    // Katerina the Cleaner
            { -8901.2f, 2971.5f, 5.89f },    // Blazeroar
            { -8773.0f, 2854.2f, 13.86f },   // The Questioner
        };
        return a;
    }

    // The Prison Gate to The Questioner: no lock, a click opens it (and it shuts again 3 s later).
    std::vector<uint32_t> hand_doors() const override { return { 649552 }; }

    // Tidemistress Ca'zass keeps her boss slot (the client's DungeonEncounter 3410, as live) but live spawns her nowhere Karrz went, and
    // neither do we (2026_11_27_40): her encounter stays NOT_STARTED, so the clear is complete without her.
    std::vector<uint32_t> event_summoned_bosses() const override { return { 255997 }; }
};

} // anonymous

std::unique_ptr<DungeonScript> MakeAlcazPrisonScript()
{
    return std::make_unique<AlcazPrisonScript>();
}

} // namespace Playerbot
