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

#include "DB2Structure.h"
#include "ItemTemplate.h"
#include "Player.h"
#include "UpdateFields.h"

#include <type_traits>

namespace
{
    template<typename> struct ArrayBits;
    template<typename T, std::size_t Size, uint32 Bit, int32 FirstElementBit>
    struct ArrayBits<UF::UpdateFieldArray<T, Size, Bit, FirstElementBit>>
    {
        static constexpr uint32 Count = Size;
        static constexpr uint32 Group = Bit;
        static constexpr uint32 First = FirstElementBit;
    };

    template<typename Field> using Bits = ArrayBits<std::remove_cvref_t<Field>>;

    template<typename A>
    constexpr uint32 GroupEnd() { return A::First + A::Count; }

    template<typename> struct FieldBits;
    template<typename T, int32 BlockBit, uint32 Bit>
    struct FieldBits<UF::UpdateField<T, BlockBit, Bit>>
    {
        static constexpr uint32 Block = BlockBit;
        static constexpr uint32 Value = Bit;
    };
}

TEST_CASE("Key ring slots are the client's InvSlots 112..143", "[ClassicKeyRing]")
{
    STATIC_CHECK(KEYRING_SLOT_START == 112);
    STATIC_CHECK(KEYRING_SLOT_END - KEYRING_SLOT_START == 32);
    STATIC_CHECK(UF::size<decltype(UF::ActivePlayerData::InvSlots)>() == 144);

    CHECK(Player::IsKeyRingPos(INVENTORY_SLOT_BAG_0, 112));
    CHECK(Player::IsKeyRingPos(INVENTORY_SLOT_BAG_0, 143));
    CHECK_FALSE(Player::IsKeyRingPos(INVENTORY_SLOT_BAG_0, 111));   // client account bank tab 9, not ours
    CHECK_FALSE(Player::IsKeyRingPos(INVENTORY_SLOT_BAG_0, 144));
    CHECK_FALSE(Player::IsKeyRingPos(INVENTORY_SLOT_BAG_START, 112)); // a slot inside an equipped bag is not the key ring

    CHECK(Player::IsInventoryPos(INVENTORY_SLOT_BAG_0, 112));
    CHECK(Player::IsInventoryPos(INVENTORY_SLOT_BAG_0, 143));
    CHECK_FALSE(Player::IsInventoryPos(INVENTORY_SLOT_BAG_0, 108));
    CHECK_FALSE(Player::IsInventoryPos(INVENTORY_SLOT_BAG_0, 111));
    CHECK_FALSE(Player::IsEquipmentPos(INVENTORY_SLOT_BAG_0, 112));
    CHECK_FALSE(Player::IsBankPos(INVENTORY_SLOT_BAG_0, 112));
    CHECK_FALSE(Player::IsBagPos((INVENTORY_SLOT_BAG_0 << 8) | 112));
}

TEST_CASE("Only items of the Keys bag family go on the key ring", "[ClassicKeyRing]")
{
    ItemSparseEntry sparse{};
    ItemTemplate proto{};
    proto.ExtendedData = &sparse;

    sparse.BagFamily = BAG_FAMILY_MASK_KEYS;
    CHECK(Player::CanGoInKeyRing(&proto));

    sparse.BagFamily = BAG_FAMILY_MASK_KEYS | BAG_FAMILY_MASK_HERBS;
    CHECK(Player::CanGoInKeyRing(&proto));

    sparse.BagFamily = 0;
    CHECK_FALSE(Player::CanGoInKeyRing(&proto));

    sparse.BagFamily = BAG_FAMILY_MASK_SOUL_SHARDS;
    CHECK_FALSE(Player::CanGoInKeyRing(&proto));

    CHECK_FALSE(Player::CanGoInKeyRing(nullptr));
}

