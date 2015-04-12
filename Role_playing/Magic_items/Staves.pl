#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magical staves', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
2 Staff +2, of Summoning
This staff is the perfect tool for a Conjurer since it summons creatures to aid its wielder if the wielder happens to be a Conjurer. If wielded by a normal wizard, it will function as a normal +2 staff and allow only 2 charges to be used at any given time. If wielded by a non-wizard, it will only function as a +2 staff. The powers of the staff are:
*| charges
* ^No charges^ Summon Swarm
* ^One charge^ Monster Summoning I
* ^Two charges^ Monster Summoning II, Summon Lycanthrope
* ^Three charges^ Conjure Elemental, Monster Summoning III, Summon Shadow
* ^Four charges^ Monster Summoning IV
* ^Five charges^ Monster Summoning V
* ^Six charges^ Monster Summoning VI
* ^Seven charges^ Monster Summoning VII
See ^magic items of the specialist^ for more about this staff.
2 Staff +2, of Transmutation
This staff has a +2 to attacks and damage when wielded by a Transmutter and adds a +1 to save vs. Abjuration spells. If wielded by a non-Transmutter, it will not give the protection against Alteration spells. It also has these powers:
*| charges
* ^One charge^ Blink or Slow (save vs. Spells)
* ^Two charges^ Polymorph Other (save vs. Polymorph)
See ^magic items of the specialist^ for more about this staff.
2 Staff of Lightning
This Staff protects the wielder from electrical attacks until all the charges are drained, then it becomes a normal staff, and functions like the following wizard spells:
*| charges
* ^One charge^ B<Shocking Grasp> (1d8+12 points of damage)
* ^Two charges^ B<Lightning Strike> (6d6 points of damage with no chance of rebound)
* ^Two charges^ B<Lightning Curtain> A curtain of lightning will appear in front of the wielder. 2d8+12, 3d8+12 for anyone carrying or wearing metal, points of damage to anyone who steps through the curtain.
* ^Three charges^ B<Lightning Bolt> (12d6 points of damage)
* ^Three charges^ B<Lightning Lash> (12d6 points of damage with more accuracy than a lightning bolt)
* ^Four charges^ B<Lightning Storm> A storm of lightning will appear, and anyone in a 70' diameter sphere will take 6d12 points of damage.
* ^Five charges^ B<Lightning Ring> A ring of lightning will surround the wielder and will discharge lightning bolts in one of three ways as listed below with each bolt doing 8d6 points of damage, and the ring will protect the wielder during this time from lightning attacks.
br
* 2 lightning bolts per round for 4 rounds
* 4 lightning bolts per round for 2 rounds
* 8 lightning bolts in one round
The staff can be recharged.
2 Staff of Property Protection
This Staff can function like the following wizard spells:
*| charges
* ^One charge^ B<Leomund's Trap> creates a false trap.
* ^Two charges^ B<Lesser Sign of Sealing> seals a door or container, when broken sets of a spell of the wielder's choice. The spell must be in the wielder's spellbook. This Sign can be dispelled.
* ^Three charges^ B<Fire Trap> traps a door or container that does 1d4+12 points of damage when broken.
* ^Four charges^ B<Greater Sign of Sealing> acts like the Lesser Sign, except that this effect can not be dispelled.
* ^Five charges^ B<Guards and Wards> (See the spell.)
* ^Six charges^ B<Incendiary Entrapment> covers a 10'×10' area of flooring and does 14d4 points of damage.
The Staff must be left in the space or near the item being protected. Once the Staff is removed, the effect, used or not, is negated.
