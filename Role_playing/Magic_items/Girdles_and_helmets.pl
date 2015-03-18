#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);
use Base::LineMagic qw($line_magic);

html( 'heading' => 'Magical girdles and helmets', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
2 Circlet of Memory
by Dan Grieg
This is a very fine Circlet that is made out of two strands of platinum and one of gold braided together and an onyx stone centered in the front. This item can record up to one hour of information. It has to be mentally activated and stopped. The circlet can be used over and over again, but old material is erased. The wearer can choose which parts are erased and can then review what has been recorded at anytime.
The Circlet may already have something recorded on it when found.
2 Circlet of Knowledge
These Circlets give the wearer sage knowledge of one area of study. It could be astrology, a language, gem lore, or even how to build something, though nothing magical. The knowledge is permanently gained, and the Circlets only activate once per month. The knowledge transfer can be intense, so the wearer must make a saving throw vs. petrifaction, and then an intelligence check, or go mad for a day. If madness occurs the knowledge is not gained. Another attempt to gain the knowledge from the circlet may be made no sooner than one month after the last failed attempt. Each Circlet confers only one type of information. For example, one Circlet cannot confer the knowledge of both the Elven language and agriculture; it is one or the other.
2 El Sombrero de Siesta Grande
by Nathan Brown
This is a hat with a very wide brim which will cause anyone to sleep deeply and without chance of awakening. The effect occurs if the hat is on the head or draped over the face. It takes one round for the hat to take effect. While under the recipient receives a full night's rest in half that time and regains 1d6 HP per 'night'.
2 Girdle of Giant Strength, revised
|| rolls
|* d100|Giant|XP value|GP value|Str.
|+ 1-20|ogre|1500|15000|18(00)
|+ 21-35|hill|2000|20000|19
|+ 36-50|stone|2500|25000|20
|+ 51-65|frost|3000|30000|21
|+ 66-75|fire|3500|35000|22
|+ 76-85|cloud|4000|40000|23
|+ 86-95|storm|4500|45000|24
|+ 95-100|titan|5000|50000|25
These girdles are exactly the same as those in the I<Dungeon Masters Guide> for Advanced Dungeons and Dragons 2nd edition. Ogres and titans have been added with their respective experience point and gold piece values added. You can further limit their powers by reading the description for the Girdle of Titan Strength below.
2 Girdle of Titan Strength
by Johnny Brant
XP Value: 4,750 GP Value: 47,500
This massive belt covers the entire waist and upper abdominal area of the wearer and is imbued with very potent magic. When worn it gives the wearer the physical prowess of a titan. (It doesn’t cause growth to the size of a titan however!) It functions exactly as a Girdle of Giant Strength but imbues the wearer with a strength equivalent to that of a titan. Thus, the wearer’s strength is raised to 25! The strength bonuses are not cumulative with normal or magical strength bonuses, not even in combination with Gauntlets of Ogre Power, A<Gauntlets of Giant Power|href="Boots_and_gloves.pl#Gauntlets_of_Giant_Power">, and magical warhammers (unlike the Girdles of Giant Strength).
2 Girdle of Weapon Protection
|| rolls
|* d6|Weapon
|+ 1|blunt weapons
|+ 2|edged weapons
|+ 3|missile weapons
|+ 4|tight group of weapons
|+ 5|broad group of weapons
|+ 6|all weapons
The Girdles give complete immunity from a type of weapon, roll weapons immunity from the chart. 5% of these girdles protect against magical weapons of the rolled type.
2 Hat of Sound Sleeping
by Dan Grieg
This droopy looking hat will instantly put to sleep up to four people upon command and give them a full nights rest in one hour allowing healing, spell memorization, and other things that happen with rest. Everyone effected by the hat is asleep for exactly one hour, unless they die, then they are dead. Nothing will wake them up, except dispel magic. Remove curse will not work. The hat is activated by one person but everyone to be affected by it must be touching the brim of the hat. If the recipient is unwilling they get a save versus spell. The one activating it has to go to sleep also.
2 Headband of Action
This headband, when worn by a Diviner, will give a Diviner an AC of -2. It gives the Diviner the ability to sense when and where his opponent will strike next. If the Diviner concentrates, it will give the Diviner Clairaudience and Clairvoyance. The headband gives the Diviner line of sight ESP. If a non-Diviner is wearing this headband, he will gain an AC of 2. A Conjurer will not be able to cast spells wearing this headband.
See ^magic items of the specialist^ for more about this headband.
2 Draven's Stone Helm
by Johnny Brant
XP Value: 6,000 GP Value: 30,000
This distinctly elven helmet is made of stone from the elemental plane of Earth. It is an earthy-looking elven helmet +4 that gives its wearer the powers of a Ring of Vampiric Regeneration which can be turned off at will by the wearer.
2 Rolt's Mask of Shame
by Johnny Brant
This everbright quicksilver mask was created to help Rolt of Helimbrash avenge his ruined city. It was created from the bones of his fallen followers and a mass of controlled living steel.
This mask of protection +3 magically repairs itself (as the spells Mending in conjunction with Permanency) if damaged in any way and grants its wear the following special abilities at will, unless otherwise noted:
* Filter (constant)
* Free action (3/day)
* Infravision (When seeing into the infrared spectrum, the wearer's eyes burn with a blood-red malevolence)
* Instant regeneration (1/week; whatever limb or organ regenerated appears as a writhing black mass of flesh, with bone-white necromantic glyphs shimmering across its surface)
* Trollish fortitude (1/day; while regenerating in this way, the mask wearer totally and utterly covered in strange silvery-black, necromantic tattoos)
* True seeing (2/day)
All of the above abilities function as if cast by a 26th-level wizard. Furthermore, none of the skin or eye coloration is noticed by Rolt as he is a barbarian and would literally "freak out!"
