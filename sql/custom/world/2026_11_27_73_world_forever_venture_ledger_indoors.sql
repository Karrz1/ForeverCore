-- We've Been Robbed! (95325, Stranglethorn): the Venture Co. Ledger 630887 (where the quest is handed in) stood on the roof of the
-- Venture Co. office by Lake Nezferiti (Discord, kujo 11-27: "stuck on the roof, not on the panel by the red button"). Our spawn
-- 47501127 (2026_11_21_23) got its height from a Wowhead map point (x/y only), which put it on the roof (z 47.68). Players
-- handed the quest in at 42.7, 18.5 (ForeverDB Companion data); Everlake's spot for it (Icy Veins addon sighting, height from
-- their map and vmap tool: -11956.2 -505.24 39.28, GPL-3.0, credit Everlake) is inside the office on the same map point.
-- Everlake's row was never added (2026_11_21_90 adds a spawn only when the object has none), so the existing spawn moves there.
UPDATE `gameobject` SET `position_x`=-11956.2, `position_y`=-505.24, `position_z`=39.28
WHERE `guid`=47501127 AND `id`=630887;
