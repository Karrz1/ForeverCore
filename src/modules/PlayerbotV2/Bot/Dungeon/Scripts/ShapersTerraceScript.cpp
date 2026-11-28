// ShapersTerraceScript - per-dungeon advice for The Shaper's Terrace (map 3001, Classic 1.60 Forever, levels 58-60).
// The creatures and the boss fights are in classic_instance_shapers_terrace.cpp and 2026_11_19_72_world_forever_shapers_terrace.sql;
// the route (playerbot_dungeon_routes, 0070_shapers_terrace_route_not_through_the_titanic_door.sql) and this file follow the same boss
// order, one wing at a time from live's landing ledge (the bots jump off it into the pool, a nav link): the north (Cinder, Snowtalon,
// Vitrix), the middle (Tor'Rel and Izha'Rel, Venomridge, Bolt), the south (Thunderhoof, King Op, the Direhorn Matriarch),
// then Nanaya (the shortest walk from the pool that ends at Nanaya, about 4140 y; every leg was path-checked on the 3001 navmesh).
// The standing bosses are at live's spots (world 2026_11_25_82, Karrz's capture of 25 Nov 2026); the five live summons at their
// panels stand at ours, Snowtalon beside his ice panel. The Titanosaur is not a boss of the dungeon: he stands behind the Titanic
// Door, live's locked raid gate (Karrz used it 12 times, it never opened), and a closed door is not walked through.

#include "../DungeonScript.h"

namespace Playerbot {

namespace {

class ShapersTerraceScript final : public DungeonScript
{
public:
    uint32_t  map_id() const override { return 3001; }   // The Shaper's Terrace
    char const* name() const override { return "shapers_terrace"; }

    DungeonAdvice get_advice(BotSnapshotView const& /*s*/) const override
    {
        DungeonAdvice a;
        // Izha'Rel slows and shocks the group while Tor'Rel holds the tank: she dies first.
        a.high_priority_kill_entries = {
            253218,   // Izha'Rel
        };
        a.mandatory_interrupt_spells = {
            1310513,   // Chain Lightning (Thunderhoof, Bolt)
            1291380,   // Chain Lightning (Nanaya, yellow panel)
            8364,      // Blizzard (Nanaya, blue panel)
        };
        // Cinder's Conflagration confuses a player who is not the tank for 4 s and every second burns every ally within 5 y of them
        // for 300 (16806, radius index 8; the area check adds the 1.5 y combat reach of whoever it hits). shapers_full af61 (22 Nov):
        // the five stood within 5 y of each other at Cinder and the mage died to it. The others keep 7 y from its carrier.
        a.keep_clear_of_carriers = {
            { 1310512, 7.0f },   // Conflagration (Cinder)
        };
        // Vitrix's Poison Shock (1312870, instant, radius index 13: 10 y round its target) hit two of the group for 1269 and 1470 in
        // one cast at 6.5 and 10.1 y from him (shapers_full af63, 23 Nov), and the priest, healing the stack through every cast, ran
        // out of mana. The ranged and the healer spread 10 y from everyone.
        a.spread_from_bosses = {
            { 272561, 10.0f },   // Vitrix
        };
        a.bosses = {
            261974,   // Cinder
            262297,   // Snowtalon
            272561,   // Vitrix
            261811,   // Tor'Rel (with Izha'Rel)
            261813,   // Venomridge
            262081,   // Bolt
            261812,   // Thunderhoof
            261993,   // King Op
            262127,   // Direhorn Matriarch
            261809,   // Nanaya
        };
        // 1:1 with `bosses`: their spawn spots (2026_11_25_82_world_forever_shapers_terrace_live_spawns.sql; the summoned five from
        // 2026_11_22_79, Snowtalon moved by 82).
        a.progression_waypoints = {
            { -5904.2f, -862.5f, 113.15f },   // Cinder
            { -5443.1f, -792.4f, 21.75f },    // Snowtalon
            { -5520.8f, -845.8f, 22.67f },    // Vitrix
            { -5628.3f, -1223.8f, 33.84f },   // Tor'Rel
            { -5908.8f, -1192.2f, 6.80f },    // Venomridge
            { -5933.0f, -1183.3f, 9.12f },    // Bolt
            { -5952.4f, -1463.5f, 8.57f },    // Thunderhoof
            { -6107.1f, -1971.4f, 43.60f },   // King Op
            { -5862.1f, -1739.6f, 13.21f },   // Direhorn Matriarch
            { -5854.2f, -1587.5f, 37.31f },   // Nanaya
        };
        return a;
    }
};

} // anonymous

std::unique_ptr<DungeonScript> MakeShapersTerraceScript()
{
    return std::make_unique<ShapersTerraceScript>();
}

} // namespace Playerbot
