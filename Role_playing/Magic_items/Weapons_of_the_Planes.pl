#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
by Robert Anderson and me
Mostly these are Robert's creations, I came up with a few of the weapon names and a some of the powers. These weapons have drawbacks which are not listed yet. When you look at them, remember when using these weapons, your character must be willing to pay the price.
2 Elemental Weapons
3 Inferno: The Fire Long Sword
Long Sword +5, +10 vs. Water Creatures
* STRONG<Major powers:> Meteor Swarm (1 × week), Conjure Fire Elemental (16 HD, 1 × day), Delayed Blast Fireball (2 × day)
* STRONG<Minor powers:> Fire Shield (3 × day), Fireball (3 × day), Flame Arrow (3 × day), Fire Burst (5 × day), Heat Metal (5 × day)
* STRONG<Constant powers:> The wielder is immune to Fire, and can sense Water creatures within a 60' radius
3 Earthquake: The Earth Maul
Maul +5, +10 vs. Air Creatures
* STRONG<Major powers:> Earthquake (1 × week), Conjure Earth Elemental (16 HD, 1 × day), Iron Body (1 × day)
* STRONG<Minor powers:> Wall of Stone (3 × day), Transmute Rock to Mud / Mud to Rock (3 × day), Stoneskin (3 × day), Meld into Stone (3 × day), Strength of Stone (5 × day)
* STRONG<Constant powers:> The wielder is immune to Earth attacks, and can sense Air creatures within a 60' radius
3 Tornado: The Air Spear
Spear +5, +10 vs. Earth Creatures
* STRONG<Major powers:> Whirlwind (1 × week), Conjure Air Elemental (16 HD, 1 × day), Suffocate (1 × day)
* STRONG<Minor powers:> Wind Wall (3 × day), Fly (3 × day), Wind Servant (3 × day), Stinking Cloud (5 × day), Lance of Disruption (3 × day)
* STRONG<Constant powers:> The wielder is immune to Air attacks, and can sense Earth creatures within a 60' radius
3 Tsunami: The Water Trident
Trident +5, +10 vs. Fire Creatures
* STRONG<Major powers:> Tsunami (1 × week), Conjure Water Elemental (16 HD, 1 × day), Acid Storm (1 × day)
* STRONG<Minor powers:> Part Water (3 × day), Vile Venom (3 × day), Vitriolic Sphere (3 × day), Watery Double (5 × day), Insatiable Thirst (5 × day)
* STRONG<Constant powers:> The wielder is immune to Water attacks, and can sense Fire creatures within a 60' radius
2 Para-Elemental Weapons
3 Frostbite: The Ice Short Sword
Short Sword +3, +6 vs. Fire and Earth Creatures
* STRONG<Major powers:> Otiluke's Freezing Sphere (1 × day), Cone of Cold (1 × day)
* STRONG<Minor powers:> Ice Storm (3 × day), Chill Shield (3 × day), Snilloc's Snowballs (5 × day)
* STRONG<Constant powers:> ½ damage from Air and Water attacks, sense Fire and Earth creatures in a 30' radius
3 Volcano: The Magma Mace
Mace +3, +6 vs. Air and Water Creatures
* STRONG<Major powers:> Transmute Rock to Magma / Magma to Rock (1 × day), Wall of Magma (1 × day)
* STRONG<Minor powers:> Melf's Minute Meteors (3 × day), Flaming Sphere (3 × day), Magma Missile (5 × day)
* STRONG<Constant powers:> ½ damage from Fire and Earth attacks, sense Air and Water creatures in a 30' radius.
3 Sludge: The Ooze Dagger
Dagger +3, +6 vs. Fire and Air Creatures
* STRONG<Major powers:> Transmute Rock to Mud / Mud to Rock (1 × day), Wall of Ooze (1 × day)
* STRONG<Minor powers:> Ooze Ball (3 × day), Watery Double (3 × day), Create Ooze (3 × day)
* STRONG<Constant powers:> ½ damage from Water and Earth attacks, sense Fire and Air creatures in a 30' radius
3 Asphyxiator: The Smoke Flail
Flail +3, +6 vs. Earth and Water Creatures
* STRONG<Major powers:> Suffocate (1 × day), Death Fog (1 × day)
* STRONG<Minor powers:> Wall of Smoke (3 × day), Stinking Cloud (3 × day), Pyrotechnics (5 × day)
* STRONG<Constant powers:> ½ damage from Fire and Air attacks, sense Water and Earth creatures in a 30' radius
2 Quasi-Elemental Weapons
3 Shocker: The Lightning Dagger
Dagger +2, +4 vs. Earth and Undead Creatures
* STRONG<Major power:> Chain Lightning (1 × day)
* STRONG<Minor powers:> Lightning Bolt (3 × day), Shocking Grasp (5 × day, on hit)
* STRONG<Constant power:> +4 save vs. Air attacks
3 Imploder: The Vacuum QuarterStaff
QuarterStaff +2, +4 vs. Earth and Living Creatures
* STRONG<Major power:> Implode (1 × day, on hit)
* STRONG<Minor powers:> Destroy Air (3 × day), Vacuum Ball (3 × day)
* STRONG<Constant power:> +4 save vs. Air attacks
3 Decapitator: The Mineral Long Sword
Long Sword +2, +4 vs. Air and Undead Creatures
* STRONG<Major power:> Functions as a +2 Vorpal Blade
* STRONG<Minor powers:> Spike Stones (3 × day), Stone Lance (3 × day)
* STRONG<Constant power:> +4 save vs. Earth Attacks
3 Disintegrator: The Dust Mace
Mace +2, +4 vs. Air and Living Creatures
* STRONG<Major power:> Disintegrate (1 × day)
* STRONG<Minor powers:> Transmute Rock to Dust (3 × day), Dust Devil (5 × day)
* STRONG<Constant power:> +4 save vs. Earth attacks
3 Scalder: The Steam Spear
Spear +2, +4 vs. Fire and Undead Creatures
* STRONG<Major power:> Cone of Steam (1 × day)
* STRONG<Minor powers:> Wall of Fog (5 × day), Steam Spray (5 × day)
* STRONG<Constant power:> +4 save vs. Water attacks
3 Agonizer: The Salt Scourge Whip
Scourge Whip +2, +4 vs. Fire and Living Creatures
* STRONG<Major power:> Stun target on a successful hit for 1d4 rounds from excessive pain (save vs. poison avoids). Multiple hit effects are cumulative. This power functions constantly
* STRONG<Minor powers:> Destroy Water (5 × day), Insatiable Thirst (5 × day)
* STRONG<Constant power:> +4 save vs. Water attacks
3 FlashBurn: The Radience Scimitar
Scimitar +2, +4 vs. Water and Undead Creatures
* STRONG<Major power:> Sunray (1 × day)
* STRONG<Minor powers:> Continual Light (3 × day), SunScorch (5 × day, No sunlight needed)
* STRONG<Constant power:> +4 save vs. Fire attacks
3 Debilitator: The Ash Flail
Flail +2, +4 vs. Water and Living Creatures
* STRONG<Major power:> Wither (1 × day, as per Staff of Withering with 3 charges expended)
* STRONG<Minor powers:> Chill Touch (5 × day, on flail), Paralysis (as per Wand of Paralyzation, 3 × day)
* STRONG<Constant power:> +4 save vs. Fire Attacks
2 Astral and Ethereal Weapons
3 ShadowStaff: The Ethereal QuarterStaff
QuarterStaff +3
* STRONG<Major powers:> Plane Shift (1 × day), Duo-Dimension (1 × day)
* STRONG<Minor powers:> Etherealness (3 × day), Detect Phase (5 × day), Dimension Door (3 × day)
* STRONG<Constant power:> Functions as a Blur spell when wielded
3 ChronoFlow: The Astral QuarterStaff
QuarterStaff +3
* STRONG<Major powers:> Astral Spell (1 × day), Time Stop (1 × day)
* STRONG<Minor powers:> Repeat Action (3 × day), Know Time (5 × day), Speak With Astral Traveler (5 × day)
* STRONG<Constant powers:> Subjective time flows at 1/1000 (1 day = 1000 years) for the wielder as long as the staff is possessed. The wielder is also immune to magical aging. Also, any potions ingested by the wielder are permanent as long as the staff is possessed
2 Energy Plane Weapons
3 DeathBane: The Positive Material Mace
Mace +5, +10 vs. Undead
* STRONG<Major powers:> Resurrection (1 × day), Regenerate (1 × day), Restoration (1 × day)
* STRONG<Minor powers:> Heal (2 × day), Cure Critical Wounds (3 × day), Remove Curse (3 × day), Cure Disease (3 × day), Cure Blindness or Deafness (3 × day)
* STRONG<Constant powers:> Acts as a Ring of Rapid Regeneration (1 hp healed per round) when wielded
3 LifeBane: The Negative Material Mace
Mace +5, +10 vs. Living Creatures
* STRONG<Major powers:> Destruction (1 × day), Wither (1 × day), Energy Drain (1 × day)
* STRONG<Minor powers:> Harm (2 × day), Cause Critical Wounds (3 × day), Bestow Curse (3 × day), Cause Disease (3 × day), Cause Blindness or Deafness (3 × day)
* STRONG<Constant powers:> Acts as a Ring of Vampiric Regeneration when wielded
2 Lower Planes Weapons
3 Dark Wind: The Pandemonium Military Fork
Military Fork +3, +6 vs. Lawful Good Creatures
* STRONG<Major powers:> Uncontrolled Weather (1 × day), Wail of the Banshee (1 × day)
* STRONG<Minor powers:> Inverted Ethics (3 × day), Shout (3 × day), Wind Wall (3 × day)
* STRONG<Constant powers:> The wielder is immune to wind-based spells and sonic attacks. If the wielder is not Evil and attempts to use Dark Wind's powers, the wielder must save vs. Spells or be deafened. If the wielder is Lawful Good and picks up Dark Wind, the wielder must save vs. Death Magic at a -5 penalty or be instantly slain. Only a Chaotic Evil creature can use Dark Wind's major powers, all other non-good creatures can only use the minor and constant powers
3 Eviscerater: The Abyss Long Sword
Long Sword +3, +6 vs. Lawful Good Creatures
* STRONG<Major powers:> Acts as a Sword of Sharpness (continuous), Gate in 1d8 lesser Tanar'ri (1 × day)
* STRONG<Minor powers:> Chaotic Combat (3 × day), Unluck (3 × day), Phantasmal Killer (3 × day)
* STRONG<Constant powers:> The wielder is immune to slashing attacks. If the wielder is not Evil and attempts to use Eviscerater's powers, the wielder must save vs. Spells or be burned for 5d10 points of damage. If the wielder is Lawful Good and picks up Eviscerater, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Chaotic Evil creature can use Eviscerater's major powers, all other non-good creatures can only use the minor and constant powers
3 Blood Light: The Carceri Broad Sword
Broad Sword +3, +6 vs. Lawful Good Creatures
* STRONG<Major powers:> Acts as a Sword of Wounding (continuous), Sphere of Ultimate Destruction (1 × day)
* STRONG<Minor powers:> Domination (3 × day), Fire Charm (3 × day), Vampiric Touch (3 × day)
* STRONG<Constant powers:> The wielder is immune to bludgeoning attacks. If the wielder is not Evil and attempts to use Blood Light's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Lawful Good and picks up Blood Light, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Chaotic Evil creature can use Blood Light's major powers, all other non-good creatures can only use the minor and constant powers
3 Tormentor: The Hades Whip
Whip +3, +6 vs. Neutral Good Creatures
* STRONG<Major powers:> Abi-Dalzim's Horrid Wilting (1 × day), Symbol of Pain (1 × day)
* STRONG<Minor powers:> Ray of Enfeeblement (3 × day), Bone Blight (3 × day), Brainkill (3 × day)
* STRONG<Constant powers:> The wielder is immune to pain spells and attacks. If the wielder is not Evil and attempts to use Tormentor's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Neutral Good and picks up Tormentor, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Neutral Evil creature can use Tormentor's major powers, all other non-good creatures can only use the minor and constant powers
3 Combuster: The Gehenna Short Sword
Short Sword +3, +6 vs. Neutral Good Creatures
* STRONG<Major powers:> Acts as a Flame Tongue (continuous), Meteor Swarm (1 × day)
* STRONG<Minor powers:> Fireball (3 × day), Wall of Fire (3 × day), Flame Arrow (3 × day)
* STRONG<Constant powers:> The wielder is immune to fire. If the wielder is not Evil and attempts to use Combuster's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Neutral Good and picks up Combuster, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Neutral Evil creature can use Combuster's major powers, all other non-good creatures can only use the minor and constant powers
3 Torturer: The The Nine Hells Military Fork
Military Fork +3, +6 vs. Chaotic Good Creatures
* STRONG<Major powers:> Trap the Soul (1 × day), Energy Drain (1 × day)
* STRONG<Minor powers:> Fear (3 × day), Feeblemind (3 × day), Solvent of Corrosion (3 × day)
* STRONG<Constant powers:> The fork acts as a ring of Mind Shielding when wielded. If the wielder is not Evil and attempts to use Torturer's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Chaotic Good and picks up Torturer, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Lawful Evil creature can use Torturer's major powers, all other non-good creatures can only use the minor and constant powers
3 Tyrant's Hand: The Acheron Long Sword
Long Sword +3, +6 vs. Chaotic Good Creatures
* STRONG<Major powers:> Mass Domination  (1 × day), Mass Charm (1 × day)
* STRONG<Minor powers:> Domination (3 × day), Confusion (3 × day), Suggestion (3 × day)
* STRONG<Constant powers:> The wielder is immune to Charm-type Spells. If the wielder is not Evil, and attempts to use Tyrant's Hand's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Chaotic Good and picks up Tyrant's Hand, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Lawful Evil creature can use Tyrant's Hand's major powers, all other non-good creatures can only use the minor and constant powers
2 Upper Planes Weapons
3 The Reaper: The Arcadia Scythe
Scythe +3, +6 vs. Chaotic Evil Creatures
* STRONG<Major powers:> Wall of Thorns (1 × day), Creeping Doom (1 × day)
* STRONG<Minor powers:> Hold Monster (3 × day), Locate Creature (3 × day), Hold Person (3 × day)
* STRONG<Constant powers:> The wielder is immune to Plant spells. If the wielder is not Good and attempts to use The Reaper's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Chaotic Evil and picks up The Reaper, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Lawful Good creature can use The Reaper's major powers, all other non-evil creatures can only use the minor and constant powers
3 Illuminator: The Mount Celestia War Hammer
War Hammer +3, +6 vs. Chaotic Evil Creatures
* STRONG<Major powers:> Blade Barrier (1 × day), Iron Body (1 × day)
* STRONG<Minor powers:> Defensive Harmony (3 × day), Strength of One (3 × day), Dismissal (3 × day)
* STRONG<Constant powers:> The wielder is immune to Chaos magic. If the wielder is not Good and attempts to use Illuminator's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Chaotic Evil and picks up Illuminator, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Lawful Good creature can use Illuminator's major powers, all other non-evil creatures can only use the minor and constant powers
3 Endurer: The Bytopia Club
Club +3, +6 vs. Neutral Evil Creatures
* STRONG<Major powers:> Control Weather (1 × day), Intensify Nature (1 × day)
* STRONG<Minor powers:> Pass Plant (3 × day),  Control Temperature 10' (3 × day), Spike Growth (3 × day)
* STRONG<Constant powers:> The wielder is immune to weather magic. If the wielder is not Good and attempts to use Endurer's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Neutral Evil and picks up Endurer, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Neutral Good creature can use Endurer's major powers, all other non-evil creatures can only use the minor and constant powers
3 Finder: The Elysium Dagger
Dagger +3, +6 Neutral Evil Creatures
* STRONG<Major powers:> Foresight (1 × day), Find the Path (1 × day)
* STRONG<Minor powers:> True Seeing (3 × day), Locate Creature (3 × day), Locate Object (3 × day)
* STRONG<Constant powers:> The wielder is immune to Scrying magic. If the wielder is not Good and attempts to use Finder's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Neutral Evil and picks up Finder, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Neutral Good creature can use Finder's major powers, all other non-evil creatures can only use the minor and constant powers
3 Soul of the Beast: The Beastlands Short Bow
Short Bow +3, +6 vs. Lawful Evil Creatures
* STRONG<Major powers:> Anti-Animal Shell (1 × day), Arrow of Bone (1 × day)
* STRONG<Minor powers:> Insect Plague (3 × day),  Call Woodland Beings (3 × day), Flame Arrow (3 × day)
* STRONG<Constant powers:> The wielder is immune to ALL missile weapons. If the wielder is not Good and attempts to use Soul of the Beast's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Lawful Evil and picks up Soul of the Beast, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Chaotic Good creature can use Soul of the Beast's major powers, all other non-evil creatures can only use the minor and constant powers
3 Joy Bringer: The Arborea Short Sword
Short Sword +3, +6 vs. Lawful Evil Creatures
* STRONG<Major powers:> Antipathy - Sympathy (1 × day), Mass Charm (1 × day)
* STRONG<Minor powers:> Seeming (3 × day), Emotion (3 × day), Lightning Bolt (3 × day)
* STRONG<Constant powers:> The wielder is immune to Emotion Magic. If the wielder is not Good and attempts to use Joy Bringer's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Lawful Evil and picks up Joy Bringer, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Chaotic Good creature can use Joy Bringer's major powers, all other non-evil creatures can only use the minor and constant powers
3 Berserker: The Ysgard War Hammer
War Hammer +3, +6 vs. Lawful Evil Creatures
* STRONG<Major powers:> Functions as a Cursed Beserking Sword against enemies only, Iron Body (1 × day)
* STRONG<Minor powers:> Tenser's Destructive Resonance (3 × day), Chaotic Combat (3 × day), Random Causality (3 × day)
* STRONG<Constant powers:> The wielder is immune to Fear attacks and spells. If the wielder is not Good and attempts to use Berserker's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Lawful Evil and picks up Berserker, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Chaotic Good creature can use Berserker's major powers, all other non-evil creatures can only use the minor and constant powers
2 Neutral Planes Weapons
3 Order: The Mechanus Crossbow
Crossbow +3, +6 vs. Chaotic Creatures
* STRONG<Major powers:> Mordenkainen's Disjunction (1 × day), Legal Thoughts (1 × day)
* STRONG<Minor powers:> Impending Permission (3 × day), Compulsive Order (3 × day), Rigid Thinking (3 × day)
* STRONG<Constant powers:> The wielder is immune to Chaotic magic and magical attacks by Chaotic creatures. If the wielder is not Lawful and attempts to use Order's powers, the wielder must save vs. Spells or be burned for 5d10 damage. If the wielder is Chaotic and picks up Order, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a Lawful Neutral creature can use Order's major powers, all other non-evil creatures can only use the minor and constant powers
3 Mirror: The Outlands Chakram
Chakram +3, +6 vs. Non-Neutral Creatures
* STRONG<Major powers:> Time Stop (1 × day), Spell Turning (1 × day)
* STRONG<Minor powers:> Antimagic Shell (3 × day), Weather Stasis (3 × day), Choose Future (3 × day)
* STRONG<Constant powers:> The wielder is immune to all Non-Neutral magic and magical attacks from Non-Neutral creatures. If a Non-Neutral creature picks up Mirror, the wielder must save vs. Death Magic at a -5 penalty or be disintegrated. Only a True Neutral creature can use Mirror's powers
3 Chaos: The Limbo Chaos Weapon
Chaos Weapon +3, +6 vs. Lawful Creatures
* STRONG<powers:> Chaos has no set powers and randomly changes its shape. Even if the user does not will it, Chaos will randomly spit out powers. It IS pure chaos
2 Demiplane Weapons
3 Twilight: The Shadow Dagger
Dagger +2, +4 vs. vs. Energy Creatures
* STRONG<Major power:> Shadow Walk (1 × day)
* STRONG<Minor powers:> Evard's Black Tentacles (3 × day), Wall of Gloom (3 × day)
* STRONG<Constant powers:> It enables wielder to see in the dark as if it were daylight
3 Metal Master: The Electromagnetism Flail
Flail +2, +4 Stone Creatures
* STRONG<Major power:> Reverse Gravity (1 × day)
* STRONG<Minor powers:> Superior Magnetism (2 × day), Avoidance (2 × day)
* STRONG<Constant powers:> The wielder is affected as if wearing a Ring of Free Action
3 Vortex: The Time Quarterstaff
Quarterstaff +2, +4 vs. Undead Creatures
* STRONG<Major power:> Time Stop (1 × day)
* STRONG<Minor powers:> Haste (3 × day), Age Creature (2 × day)
* STRONG<Constant powers:> The wielder is immune to aging effects and does not age naturally
3 Banisher: The Imprisonment Whip
Whip +2, +4 vs. Extraplanear Creatures
* STRONG<Major power:> Imprisonment (1 × day)
* STRONG<Minor powers:> Flesh to Stone (2 × day), Polymorph Other (3 × day)
* STRONG<Constant powers:> The wielder is immune to petrification, polymorph, and imprisonment magic
3 Heart of Darkness: The Ravenloft Long Sword
Long Sword +5
* STRONG<Major power:> Wish (1 × day) Wish is always twisted to cause the most suffering
* STRONG<Minor powers:> Control Undead (3 × day), Enervation (3 × day)
* STRONG<Constant powers:> Functions as a Vorpal Blade / Sword of Life Stealing
