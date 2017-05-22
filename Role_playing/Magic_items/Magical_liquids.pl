#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magical liquids and oils', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
B<^Robert Anderson^> contributed nearly all of the magical liquids listed on this page. Those not created by him have their credit listed by the item.
2 Bottle of Black Wine
by Johnny Brant
XP Value: 2,000 GP Value: 10,000
This potent magical liquid indicates where magical items of great strength are located while the imbiber is high in the air (flying, on mountain top, the top of a ship's mast, etc.) or looking at a map of any sort. This ability lasts for 10 full years, or until the one magical item this fluid shows the drinker is found. This will function for every member of a group that drinks from the Bottle of Black Wine; otherwise the bottle and the rest of its contents disappear after the end of the fourth day in which it was opened.
2 Elixir of Berserking
This substance appears to all tests to be a potion of Super-Heroism. If imbibed the drinker gains 2 levels, 15 hit points, a +3 to attack and damage rolls, but also goes into a berserk rage attacking all living creatures in sight (including allies). The drinker also gets an AC penalty of 3 but gains a +3 to strength. The drinker attacks all moving living creatures in sight until no one is left standing (dead, unconscious, playing possum, etc). The drinker returns to normal after battle, but will re-enter a berserk state if another battle begins during the elixir's duration. The elixir lasts for 1d10 +5 turns. This elixir is only usable by warriors.
2 Elixir of Trollish Fortitude
The drinker to regenerates at a phenomenal rate, 3 hit points per round; can re-attach a severed limb in 1 round; or even re-grow a severed limb in 1 turn (even if decapitated). The drinker cannot regenerate fire or acid damage, as well as instant death attacks (Death Spell, Finger of Death, etc). This elixir lasts for 2d4 turns.
2 Oil of Anti-Magic
This oil, when applied, makes the user completely immune to all magic, good and bad. No spell, spell-like effect, or magical ability will affect the user. Any magical spell or object that comes in contact with the user is nullified as long as contact is sustained or the oil's duration expires. Spellcasters or creatures with magical abilities cannot use magic while in contact with the oil user. Magically animated creatures (golems, skeletons, etc.) become inanimate while being touched by the oil user. The user can breach magical barriers and wards without harm, as well as open magically locked doors and items. The oil also permanently dispels all magical effects the user is under, both good and bad. The user is also unable to cast spells or use magical items or abilities while the oil is in effect. This oil is extremely rare. There is enough oil in a container to coat 1 man-sized creature for 4 turns.
2 Oil of Bluntness
This grainy oil gives the user partial immunity to slashing and piercing weapons. The user takes half damage and is immune to any special weapon effects of slashing or piercing that involve wounding, maiming, or dismemberment (i.e. Vorpal Blade, Sword of Wounding, etc.). There is enough oil in a container to coat 1 man-sized creature for 6 hours or more creatures for a fraction thereof. This oil will not wear off unless the user is immersed in strong acid.
2 Oil of Displacement
This shiny silver oil, when applied to a creature or object, functions like a Cloak of Displacement (+2 to AC and saving throws, first attack from a creature always misses). There is enough oil in a container to coat 1 man-sized creature for 8 hours or more creatures for a fraction thereof. This oil can only be removed prematurely by immersing the wearer in alcohol or acid.
2 Oil of Protection from Magic Weapons
This oil, when applied, will protect the user from all magical weapons and cold-iron weapons but not silver or non-magical weapons. This oil will not protect the user from weapons made from magic spells or items (i.e. Mordenkainen's Sword, Melf's Acid Arrow, etc.). There is enough oil in a container to protect 1 man-sized creature for 2 hours or more creatures for a fraction thereof.
2 Oil of Protection from Normal Weapons
This oil, when applied, will protect the user from all non-magical and silver weapons, but has no effect against magical or cold-iron weapons. There is enough oil in a container to protect 1 man-sized creature for 2 hours or more creatures for a fraction thereof.
2 Oil of Stone Melding
This grainy oil, when applied, allows the user to step into a solid stone area of equal mass. The user may pass freely into or out of the stone during the oil's duration, The oil can coat a man-sized creature for 1d4 turns. If still in the stone when the oil wears off, the user must save vs. Petrification or die. If the save is successful, the user is expelled from the stone. If killed, only a Wish spell can restore the user to life.
2 Oil of Vulnerability
This oil appears to be a beneficial protective oil when tested. If applied the user becomes incredibly vulnerable to physical attacks suffering double damage from such attacks. In addition the user's AC is worsened by 4 for the duration. This oil lasts for 4 hours unless the user is immersed in strong acid.
2 Potion of Animal Speech
This potion allows the drinker to communicate with animals (normal or giant) for 2d4+4 turns. The animals are not necessarily friendly to the drinker.
2 Potion of Anti-Venom
The drinker has all poisons neutralized, and is protected from poison for 1d6 +3 turns. This potion can also be used to neutralize poison in a dead creature that was slain by poison, bringing it back to life.
2 Potion of Charisma
This powerful potion grants the imbiber 1d6 (Max of 24) additional points of charisma for 6 turns. The drinker gains all of the benefits of the enhanced charisma score. This potion is usable by all classes.
2 Potion of Clumsiness
When imbibed this potion reduces the drinker's dexterity by 1d6 +2 points for 1d6 hours. The drinker suffers all of the effects of reduced dexterity for the duration. This potion appears to be a potion of Dexterity if tested.
2 Potion of Constitution
This powerful potion grants the imbiber 1d6 (Max of 24) additional points of constitution for 6 turns. The drinker gains all of the benefits of the enhanced constitution score including bonus hit points. If the drinker is resurrected during the potion's duration, the drinker does not lose a constitution point unless a system shock against the enhanced constitution score is failed. Then using the actual constitution, the drinker gets a second system shock roll but loses a constitution point by being resurrected. If this potion is used on a dead creature before a resurrection attempt, the creature, if successfully resurrected does not lose a constitution point. This potion is usable by all classes, but only warriors can gain the warrior bonus for hit points.
2 Potion of Dexterity
This powerful potion grants the imbiber 1d6 (Max of 24) additional points of dexterity for 6 turns. The drinker gains all of the benefits of the enhanced dexterity score, including thieving ability bonuses (if the drinker is a thief or bard). This potion is usable by all classes.
2 Potion of Extra Harming
This potion appears to all tests to be a Potion of Extra Healing. If imbibed, it causes 3d8+3 hit points damage to the drinker. This potion is brewed by priestesses of Loviatar (in Forgotten Realms) or by servants of a similar deity of inflicting pain and suffering on other worlds.
2 Potion of Flame
This potion is designed to be thrown, not drunk. If the stopper is opened, the potion acts as if it were thrown. If thrown at a target up to 30' away, the potion explodes into a 6d6 dice Fireball. All creatures within a 20' radius of the target can save vs. spells for half damage, but the target takes full damage.
2 Potion of Flame Aura
This potion causes a fiery nimbus to appear around the drinker for 1d10+4 rounds. The flame aura absorbs all fiery attacks leaving the drinker unharmed. In addition any creature striking the drinker takes 3d8 hp damage from the flame aura (Save vs. spells for half damage). Unfortunately, the potion drinker saves vs. cold based attacks at -2 and suffers double damage from such attacks while protected by the flame aura.
2 Potion of Frost Aura
This potion causes a bluish-white glow to appear around the drinker for 1d10+4 rounds. The frost aura absorbs all cold-based attacks leaving the drinker unharmed. In addition any creature striking the drinker takes 3d8 hp damage from the frost aura (Save vs. spells for half damage). Unfortunately, the potion drinker saves vs. fire based attacks at -2 and suffers double damage from such attacks while protected by the frost aura.
2 Potion of Gullibility
This potion reduces the drinker's wisdom by 1d6+2 points for 1d6 hours. The drinker suffers all of the effects of reduced wisdom for the duration including chance of spell failure due to lowered wisdom. This potion appears to be a potion of Wisdom if tested.
2 Potion of Harming
This potion appears to all tests to be a potion of healing. However it causes 1d8+1 hit points damage to the drinker. This potion is brewed by priestesses of Loviatar (in Forgotten Realms) or by servants of a similar deity of inflicting pain and suffering on other worlds.
2 Potion of Infravision
This potion grants the imbiber infravision out to a 60' range. This potion only works for creatures that do not already possess infravision. This potion lasts 3d4 hours.
2 Potion of Insatiable Hunger and Thirst
This potion causes the drinker to become ravenously hungry and thirsty. The drinker will tear into any rations, ignoring everything else, even dropping everything held in order to eat. If no food is immediately available, the drinker will attack any creatures within sight in order to kill and eat them. After eating for 1 round, the drinker is entitled to a saving throw vs. spell on each successive round until success. At that point hunger is satisfied. This potion appears to all tests to be a Potion of Vitality.
2 Potion of Intelligence
This powerful potion grants the imbiber 1d6 (Max of 24) additional points of intelligence for 6 turns. The drinker gains all of the benefits of the enhanced intelligence score, except for spell learning percentages and mage spell level. This potion is usable by all classes.
2 Potion of Invincibility
This potion makes the drinker immune to all forms of damage for 2d4 rounds. Only divine creatures and artifacts can harm the drinker while the potion is in effect.
2 Potion of Iron Skin
This potion turns the drinkers skin as hard as iron, granting an AC of 0 and half damage from blunt weapons. Unfortunately the potion also stiffens the drinker's movements resulting in a dexterity penalty of -3. This potion will not work on anyone wearing armor but will work with magical protective devices. When the potion wears off, the drinker must save vs. polymorph or take 2d8 damage as the skin returns to normal.
2 Potion of Magic Resistance
This potion grants the drinker a 5% to 40% (1d8×5) magic resistance. If the drinker already has magic resistance through item or race, the effects are cumulative up to 100% magic resistance. This potion lasts 1d4 turns.
2 Potion of Mental Fortitude
This potion makes the imbiber totally immune to all spells from the Illusion/Phantasm and Enchantment/Charm schools, as well as the Clairsentient, Meta-Psionic, and Telepathic Psionic disciplines for 1d10 +4 turns.
2 Potion of Mental Prowess
This potion is only useable by psionicists or spellcasters. A psionicist instantly regains half of his / her PSPs for 1d6+2 turns upon drinking the potion. A spellcaster can recall a previously cast spell upon drinking the potion. The recalled spell must be cast within 1d6+2 turns, or it is lost from memory.
2 Potion of Mental Refreshment
This potion is only useable by a psionicist or spellcaster. A psionicist is restored to full PSPs upon drinking, and a spellcaster is allowed to memorize spells without the requisite 8 hours of sleep. Note: this potion does not nullify a spellcaster's or psionicist's need for sleep, just allowsing them to use their powers again without getting any rest.
2 Potion of Petrification
This potion causes the drinker to turn to a statue unless a save vs. Petrification at -2 is made. This potion appears to be a Potion of Stoneskin if identified.
2 Potion of Plant Speech
This potion allows the drinker to communicate with plants for 2d4+4 turns.
2 Potion of Poison Breath
This deadly potion allows the drinker to breathe out a 20' cube to poison gas similar to a Cloudkill spell that can be breathed up to 30' away. Any living creature caught in the cloud must save vs. poison at -2 or die. The cloud lasts for 1d3 rounds unless dispersed by any wind higher than 20 mph. The drinker of this potion is not immune to the poison gas. The drinker must breathe out the cloud within 1 turn of drinking the potion. There is a 50% chance that the drinker expels the cloud involuntarily. The drinker is allowed a constitution check to breathe the cloud where desired, otherwise the cloud is centered on the drinker. If the drinker does not breathe out the cloud involuntarily, a save vs. poison must be made at -6. If the save is failed the drinker is slain by the poison. Even if the save is made, the drinker takes 3d10 damage from the poison. Excessive use of this potion is not considered a good act.
2 Potion of Quickling Speed
This potion grants the drinker extreme speed and dexterity. The drinker can move at 4 times normal movement rate and has 4 times as many physical attacks. The drinker also gains a dexterity of 22 with all bonuses associated with it. This potion ages the drinker 5 years and lasts for 1d4 turns.
2 Potion of Reading
This potion allows the drinker to read any written message seen including magical writing. The potion does not grant the drinker understanding of what is read however. The potion lasts for 2d4 +4 turns.
2 Potion of Sickness
This potion reduces the drinker's constitution by 1d6+2 points for 1d6 hours. The drinker suffers all of the effects of reduced constitution for the duration including loss of hit points. This potion appears to be a potion of Constitution if tested.
2 Potion of Spell Stealing
This potion forces the drinker to save vs. spells at -2 or forget all memorized spells. All spells can be regained through re-memorization or by a Wish spell. A Necklace of Memory Enhancement gives the drinker a +4 bonus to the save. A saving throw bonus for high wisdom also applies to the save. This potion appears to be a potion of Mental Prowess to all tests.
2 Potion of Stone to Flesh
This powerful potion when poured on a petrified creature will restore it to a fleshy state (system shock roll still applies). This potion can also be used as a weapon against creatures made of stone or someone under the influence of a Stoneskin spell or Statue spell. If used against a stone creature, the potion must be thrown at the creature (attack roll required) and the target must save vs. polymorph or have its AC worsened by 5 and become vulnerable to all weapons for 2d8 rounds. If the potion is used against a target under the influence of a Stoneskin or Statue spell, a hit instantly nullifies the spell (No save).
2 Potion of Stoneskin
This potion protects the drinker from 1d4 +4 physical attacks exactly like the 4th level wizard spell Stoneskin. If not removed earlier, the protection lasts up to 24 hours.
2 Potion of Strength
This powerful potion grants the imbiber 1d6 (Max of 24) additional points of strength for 6 turns. The drinker gains all of the benefits of the enhanced strength score. This potion is usable by all classes.
2 Potion of Stupidity
This potion reduces the drinker's intelligence by 1d6+2 points for 1d6 hours. The drinker suffers all of the effects of reduced intelligence for the duration including the loss of spell access due to lowered intelligence. This potion appears to be a Potion of Intelligence if tested.
2 Potion of Sweetness
by Joshua Moore
This potion is a blaze orange liquid with the consistency of cooking oil. It has a very sweet to taste and will heal all hit points, no matter how many, with one dose. There are two doses to a flask. After drinking it the imbiber becomes extremely docile and agreeable, unable to attack anything, grow angry for any reason, will not defend himself, or grow excited or agitated. All the drinker will do is smile, be friendly, and relax; but may be upset and inwardly be raging, but externally will not show it at all. The drinker will constantly say "Sweet!" if asked for an opinion on something.
2 Potion of Tongues
This potion allows the drinker to speak with and understand all intelligent creatures within 60' for 2d6 hours.
2 Potion of Ugliness
This potion reduces the drinkers charisma by 1d6+2 points for 1d6 hours. The drinker suffers all of the effects of reduced charisma for the duration. This potion appears to be a Potion of Charisma if tested.
2 Potion of Weakness
This potion reduces the drinkers strength by 1d6+2 points for 1d6 hours. The drinker suffers all of the effects of reduced strength for the duration. This potion appears to be a Potion of Strength if tested.
2 Potion of Wisdom
This powerful potion grants the imbiber 1d6 (Max of 24) additional points of wisdom for 6 turns. The drinker gains all of the benefits of the enhanced wisdom score, except it will not allow priests to memorize extra spells gained by a higher wisdom. This potion is usable by all classes.
2 Potion of Wraithfrom
This potion turns the drinker and all gear carried insubstantial. The drinker is immune to non-magical weapons but cannot attack any other creatures unless they are in the ethereal plane. Undead will believe the drinker is a Wraith or Spectrer and ignore the drinker. The drinker can fit through small holes and the like with ease. This potion lasts for 1 turn.
