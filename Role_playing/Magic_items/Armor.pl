#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);
use Base::LineMagic qw($line_magic);

html( 'heading' => 'Magical armor', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
2 DeVir Chain Mail
by Johnny Brant
This drow chain mail +5 is constructed completely of onyx links. Furthermore it has been bonded to a pair of adamantine bracers inlaid with obsidian DeVir insignia. These bracers instantly protect the wearer in onyx chain mail whenever physical attacks are made against him.
This armor reduces the magic resistance of the wearer's foes and enemies by a percentage equal to his own level based magic resistance (2% per level, not the initial 50% for a 0-level drow) gained from birth for being a drow! Thus Yazston DeVir, who is a 13th-level wild mage, reduces the magic resistance of his enemies while wearing these magical bracers by 26% (2 × 13 = 26).
Like all drow magical items these bracers do not radiate magic but are not destroyed by sunlight when above ground for too long. They function as both bracers of defense AC 0 and drow chain mail +5 whichever best suits the needs of the wearer.
2 Cynabrill Armor
by Rich Rayburn
|* Armor|Magic Resistance
|+ Full Plate|70%
|+ Field Plate|60%
|+ Plate Mail|50%
|+ Splint|40%
|+ Banded|30%
|+ Chain mail|20%
|+ Studded Leather|10%
|+ Medium/Large Shield|+10%
|+ Small Shield|+5%
Cynabrill is a very rare, rust-red iron-like ore mined from the mountains of one nation of Mystara in the Heldann Freeholds with inherent magic resistance. When fired and fashioned into armor, it acts as non-magical armor with magic resistance of between 10-70% depending on how much cynabrill is in the armor itself not on the refining or smelting process.
Any quantity of the ore less than the weight of 2-3lbs has no real MR properties of "game-able" measurement. As an oddity Clerical magic is unaffected (thus, it is possible for clerics to wear the armor and cast spells). Cleric-specific magic items work when worn with the armor as well, but all other magic items carried/worn must make MR roles to be effective (DM fiat on the roll needed for the effects). Magical swords and other weapons do not lose any of their plusses when wielded with the armor nor does a magic shield (so it is possible to have cynabrill armor, a +4 shield, and hefting a +4 Defender, applying the +4 to AC, making it effectively 70% MR with a -9 AC!).
Needless to say this ore and mines it comes from are VERY well protected. Armor fashioned from it is used by the Order of Heldann in their blood war against the wizard-empire of Alphatia.
All known attempts to enchant cynabrill with an Enchant an Item spell have failed including a full plate set captured by Alphatian forces (studied for months and attempts made by a council of 18th level + wizards).
2 Dinner Plate
by ^Gabriel Elias^
Forged by a Gnomish chef turned Armorer/Tinkerer, this armor, when all together, acts as +2 Plate Mail. The hard part is living with the laughter and humiliation of wearing it.
The breast and back plate is a BBQ-type grill, the left arm is protected by a ladle, the overly large scooper covers the shoulder while the handle protects the biceps and triceps, and a spatula is on the right. A flour sifter acts as a Bracer on one forearm, and a measuring cup with the bottom missing is for the other. Rubber dish washing gloves are the gauntlets.  Plates and frying pans of different sizes cover the remaining parts of the body. It is held together by a S.O.S. pad type material. The helmet is a very large funnel.
When found by a character, it will be lying in a pile and appears to be just a bunch of dirty dishes, pots, and pans.
2 Air Mail
by Nathan Brown
Air Mail functions as +3 field plate. The armor is invisible without magical sight as it is a field of rushing air about the wearer. The armor is incredibly light and causes the wearer no encumbrance. Should the wearer enter a body of water, the wearer would float easily, supporting up to 600 pounds of weight. Due to the nature of the mail, the spells Gust, Feather Fall, and Levitate enable the wearer limited flight. While wearing the armor, the weight but not mass of the wearer is significantly decreased allowing moonlike gravity effects. Penalties to thief abilities and spell-casting still apply.
2 Phoenix's Mercury Mail
by Johnny Brant
Talina "Phoenix" Faynevon in honor of her pledge to serve the Lady of Mysteries, Mystra, enchanted this plate mail. This plate mail is made from liquid metal and the malleable scales of a great wyrm quicksilver dragon. The armor is the equivalent of plate mail +4 and grants its wearer protection from normal missiles and the constant effect of an Ironguard spell.
Spells can be cast while wearing the armor only if the caster is both a fighter and a mage. This armor has a permanent mending ability and adjusts to fit any form the wearer may take. This armor has a +6 to its saving throws and saves as metal or crystal whichever is better. This armor is also protected by the trifold curse of Mystra.
2 Medium Shield of Missile Deflection +1
by ^Randy Furuyama^
The shield is found usually with 10 charges. For every charge expended, the shield will automatically deflect any single missile fired at the shield bearer. The DM may choose to override this for artifact level magic. More than one charge can be expended in a single round to deflect more missiles. The missile must be fired at the shield bearer for it to work. For example, a Fireball has an area affect and cannot be deflected unless the shield bearer is the target. This shield can be visually impressive in such cases as a giant throwing a boulder, only to have it batted away by the shield bearer. The shield can be recharged by a mage recharging of at least 15th level at a typical cost of 5000 GP per charge.
