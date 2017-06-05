#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magical rings', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
Rings without a credit were created by me. B<A<Robert Anderson|href="mailto:ogre1971@hotmail.com?subject=Ring%20on%20Lady%20Aleena's%20site">> created most of the rest which will be marked with an asterisk (*).
2 Flight Ring
by Johnny Brant
XP Value: 800 GP Value: 1,300
This ring was created from bronze colored cyrstal that was rendered as hard as mithral. It allows the wearer to fly at will as the 3rd-level wizard spell. The ring has no limit to the times it can be used and allows the wearer to fly for an indefinite amount of time each use.
2 Ring Against Resistance
This ring helps spellcasters against creatures with magic resistance. It can Lower Resistance five times a day, Pierce Magic Resistance three times a day, or Pierce Any Shield once a day. This ring can be worn only by spellcasters.
2 Ring of Astral Travel *
This ring allows the wearer to transport himself and up to 4 other creatures into the Astral plane. The ring wearer can return at will, however, any other creatures taken along must be willed back by the ring wearer, otherwise they are trapped in the Astral plane. The ring wearer may visit other planes through color pools or other portals, but must be in the Astral plane in order to return to the Prime Material plane. The ring functions once per day and costs 1 charge per round trip. The ring typically has 2d6 charges and may be recharged.
2 Ring of Chaotic Magic *
This ring appears to all tests to be a Ring of Wizardry or Ring of Holiness (DMs option) and will function as such. However, whenever the ring wearer casts a spell, there is a 50% chance that the spell generates a Wild Surge (see Tome of Magic). Once the ring shows its true power, it can only be removed by a Remove Curse spell cast by a spellcaster of at least 15th level. Once uncursed, there is a 50% chance that the ring will become a normal Ring of Wizardry or Holiness. Otherwise, the ring will shatter.
2 Ring of Cowardice *
This ring appears to all tests to be a Ring of Strength and functions as such. When involved in combat however, the wearer must save vs. spells each round or flee in terror for 1d4 +2 rounds at the wearer's maximum movement rate. The ring can only be removed by a Remove Curse cast at 15th level or above.
2 Ring of Defending *
This ring generates a field of force around the wearer that protects against I<all> attacks for 1 round per charge. While the ring is functioning, the wearer is immune to all magical, physical, and psionic attacks and forces (falling, drowning, etc.). Attacks on the ring wearer are randomly redirected at different targets while the ring is functioning. This ring contains 1d6 + 8 charges and cannot be recharged.
2 Ring of Deflection *
This ring, when worn, protects the wearer from all non-magical projectiles smaller than a boulder. Magical missile weapons cause half damage to the ring wearer (round down). The ring has no effect on missiles created by spells (Flame Arrow, Magic Missile, Melf's Acid Arrow, etc.).
2 Ring of Draining *
This ring allows the wearer to drain energy levels from a target with a touch. The ring wearer must activate the ring and touch the target (attack roll required). If the ring wearer succeeds in touching the target, the target loses 1 hit die or level permanently. This ring contains 1d4 +2 charges and can be recharged. Using this ring is considered an evil act.
2 Ring of Dual Invisibility
This ring acts like a Ring of Invisibility, but while wearer is invisible so is every other intelligent creature, including friends, in the eyes of the wearer. This item can only be removed with a Remove Curse spell cast by at least a 7th level mage or a 5th level priest if the wearer can be found.
2 Ring of Earthquakes *
This ring allows the wearer to use some powerful abilities related to elemental earth. The powers and their usage are as follows: Strength of Stone (at will), Soften Earth and Stone (at will), Maxmilian's Earthen Grasp (at will), Fool's Gold (at will), Stoneskin (5 x day), Turn Pebble to Boulder (5 x day), Earthquake (1 x day), and Statue (1 x day). This ring contains no charges, but the wearer cannot use air-based spells or items. Earth Elementals will attempt to possess the ring attacking the wearer with preference.
2 Ring of Energy Drain Protection *
This ring protects the wearer from undead energy draining attacks and spells that drain energy levels. The ring has 3d6 charges, and each energy drain the wearer is protected from drains the ring of 1 charge per level that would have been drained (i.e. a wight drains 1 charge per hit, while a vampire drains 2 charges per hit). If the ring does not have sufficient charges to deflect all of the energy drains directed at the wearer, the ring absorbs them and then crumbles to dust. Then ring can be recharged by a priest of at least 18th level with access to the Necromatic sphere.
2 Ring of Ethereal Travel *
This ring allows the wearer to phase into the Ethereal plane at the cost of 1 charge. The ring wearer may stay in the Ethereal plane as long as he / she wishes and can return to the Prime Material plane at will. While in the Ethereal plane the user can see into the Prime Material plane, but what he / she sees is shadowy and indistinct. The ring wearer can be seen on the Prime Material plane as a shadowy outline, and can be attacked by magical weapons and spells. The ring wearer can also travel into the Deep Ethereal, where he / she cannot see the Prime Material plane, but cannot be seen from there either. The ring typically has 2d6 charges and can be recharged.
2 Ring of Fear
This ring wards off magical Fear, as the Fear Ward spell, and gives the wearer a Fear Aura. Five times a day, the wearer can use the Ring to cause Fear.
2 Ring of First Strike
This ring allows a spellcaster to have the first initiative in the beginning of each Turn if the spellcaster is casting a spell or using a magic item that emulates a spell effect.
2 Ring of Flight
by Johnny Brant
|| rolls
|* d10|Speed|Maneuverability
|+ 1|12|A
|+ 2-4|20|D
|+ 5-8|18|C
|+ 9-10|15|B
XP Value: 2,300 GP Value: 11,500
This ring allows the wearer to fly up to 8 hours a day. Unlike winged boots this flight need not be activated, the wearer simply jumps into the air and flies around. The wearer is only considered to be flying and using up his 8 hours a day if the character states he is flying, otherwise he is not. The movement rates of this magical flight vary from ring to ring; roll on the following chart below to find any particular rings speed and movement capabilities:
2 Ring of Force *
This ring allows the wearer to erect a sphere of force (as per the Wall of Force spell) that is 10' in diameter and moves with the ring wearer. The sphere lasts for 1d6 +2 turns and costs 1 charge to create. The ring typically has 2d6 +2 charges, and can be recharged. The sphere has all of the immunities and vulnerabilities of a Wall of Force.
2 Ring of Heaviness *
This ring appears to all tests to be a Ring of Feather Falling. If worn for more than a day however, the curse activates. The curse causes the user to double in weight, suffer a -2 to attack and damage rolls, +3 penalty to AC, -3 penalty to dexterity, and slows the wearer's movement by p. The ring wearer also takes double damage from falls. The ring can only be removed by a Remove Curse cast at 15th level or above.
2 Ring of Holiness *
|| rolls
|* d20|Spells doubled
|+ 1-4|Doubles 1st and 2nd level spells.
|+ 5-8|Doubles 2nd and 3rd level spells.
|+ 9-12|Doubles 3rd and 4th level spells.
|+ 13-16|Doubles 1st, 2nd, and 3rd level spells.
|+ 17-19|Doubles 2nd, 3rd, and 4th level spells.
|+ 20|Doubles 1st, 2nd, 3rd, and 4th level spells.
This ring allows a priest to memorize double the spells for certain levels, depending on the type of ring found. Roll a d20 and consult the chart.
The number of spells to be doubled is done before adjustments for wisdom are taken into account.
2 Ring of Illusion Immunity *
This ring allows the wearer to see any illusion spell of 4th level or less for what it really is. The user still sees the spell's effects, but knows it is an illusion and can see right through it with ease. The wearer can also see and attack anyone under an Invisibility or Improved Invisibility spell.
2 Ring of Illusions and Healing
by Johnny Brant
XP Value: 10,600 GP Value: 53,000 
The Ring Of Illusions and Healing functions as a Wand Of Illusions without the use of charges and allows the wearer to use the following spells each once per day (at the silent will of the wearer): Cure Light Wounds, Cure Moderate Wounds, Repair Injury, Cure Serious Wounds, Cure Critical Wounds, Heal, and Regenerate.
2 Ring of Improved Invisibility *
This ring allows the user to become invisible and still attack or cast spells without becoming visible again (as per the wizard spell Improved Invisibility.). The rings effect lasts for 5 turns per use and costs 1 charge. The ring typically has 3d6 +3 charges and can be recharged.
2 Ring of Insect Control *
This ring allows the wearer to control all normal insects within a 50' radius up to 3 times per day. The ring wearer can also control up to 15 hit dice of giant insects per day (save vs. spells negates). Any normal insects controlled can be formed into either an Insect Plague or Creeping Doom, as the priest spells cast at 15th level. Giant insects can be used to attack foes, carry things, or do simple tasks. If the ring wearer commands the insects to do anything self-destructive, (besides combat) the ring wearer immediately loses control of the insects.
2 Ring of Insulation
This ring provides its wearer with protection even in extremely electrical environments. No metal on the wearer will attract lightning. It also restores damage caused by electricity at the rate of one point per turn, provides a saving throw bonus of +2 versus electricty-based attacks, and reduces damage sustained by -1 per die.
2 Ring of Knocking *
This ring allows the wearer to cast a Knock spell from the ring at the cost of 1 charge per spell. The ring contains 2d4 x 10 charges and can be recharged.
2 Ring of Life
This ring allows the wearer to Detect Life at will. Five times a day it will create a double of the wearer which acts like the double in Zala'a Lifeforce Guardian spell. It can create a Life Bolt three times a day with the Hit Points used coming from the wearer. It can create a Life Field once a day as if the wearer were a 12th level wizard. It can do a Life Force Transfer once a week with the Hit Points coming from the wearer.
2 Ring of the Magi *
This ring gives the wearer a +3 bonus to saving throws and armor class, a +1 bonus to intelligence, and allows the wizard to memorize double the number of spells for levels 1-3. This ring only works for single class mages or specialist wizards, and vanishes when removed.
2 Ring of Might *
This ring gives the wearer a +3 bonus to attack, damage, and saving throws. It also increases the wearer's strength by 1 point. This ring only works for single class fighters, rangers, or paladins and vanishes when it is removed.
2 Ring of Missile Attraction *
This ring appears to be a Ring of Deflection to all tests. When worn for more than a turn however, this ring attracts all missiles fired within 60' to head towards the ring wearer. In effect, all missiles within 60' strike the ring wearer (attack roll still required). All missiles that are boulder sized or less are attracted by the ring. Any missile attack directed specifically at the ring wearer gets a +4 to attack and damage rolls. This ring requires a Remove Curse spell cast at 15th level or higher to remove.
2 Ring of Monster Summoning *
This ring allows the wearer to summon a 1d4 hit dice monster (chosen randomly by the DM) at the cost of 1 charge. Any monster summoned stays until slain and is under complete control of the ring wearer. The ring has 40 charges initially and cannot be recharged. There is a 60% chance that if the ring is found in a treasure hoard, 3d6 charges have already been used. Once all of the charges have been used, the ring crumbles to dust.
2 Ring of the Negative Plane
by Dan Grieg
This ring looks to be a gold ring that on half of it has a slight glow, the other half looks like it was smeared with soot.
Its first and most frightening ability is to drain two levels/HD from a creature. Not only does this drain the victim but it also transfers the levels/HD to the user of the ring affecting all level based rolls such as hit dice and saving throws. This affect only lasts for two turns. The levels are returned to the creature they were taken from. If the creature died from the draining, the creature will stay dead. This power my be used once a day.
The second power is negative plane protection. The ring works almost exactly like the spell except that the effect is always on, and if the wearer fails the save against the drain the wearer does not take double damage.
No undead can never wear this ring. The ring will burn through its finger and fall off.
2 Ring of Object Control *
This ring allows the wearer to animate any objects whose combined size would fit into a 30' cube (i.e. 4 tables, or 1 statue, or 10 chairs). This ring essentially functions as the 6th level priest spell Animate Object, at the cost of 1 charge per use. The duration of control / animation is 5 turns. The ring typically contains 4d6 charges, and can be recharged.
2 Ring of Petrification Protection *
This ring protects the wearer from all petrification attacks. While the ring is worn, 1 charge is drained from the ring every time the wearer is subjected to a petrification attack. The ring wearer cannot decide to make a saving throw against the attack, because the ring supercedes it. The ring has 10d6 charges and can be recharged.
2 Ring of Piety *
This ring gives the wearer a +3 bonus to saving throws, a +1 bonus to wisdom, and allows him / her to memorize double the number of spells for levels 1-4. This ring only works for single class clerics, druids, or other priest classes and vanishes when removed.
2 Ring of Plant Control *
This ring allows the wearer to control plants in a 100' radius, up to 3 times per day. The ring wearer can cause any plants in the area to move about, entangle foes, cover things, etc, up to the limit for the plant's size (i.e. grass could not stop anyone, but a tree could reek havoc on foes.). The control lasts for up to 1 hour per use. The user may also try to control plant-like monsters, but the monster(s) receive a save vs. spells if intelligent, to avoid control. Plants that are destroyed or damaged cannot be controlled (i.e. a chopped down tree cannot do anything, neither can a cut flower). This ring is prized by druids and rangers to help them protect woodlands.
2 Ring of Protection From Animals and Plants
This ring will protect the wearer from attacks made by normal animals and plants. It will not protect the wearer from any creatures with an intelligence of 2 or better.
2 Ring of Provocation *
This ring appears to all tests to be a control-type ring (Mammal control, Reptile control, etc.).  Once put on however, the ring doubles the chance of random encounters, and causes all hostile creatures to attack the ring wearer and fight to the death (no morale checks). This ring can only be removed by a Remove Curse cast at 15th level or higher.
2 Ring of Psionic Power *
This ring gives the wearer a +2 bonus to all power checks, and a +50% bonus to his / her total PSPs. This ring is only usable by a single class psionicist and vanishes when removed.
2 Ring of Pummeling *
This ring allows a wearer who fights with his / her fists only, to cause 1d8 damage per hit per fist (instead of the normal 1d2 damage). If the ring wearer is trained in unarmed fighting with his / her hands, he / she gains a + 2 to hit and damage, and causes an additional 1d8 damage to his / her normal barehanded damage. This ring has no charges.
2 Ring of Rage *
This ring appears to be a Ring of Strength to all tests and functions as such. The ring wearer goes berserk in combat, attacking all creatures including allies. The ring wearer continues attacking until all creatures are dead, unconscious, playing possum, or gone. Then the ring wearer returns to normal. The ring can only be removed by a Remove Curse cast at 15th level or higher.
2 Ring of Regents *
This ring allows the wearer to cast spells without the use of material components. The ring has 200 + 5d10 charges and uses up 1 charge per spell level of the cast spell (i.e. 6th level spell uses 6 charges). If the ring wearer has the material components for the spell being cast, or the spell requires no material components, the ring does not function. This ring is especially useful to Alchemists.
2 Ring of San Sao (Fighting)
by ^Gabriel Elias^
This ring is made of a blood red metal with the characters of "San Sao Chuen Shu" in gold on the inside.
When worn by a non martial artist, the Ring of San Sao gives a +2 bonus to hit when fighting in unarmed combat only and allows the wearer Crushing Blow. When worn by a pure martial artist, the character gets the above mentioned, a +2 to AC (If the wearer wear no armor), +1 damage every 4 levels, and 2 extra attacks every 5 levels. If the wearer is from Shao Lung, it also serves as a Ring of Free Action.
2 Ring of Shapechanging *
This ring grants the wearer the ability to shapechange into any creature seen before up to twice the ring wearer's mass. The user gains all the non-magical abilities (night vision, giant strength, flight, etc.), physical attributes (size, physical attacks, wings, etc.), and 1 magical ability of the chosen creature (Energy drain, breath weapon, etc.). The wearer also gains all of the vulnerabilities of the chosen form as well (i.e. a vampire would have problems with sunlight, holy water, garlic, etc.). The ring is usable up to 3 times a day, but there is no limit on the duration of a chosen form. If the user is slain while shapechanged, the user reverts to the user's true form, causing the ring to shatter. Good creatures that constantly transform into evil creatures may also have alignment penalties, at the DMs discretion.
2 Ring of Shields
This ring will give the wearer a constant Shield. Five times a day the Ring can create a Fire Shield (vs. either fire-based or cold-based spells) or a Lightning Shield (vs. lightning-based or acid-based spells). It can create a Shock Shield three times a day.
2 Ring of Solidity
This ring provides its wearer with protection in extremely gaseous environments that contain poison as if the person had a mask on to keep from breathing the fumes. It restores damage caused by gas clouds at the rate of one point per turn, provides a saving throw bonus of +2 versus gas-based attacks, and reduces damage sustained by -1 per die.
2 Ring of Speech *
This ring allows the user to understand and converse with any intelligent creature that has a spoken form of communication. The ring works automatically, whether the wearer wants it to or not.
2 Ring of Spell Immunity
One of these Rings only protects the wearer from one wizard spell that is targeted at the wearer. Area of effect spells will not cause the protection to activate unless the spell is targeted at the wearer. Each time it protects the wearer, it expends one charge, and there is a 12% chance the spell reflects back on the caster. These rings can not be recharged. See Counterspell Immunity spell for more information.
2 Ring of Spell Might
by Johnny Brant
This ring is made of woven unicorn hairs and bears a small golden illusion of Piper's mage sigil (a golden cat eye) inside its diamond setting. This unique ring has all the abilities of a Ring of Protection +4 (+2 to saving throws) and a Ring of Fire Resistance, and allows the wearer to cast spells as needed instead of having to memorize them as is normal for a wizard. This function of the ring works for all known spellcasters. This includes bards, paladins, priests, and rangers.
If the wearer chooses to memorize spells normally, they are cast with a reduction in their casting times. Spells memorized in this manner have their casting times reduced by 3 to a minimum of a 1 casting time.
In addition this was also subjected to Thiondar's permanent anti-magic field during its creation thus making it immune to all further magics. Protective items treated with Thiondar's permanent anti-magic field gives the wearer magic resistance equal to 20% per plus of saving throw bonuses, thus, the ring of spell might grants 80% magic resistance to its wearer.
2 Ring of Spell Stealing *
This ring appears to all tests to be a Ring of Wizardry or Ring of Holiness (DMs option). However, when the ring is put on and the extra spells memorized, the curse is activated. Whenever the ring wearer attempts to cast a spell, there is a 75% chance that the ring Q<eats> the spell, causing the spell to fizzle. There is also a 30% chance that the ring will dispel any active enchantments on the ring wearer (good or bad) checked once per turn. Once the ring shows its true power, it can only be removed by a Remove Curse spell cast by a spellcaster of at least 18th level.
2 Ring of Sweetness
This ring provides its wearer with protection even in extremely acidic environments. It restores damage caused by acid at the rate of one point per turn, provides a saving throw bonus of +2 versus acid-based attacks, and reduces damage sustained by -1 per die.
2 Ring of Teleportation *
This ring allows the wearer and up to 1000lbs of living or non-living matter to Teleport (as the 5th level mage spell) once per day. The ring's power has the same chances for error as a Teleport spell. The ring neither has nor uses charges.
2 Ring of Temporal Displacement
by ^Randy Furuyama^
When this ring is activated, the wearer is displaced back in time 1 combat round. This allows the wearer to try to correct a mistake made during combat including re-rolling an attack roll, re-wording a wish, or any other action that could change the resulting consequences. Once this function is used, the magic in the ring is expelled. The ring becomes a simple silver band worth about 10 gp. This ring cannot be recharged.
2 Ring of Thievery *
This ring gives the wearer a +3 bonus to attacks and damage, a +1 bonus to dexterity, and a +15% to all thieving abilities. The ring only works for single class thieves and bards and vanishes when removed.
2 Ring of Touches
This ring is a powerful item on the finger of a mage or cleric. The ring has many powers which require charges (see below). This ring can be recharged.
*| charges
* ^One charge^ Chill Touch (1d4 points of damage, and -1 to strength)
* ^Two charges^ Ghoul Touch (victim Rigid for 1d6+2 rounds)
* ^Three charges^ Mummy Touch (Mummy Rot disease)
* ^Three charges^ Paralyzing Touch (paralyzed for 2d4 rounds)
* ^Four charges^ Pain Touch (pain for 1d4 rounds)
* ^Four charges^ Vampiric Touch (1d6 points of damage, ½ transferred to wearer)
* ^Six charges^ Lich Touch (1d10 points of damage, and is paralyzed for 2d4 rounds)
2 Ring of Trollish Regeneration *
This ring allows the wearer to regenerate at the same speed that a Troll does (3 hit points per round), even regrowing limbs and internal organs. The wearer cannot regenerate fire or acid damage, nor can they regenerate from an instant death attack or spell (Death Spell, System shock failure,etc).
2 Ring of Truesight *
This ring allows the wearer to see things as they really are, exactly like the priest spell True Seeing. The ring can be used up to 5 times a day for up to an hour each time.
2 Ring of Tsunamis *
This ring allows the wearer to use some powerful abilities related to elemental Water. The powers and their usage are as follows: Water Breathing (at will), Creater / Destroy Water (at will), Metamorphose Liquids (at will), Watery Fist (at will), Watery Double (5 x day), Water Walk (5 x day), Tsunami (1 x day), and Acid Storm (1 x day). This ring contains no charges, but the wearer cannot use fire-based spells or items. Water Elementals will attempt to possess the ring attacking the wearer with preference.
2 Ring of Undead Attraction *
This ring appears to be a Ring of Draining when identified or tested, and it functions as such. When worn however, it attracts any and all intelligent undead within a 1 mile radius of the ring wearer. The undead attracted will seek to possess the ring and destroy the wearer, attacking him / her in preference to all others, unless attacked by a more powerful opponent. The ring can be removed when it runs out of charges, the user is killed, or by a Remove Curse cast at 17th level or higher.
2 Ring of Undead Control *
This ring allows the wearer to attempt to control any undead creature within a 50' radius. The undead creature so targeted must save vs. spells become the ring wearer's slave for up to 1 day, or until the undead creature is farther then 25' from the ring wearer. Undead who save act as if they were turned, fleeing from the ring wearer at maximum speed for 1d6 turns. The ring wearer can command only 1 undead creature at a time, and the ring can only be used once per day. The undead creature commanded will follow the ring wearer's directions, as long as the directions are not self-destructive (not including combat). The undead creature commanded will not divulge any information for the ring wearer, and does not have to use any spells or abilities it may possess for the ring wearer's benefit. This ring can usurp control of undead from priests or other undead if the ring wearer is higher level than the other controlling factor.
2 Ring of Volcanoes *
This ring allows the wearer to use some powerful abilities related to elemental fire. The powers and their usage are as follows: Burning Hands (at will), Fireburst (at will), Affect Normal Fires (at will),  Produce Flame (at will), Fireball (5 x day), Fire Shield (5 x day), Firestorm (1 x day), and Meteor Swarm (1 x day). This ring contains no charges, but the wearer cannot use water-based spells or items. Fire Elementals will attempt to possess the ring attacking the wearer with preference.
2 Ring of Wind *
This ring allows the wearer to use some powerful abilities related to elemental air. The powers and their usage are as follows: Gust of Wind (at will), Wind Wall (at will), Dust Devil (at will), Fly (at will), Control Winds (5 x day), Lance of Disruption (5 x day), Wind Walk (1 x day), and Whirlwind (1 x day). This ring contains no charges, but the wearer cannot use earth-based spells or items. Air Elementals will attempt to possess the ring attacking the wearer with preference.
2 Ring of the Worm *
This ring allows the wearer to transform the ring into a Purple Worm (see MM) with maximum hit points. The Purple Worm is under the ring wearer's complete control and stays in worm form until slain, or until the ring wearer commands it back into ring form. Any damage done to the Purple Worm is permanent unless healed by a Wish spell. When the Purple Worm dies the ring turns to dust.
2 Rings of Abilities
by Robert Anderson
These rings can be use by any class.
3 Ring of Charisma
This ring raises the wearer's charisma by 1 point for as long as it is worn.
3 Ring of Constitution
This ring raises the wearer's constitution by 1 point for as long as it is worn.
3 Ring of Dexterity
This ring raises the wearer's dexterity by 1 point for as long as it is worn.
3 Ring of Intelligence
This ring raises the wearer's intelligence by 1 point for as long as it is worn.
3 Ring of Strength
This ring raises the wearer's strength by 1 point for as long as it is worn.
3 Ring of Wisdom
This ring raises the wearer's wisdom by 1 point for as long as it is worn.
2 Rings of Magical Protection
by Robert Anderson
These rings contain 50 + 3d10 charges typically and can be recharged.
3 Ring of Acid Protection
This ring protects the wearer from acid attacks and spells while worn. When the ring wearer is subjected to an acidic attack or spell, the ring loses 1 charge per 10 (or fraction thereof) hit points of damage the ring wearer would have sustained. For example, the ring wearer is hit by an Acid Storm that did 50 hit points of damage, the ring loses 5 charges and the wearer takes no damage. If the ring wearer saved against the spell, the ring would lose 3 charges.
3 Ring of Cold Protection
This ring protects the wearer from cold or ice attacks and spells while worn. When the ring wearer is subjected to an cold or ice attack or spell, the ring loses 1 charge per 10 (round up) hit points of damage the ring wearer would have sustained. Example: the ring wearer is hit by an Ice Storm that did 13 hit points of damage, the ring loses 2 charges and the wearer takes no damage. If the ring wearer saved against the spell, the ring would lose 1 charge.
3 Ring of Electrical Protection
This ring protects the wearer from electrical attacks and spells while worn. When the ring wearer is subjected to an electrical attack or spell, the ring loses 1 charge per 10 (or fraction thereof) hit points of damage the ring wearer would have sustained. Example: the ring wearer is hit by a Lightning Bolt that did 43 hit points of damage, the ring loses 5 charges and the wearer takes no damage. If the ring wearer saved against the spell, the ring would lose 3 charges.
3 Ring of Fire Protection
This ring protects the wearer from fire and heat attacks and spells while worn. When the ring wearer is subjected to an fire/ heat attack or spell, the ring loses 1 charge per 10 (or fraction thereof) hit points of damage the ring wearer would have sustained. Example: the ring wearer is hit by a Fireball that did 57 hit points of damage, the ring loses 6 charges and the wearer takes no damage. If the ring wearer saved against the spell, the ring would lose 3 charges.
2 Rings for Women
These rings are usable by female adventurers only. Should a man find one of these rings, he will feel compelled to give the ring to the first woman he meets who is the right class for the ring. The compulsion is not overwhelming, so the man will not put himself in danger to find a woman who fits the ring. However, the man will take better care of himself while in possession of the ring. The compulsion will fade temproarily if a woman appears who fits the ring but has ill intentions for the man.
Woe to the man who harms a woman knowingly and without provocation. The ring will drain the man's strength or dexterity by a point for each offence.
3 Ring of the Diva
This ring is for female bards. It gives the bard a permanent +1 to her influence rolls and one additional musical ability after one full day of meditation. It confers a +1 to charisma while worn.
3 Ring of the Forest Lady
This ring is for female druids. It gives the druid one additional spell per level and one non-weapon proficiency from the priest group, permanently, after one full day of meditation. It confers a +1 to charisma while worn.
3 Ring of the Huntress
This ring is for female rangers. It gives the ranger one additional spell per level and one non-weapon proficiency from the fighter group, permanently, after one full day of meditation. It confers a +1 to dexterity while worn.
3 Ring of the Priestess
This ring is for female priests. It gives the priest one additional spell per level and one non-weapon proficiency from the priest group, permanently, after one full day of meditation. It confers a +1 to wisdom while worn.
3 Ring of the Psionic Sister
This ring is for female psionisists. It gives the psionisist one additional science and two additional devotions, permanently, after one full day of meditation. It gives a +1 to constitution while worn.
3 Ring of the Sister Knight
This ring is for female paladins. It gives the paladin one additional weapon proficiency and one non-weapon proficiency from the fighter group, permanently, after one full day of meditation.  It confers a +1 to charisma while worn.
3 Ring of the Sorceress
This ring is for female mages. It gives the mage one additional spell per level and one non-weapon proficiency from the wizard group, permanently, after one full day of meditation.  It confers a +1 to intelligence while worn.
3 Ring of the Thieving Lady
This ring is for female thieves. It gives a 5% bonus to all thieving skills and one non-weapon proficiency from the thief group, permanently, after one full day of meditation.  It confers a +1 to dexterity while worn.
3 Ring of the Warrioress
This ring is for female warriors. It gives one additional weapon proficiency and non-weapon proficiency from the warrior group, permanently, after one full day of meditation.  It gives a +1 to strength while worn.
