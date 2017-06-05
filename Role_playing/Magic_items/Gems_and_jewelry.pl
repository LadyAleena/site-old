#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magical gems and jewelry', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
2 Amulet of the Escapist
by Johnny Brant
This amulet allows its wearer, who must be a Wizard, to use the following spells each once per day (unless otherwise noted): Blur, Dimension Door, Feather Fall (at will), Invisibility, Non-Detection (constant), and Teleport. This amulet also functions as a Ring of Agility (same as a Ring Of Beauty, but affects Dexterity). This item functions at 20th level. 
The following abilities each once per day if the wearer is an archmage: Haste (no aging), Polymorph Self, Shadowshield, and Simbul's Synostodweomer.
2 Amulet of Eversleep
by Nathan Brown
The wearer cannot be awakened when placed into a deep sleep one round after donning the amulet until it is removed. While asleep the wearer will not age. Any physical or magical damage may occur to the body which will heal at a normal rate, but the wearer will not awaken unless the amulet is removed.
2 Beads of Nothingness
by Johnny Brant
This magical necklace is fitted snugly against the neck of its wearer and is made of glassteel beads strung on and affixed to the wearer by the tendons of an astral dragon. It renders the wearer's neck and itself totally ethereal as the 3rd level priest spell Etherealness.
2 Bracelet of Magic Finding
This item is an artifact. It is bright gold with diamonds in a small band in the center. The Bracelet will lead the wearer to the most powerful magic item in the world. To find the next most powerful item, the wearer must destroy the item currently in his or her possesion. If the wearer is not in possession of the item within one week, the wearer will die, no save. To remove the curse, the wearer must have the most powerful item in hand, renounce all magic in front of the deity of magic, or leave the known universe. To destroy the Bracelet, all magic items, including artifacts, in the known universe must be destroyed; all of the gods depart the known universe; or it is thrown, attached to its current wearer, into the heart of the known universe.
2 Bracelet of RSP
by Joshua Moore
The Bracelet of RSP (Reversed Statistical Polarity) is a cursed item that guarantees a dramatic reversal in a PC. This bracelet automatically activates when donned, and totally reverses the ability scores of the wearer, using the 3 and 18 as the base guideline. If the wearer started off with 13, 10, 17, 5, 11, 14; he would then have the new stats: 8, 11, 4, 16, 10, 7. Any stats of 21 or higher become ones. Also, if a character gains a level while wearing it, the hit die is reversed as well. A fighter who rolled a ten would get a one, or if he rolled a 2 he'd get a nine. Saving throws are not affected. Such is the power of the curse on it that only a Wish spell or limited Wish will remove it.
2 Drop of Luck
by Nathan Brown
These small amber gems are tear-shaped and rumored to have been created from an indeterminable bodily fluid of Tymora. The character must be aware of their purpose for the Drop to work. If the player makes a roll just short of a success, the Drop can used at will and after the roll is made to alter the roll up or down, as appropriate, by 1d4. The drop cannot take the roll beyond the bounds of the die. When used the drop flashes violently and fades from existence. They are very rare, but there is no set number of them in Faerun.
STRONG<Note:> This item is restricted to Faerun. If taken from Faerun by any means, the drop will disappear.
2 Elemental Harness
The different parts of the B<Elemental Harness> are powerful on their own. When brought together, they become nearly as powerful as an artifact.
3 Necklace of Elemental Command
The B<Necklace of Elemental Command> appears to be nothing more than an ordinary piece of jewelry, but it a very powerful item.
4 Powers
# Elementals can't attack or even approach within 5 feet of the wearer. If the wearer desires, he may forego this protection and instead attempt to charm the elemental (saving throw applicable with a -2 penalty to the die). If the charm fails, however, total protection is lost and no further attempt at charming can be made, but the secondary properties given below will then function with respect to the elemental.
# Creatures, other than normal elementals, from the elemental planes attack with -1 penalties to their attack rolls. The necklace wearer takes damage at -1 on each die of damage and makes applicable saving throws from the creature's attacks at +2. All attacks are made by the wearer of the necklace with a +4 bonus to the attack roll (or -4 on the elemental creature's saving throw), and the wearer inflicts +6 damage (total, not per die) adjusted by any other applicable bonuses and penalties. Any weapon used by the necklace wearer can hit elementals or elemental creatures even if it is not magical.
# The wearer of the necklace is able to converse with elementals or elemental creatures. These creatures will recognize that he wears the necklace, and will show a healthy respect for the wearer, if alignments are similar. If alignment is opposed, creatures will fear the wearer if he is strong, hate and desire to slay him if the wearer is weak. Fear, hatred, and respect are determined by the DM.
# Only one of the powers of a necklace of elemental command can be in use at any given time.
4 Additional powers
The necklace gives the character the following abilities from the four elemental planes. The necklace operates at 12th level of experience, or the minimum level needed to perform the equivalent magical spell, if greater.
* Air
** Gust of wind (once per round)
** Fly
** Wall of force (once per day)
** Control winds (once per week)
** Invisibility
* Earth
** Stone tell (once per day)
** Passwall (twice per day)
** Wall of stone (once per day)
** Stone to flesh (twice per week)
** Move earth (once per week)
** Feather fall
* Fire
** Burning hands (once per turn)
** Pyrotechnics (twice per day)
** Wall of fire (once per day)
** Flame strike (twice per week)
** Fire resistance
* Water
** Purify water
** Create water (once per day)
** Water breathing (5-foot radius)
** Wall of ice (once per day)
** Airy water
** Lower water (twice per week)
** Part water (twice per week)
** Water walking
3 Necklace of Paraelemental Command
The B<Necklace of Paraelemental Command> appears to be nothing more than an ordinary piece of jewelry, but it is a very powerful item.
4 Powers
# Paraelementals can't attack or even approach within 5 feet of the wearer. If the wearer desires, he may forego this protection and instead attempt to charm the elemental (saving throw applicable with a -2 penalty to the die). If the charm fails, however, total protection is lost and no further attempt at charming can be made, but the secondary properties given below will then function with respect to the elemental.
# Creatures, other than normal paraelementals, from the elemental planes attack with -1 penalties to their attack rolls. The wearer takes damage at -1 on each die of damage and makes applicable saving throws from the creature's attacks at +2. All attacks are made by the wearer of the necklace with a +4 bonus to the attack roll (or -4 on the elemental creature's saving throw), and the wearer inflicts +6 damage (total, not per die) adjusted by any other applicable bonuses and penalties. Any weapon used by the necklace wearer can hit paraelementals or paraelemental creatures even if it is not magical.
# The wearer of the necklace is able to converse with  paraelementals or paraelemental creatures. These creatures will recognize that he wears the necklace, and will show a healthy respect for the wearer, if alignments are similar. If alignment is opposed, creatures will fear the wearer if he is strong, hate and desire to slay him if the wearer is weak. Fear, hatred, and respect are determined by the DM.
# Only one of the powers of a necklace of elemental command can be in use at any given time.
4 Additional powers
The necklace gives the character the following abilities from the four elemental planes. The necklace operates at 12th level of experience, or the minimum level needed to perform the equivalent magical spell, if greater.
* Ice
** Ice Storm (twice per day)
** Wall of Ice (twice per day)
** Otiluke's Freezing Sphere (once per week)
** Warmth
* Magma
** Burning Hands (once per turn)
** Affect Normal Fires (once per turn)
** Flaming Sphere (twice per day)
** Fire Resistance
* Ooze
** Grease (once per turn)
** Melt (one per hour)
** Rock to mud (twice per day)
** Water walking
* Smoke
** Wall of Fire (once per hour)
** Fog Smoke (twice per day)
** Solid Fog (once per week)
** Free action
3 Amulets of Quasielemental Command
The B<Amulet of Positive Quasielemental Command> and the B<Amulet of Negative Quasielemental Command> appear to be nothing more than ordinary amulets.
4 Powers
# Quasielementals that are represented by the amulet can't attack or even approach within 5 feet of the wearer. If the wearer desires, he may forego this protection and instead attempt to charm the elemental (saving throw applicable with a -2 penalty to the die). If the charm fails, however, total protection is lost and no further attempt at charming can be made, but the secondary properties given below will then function with respect to the elemental.
# Creatures, other than normal quasielementals, from the elemental planes in respect to the amulet attack with -1 penalties to their attack rolls. The wearer takes damage at -1 on each die of damage and makes applicable saving throws from the creature's attacks at +2. All attacks are made by the wearer of the amulet with a +4 bonus to the attack roll (or -4 on the elemental creature's saving throw), and the wearer inflicts +6 damage (total, not per die) adjusted by any other applicable bonuses and penalties. Any weapon used by the amulet wearer can hit quasielementals or quasielemental creatures even if it is not magical.
# The wearer of the amulet is able to converse with the quasielementals or quasielemental creatures of the planes to which the amulet is attuned. These creatures will recognize that he wears the amulet, and will show a healthy respect for the wearer, if alignments are similar. If alignment is opposed, creatures will fear the wearer if he is strong, hate and desire to slay him if the wearer is weak. Fear, hatred, and respect are determined by the DM.
# These amulets operate at 12th level of experience, or the minimum level needed to perform the equivalent magical spell, if greater.
# Only one of the powers of an amulet of quasielemental command can be in use at any given time.
4 Additional powers
The amulet gives the character the following abilities from the four elemental planes.
* Positive  
** Lightning
*** Shocking grasp (once per turn)
*** Lightning bolt (four times a week)
** Mineral
*** Transmute metal to wood (once a day)
*** Wall of stone (once a day)
** Radiance
*** Rainbow pattern (once an hour)
*** Sunray (twice a week)
** Steam
*** Melt (once per turn)
*** Fog cloud (twice a day)
* Negative
** Ash
*** Pass without trace (once an hour)
*** Detect invisibility (once an hour)
** Dust
*** Dust devil (once a day)
*** Transmute water to dust (once a day)
** Salt
*** Irritation (twice a day)
*** Preserve (twice a day)
** Vacuum
*** Unseen servant (once a day)
*** Negative plane protection (four times a week)
3 Concurrent Powers
If there is more than one Elemental Harness in the world, a piece from one Elemental Harness can not be used with a piece from another. They would destroy each other causing a rift to open to a random elemental plane.
Elementalist mages and priests and clerics of Elemental deities can not use any of these items.
4 Any two
When any two items are worn, the wearer can use all the powers of the two items.  If a power is repeated, such as a burning hands (once per turn), it would be once every five rounds. Additionally, the items will grant the wearer the ability to polymorph into any elemental the two items represent.
# Elementals can't attack or even approach within 10 feet of the wearer. If the wearer desires, he may forego this protection and instead attempt to charm the elemental (saving throw applicable with a -3 penalty to the die). If the charm fails, total protection is not lost and one more attempt at charming can be made, but after that total protection is lost.  The secondary properties given below will then function with respect to the elemental.
# Creatures, other than normal elementals, from the elemental planes in respect to the pieces worn attack with -2 penalties to their attack rolls. The wearer takes damage at -2 on each die of damage and makes applicable saving throws from the creature's attacks at +3. All attacks are made by the wearer of the amulet with a +5 bonus to the attack roll (or -5 on the elemental creature's saving throw), and the wearer inflicts +7 damage (total, not per die) adjusted by any other applicable bonuses and penalties. Any weapon used by the amulet wearer can hit elementals or elemental creatures even if it is not magical.
# Two different powers of the items can be in used at any given time.
4 Any three
When any three items are worn, the effects of wearing two come into effect.  If a power is repeated, such as a burning hands (once per turn), it would be once every five rounds. Additionally, the wearer can survive on any plane that is represented by the three items by elemental adaptation.  When in a plane, the wearer can travel normally.
# Elementals can't attack or even approach within 15 feet of the wearer. If the wearer desires, he may forego this protection and instead attempt to charm the elemental (saving throw applicable with a -4 penalty to the die). If the charm fails, total protection is not lost and two more attempts at charming can be made, but after that total protection is lost.  The secondary properties given below will then function with respect to the elemental.
# Creatures, other than normal elementals, from the elemental planes in respect to the pieces worn attack with -3 penalties to their attack rolls. The wearer takes damage at -3 on each die of damage and makes applicable saving throws from the creature's attacks at +4. All attacks are made by the wearer of the amulet with a +6 bonus to the attack roll (or -6 on the elemental creature's saving throw), and the wearer inflicts +8 damage (total, not per die) adjusted by any other applicable bonuses and penalties. Any weapon used by the amulet wearer can hit elementals or elemental creatures even if it is not magical.
# Three different powers of the items can be in used at any given time.
4 All four
When all four items are worn, the full power of the Harness of Elemental Command is revealed.  The effects of wearing three come into effect.  If a power is repeated, such as a burning hands (once per turn), it would be once every five rounds. Additionally, the Harness allows the wearer to planeshift at will without having to first travel through the Ethereal plane.  When in a plane, the Harness will create a 10' sphere around the wearer that will allow any traveling with the wearer to benefit from its protection and will be able to travel normally through the planes.
# Elementals can't attack or even approach within 20 feet of the wearer. If the wearer desires, he may forego this protection and instead attempt to charm the elemental (saving throw applicable with a -5 penalty to the die). If the charm fails, total protection is not lost and three more attempts at charming can be made, but after that total protection is lost.  The secondary properties given below will then function with respect to the elemental.
# Creatures, other than normal elementals, attack with -4 penalties to their attack rolls. The wearer takes damage at -4 on each die of damage and makes applicable saving throws from the creature's attacks at +5. All attacks are made by the wearer of the amulet with a +7 bonus to the attack roll (or -7 on the elemental creature's saving throw), and the wearer inflicts +10 damage (total, not per die) adjusted by any other applicable bonuses and penalties. Any weapon used by the amulet wearer can hit elementals or elemental creatures even if it is not magical.
# Four different powers of the items can be in used at any given time.
2 Eyes of the "Unsun"
by Johnny Brant
These very fine and superiorly thin onyx lenses fit perfectly over the irises and pupils of any being with humanoid eyes. These lenses grant the wearer immunity to any and all light based penalties. Commonly made by drow and other spellcasting Underdark races for travel to the lands above!
2 Gem of Darkness
by Johnny Brant
XP Value: 300 GP Value: 1,500
This magical gem allows its bearer to cast Darkness 15' Radius up to 5 times a day.
2 Leg Band of the Elements
by Johnny Brant
XP Value: 23,000 GP Value: 115,000
This magical leg band has 4 separate pouches each attuned to a particular elemental plane (Air, Earth, Fire and Water). In each of these pouches can be stored anything that can survive in that particular elemental plane. Each pouch can contain up to 10 pounds worth of substances, much like that of a Bag of Holding (although it has no problem going into a Portable Hole and the like, nothing bad happens should this occur); and a maximum amount of each of the four elements can also be withdrawn from the pouch of each particular element in any 1 turn period.
Thus items of food could even be cooked by placing them in the pouch of elemental Fire, while cool pure water could be gathered from the sides of the pouch of elemental Water as it cascades down the sides as miniature waterfalls. Clean, fresh air is always nearby with the pouch of elemental Air open, and perfectly good soil can be scraped away from the inside of the pouch of elemental Earth.
Furthermore, like a blending of each of the four types of Rings of Elemental Command, this item bears all of the abilities of each of the four Rings of Elemental Command, except that it only has the following usable abilities of the four elements for the wearer to use (only three spell-like powers from each ring):
Only one power from each of the four elements of the Leg Band of The Elements can be in use at any given time. (Thus a wearer can simultaneously be using a power from Air, Earth, Fire and Water, but never two of the same elemental type.) In addition to the powers described above, the Leg Band gives characters the following abilities:
* Air
** Fly
** Gust of Wind (once per round)
** Wall of Force (once per day)
* Earth
** Feather Fall
** Passwall (twice per day)
** Wall of Stone (once per day)
* Fire
** Fire Resistance (as a Ring of Fire Resistance)
** Flame Strike (twice per day)
** Wall of Fire (once per day)
* Water
** Create Water (once per day)
** Wall of Ice (once per day)
** Water Breathing (5' radius)
2 Neck Chain of Attractiveness
by Johnny Brant
XP Value: 4,000 GP Value: 20,000
This magical neck chain raises the wearer's Charisma to 25 at a rate of 1 point per week. After every full year of wearing the Neck Chain, 1 point gained becomes a permanent and lasting gain of Charisma!
2 Scarabs of Planar Travel
A scarab allows the wearer to travel to a single outer plane through the Astral Plane and to take up to five other beings on this journey. There is no weight limit. A scarab brings the traveler and any companions physically into the Astral Plane and then moves them into the associated plane. It will also take them back to the home plane. During either trip the wearer can command the scarab to stop the trip in the Astral Plane. A scarab gives the wearer the additional ability to be invisible to all of the denizens of the associated plane. The only beings on those planes that can see the traveler are the powers, even demi-powers. The companions are not offered the same protection. A scarab attaches itself to the wearer's skin on the back of the neck. Each scarab is made from the purest platinum set with a flawless jewel.
*| three
* Abyss (Rose Quartz)
* Acheron (Fire Opal)
* Arborea (Sapphire)
* Arcadia (Hessonite)
* Baator (Ruby)
* Bytopia (Amber)
* Carceri (Bloodstone)
* Elysium (Opal)
* Gehenna (Dravite)
* Limbo (Jet)
* Mechanus (Carnelian)
* Mount Celestia (Gold)
* Pandemonium (Rubellite)
* The Beastlands (Emerald)
* The Gray Waste (Adveturine Quartz)
* The Outlands (Citrine)
* Ysgard (Ziosite)
2 Spectacles of Revo
by ^Gabriel Elias^
The Spectacles have a good quality metal frame, a mysterious material for the lenses, and the word Revo is embossed on the frame. The lenses are mirror-like and reflective. The spectacles allow the wearer to look directly into the gaze of a medusa and reflect it back.  If the wearer is struck in the head, the spectacles can take 10 hit points and then are broken making them useless. They also give the wearer a +1 to all intelligence rolls (when worn) when looking for or at something in the sunlight. There is a 5% chance per level of the wearer that they will reflect other gaze attacks.
2 Drianna's Star of Chromatic Dragon Breath Protection
The Star grants full protection from the breaths of white, black, green, blue, and red dragons. On a failed saving throw, the wearer takes only ¼ damage from the dragon's breath weapon. On the back is the sigil of Drianna, a weeping willow with 18 weeping branches. There is only one in existence and is currently being worn by Drianna herself. The only way to remove the Star is for the wearer to be dead. When the Star is first attached to the new wearer, the wearer will take 5 hit points of damage if the wearer is of the same alignment of the former. The Star will do 10 points of damage if the new wearer's alignment is one step away from the former. The Star will do 20 points of damage if the new wearer's alignment is two steps away from the former. If the new wearer's alignment is three steps away from the former wearer, it will do 50 points of damage. There is no saving throw allowed for this damage. The Star must be worn attached to the wearer's skin for it to work. It will embed itself into the wearer until the wearer's death.
