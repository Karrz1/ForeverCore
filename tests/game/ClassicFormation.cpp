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

#ifdef TESTS_HAVE_PLAYERBOT_V2

#include "../../src/modules/PlayerbotV2/Bot/Formation.h"
#include <cmath>
#include <set>

using namespace Playerbot;

namespace
{
constexpr float kPi = 3.14159265358979323846f;

// Distance of an angle from straight ahead of the owner (0) in radians, 0 .. pi.
float OffFront(float a)
{
    a = std::fmod(a, 2.0f * kPi);
    if (a < 0.0f) a += 2.0f * kPi;
    return a > kPi ? 2.0f * kPi - a : a;
}
}

TEST_CASE("Circle formation: the first slot leads, the last closes the ring behind the owner", "[ClassicFormation]")
{
    // Members are sorted tanks first, healers last (State_InGroup). Row 348: the tank stood directly behind the owner.
    for (uint32_t count : { 2u, 4u, 5u, 9u })
    {
        FormationOffset const tank = ComputeOwnerSlotOffset(FormationType::Circle, 0, count, 1, 3.0f);
        FormationOffset const last = ComputeOwnerSlotOffset(FormationType::Circle, count - 1, count, 1, 3.0f);
        CHECK(OffFront(tank.angle_radians) < 0.1f);
        CHECK(OffFront(last.angle_radians) > OffFront(tank.angle_radians));
        // Each later slot of the first ring stands at least as far round towards the back as the one before it.
        for (uint32_t i = 1; i < count && i < 5; ++i)
            CHECK(OffFront(ComputeOwnerSlotOffset(FormationType::Circle, i, count, 1, 3.0f).angle_radians) + 1e-4f >=
                  OffFront(ComputeOwnerSlotOffset(FormationType::Circle, i - 1, count, 1, 3.0f).angle_radians));
    }
    // With 5 bots the healer (last) is behind the owner's shoulders.
    CHECK(OffFront(ComputeOwnerSlotOffset(FormationType::Circle, 4, 5, 1, 3.0f).angle_radians) > kPi / 2.0f);
}

TEST_CASE("Circle formation: no two slots on the same spot", "[ClassicFormation]")
{
    for (uint32_t count : { 3u, 8u, 20u, 40u })
    {
        std::set<std::pair<int, int>> spots;
        for (uint32_t i = 0; i < count; ++i)
        {
            FormationOffset const o = ComputeOwnerSlotOffset(FormationType::Circle, i, count, 1, 3.0f);
            CHECK(o.distance > 1.0f);
            int const x = int(std::lround(o.distance * std::cos(o.angle_radians) * 4.0f));
            int const y = int(std::lround(o.distance * std::sin(o.angle_radians) * 4.0f));
            CHECK(spots.insert({ x, y }).second);
        }
    }
}

#endif
