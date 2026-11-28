-- Blackmaw Hold (map 2974): Clawbert's lines in the Blackmaw Behemoth fight, as live has them, from a live capture made on
-- 27 November 2026 (client 1.60.1.71139) of a Behemoth kill (encounter 3323, 23:25:54-23:27:40). All six are Clawbert's
-- yells (live's sound kits; broadcast texts where the capture gave them). When live said each is in its comment; our
-- Blackmaw script does not call them yet. Safe to run again.
DELETE FROM `creature_text` WHERE `CreatureID` = 247996;
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(247996,0,0,'Kill the intruders, you half-wit!',14,0,100,0,0,221105,310290,0,'Clawbert - on pull, to the Behemoth (live 23:25:54, same tick as the encounter start)'),
(247996,1,0,'What would you do without me?',14,0,100,0,0,350971,293635,0,'Clawbert - as he starts Restore on the Behemoth (live 23:26:08 and 23:26:19, both casts)'),
(247996,2,0,'I''m not a club, you imbecile!',14,0,100,0,0,202166,0,0,'Clawbert - with his spell 1244482 as the Behemoth starts Bestial Roar (live 23:26:22)'),
(247996,3,0,'Aaaaaaaaaaaaaargh!!!',14,0,100,0,0,221104,293470,0,'Clawbert - when the Behemoth starts Whirlwind with him low (live 23:26:43)'),
(247996,4,0,'Wait, no! Stop!',14,0,100,0,0,221107,0,0,'Clawbert - when he is down to 1 health and the Behemoth starts eating him (live 23:26:47)'),
(247996,5,0,'Noooooooooooooooo!',14,0,100,0,0,221109,0,0,'Clawbert - halfway through being eaten (live 23:26:51, 4 s after line 4)');
