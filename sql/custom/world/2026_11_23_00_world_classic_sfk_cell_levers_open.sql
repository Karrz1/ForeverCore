-- Shadowfang Keep: the cell levers really open the cells now (follow-up of 2026_11_19_84). That file opened the cell doors with
-- SMART_ACTION_ACTIVATE_GAMEOBJECT Open, but GameObject::ActivateObject only opens with a unit caster, and the script owner is
-- the lever (a gameobject): the lever moved, the cell stayed shut, so Deathstalker Adamant could not be reached and the
-- courtyard door could not be opened. Set the door state directly instead (SMART_ACTION_GO_SET_GO_STATE GO_STATE_ACTIVE), as
-- the courtyard door lever 32443 does. Safe to run again.

UPDATE `smart_scripts` SET `action_type` = 118, `action_param1` = 0
WHERE `source_type` = 1 AND `entryorguid` IN (-30032442,-30034006) AND `id` = 0 AND `event_type` = 70;