TEST_CASE("ActivePlayerData arrays after InvSlots follow it without gaps", "[ClassicKeyRing]")
{
    // InvSlots grew from 108 to 144 entries, every changes-mask bit after it moved by 36; a field left at its old bit would overlap
    // InvSlots or leave a hole, and the client would read the wrong field (ClassicActivePlayerDataBit70291 maps them with one offset)
    using APD = UF::ActivePlayerData;
    using Inv = Bits<decltype(APD::InvSlots)>;
    using Rest = Bits<decltype(APD::RestInfo)>;
    using DonePos = Bits<decltype(APD::ModDamageDonePos)>;
    using DoneNeg = Bits<decltype(APD::ModDamageDoneNeg)>;
    using DonePct = Bits<decltype(APD::ModDamageDonePercent)>;
    using HealPct = Bits<decltype(APD::ModHealingDonePercent)>;
    using WpnDmg = Bits<decltype(APD::WeaponDmgMultipliers)>;
    using WpnSpd = Bits<decltype(APD::WeaponAtkSpeedMultipliers)>;
    using BuyPrice = Bits<decltype(APD::BuybackPrice)>;
    using BuyTime = Bits<decltype(APD::BuybackTimestamp)>;
    using Ratings = Bits<decltype(APD::CombatRatings)>;
    using NoReagent = Bits<decltype(APD::NoReagentCostMask)>;
    using ProfLine = Bits<decltype(APD::ProfessionSkillLine)>;
    using BagFlags = Bits<decltype(APD::BagSlotFlags)>;
    using Upgrade = Bits<decltype(APD::ItemUpgradeHighWatermark)>;
    using Stable = FieldBits<std::remove_cvref_t<decltype(APD::NumStableSlots)>>;

    STATIC_CHECK(Inv::Group == 163);
    STATIC_CHECK(Inv::First == 164);
    STATIC_CHECK(Rest::Group == GroupEnd<Inv>());
    STATIC_CHECK(Rest::First == Rest::Group + 1);
    STATIC_CHECK(DonePos::Group == GroupEnd<Rest>());
    STATIC_CHECK(DonePos::First == DonePos::Group + 1);
    STATIC_CHECK(DoneNeg::Group == DonePos::Group);
    STATIC_CHECK(DoneNeg::First == GroupEnd<DonePos>());
    STATIC_CHECK(DonePct::First == GroupEnd<DoneNeg>());
    STATIC_CHECK(HealPct::First == GroupEnd<DonePct>());
    STATIC_CHECK(WpnDmg::Group == GroupEnd<HealPct>());
    STATIC_CHECK(WpnDmg::First == WpnDmg::Group + 1);
    STATIC_CHECK(WpnSpd::First == GroupEnd<WpnDmg>());
    STATIC_CHECK(BuyPrice::Group == GroupEnd<WpnSpd>());
    STATIC_CHECK(BuyPrice::First == BuyPrice::Group + 1);
    STATIC_CHECK(BuyTime::First == GroupEnd<BuyPrice>());
    STATIC_CHECK(Ratings::Group == GroupEnd<BuyTime>());
    STATIC_CHECK(Ratings::First == Ratings::Group + 1);
    STATIC_CHECK(NoReagent::Group == GroupEnd<Ratings>());
    STATIC_CHECK(NoReagent::First == NoReagent::Group + 1);
    STATIC_CHECK(ProfLine::Group == GroupEnd<NoReagent>());
    STATIC_CHECK(ProfLine::First == ProfLine::Group + 1);
    STATIC_CHECK(BagFlags::Group == GroupEnd<ProfLine>());
    STATIC_CHECK(BagFlags::First == BagFlags::Group + 1);
    STATIC_CHECK(Upgrade::Group == GroupEnd<BagFlags>());
    STATIC_CHECK(Upgrade::First == Upgrade::Group + 1);
    STATIC_CHECK(Stable::Value == GroupEnd<Upgrade>());
    STATIC_CHECK(std::is_base_of_v<UF::HasChangesMask<Stable::Value + 1>, APD>);
}
