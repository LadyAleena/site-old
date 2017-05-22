#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magical weapons', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
2 Arrows
3 Arrows of Enchantment +2
These arrows look like normal arrows, but they have a few little surprises for the victims of successful hits. When the command word is spoken, they act like and can be used as wands, and using their powers requires charges. If used as wands, they will only be able to release one charge for a non-Enchanter. If a Invoker tries to use these arrows, the powers of the arrows will turn on the Invoker, not the target, unless the target is another Invoker. If a non-wizard uses these arrows, they will only act like as +2 arrows. The powers of these arrows are:
*| charges
* ^No charges^ Charm Person, Friends, Hypnotism
* ^One charge^ Forget, Ray of Enfeeblement, Scare
* ^Two charges^ Hold Person, Suggestion
See ^magic items of the specialist^ for more about these arrows.
3 Prismatic Arrows +4
There are 7 arrows in this set. They come in a rainbow colored quiver which is not magical. The arrows were designed to destroy prismatic walls and spheres. Each arrow has a different spell on it with only a 25% chance of being visibly marked. Only an identify spell can discern which arrow has which spell on it if not marked. The spells are cone of cold, gust of wind, disintegrate, passwall, magic missile, continual light, and dispel magic. These arrows can be used to cause the effect, not only to destroy a prismatic wall or sphere.
What makes these arrows special is the wielder can try to pierce intermediate sections or the wall or sphere to dispel the section the shot arrow was meant to destroy. Roll 1d6 for damage, and if the damage without the +4 bonus is equal to or greater than the amount of intermediate sections, the arrow gets through. If the damage is less, the arrow fails to reach its target and is destroyed.
The arrows can be used only once and are destroyed when used.
B<The Double Rainbow variant:> There is a 1% chance the quiver is magical. Once the Double Rainbow quiver is empty, it fills up again with a second set of arrows. <!-- Added 27-11-2013 -->
2 Silverblaze, Axe +4
by Johnny Brant
XP Value: 6,300 GP Value: 31,500
Silverblaze is a silver axe of hurling +4. It flames as a I<flametongue> sword on command.
2 Phoenix's Blade Bow
by Johnny Brant
XP Value: 30,000 GP Value: 150,000
This long bow is made of solid gold and bends and flexes as a normal fine wooden bow would. It bears twin sapphires in its ends, and when the wielder places her hand in the appropriate place a string of magical force is produced. This "string" of force is the same color as the sapphires that create it and is unbreakable and functions as a I<wall of force> for purposes of what can affect or damage it.
Enchanted by the Akh'Faern for the lead archer of Myth Drannor, this bow produces unlimited magical arrows for use by its wielder. An I<elven long bow of enchantment>, all arrows produced by the bow or fired from it can hit any creature that needs a magical weapon in order to successfully strike and injure it (thus arrows fired from this bow are considered to be whatever + is needed to strike their target).
In addition to being a normal elven long bow, this weapon has been dubbed a "blade bow", as the length of the bow from the grip out to each end has blades protruding from each side. It may be used in melee battle (although it requires a "blade bow" proficiency to use it without penalty in melee situations) and causes damage as a long sword (1d8/1d12); and in this case is considered to be a blade bow of enchantment.
This supreme bow of the elven nations was lost in the fall of Myth Drannor, and since Phoenix found this relic she has found that it also functions as a bard's blade (from Code of the Harpers).
2 Cesti of Deathblows
by Johnny Brant
XP Value: 2,000 GP Value: 10,000
These cesti (glove nails or other forms of fighting gloves) are usable only by warriors. The cesti will kill an opponent if a saving throw vs. death magic with a +4 bonus to the saves is failed. Anyone struck by the Cesti of Deathblows must make this saving throw.
2 Club of Gremlin Slaying
by ^Gabriel Elias^
No one knows when or where this item was created, but it turned up in an crazy old wizard's shop.
When a Bushi and a Swashbuckler needed something that would rid their mountain of Gremlins, Q<Whack them with this, Boys,> was the response they were given.
This two headed club weighs 30 pounds when Gremlins are not present and is as light as a feather when they are. The wielder is immune to their magic while in possession of the club. One hit with the club; and they are dead, no save. These cesti (glove nails or other forms of fighting gloves) are usable only by warriors. The cesti will kill an opponent if a saving throw vs. death magic with a +4 bonus to the saves is failed. Anyone struck by the Cesti of Deathblows must make this saving throw.
2 Daggers
3 Dagger of the Dead +2
When wielded by a Necromancer, this dagger will have +2 to attacks and damage. When wielded by a normal magic-user it will have +2 to attacks and damage, but none of the other abilities. If wielded by a non-magic-user, it will have only +1 to attacks and damage. When a Necromancer successfully attacks with this dagger, it will drain its victim as if Vampiric Touch was cast by the wielder. If the Necromancer is pressed and utters the command word, he can point it at his victim and it will cause Enervation. The dagger gives a +1 to save vs. Necromancy spells.
See ^magic items of the specialist^ for more about this dagger.
3 Daggers of Fire and Ice +2
These daggers are very powerful. One has a ruby on its hilt and one has a sapphire. The ruby hilted throws a Fireball while the one with the sapphire throws out an Ice Storm by the wielder at will. If they wielded by the same person who is an Invoker, they will do either a Lightning Bolt, which appears between the tips of the two daggers, or the point where both daggers points would intersect Cloudkill. If they are wielded by a Enchanter, the effects of the daggers will center on the wielder. If wielded by a normal magic user, the Cloudkill ability will not function. They will act like +2 daggers for non-wizards. If these daggers are wielded separately, the ruby hilted one by a Fire Elementalist and the sapphire hilted one by a Water Elementalist, they will act the same as if wielded by an Invoker. If the two Elementalists bring them close together, they will be able to create the Lightning Bolt or Cloudkill abilities. Each dagger gives a +1 to save vs. Invocation spells, +2 if both are owned.
See ^magic items of the specialist^ for more about these daggers.
3 Dagger of Illusion +2
This dagger looks like anything the wielder wants it to look like. It also causes damage like the weapon looks like, but the damage is illusionary. If wielded by an Illusionist, this dagger causes half real damage and half illusory damage. The damage will feel real to the victim, but after the dagger is back in its real form, the damage will go away. There is a 5% chance that the damage will lead to death. One can die from the pain inflicted by this weapon. If a Necromancer is hit with the dagger, the damage will be 100% real. If a Necromancer tries to wield this dagger, he will take 25% of the damage he is inflicting on his opponents. The dagger gives a +1 to save vs. Illusion spells.
See ^magic items of the specialist^ for more about this dagger.
3 Windsong +2, +5 vs. Tanar'ri
by ^Randy Furuyama^
When Myth Drannor was overrun by demonic hordes, many great heroes laid down their lives that day as a defensive line against the encroaching evil creating more time for others to escape. Among those heroes to die that day was the famed bard Windsong Dreamweaver. Long sword and dagger in hand, her life ended at the hands of a Balor. As she died the power of the mythal caused some of her spirit to enter her dagger.
Windsong is a +2 dagger of throwing. When thrown upwards the dagger will fall to shoulder height and, if not caught, will hover in place. As it hovers Windsong will begin to "sing". The song will counter act the charming effects of harpies and sirens and the keening of a banshee. The song will also encourage allies and dishearten foes, giving a +1 and a -1 on morale checks respectively. Against greater and true tanar'ri, Windsong acts as a +5 weapon.
There are rumors of the long sword having received powers also, but are unconfirmed because the long sword has never been retrieved.
3 Dagger of Gravitational Crush
by Nathan Brown
When the blade of the dagger cuts or lodges itself in something, it will begin glowing and making a beeping noise. All the while the dagger is increasing in density until it reaches 2000 pounds at the end of half of a round. At this point anything within a 10 yard radius is caught in a gravity well which causes 5d6 points of damage to all living creatures and will crush any crushable items within the radius. Magic items receive a saving throw of course. Once this is over, the dagger returns to its original density and may be used again. The dagger has 7 charges and may be recharged by an invoker of at least 14th level.
2 Ye Ol' Ball & Chain: Flail, +3
This is a +3 Flail that is dependent on its wielder. If the wielder gets any other magical weapons that are of a higher plus than it is, it will give the wielder penalties if the wielder is wielding it or not. The wielder's intelligence will also go down and so will his wisdom because of the constant nagging of this magical weapon to get rid of the higher plussed weapon. This weapon will not leave the wielder without a fight or a wish spell.
2 Hammer of Abjuration +2
If this hammer is wielded by an Abjurer, it will have +2 to attacks and a +2 to damage. If it is wielded by a wizard other than an Abjurer, it will have +2 to attacks but only a +1 to damage. If wielded by a non-wizard, it will only have the attack bonus. If it is wielded by a Transmutter, it will have a -1 to attack and a -1 to damage. When wielded by an Abjurer and upon a successful attack roll, it will cause the victim to be repulsed, as per the Repulsion spell, save vs. Spells at minus the wielder's level. The hammer also gives an Abjurer a chance verses Spells, as per the spell Minor Spell Turning, with an automatic +1 save vs. Abjuration Spells.
See ^magic items of the specialist^ for more about this hammer.
2 Maces
3 Lord's Scale Mace +5
by Johnny Brant
XP Value: 15,000 GP Value: 75,000
This horseman's mace is made from the body of a rock lord and adamantine. Being created from a rock lord grants a bludgeoning weapon a non-magical +1 to hit and +3 to damage; this combined with it being a horseman's mace +5 totals the Lords Scale at +6 to hit with a +8 damage bonus. Despite its enormous plusses to hit and damage, the Lords Scale is still only considered a +5 weapon, but receives +7 on all of its saving throws. It saves as metal or rock whichever saving throw is better.
This incredible weapon also ignores all non-magical armor bonuses. For example a man in plate mail +3 would only get the magical +3 off his Armor Class the rest is negated by the Lords Scale. In addition to the above effects and on a natural roll of 20, the being struck by the mace must save vs. Spell at -4 or be turned to stone (as per flesh to stone).
3 The Masturbator +5
This +5 Mace looks ordinary on inspection. When wielded it will make its wishes known. When the mace is at rest and after the first battle it is used, it changes to look like a phallus, if wielded by a woman, or a hollowed out tube with the shape of a naked woman on it, if wielded by a man. The mace will seek out a way to give the wielder sexual pleasure no matter what. The mace has the ability to move on its own in this state. If the wielder happens to be clothed, the mace will rest between the wielder's legs and vibrate. If the wielder is naked, the mace will insert itself into a woman or will envelope a man's penis. It will stay this way until the wielder climaxes. It will give anal pleasure upon request of the wielder. If the wielder happens to be a virgin, the mace will not activate immediately. It will first determine if activating will be detrimental to the wielder's mental state. If the wielder is a paladin, the mace may (50% chance) activate before the first battle. After the first use of the mace for sexual satisfaction, it will start to convert itself to the needs of the wielder, but it will become jealous of any of the wielder's other sexual activities and lose one plus per incident. When the mace loses all of its plusses, it will still retain the magical ability to sexually please, but it will give no benefit in battle. If more incidents occur than the mace has plusses, the mace will have attack and damage penalties (-1 Att. -1 dmg. per incident). For every 5 incidents, there is the possibility (10% cumulative) that the mace will damage the wielder for 1d6+1 dmg while giving sexual pleasure. The mace will not leave its wielder unless a wish spell is cast, the wielder somehow restores her/his virginity, or the wielder is youthened to an age that is below the age of consent. Another power of this item is that it makes the wielder an excellent fisher.
2 Defending Bo Staff +5
by Johnny Brant
XP Value: 5,400 GP Value: 27,000
This quarterstaff was carved in the traditions of Kara Tur, and is capped with a gold dragon at the top and an adamantine spear-like point at the bottom. It functions as a defender sword +5 with the following exception. It is always +5 to hit and damage and constantly grants its +5 bonus to armor class. Thus it is +5 to hit, damage, and AC at all times. Furthermore it gains a +7 to all saving throws and save as cyrstal, metal, or wood, whichever has the better save for the occasion.
2 Spears
3 Spear of Souls +1
by ^Randy Furuyama^
This is a +1 spear with a metallic shaft and a crystalline head. The crystalline spearhead will either be red, blue, or violet when this spear is found, the majority either red or violet.
If the command word "Feed" is spoken to the spear while in combat and if the strike succeeds, the spear seeks to devour the soul of the opponent, much like a sword of life stealing. The opponent gets to make a save vs. death magic, but if the save fails, the soul is sucked into the spear. The spear then gains a bonus +1 to hit and damage for as many days as the level the opponent had. This bonus will accumulate to a maximum of +5 at which point the spear is sated and will not be able to consume another soul until the bonus again drops below a +5.
Additionally the spear's alignment makes a one step shift in the direction of the soul it just consumed. Its ego gains a boost equivalent to the person's intelligence, losing 1 point per day. Should the spear's ego become greater than the wielder's, the spear will gain dominance over the wielder.
As previously noted the spear's alignment shifts according to the souls it consumes. This will be reflected in the color of the crystalline spearhead. Red for evil, blue for good, and violet for neutral. Should a spear gain control of it's wielder, its actions will be dictated by it's current alignment. If the spear is currently evil, it will seek to punish the wielder for stealing its souls by causing the wielder to seek impossible opponents to defeat (perhaps a Great Wyrm or other such monster.)  If the spear is currently neutral, it will attempt to maintain it's power as long as possible by consuming as many souls as possible as often as necessary. And if the spear is currently good, it will cause the wielder to seek to atone for the sin of stealing other's souls by doing penance in the form of destroying beings of great evil.
3 Scholar's Brush (Qiang) +3, +4
by ^Gabriel Elias^
This 7 foot long spear is made of white wax wood with an 8 inch long spear head made of a combination alloy of mithryl and admantium at its tip. It has a thick red tassel which is used as a distraction, to catch the enemies blood, and spreads out to a two foot diameter when thrust forward.
It is a +3 Spear, created by Monks in Shao Lung and is +4 when used by a Monk from Shao Lung.
Special Abilities:
* The wielder can parry all attacks made against him or her equal to the maximum attacks per round by armed and un-armed opponents by hitting opponents AC.
* Opponents get a -2 to their Parry because of the Tassel distraction and White Wax Wood - it is VERY difficult to Parry because of its flexibility.
* The wielder is able to deflect or cut missile attacks, which is equal to the wielder's maximum attacks in a round, by hitting opponents AC with no minuses.
* Twice a week the wearer is able to perform "Dragon's Tale Splits the Wind." The wearer makes the motion that the wielder is cutting the opponent in half from the ground up. If the wielder hits, it does an additional 1d4 of damage per level of wielder, no additional bonuses are applied. The opponent gets a save versus death. If the opponent makes it,  the person takes half damage. The opponent cannot parry this move. If the opponent dies from this attack he or she splits in half from the groin up and falls to the ground in opposite directions.
* Range is 5 feet per level. The strike keeps going until the entire range is used.
It also gives user Artistic Ability while the item is owned.
2 Broadswords
3 Broadsword of Atrocities +5
by Joshua Moore
Broadsword +5, double damage to all living creatures.
The Sword of Atrocities is perhaps the single most reviled item created. Spat from the overgod in a moment of spite caused by his revulsion at how base humans can be, its power is threefold:
* The Sword of Atrocities is solely for destruction and does it well. It does double damage to any living creature it strikes and acts as a Sword of Wounding.
* On a natural roll of 20 the Sword steals the soul of the creature it strikes, rendering it dead instantly.
* The Sword makes the wielder berserk for the rest of his brief life. The wielder must fight all fauna he happens to meet until he is slain. When hungry, the wielder will eat what he has slain - even if it's another person. The wielder is always considered proficient with the weapon, even mages or clerics. However, the wielder will not be able to sleep - he or she will live a number of days equal to his/her constitution score, then die.
The Sword cannot be broken and never needs sharpening. Since the overgod created it, the gods - who hate it bitterly - cannot destroy it or the wielder. The wielder is immune to clerical magic of any sort. The wielder is condemned to die the moment he picks it up - you cannot avoid this. It can only be destroyed by a person of total purity. The person must be of good alignment, must never have slain or willfully harmed any living creature, and must have saved at least one life. That pure person must appeal directly to the overgod in a place consecrated to him; the appeal must be for the weapon to be destroyed and for forgiveness of the human race (regardless of the pure person's race).
A normal broadsword in shape and size. The blade is blood red and never shines in light; it's quillons are hooked. The hilt is wrapped in human skin.
It is a B<cursed artifact>.
3 Lung Shao's Echo +5
by ^Randy Furuyama^
Twin Tornado Broadswords (Kung Fu) these swords are +5 weapons. If an attack with one of these swords hits, it creates echoes of itself. A second to-hit roll is made for the echo at a +4 instead of a +5. If this attack hits, it echoes again and another to-hit roll is made. This continues until either the attack misses, or 4 echoes have been made. Damage is as follows:
* STRONG<1SUP<st> hit:> 1d8 + 5 + Weapon Specialization Bonus + Strength Bonus
* STRONG<2SUP<nd> hit:> 1d6 + 4 + Weapon Specialization Bonus + Strength Bonus
* STRONG<3SUP<rd> hit:> 1d4 + 3 + Weapon Specialization Bonus + ½ Strength Bonus
* STRONG<4SUP<th> hit:> 1d2 + 2 + Weapon Specialization Bonus + ½ Strength Bonus
* STRONG<5SUP<th> hit:> 1 point + Weapon Specialization Bonus
2 Long swords
3 Sword of the Critical Deathblow
by Joshua Moore
This long sword can be used only once. When a PC goes under one-tenth of its hit points and speaks the command word (ha do ken!), the blade will emit a shaft of energy which is sized in proportion to the number of hit points lost. The beam does the number of hit points in damage that the hero has lost.  No roll to attack is necessary and no save is made. The sword then crumbles to dust.
3 Drinker, Sword of Wounding +1
by Johnny Brant
XP Value: 4,400 GP Value: 22,000
Drinker is a normal Long Sword of Wounding +1. Its only special qualities are its appearance. The hand guard appears as the open wings of a night hunter (deep bat) with its tail twisting down forming the handle of the sword. The head of the bat opening fully as if spitting forth the acid etched blade.
3 Grass Blade +3
This sword was made by druids and dryads for rangers. The blade is made of tightly woven and lacquered blades of grass. The edges of this weapon are sword grass. This weapon inflicts the same damage as a long sword and is the same size. It is lighter and faster because of the materials used. The hilt of this sword is a light but strong wood. Each sword has been touched by a dryad. The sword, upon speaking the name of the dryad who touched it, will enable the ranger to dimension door to the grove of the dryad. It will also allow the ranger to cast charm person once a day. These swords are very rare in that the hilts are made with a branch of the dryad's tree.
3 Long Sword of OSHA +3
by Rich Rayburn
This is a +3 Long Sword complete with all required occupational safety standards to all known cultures applied. The scabbard is wrapped in a mystical bright yellow coating with black warnings and cautions written in every language readable for surrounding 100 sq miles that shifts and adjusts as the sword's owner travels; part of the magic of the weapon. The pommel of the sword is safety-tipped with a fine-mesh cage lacquered in orange preventing blunt-force trauma if ever brought to strike anyone (0 + Str Bonus damage to the victim if struck by the pommel). When and if the owner decides to draw the weapon, three separate safety devices must be disabled, each of them locks that are meant to keep the sword in sheath. It takes both hands and two segments (12 seconds actual time) to manipulate these safety releases. Once the sword starts coming out of its sheath, only one hand is needed. While being drawn and as long as it is out and exposed, a loud beeping noise sounds off and rotating red lights on the tips of the cross guards activate, warning all near that a dangerous weapon is in reach of striking them. The safety aspects of this weapon cannot be countered by anything less than a 24th level spellcaster.
2 Short swords
3 Crystylpeak +2
by Johnny Brant
This elven Moonblade is a Short Sword +2 made of the finest steel with a hilt of the bone of a Leviathan. It has been in Jamal's family for 3 generations, gaining the following powers:
* STRONG<Danger Sense:> The sword glows pale blue when danger is imminent.
* STRONG<ESP:> The sword functions as a Medallion Of Esp.
* STRONG<Good Luck:> The sword functions as a Luckstone.
* STRONG<Throwing:> Jamal on a few occasions, had to hurl his sword at either his opponents or objects. As such the sword can now be thrown up to 100 feet, inflict damage, and return to him in the same round.
3 Blade of Battledancers
by Johnny Brant
This sword, in the hands of a female fighter is a weightless Short Sword +2; its weightlessness grants it a speed factor of "0" although the magical +2 bonus does not further reduce this weapon's speed.
Furthermore, when in the hands of a female fighter, she gains the abilities of agility and evasion; this ability is the same as the ability that is possessed by the bards known as jongleurs. Thus in any round that the female fighter wielding this potent weapon wins initiative, she would also gain a +4 bonus to her Armor Class (as the sword accelerates her feminine balance and flexibility allowing her to tumble and attack normally if she beats the speed factors of her foes).
If wielded by a male this weapon is twice as heavy with double the speed factor (4 including the +2 magical bonus of the weapon), and is only slightly better than a normal weapon of the same type, the +2 magical bonus to hit does not factor into male wielder's attack rolls, although the +2 to damage still functions normally.
3 Short Sword of Omens
by Nathan Brown
In its natural state this weapon is a Short Sword +1. With a command word the sword lengthens into a Long Sword +3. While in its lengthened state, the sword can fire three magic missiles from its tip per round. These missiles are not self-guided however and require an attack roll with missile THAC0. The sword stays in its elongated state for the duration of battle or can be shortened by a Dispel Magic cast by a 13th level caster or greater. With another command word, the sword can be summoned and will fly to its owner's hand despite the complexity of its path. This flight can be prevented if it is contained inside a container of some sort. With yet another command word, the sword can cast Clairvoyance and True Seeing up to ten times per day. The center of the sword's power is a gemstone 'eye' set at the crosspiece of the blade. Should the eye be covered none of these abilities will function.
2 Reaver blades
by Johnny Brant
Cost 25 gp; weight 6 pounds; size M; type P/S; speed factor 6; damage 2d4+1 vs. S-M, 2d6+1 vs. large opponents.
Any character can use these I<non-magical> weapons properly if proficient in either scimitar or khopesh, suffering -2 to hit and damage if only proficient in the scimitar and suffering -1 to hit and damage if only proficient in the khopesh. Elves who are familiar with elven long swords can also use this weapon, although they suffer the same penalties as those who are only proficient in the scimitar. They must fully learn this strange weapon by devoting a weapon proficiency slot to reaver blade, otherwise they will never be able to use the weapon up to its potential.
3 Bloodglass, Reaver +4
by Johnny Brant
XP Value: 6,000 GP Value: 30,000
This Reaver +4 is Draven's most prized possession. If an attack with it severes a limb, the number of hit points in damage done is stored in the weapon's handle as regenerative blood (to a maximum of 50 hit points). Any limb removed in this way crumbles into fine gray dust and prevents the wound from regenerating. If the target is decapitated, which occurs on a naturally rolled 20 (Man-sized or smaller beings only), the victims remaining hit points are added to the blood in the handle. The blood in the handle is then used to regenerate any being holding its handle at a rate of 1 hit point per round.
3 Reavers of Doubling
by Johnny Brant
There are only four known Reavers of Doubling. They are very similar to scimitars or elven long swords, except that they curve more like a khopesh and are sharpened along the opposite sides; thus they act and can be used for any purpose for which a sickle or scythe can be used, even harvesting spell components! All of the swords of doubling are True Neutral in alignment, allowing any normal ranger or druid to use them.
Each of the swords of doubling appear as a single sword. If the name of the sword is learned by a ranger or druid, usually after a great quest in the name of nature, it becomes sentient and fully aware of itself and awakened to its magical powers. After that they can be made to separate into twin weapons. Only rangers and druids can use these weapons' other abilities. They are normal magical swords to all other classes of characters or beings who may gain them.
4 Sword of Doubling +2, +1 (Taris)
This sword is a reaver blade +2 when found. If its name "Taris" is discovered, the sword gains the ability to split into twin reaver blades +1! Once awakened Taris has a 12 intelligence, 8 ego, can detect shifting walls 10' radius, and can speak Elven.
4 Sword of Doubling +3, +2 (Dor)
This sword is a reaver blade +3 when found. If its name "Dor" is discovered, the sword gains the ability to split into twin reaver blades +2! Once awakened Dor has a 15 intelligence, 16 ego, can detect good/evil 10' radius, detect precious metals (kind and amount) 10' radius, clairvoyance thrice per day, and can speak Common and Elven.
4 Sword of Doubling +4, +3 (Conra)
This sword is a reaver blade +4 when found. If its name "Conra" is discovered, the sword gains the ability to split into twin reaver blades +3! Once awakened Conra awakens has a 14 intelligence, 12 ego, can detect shifting walls 10' radius, and can speak Common, Elven and Faerie.
4 Sword of Doubling +5, +4 (Torq)
This sword is ancient and is a reaver blade +5 when found. If its name "Torq" is discovered, the sword gains the ability to split into twin reaver blades +4! Once awakened Torq has 16 intelligence, 18 ego, can read magical writings and maps, detect gems (kind and amount) 10' radius, detect "elevator"/shifting rooms 10' radius, detect secret doors 10' radius, and can speak Common, Dragon, Drow, Elven and Faerie.
2 Other swords
3 Tanyani's Elemental Blades
The Elemental blades are Any swords +3. Their abilities are targeted for each specific Elemental plane. I was going to have them created by my character Tanyani but never got around to playing it through.
B<Constant:>
* Elemental Adaption
* Elemental Command
* Elemental Compass - 300 miles
* The swords may be recharged.
B<Sometimes:>
* Elemental Metamophosis 1/day
* Elemental Travel 1/wk
4 Flame
B<+5 vs. Regenerating creatures, +6 vs. Cold-using, Flammable, or Avian creatures, +7 vs. Undead>
Acts as a Ring of Coolness.
* STRONG<Burning hands:> The sword emits a fan-shaped sheet of fire 10 feet wide at its end and 12 feet long. Each creature touched suffers six points of damage. The sheet of fire appears instantly, shoots forth dark red flames, and snuffs out in less than one second. It expends one charge.
* STRONG<Pyrotechnics:> This function duplicates the spell of the same name. It expends one charge.
* STRONG<Fireball:> The sword coughs forth a pea-sized sphere that streaks out to the desired range (to a maximum of 160 feet) and bursts in a fiery, violet-red blast, just like the fireball spell. The initiative modifier is +2, and this expends two charges. The fireball inflicts 6d6 points of damage, but all 1s rolled are counted as 2s (i.e., the burst causes 12-36 points). A saving throw vs. wands is applicable.
* STRONG<Wall of fire:> The sword can be used to draw a fiery curtain of purplish-red flames 1200 feet square (10' x 120', 20' x 60', 30' x 40', etc.). The flames last for six rounds and cause 2d6+6 points damage if touched (2d4 points if within 10 feet 	of the fire, 1d4 if within 20 feet). The flames can also be shaped into a ring around the sword user (but the circle is 25 feet in diameter). Its use expends two charges.
4 Ice
B<+5 vs. Water-based/dwelling creatures, +6 vs. Fire-using/dwelling creatures, +7 vs. Gaseous creatures>
Acts as a Ring of Warmth.
* STRONG<Frost fingers:> The swords emits a fan-shaped sheet of cold and ice 10 feed wide at its end and 12 feet long.  Each creature touched suffers six points of damage.  The sheet of ice appears instantly, shoots forth, and then stops in less than one second.  It expends one charge.
* STRONG<Ice storm:> A silvery ray springs forth from the sword and an ice (or sleet) storm occurs up to 60 feet away from the sword holder. This function requires one charge.
* STRONG<Wall of ice:> The silvery ray forms a wall of ice, six inches thick, covering a 600-square-foot area (10' x 60', 20' x 30', etc.). This function uses two charges.
* STRONG<Cone of cold:> White crystalline motes spray forth from the sword in a cone with a 60-foot length and a terminal diameter of 20 feet. The initiative modifier is +2, and the effect lasts just one second. The temperature is -100 degrees F., and damage is 6d6, treating all 1s rolled as 2s (6d6, 12-36). The cost is two charges per use. Saving throw vs. wands is applicable.
4 Lightning
B<+5 vs. Jellies, Oozes, Puddings, and Slimes, +6 vs. Acid-using/dwelling creatures, +7 vs. Energy/Life Draining creatures>
Acts as a A<Ring of Insulation|href="Rings.pl#Ring_of_Insulation">.
* STRONG<Shock:> This does 1-10 hit points of damage to a target struck in melee combat, with no saving throw. Characters wearing metal armor and/or shields are treated as armor class 10. Plain leather and wood work normally. Magical bonuses on metal armor do not affect Armor Class, but a ring of protection does. The shock uses one charge.
* STRONG<Lightning strike:> The possessor of the sword can discharge a bolt of lightning that will not rebound. Damage is 6-18 (3d6, treating 1s as 2s), but a saving throw is applicable. This function uses one charge.
* STRONG<Lightning bolt:> The possessor of the sword can discharge a bolt of lightning. The stroke can be either a forked or straight bolt (see wizard spell, lightning bolt). Damage is 12-36 (6d6, treating 1s as 2s), but a saving throw is applicable. This function uses two charges.
* STRONG<Lightning curtain:> A curtain of lightning will appear in front of the wielder. It will do 2d8+6 points of damage (3d8+6 points of damage, to anyone carrying or wearing metal) to anyone who steps through the curtain, treating all 1s rolled as 2s for. The cost is two charges. 
4 Acid
B<+5 vs. Golems, +6 vs. Electricity-using/dwelling creatures, +7 vs. Stone creatures>
Acts as a A<Ring of Sweetness|href="Rings.pl#Ring_of_Sweetness">.
* STRONG<Splash:> This does 2d4 hit points of damage to a target struck in melee combat, with no saving throw.  The acid will corrode armor, weakening it.  If armor is hit, the area hit will lose 1 point to armor class.  The splash uses one charge.
* STRONG<Acid lash:> The possessor of the sword can discharge a stream of acid that can be swept to hit multiple targets.  Damage is 4-16 (4d4, treating 1s as 2s).  This function uses one charge.
* STRONG<Acid bolt:> The possessor of the sword can discharge two balls of acid from the tip of the sword.  Damage is 4-16 (4d4, treating 1s as 2s).  This function uses one charge.
* STRONG<Vitriolic sphere:> A sphere of green acid shoots forth from the tip of the sword and flies towards its target.  The damage is 12-24 (6d4, treating 1s as 2s).  This function uses two charges.
4 Vapor
B<+5 vs. Amorphs, +6 vs. Gas-users and Gaseous creatures, +7 vs. Metal creatures>
Acts as a A<Ring of Solidity|href="Rings.pl#Ring_of_Solidity">.
* STRONG<Scald:> This does 2d4 points of damage to a target struck in melee combat, with no saving throw.  The target will be surrounded by a steaming cloud for 1 round, negating any attacks for the remainder of the round. The scald uses one charge.
* STRONG<Steaming sphere:> The possessor can discharge a steaming sphere 60 feet in diameter up to 60 feet away.  Damage is 8-16 (4d4, treating 1s as 2s).  This function uses one charge.
* STRONG<Incendiary cloud:> The possessor of the sword can discharge a cloud of smoke that is 4,000 cubic feet.  Damage is 12-24 (6d4, treating 1s as 2s).  This function uses two charges.
* STRONG<Steam blast:> The possessor of the sword can discharge a cloud of steam in a cone that is 40 feet long and 10 feet wide.  Damage is 12-36 (6d6, treating 1s as 2s).  This function uses two charges.
3 Safety Sword +2
by Dan Grieg
This is a +2 sword or other weapon. It can be of any make, but most often is a long sword. It was made by a mother who worried about her "little" boy going out into the world and getting hurt. This sword is intelligent. It can usually speak two languages telepathically with the wielder. It will bond with its wielder just like a cursed sword, so it will always return to the wielder and must always be used in a fight. The "voice" is in the most nasal and annoying tone, and it will give tips such as:
* EM<"You shouldn't be drinking you're going to get sick.">
* EM<"You shouldn't be gambling you will lose all your money.">
* EM<"You shouldn't be fighting you could get hurt.">
* EM<"You shouldn't throw me it is bad for the blade.">
3 Dawnsreaver, Vorpal Katana +3
by Johnny Brant
XP Value: 11,000 GP Value: 55,000
An elven sword forged in long ago Myth Drannor, Dawnsreaver is a Vorpal Katana +3 that is constructed of an alloy made from gold and mithral. It is so sharp that it cuts through stone as easily as a dagger cuts through wet paper.
2 Hero Weapon
by Joshua Moore
This is another class of weapons. They contain the soul of a hero who died with them and had their souls bonded to the weapon they carried by enchanters. The weapon is sentient and carries the personality of the soul bonded to it; the real power is in it's combat abilities. A Hero weapon's strength is a reflection of the former strength of the soul inhabiting it. The sword fights of its own volition as long as it's in someone's hand, and its THAC0, regardless of the wielder, is equal to that of the soul in the weapon. Every four levels of the soul adds a +1 bonus to attack rolls (up to a max of +5). So if a fifth level warrior were bonded to a sword, the sword would fight with a natural THAC0 of 16 plus its bonus (+1, which it gained at level four) which makes its THAC0 a 15. If it were a twelfth level warrior, the sword would have a natural THAC0 of 9 plus the +3 bonus for its levels. The Hero weapon also retains all knowledge that the soul within it had at the time of death.
2 Magicbane, Weapon +1
by Joshua Moore
This is actually a type of magic weapon such as a Defender weapon. It can be any sword or axe. All Magicbane weapons are +1 normally but have the unique quality of granting an additional +2 bonus to hit anyone casting magic or to hit a specific magic item. When a magic item is struck by a Magicbane weapon, its magic is nulled for 1d4 rounds, including magic on swords used to parry a Magicbane weapon or armor struck by them. A magic using being in the midst of casting a spell is automatically interrupted and the spell dissolved.
2 Weapons_of_the_Planes
by ^Robert Anderson^
The B<A<Weapons of the Planes|href="Weapons_of_the_Planes.pl">> were created by Robert Anderson with only a little help from me. Mostly these are his creations, I came up with a few of the weapon names and a some of the powers. These weapons have drawbacks which are not listed yet. When you look at them, remember when using these weapons, your character must be willing to pay the price.
2 Weapons of the Munchkin God
Do these really need an explination?
3 Weapon of the Munchkin God
Antistoneskin, Anything, Intelligent, Invisible, Lightweight, Spectral, Unbreakable Weapon of Adaptation; Balance; Breathing; Charming; Clairaudience;  Clairvoyance; Concealed Wizardry; Deceiving; Defending; Deflecting; Detect Good and Evil, Gems, Magic, Metal, Shifting Walls and Rooms, and Slopes; Detection; Disruption; Draining; Enchantment; ESP; Extinguishing; Extra Damage; Find Secret Doors and Traps; Finding; Flame; Flaming; Flying; Forgetfulness; Healing; Hiding; Holding; Illumination; Illusion; Levitation; Lighting; Proficiency; Returning; See Invisible; Silence; Silencing; Slaying; Slicing; Slowing; Specialization; Speed; Speeding; Telekinesis; Telepathy; Teleportation; Translating; Venom; Watching; Wishing; X-Ray Vision with Hilt of Conjuring +5 (+5 vs. Bugs, Constructs, Dragonkind, Enchanted monsters, Giantkind, Lycanthropes, Planar Beings, Regenerating monsters, Reptiles and dinosaurs, Spell-Immune monsters, Spellcasters, Undead, Water-breathing monsters, Weapon-using monsters)
Int: 17 (Speech and Telepathy)
Read languages, maps, and magical writings
If wielded by a non-munchkin it will become an Agoraphobic, Bloodfearer, Brittleblade, Claustrophobic, Narcissistic, Shivering, Uncharged Weapon of Surrender.
3 Sword of the Munchkin God
Dragon, Genie, Giant, Monster, and Undead Slayer; Defender, Everstriking; Fiend, Foe, and Troll's Bane; Flame Tongue; Flaming; Foefinder; Frost Brand; Gemsword; Heart and Soul Seeker; Holy Avenger and Revenger; Luck Blade; Vampiric Regeneration; Vorpal; Warbringer; Sword of Abhorrence of Shape Changers; Charm Person; Cleaving; Cold; Dancing; Dragon, Efreeti, and Giant Slaying; Light; Luck; the Planes; Quickness; Sharpness; Wishes; Wounding +5 (+5 vs. Bugs, Constructs, Dragonkind, Enchanted monsters, Giantkind, Lycanthropes, Planar Beings, Regenerating monsters, Reptiles and dinosaurs, Spell-Immune monsters, Spellcasters, Undead, Water-breathing monsters, Weapon-using monsters)
(Add all the abilities of the Weapon of the Munchkin God.)
