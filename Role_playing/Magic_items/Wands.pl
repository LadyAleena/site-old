#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magical wands', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
Wands without a credit were created by me.
2 Wand of Absorption
by B<^Robert Anderson^>
This wand appears to be a wand of fire, wand of cold, wand of lightning, or wand of wonder (DM's choice). The wands true function, however, is to absorb magic spells and dwenomers. If used to absorb a spell being cast, the wand user must use the wand in the same combat segment that the spell is being cast. To absorb a spell being cast, the wand wielder must make an attack roll against AC: 5 (No Dex bonuses for missile attack) to absorb the spell. The spell caster or wielder must make a save vs. spells at a -4 penalty or lose the spell or effect. The target dwenomer must be within 60' of the wand wielder. To absorb a dwenomer or a spell effect the wand wielder must make a dispelling check (as a 20th level mage) as per Dispel Magic spell. If the check succeeds, the dwenomer is absorbed (and destroyed) by the wand. Only true dwenomers and artifacts are immune to the wand's power. Any spell or dwenomer absorbed by the wand only gives the wand 1 charge, no matter how powerful the effect absorbed. The wand has an absorption potential of 1d4 x 100 charges, but a maximum of 10d8 storable charges. Any charges in the wand can be used to power the wands other ability (fire, cold, lightning, or wonder). There must be at least 1 charge left in the wand to absorb magic, and if all charges in the wand are expended, the wand crumbles to dust. If more charges are absorbed than the maximum storable charges, then the wand explodes doing 1d8 damage per stored charge in a 30' radius (save vs. wands for ½ damage). If the absorption potential is reached, the wand will stop absorbing magic, but can still be used as a normal wand of the secondary type, until it runs out of charges. Note: all permanent items (swords, armor, rings, etc.) resist dispelling as 20th level of power. Only a spell caster who can cast True Dwenomers can create this wand.
2 Wand of Battle
by B<^Robert Anderson^>
This wand is a powerful weapon for any wizard in combat situations. The wand is usually made of metal and is always topped with an edged diamond. The wand can be used as a melee weapon doing 1d6 vs. S/M creatures, and 1d8 vs. L creatures, in addition to its plus. The wielder must be proficient in dagger to use it as a melee weapon. The wand is enchanted from + 1 to + 5, and its powers are dependant on its combat bonus. All wand powers function as if cast by a 14th level wizard. The abilities are as follows:
*| charges
* ^One charge^ (+1)  Magic Missile (5 missiles), Armor, Burning Hands
* ^Two charges^ (+2) Stinking Cloud, Web, Invisibility, Flaming Sphere
* ^Three charges^ (+3) Lightning Bolt, Fireball, Haste, Dispel Magic (15th level), Fly
* ^Four charges^ (+4) Fear, Enervation, Ice Storm, Stoneskin, Fire/Chill Shield, Polymorph Other
* ^Five charges^ (+5) Teleport, Summon Shadow, Monster Summoning III, Chaos, Hold Monster, Cone of Cold, Cloudkill
All Wands of Battle have the following abilities in addition to the powers listed above:
* 10% Magic Resistance when wielded
* cause double damage on a successful hit for one charge
* acts as a ring of Vampiric Regeneration.
Only Wizards can use this wand. The wand typically has 100 + 2d12 charges and can be recharged by a wizard of 20th level or above.
2 Wand of Blasting
by B<^Robert Anderson^>
This powerful wand has the ability to smash targets with an explosive blast of force. If the wand is pointed at a target, and the command word is spoken, a small burst of energy streaks towards the target hitting it unless it makes a save vs. wands. If the energy burst hits, the target suffers 4d6 damage and must save vs. petrification or be knocked backward 10' for every 2 points of damage taken. If this wand is employed against an object, it must save vs. disintegration or be utterly destroyed. The blast can destroy 10 cubic feet of matter for every 5 points of damage that it does. This wand can be used by any class and can be recharged.
2 Wand of Disintegrating
by B<^Robert Anderson^>
This wand of blackened ironwood is usually capped with a black opal or similar valuable dark gemstone. When the command word is spoken, and the wand is pointed at a target, the wand's tip is enveloped in a crackling halo of purplish-black energy. A high pitched whine accompanies the energy. The wand tip flashes brightly and then...
...the wand disintegrates.
This wand typically has 80 + 2d20 charges (Who knows why?) and can only be used by mages. It idenifies as a Wand of Disintegration or similarly destructive wand.
2 Elemental Wands
by B<^Robert Anderson^>
Any spellcaster can use these wands, and they can be recharged.
3 Wand of Air
This wand has powers based on Elemental Air. It has the following powers:
*| charges
* ^One charge^ Feather Fall, Stinking Cloud, Levitate, and Wall of Fog.
* ^Two charges^ Wind Wall, Fly, and Wind Servant.
* ^Three charges^ Whirlwind and Cloudkill.
3 Wand of Earth
This wand has powers based on Elemental Earth. It has the following powers:
*| charges
* ^One charge^ Fool's Gold, Fist of Stone, Strength of Stone, and Soften Earth and Stone.
* ^Two charges^ Maximilian's Stony Grasp, Meld into Stone, and Stoneshape.
* ^Three charges^ Transmute Rock to Mud / Mud to Rock, and Wall of Stone.
3 Wand of Water
This wand has powers based on Elemental Water. It has the following powers:
*| charges
* ^One charge^ Create/Destroy Water, Insatiable Thirst, Watery Fist, and Metamorphose Liquids.
* ^Two charges^ Water Breathing, Water Walk, Lower/Raise Water, and Watery Double.
* ^Three charges^ Cone of Cold and Produce Ice.
2 Wand of Incineration
This wand can function like the following wizard spells:
* STRONG<Incendiary Entrapment:> The wand emits a short burst of vapor, which sinks in to the floor, an area of 10 feet by 10 feet. When a creature steps on that area, all the combustible materials that it is carrying or wearing ignite, and the creature take 14d4 points of damage.
* STRONG<Incendiary Cloud:> The wand emits a conical cloud that is 10 feet long, and 20 feet at the end of the cone. It causes 6d2 points of damage the 3rd round after it is invoked, and on the forth round does 6d4 points of damage. The wand expends one charge after the first three rounds, an additional charge on the fourth round, and one final charge the fifth round.
2 Wand of Purifying (Priest)
by Johnny Brant
XP Value: 200 GP Value: 1,000
This wand allows a priest to use Purify Food or Drink for one charge, and both if 2 charges are used. This wand's functions are cast at the 12th-level of ability and you must be at least 12th-level to make one.
2 Wand of Radiance
This wand can function like the following wizard spells:
*| charges
* ^One charge^ B<Nystul's Radiant Baton> - The wand will glow a color of the rainbow, and depending on the color chosen, the wand will have the type of damage listed below. The wand will do 2d4+6 points of damage. There is no saving throw.
* ^Two charges^ B<Nystul's Radiant Arch> - The wand will create an arch between its tip and the other hand of the wielder. The arch can fire one ray of light, 1 foot wide, and 10 feet long, towards the target. The ray will be one of the colors of the rainbow and do 7d6 points of damage, save for half damage.
* ^Two charges^ B<Otiluke's Radiant Screen> - The wand will create a screen, and any creature who tries to pass through the screen will take 14 points of damage, 21 points of damage to creatures adversely affected by the screen effect. There is no saving throw.
|| centered
|* Color|Effect|Other
|+ Red|Cold Energy|+1 damage to fire-based creatures, no damage to cold-based creatures
|+ Orange|Heat Energy|+1 damage to cold-based creatures, no damage to fire-based creatures
|+ Yellow|Acid Damage|save vs. spell to take no damage.
|+ Green|Neutralize Poison|as 4th-level priest spell.
|+ Blue|Electrical Energy|+10 damage to metal armored enemy.
|+ Indigo|Undead Specific|only undead are harmed.
|+ Violet|Vegetation Specific|only plant-life, including fungi and molds are harmed.
2 Wand of Spike Mines
by B<^Robert Anderson^>
This wand creates floating explosive balls called spike mines. The mines look like 1' diameter steel balls with 1" spikes covering their surfaces. When created, a spike mine floats in one place and gives off a quiet humming sound. If anything larger than a big rat approaches within 5' of the mine, the mine explodes. Exploding mines do 4d6 damage to anything within 10' and all creatures within 40' are struck by the spikes taking 2d10 damage. A save vs. breath weapon halves the spike damage, while a save vs. wands halves the explosion damage. The wand has 40 + 1d10 charges and cannot be recharged. Any class can use the Wand of Spike Mines.
