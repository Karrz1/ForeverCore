// One-button rotation for every class but the warlock: `.playerbot lazy [dps|tank|heal]` (the add-on's "Lazy key") casts the next spell
// of the player's class and role. The warlock keeps its own rotation (Session/LazyLock.h).
#pragma once

#include "Define.h"
#include <string>

class Player;

namespace Playerbot {

// One press. `role` is "dps", "tank" or "heal" to override the role of the player's spec, empty for the spec's. Returns the text to show
// the player when the press failed in a way worth telling (empty when it cast, or when nothing was ready and the next press will try again).
std::string LazyKeyPress(Player* player, std::string const& role);

} // namespace Playerbot
