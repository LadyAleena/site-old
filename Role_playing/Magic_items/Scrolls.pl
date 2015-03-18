#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);
use Base::LineMagic qw($line_magic);

html( 'heading' => 'Magical scrolls', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
B<^Robert Anderson^> contributed nearly all of the scrolls listed on this page. Those not created by him have their credit listed by the item.
2 Jordon's Memory Map
by Johnny Brant
This magical map draws maps seen by its owner by producing its own ink, which runs across the map as if someone were sketching the map by hand drawing the area exactly as its owner sees it. If the owner cannot find a secret door, the door does not appear on the map. (If the owner later finds a secret door, the map will draw it in.) The map also stores the maps it's drawn for later use.
The map automatically redraws any changes, and the map shown can be enlarged or reduced in size to see a larger radius or fine detail by silent act of will. The map must be in contact with the owner's flesh to function and takes a full year to attune itself to a new user.
2 Scroll of Adaptation
This scroll protects the reader from all environmental effects including damage and restrictions caused by the environment. It will allow the reader to survive in a vacuum, the heart of a star, the elemental plane of fire, or underwater, etc. The reader can act and speak freely in such conditions. The scroll's effects last for 1d3+1 days but do not protect the reader from the environment's denizens. Any class can use this scroll.
2 Scroll of Armoring
Reading this scroll causes a shimmering and sparkling gray light to form around the reader. The light gives the reader a +8 bonus to Armor Class for 3d4 +2 turns.
2 Scroll of Disasters
Reading this scroll causes a random disaster to strike a 5-mile radius centered on the reader. Roll 1d10 to find the effect of the scroll and consult the chart below.
# The area is flooded with 10' of water. It rains for 10 consecutive days, accumulating 1' of water per day. In sloped areas the rain can also cause mudslides, avalanches, or flash floods.
# An earthquake (as 7th level priest spell) strikes the area. The earthquake has double the effects of the spell. The earthquake can also cause collateral effects in certain areas.
# Multiple tornadoes roll through the area. The tornadoes cause 30 points of structural damage to all buildings in the area as well as doing 10d6 damage to all unprotected creatures (from being hit by debris, being picked up, etc.). Underground creatures take no damage.
# A plague strikes all living creatures in the area. The plague is fatal to all creatures within 1d4 +1 weeks unless cured. The plague is highly contagious and any creature entering the area contracts the plague also.
# A plague of locusts appears and destroys all plant life in the area within 2d6 days. The locusts do not harm non-plant creatures and die when all the plant life is gone.
# A drought strikes the area lasting for 1d6 months. All standing water evaporates in 1 week, and all rivers drop 2d4 in water level at the same time. No clouds will form in the area, and any weather summoning will automatically fail. All plants will die within 1d4 weeks and all animal life will die within 2 weeks after the plants. No water or cold-based spells will function in the area.
# The area turns into a huge swamp. It takes 1d4 weeks for the swamp to form, but all structures will collapse within 1 week. In the mountains the swamp will form in 2d6 weeks due to the time it takes for the rock to erode into a plateau.
# A volcano forms in the area. The volcano takes 1d6 weeks to form in flat terrain but only 1 week in the hills or mountains. Once formed the volcano will erupt killing all living things in the area and destroying all structures.
# A meteor shower pummels the area, causing 40 points of structural damage to all buildings and 20d6 damage to all living things. After the meteor shower, there is a 60% chance of the area catching fire for 1d6 days.
# A Nature Elemental appears and "renovates" the area. The elemental destroys all man-made structures and items and all non-animal life forms within 24 hours.
The reader of this scroll is immune its effects for 1d4 hours (time to leave). Using this scroll is considered an evil act and can cause problems with the local authorities.
2 Scroll of Entrapment
Reading this scroll and pointing at a creature causes the scroll to flash and crumble to dust. The creature pointed at must save vs. spells at -4 or become trapped in a pocket dimension permanently unless freed by the reader or another using a Wish or Freedom spell. If the reader, upon freeing the target, may demand 1 service from the trapped creature. The creature must comply unless the service is obviously self-destructive or against the creature's alignment or beliefs (i.e. a paladin told to slay innocent children). In that case the creature gets a save vs. spells at +4 to avoid the service. Once the service is done, the target may act however it sees fit.
2 Scroll of Equipment
This scroll contains the drawings of 2d4 +2 pieces of normal equipment (i.e. 50' rope, lantern, tent, etc.). If one of the drawings is touched or grasped at, it appears on the ground in front of the reader. The item is permanent unless touched to the scroll, thereby causing it to re-appear on the scroll as a drawing. When all the items are taken off, the scroll crumbles to dust.
2 Scroll of Globes
Reading this scroll creates 3d6 glowing, pulsing golden globes which whirl about the reader. Each globe can absorb 1 melee or missile attack or 1 individually targeted spell. Each globe can also absorb 1 die of damage from an area of effect attack (i.e. Fireball spell, dragon's breath, etc). Example: a 5d6 Fireball destroys 5 globes, but leaves the scroll reader unharmed. If the area of effect attack does more dice of damage than the user has globes, the user takes the excess damage. Example: a reader has 3 globes and is hit with a 5d6 Fireball, the 3 globes vanish and the user takes 2d6 damage. Any attack or damage absorbed by the globe causes it to vanish. The globes last for 4d4 turns until the user wills them away, they are destroyed, or they are dispelled.
2 Scroll of Healing
Reading this scroll restores half of the readers maximum hit points. Example: Krag the Bold has 84 hit points at full health. He currently has 13 hit points. He reads the scroll and gets back 42 (84/2) hit points. This scroll cannot give back more than the reader's maximum hit points.
2 Scroll of Identification
This scroll appears as a blank durable scroll and contains a powerful magical ability. If the user places a magic item on the scroll, the name of the item, any command words, the functions, and charges (if any) appear on it. The scroll can identify 2d12 items before turning to dust. The scroll cannot identify Artifacts or magical tomes. Cursed items are identified as similar useful items.
2 Scroll of Languages
This scroll is inscribed with the name of a language (gnome, giant, black dragon, etc.) and some other symbols. When the name of the language is read aloud, the symbols on the scroll flash, and the scroll turns to dust. The reader then permanently gains the ability to speak the language that was written on the scroll. If the reader can already speak the language on the scroll, then the reader instead gains the ability to read and write that language. If the reader can already read, write, and speak the language, then the scroll's magic is wasted.
2 Scroll of Proficiencies
This scroll is inscribed with the name of a proficiency (weapon or non-weapon) and some other symbols. When the name of the proficiency is read aloud, the symbols flash, and the scroll turns to dust. The reader then gains the proficiency written on the scroll. If the reader already has the proficiency add +2 to the proficiency's checks (for NWPs) or specialization in the weapon (for WPs). If the reader is already specialized, then the scroll has no effect and is wasted. Non-warriors gain expertise instead of specialization.
2 Scroll of Protection from Psionics and Mental Attacks
Reading this scroll grants the reader complete immunity to all psionics and mental attacks (charm, illusions, feeblemind, mind reading, etc.) for 1d10 +5 turns. All classes can use this scroll.
2 Scroll of Psionic Power
This scroll is inscribed with the name of a psionic power and some strange symbols. When the name of the psionic power is read aloud, the symbols flash and the scroll turns to dust. The reader gains the power and enough PSPs to use it 3 times in addition to 30 extra PSPs. Thereafter, the reader functions as if he has a wild psionic talent. A psionicist or a creature with a wild psionic talent who reads the scroll gains the power plus enough PSPs to use it 3 times. If the reader is a psionicist or wild talent already possessing the power, +2  is added to power checks for that power plus 30 PSPs.
2 Scroll of Rust Monster Summoning
by ^Gabriel Elias^
When this scroll is read a Rust Monster will appear. The Rust Monster that is summoned is equal to the reader's level in years, i.e. a 5 year old Rust monster appears if the reader is a 5th level wizard. Also once finished with its task (if it survives), the Rust Monster acts as a trained pet responding to simple one word commands. Other commands depend on a roll for Animal Training (and the DM's approval), if the reader has Animal Training as a Proficiency the character gets a +4 to his roll. A -4 is applied to any roll when the Rust Monster is commanded to "stay" around metal, -7 without the Animal Training proficiency.
2 Scroll of Speed
Reading this scroll doubles the reader's speed for 2d4+1 turns. All the benefits of increased speed are gained (multiple attacks, faster movement, etc.) in addition to a -2 initiative bonus, a +2 bonus to AC, a +4 to dexterity checks, and saving throws vs. individually targeted spells, breath weapons, and wands. The reader ages 1 year and cannot cast spells at a faster rate.
2 Scroll of Spell Catching
This blank scroll contains powerful magic. This scroll can absorb any spell cast at the scroll holder. To absorb the spell, the scroll must be held in the holder's hands during the same round that a spell is targetted at the holder. If the scroll holder wins initiative, the spell is absorbed into the scroll. Once a spell is absorbed, it appears on the scroll and can be cast off the scroll at the same level at which it was originally cast. This scroll can catch up to 1d6 +1 spells before it cannot catch any more. Only a spellcaster of the appropriate class can cast the spells off the scroll. If the holder tries to catch more spells than the scroll can hold, then the scroll turns to dust and any spells currently on the scroll affect the holder. When the last spell is cast off of the scroll, the scroll also turns to dust. Any class can use the scroll to absorb spells.
2 Scroll of Storage
This scroll is designed to carry an unlimited amount of objects indefinitely. If an object is touched to the scroll, it appears as a drawing on the scroll with a brief description of the object underneath it. To retrieve an item from the scroll, the user must touch the item and speak the scroll's command word. This scroll is about as durable as a normal scroll, except it gains a +4 bonus to any saving throws it has to make. If the scroll is destroyed, all objects on the scroll are destroyed too. The scroll is attached to 2 rollers and grows in size as more items are added to it. Any class can use this.
2 Scroll of Summoning
This scroll contains the name of a creature from the lower planes, a diagram of a summoning triangle, and a complex summoning ritual. If the triangle is drawn, and the ritual followed, the scroll user can summon the creature whose name is written on the scroll. The user must make an intelligence check to check and see if any mistakes were made during the ritual. If any mistakes were made, the creature is summoned, but is uncontrolled. If the check is made, the summoned creature is forced to do either 3 tasks for the scroll user, or serve as a bodyguard and advisor for the scroll user for up to 1 year. The 3 tasks must be completed within 1 month, or the creature is freed. The creature will always attempt to twist its orders to cause harm to the summoner. Any class can use this scroll.
2 Scroll of Thievery
This scroll is inscribed with the name of a thief skill and some symbols. When the name of the skill is read aloud, the symbols flash and the scroll turns to dust. If the reader is a thief, bard, or ranger, a +25% bonus is added to the skill if possessed already. For anyone else, or for a bard or ranger who does not possess the skill, the skill is gained, but the reader functions as a thief of 2 levels lower (level 1 minimum) and uses the percentage listed on the average thieving skills table in the DMG.
2 Spell Scrolls
* General
** STRONG<Scroll of Color:> Color, Color Spray, Rainbow Pattern
** STRONG<Scroll of Illusion:> Detect Illusion, Illusionary Spript, Protection from Illusions, Dispel Illusions, Illusionary Wall, Advanced Illusion, Protection from Illusions, 10' Radius, Permanent Illusion, Programmed Illusion
** STRONG<Scroll of Invisibility:> Detect Invisibility, Invisibility, Invisbility, 10' Radius, Improved Invisibility, Mass Invisibility
** STRONG<Scroll of the Magic Item:> Identify, Enchant an Item, Permanency
** STRONG<Scroll of Prismatics:> Magic Missile, Continual Light, Dispel Magic, Cone of Cold, Gust of Wind, Passwall, Disintegrate, Prismatic Spray, Prismatic Wall, Prismatic Sphere
* Path Scrolls
** STRONG<Counselor’s Path:> Hypnotism, Suggestion, Domination, Mass Suggestion
** STRONG<Misty Road:> Wall of Fog, Fog Cloud, Stinking Cloud, Hold Vapor, Solid Fog, Cloudkill, Mind Fog, Death Fog, Incendiary Cloud
** STRONG<Path of Terror:> Spook, Scare, Fear, Phantasmal Killer, Weird
