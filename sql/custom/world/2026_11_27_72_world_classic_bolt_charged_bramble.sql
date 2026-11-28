-- Items of Power 1948 (mage, Discord RU, Gefest666, 11-27): the Witherbark Totem Bundle put up at the Stone of Outer Binding never turned
-- into the Bolt Charged Bramble 103662, so the Bolt Charged Bramble 7272 for Tabetha could not be had. The bundle's trap 103661 had a
-- nearby trigger creature 15214 cast Bolt Charge Bramble 9056 (summon object 103662 at the caster), and no such creature stands at the
-- stone. The trap casts 9056 itself now, so the bramble comes up where the bundle stood, 10 s after it was put up, as before.
-- Safe to run again.
UPDATE `smart_scripts` SET `action_type`=11, `action_param1`=9056, `action_param2`=2, `action_param3`=0,
  `target_type`=1, `target_param1`=0, `target_param2`=0, `target_param3`=0,
  `comment`='Witherbark Totem Bundle TRAP - On update - Cast Bolt Charge Bramble (summons the Bolt Charged Bramble here)'
WHERE `entryorguid`=103661 AND `source_type`=1 AND `id`=1 AND `action_type` IN (85, 11);
