#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);
use Base::LineMagic qw($line_magic);

html( 'heading' => 'Miscellaneous magic items', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
2 Acorns of Stoning
by Johnny Brant
XP Value: 600 GP Value: 3,000
These tiny little weapons are empowered by vast alteration magic. They cause anyone or anything they are thrown at and successfully hit to turn to stone as per the wizard spell flesh to stone. For purposes of throwing them, they are considered +2 weapons to all but halflings; in their tiny hands they are considered +4 weapons. Furthermore, these acorns need not hit the bare flesh of the object, thus against armored foes all AC benefits derived from the armor they wear is not counted into the armor class of the being; although magical and Dexterity based bonuses still apply. Thus a man in chain mail +2 with a Dexterity of 15 would only have an AC of 7 (+1 from Dex and +2 magical bonus from the chain mail +2), as the AC 5 from the chain mail does not count against these potent magical acorns.
2 Bridle of Alignment Change
by Rich Rayburn
This enchanted muzzle-like bridle of the purest platinum was custom made for a small red dragon; but as with many magical items, it will shrink or expand to fit the creature it is being applied to. As the name suggests, if this bridle is placed on the muzzle of a medium to huge creature that has a protruding snout (like, a dragon, or a nightmare, but not a giant) it irrevocably changes the alignment of the creature to its diametrically opposite alignment.
The creature does get a save, a percentile roll of 2× the creature's Intelligence. If the creature's intelligence rating is 19, the creature must roll a 37% or lower to resist the alignment change. Demi-powers get 4× thier Intelligence as thier save, thus a demi-power with a 25 Intelligence will automatically save.
Note: Acidic or magical fire or frost from the creatures mouth, like a breath weapon, will require the bridle make a save as hard metal +2 versus the effects. Failure means destruction of the enchantment.
When a magic item is destroyed, explosive results are usually the norm causing the creature serious damage in a very sensitive area.
2 Cane of Chauncey
by Nathan Brown
This is a pimp cane further enchanted with the following attributes. With a tap on the ground, the cane can elongate into a quarterstaff with a +3 enchantment. When in its natural state, the cane can be spun and can deflect any missile fire, including magical, granted that the pimp forego any attack that round. If a button near the pommel is pressed, the cane will extend rapidly and carry its bearer upward, Dakuwan-style. A second press will retract the cane.
2 Coin of Compulsion
by Joshua Moore
This coin is a silver piece with the word "honor" on one side and the word "worth" on the other. The owner of the coin must obey all oaths made while in possession of it and take any quest presented in such a way that honor would seem to be gained by accomplishing it. The flip side is that any oath given to the holder must be fulfilled to the letter.
2 Jarid's Lucky Platinum Coin
by Johnny Brant
This platinum coin allows its owner to duplicate spells as a Robe of Repetition and also functions as a Luck Stone and a Ring Of Beauty (+2 to the coin bearer's Charisma, or racial maximum). If the owner is an archmage, the coin functions as a special Ring of Spell Storing that can store one spell of each spell level.
2 Cool Beans
These magical beans are only used when someone is happy about a given circumstance. Usually they are given when someone does something nice for another. The recpient of the nice deed or service can give some beans to the giver. When eaten they give the person a +1 to their Charisma for 1 round per bean.
No more than 2 beans can be eaten at one time. If more than one is eaten, the person has to make a constitution check or get horribly sickeningly sweet to everyone and everything that he or she encounters.
2 E-Mail
by ^Gabriel Elias^
This item is a small 2"x3" card of good quality paper. It has the owner's address (Storm@7Sisters.com, Elminster@Wizards.com, etc) on the front and a small button on the bottom right corner. The back of the card is blank. The user writes the message on the card, even if the owner cannot read or write, and presses the button. The message is sent through the Ethereal plane as a message spell to the recipient's card. The message appears on the back.
There are two buttons on the bottom right corner of the back of the card also to scroll up or down to view past messages. Ten messages can be held indefinitely if saved. The e-mail deletes all unsaved messages twice a week.
The quickness of the letter depends on the activity of the Ethereal plane at the time of sending, it is normally instant. There is a 30% chance that it might not get through and will have to be returned to sender.
2 Leon's Card
by Rich Rayburn
Leon's Card was first penned by a Pimp Mage who was tired of being harassed by "The Man." It is a magical card (a very small scroll of hard stock) about three inches long and an inch and a half wide that has Leon's name, address, and profession penned on it in a mystical ink. Taking and reading this card acts as a powerful combination Charm Person and Suggestion spell leaving the reader open to "viable" alternatives to the original plan. An example of use:
Leon is accosted by the city watch for pandering—he flashes his card; the Captain reads the card; and then gets irate that Leon handed it to him... "Just what is this thing?". Leon makes the observation that the City Watch just is not appreciated enough in this town; that they work long, hard hours, exposed to many countless dangers, as well as mundane, boring tasks... perhaps he should personally show his gratitude for the efforts of the Watch Captain with a generous (and regular) contribution...In exchange of course for some "consideration" for a reasonable man trying to earn a living in a non-violent way that does not threaten the peace.
The reader of the card must make a save versus magic at -2. If the suggestion is reasonable to the situation, failure results in perfect agreement. A failed save by more than 10 points means not just tacit agreement but active and sincere apologies with a humble refusal of bribery or whatever the Pimp Mage is offering while the victim departs the area ("this was OBVIOUSLY a mistake...").
The ink for this card is a mixture of giant squid ink, blood from the Pimp Mage, and distilled water from a reversal of the "Water to Liquor" spell, all in equal measures, mixed with 200gp of crushed pearl per application.
2 Lute of the Flea
by Nathan Brown
This normal-appearing lute has four strings and, when strummed, gives off a lower sound than it should. If a successful musical instrument check is made, the player goes into a wild beat. This beat will not interfere with other music playing and will fit into the rhythm and tune.
2 Mirror of Control
|* Frame|# of People|Gem-studded|Duration|Saving Throw
|- Wooden|1d4|×2|2d4 Hours|Normal
|- Iron|1d6|×3|2d6 Days|-1
|- Copper|1d8|×3|2d8 Days|-2
|- Silver|1d10|×4|2d10 Days|-4
|- Electrum|1d12|×4|1d12 Weeks|-6
|- Gold|1d20|×4|1d20 Weeks|-8
|- Platinum|1d100|×5|1d100 Months|None
There are only a few of these mirrors in existence. The mirror is a five foot wide oval. Some of them are freestanding and others are wall mountable. The mirror spawns smaller mirrors which are given to the people to be controlled. The amount of people that can be controlled and the length of time of the control depends on how the main mirror is framed (see chart). If a person is unwilling to be controlled, the victim may get a saving throw versus petrifacation.
To use the mirror, the owner will have to have a smaller mirror spawned and give it to the intended target. Once the target touches the smaller mirror, that person is controlled after failing the saving throw. When control is established, all the owner has to do it focus on one of the people controlled and issue commands through the mirror. The victims can be forced to act against their own interests and alignments. The victims are also fully aware of the control and of what they are doing. The victims are barred from planear travel.
If the smaller mirror is broken by accident, the holder gets a saving throw versus death. If the mirror is broken on purpose, the holder immediately dies. If the main mirror is destroyed, all those that are under control are freed, and the owner must make a save versus death or die.
2 Plague Plaque
On first inspection, the person will notice that the plaque has magical properties when the plaque changes whatever is inscribed on it to something that will personalize it to the new holder. It will be dormant until it is hung on the wall of the home of the holder. Once hung it is too late.
The plaque will first infect the holder and everyone in the household including any long time temporary guests. Anyone entering the building will contract the infection. After that the infection will spread throughout the area at a high rate of speed. It can spread through a large sized city within 3 days. All creatures will contract the infection. The infection will have successfully have taken over the body of the victim in 1 + Con hrs. To cure an infected victim, two priests will have to cast cure disease and remove curse at the same exact moment.
All animal life within the area will contract the infection. All livestock will be inedible (milk will become scarce as it will pass along the infection). After a week vegetable life will start to wilt.
The only way to stop the spread of the infection is to remove the plaque from the wall and bathe it in holy water consecrated by a 16th level (or higher) priest of a god of nature. That will only stop the current infection. To destroy it it must be completely immersed in the holy water of five good gods and the unholy water of five evil gods (not all evil deities like plagues) then given to the God of Nature.
When found, it will usually bear the inscription "Home Sweet Home."
This item is an artifact.
2 Stone of Sharpening
by Johnny Brant
XP Value: 500 GP Value: 2,500
This whetstone can sharpen anything to the finest edge within minutes. It can be used to sharpen up to 10 tiny objects in a single round (like ten coins); although, it takes one round to properly sharpen a small sized object, 2 rounds to properly sharpen a medium sized object, and 4 rounds to sharpen a large sized object. The damage these sharpened object causes is left to the DM. Although a sharpened coin causes 1d2 points of damage to small-medium sized creatures and only 1 point of damage vs. large creatures. It is said that a party once killed a werewolf with coins sharpened in this fashion!
2 String of Returning
by Johnny Brant
XP Value: 3,000* GP Value: 15,000*
Any non-living material this magical string is tied to will always return to the person who tied it there. 1d2 feet of this magical string will be found and can be used in the following ways:
* ¼ of a foot is required for items equivalent to a small (S) sized weapon.
* ½ a foot is required for items equivalent to a medium (M) sized weapon.
* 1 foot of string is required for items equivalent to a large (L) sized weapon.
Otherwise this string functions as rings of readiness, but the only limitations to the distance between the item and the person who tied the string of returning to the item is that they must both be on the same plane of existence. The experience and gold piece values are allotted per foot created, bought, or sold.
2 Zagixn
by Johnny Brant
An evil rope of climbing, Zagixn is a unique psionically intelligent magical item. He has an Intelligence of 15 (speaking Common, Dragon, Drow, Elven and Orc) and an ego of 20. Otherwise, Zagixn has the following statistics:
Zagixn: AC 6; MV 30; HD 2; hp 16; THAC0 18; #AT 1; Dmg 1d6 (3 consecutive rounds kills victim); SA strangulation (no magical bonuses apply to this attack), psionic abilities of adrenalin control, cell adjustment, contact, metamorphosis, mindlink, synaptic static (171 PSPs), locate object 120' radius, detect magic 10' radius, detect precious metals (kind and amount) 20' radius; SD immune to all falling/crushing damage; SW -2 to saves vs. fire-based attacks; SZ L (60' long); ML (16); AL CE; XP 13,000.
Zagixn sometimes attempts to trip or otherwise screw up the life and actions of it's owner.
