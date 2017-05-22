#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA); });

__DATA__
Chaos Wardens are of no race nor class once chosen to be one. They disguise themselves as humans and act as if they are a class, mostly fighters. The whole person is not subsumed, but the host resides in the back of the mind of the agent who has taken control. The person can take limited control when necessary.
Chaos Wardens do not reveal themselves to anyone. Most people do not know there is a war being fought. They do not work together unless the region is filled with chaos creatures or events. It is dangerous for more than one Chaos Warden to be in the same area because it would draw even more Chaos creatures to it. Chaos creatures have a chance to sense Chaos Wardens, as Chaos Wardens can sense chaos creatures.
Chaos creatures that Chaos Wardens fight come from A<outside|href="../Locations/The_True_Void.pl"> the known universe. They do not belong to any of the known chaotic planes. They are above and beyond the known places being totally alien. The forces of Law inhabit the bodies of creatures within, as do the agents of Chaos. The philosophies of Law and Chaos inside the known universe are not the same as those outside. Anyone can become an agent of Chaos as anyone can become an agent of Law. Each tends to drift to those of similar outlook in life. Only in rare circumstances do they take one that is drastically different. Even gods could be used, but only in dire circumstances.
2 Requirements
All ability scores must be 16 or above. If any score drops below 16, the Chaos Warden is destroyed. All Chaos Wardens are human in form and of lawful alignment be it good, neutral, or evil. The first three weapon proficiency slots allotted must go to a broad group of weapons.
2 Abilities
A Chaos Warden can:
* use any non-weapon proficiency table and weapons, gains Mastery as a Warrior.
* sense varying degrees of chaos, 100% plus or minus 10% for the difference in level or hit dice.
* turn chaotic creatures as a Cleric or Priest can turn undead
* alter reality around him or her in a Reality Bubble. For levels one through six, the area of reality the chaos warden can manipulate is levelSUP<2> inches. Add six inches for levels seven through twelve. Add three inches for each level after. One Chaos Warden's Reality Bubble cannot come into contact with another Chaos Warden's Reality Bubble.
* cast Compulsive Order, as many times a week as the Chaos Warden has levels.
* polymorph into another form at 3rd level, and another form each additional three levels.
* at 10th level, imposes a penalty to saving throws depending on how many levels above 9th he or she is.
* when unconscious, chaos points will automatically start the healing process. If the Chaos Warden does not have enough chaos points to reach 1 hit point, the Chaos Warden will stay unconscious until non-magical methods of healing are used on the Chaos Warden.
* weave chaos energy into healing, abilities, proficiencies, psionics, or spells. It takes one round for each chaos point use to gain the ability.
** STRONG<Healing:> 1 chaos point per hit point
** STRONG<Abilities:> 1,000 chaos points per 1 point increased
** STRONG< Sub-abilities:> 100 chaos points per sub-ability increased
** STRONG<Proficiencies:> 10 chaos points per slot (weapon proficiencies and non-weapon proficiencies)
** STRONG<Thief Sills:> 1 chaos point per percentage point
** STRONG<Psionics:>
*** 10 chaos points per Devotion
*** 20 chaos points per Science
*** 2 chaos points per PSP
** STRONG<Spells:> 10 chaos points × Spell levelSUP<2>
** STRONG<Racial Abilities:> 100 chaos points per ability
3 Gaining chaos points
A Chaos Warden gains Chaos Points by draining chaos creatures. One chaos point is one hit dice or level. He or she must be in physical contact with the chaos creature to drain, which requires a successful attack roll. A Chaos Warden must keep in tactile contact with the chaos creature to drain more chaos points, which requires a strength check. 
If a chaos creature has fewer hit dice or levels than the host, the host will survive the draining. If the chaos creature has equal or more hit dice or levels than the host, the host is killed. If the host is killed, it can be resurrected without the chaos creature.
Chaos Wardens cannot store unlimited chaos points. They can store 10×level in chaos points plus ability score modifiers, see chart below. Add the modifiers for each ability score and at each level gained.
*| two
* STRONG<16:> 0
* STRONG<17:> +1
* STRONG<18:> +2
* STRONG<19:> +3
* STRONG<20:> +4
* STRONG<21:> +5
* STRONG<22:> +6
* STRONG<23:> +7
* STRONG<24:> +8
* STRONG<25:> +9
2 Restrictions
A Chaos Warden can not:
* use multiclass as a disguise.
* gain extra experience points for exceptional abilities.
* be magically reincarnated or resurrected.
2 Class chart
|* r2 Level|r2 Exp Req|Hit Dice|r2 THAC0|c2 Proficiences|r2 Att/Rd|c5 Saving Throws
|* 1d8|Weapon|Non-Weapon|PPD|RSW|PP|BW|Sp
|- 1|&nbsp;0|1|20|4|4|1|13|14|13|16|15
|- 2|2,250|2|20|4|4|1|13|14|13|16|15
|- 3|4,500|3|19|4|4|1|13|14|13|16|15
|- 4|9,000|4|19|4|8|1|13|14|13|16|15
|- 5|18,000|5|18|4|8|1|12|12|12|15|14
|- 6|36,000|6|18|8|8|1|12|12|12|15|14
|- 7|62,000|7|17|8|12|1|12|12|12|15|14
|- 8|107,500|8|17|8|12|1|12|12|12|15|14
|- 9|192,500|9|16|8|12|3/2|11|10|10|13|12
|- 10|375,000|10|16|8|16|3/2|11|10|10|13|12
|- 11|562,500|10+2|16|8|16|3/2|11|10|10|13|12
|- 12|875,000|10+4|15|12|16|3/2|11|10|10|13|12
|- 13|1,187,500|10+6|15|12|20|3/2|10|8|9|12|11
|- 14|1,500,000|10+8|14|12|20|3/2|10|8|9|12|11
|- 15|1,812,500|10+10|14|12|20|3/2|10|8|9|12|11
|- 16|2,125,000|10+12|13|12|24|3/2|10|8|9|12|11
|- 17|2,437,500|10+14|13|12|24|3/2|9|6|7|10|9
|- 18|2,750,000|10+16|12|16|24|2|9|6|7|10|9
|- 19|3,062,500|10+18|12|16|28|2|9|6|7|10|9
|- 20|3,375,000|10+20|11|16|28|2|9|6|7|10|9
