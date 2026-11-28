-- Camp Chair (612275): the camp rest of whoever sits in it now starts in the core, once the chair's seat move has landed
-- (WorldSession::UpdateCampfireRest). The chair's own script started the rest before the seat move, which then took it away
-- again at once, so it is gone. Safe to run again.
UPDATE `gameobject_template` SET `ScriptName` = '' WHERE `entry` = 612275 AND `ScriptName` = 'classic_go_camp_chair';
