#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
These are the special abilities (and restrictions) of some of the other races which can be played in AD&D 2nd Edition.
2 Elf
3 High elf
* 90% resistant to sleep/charm
* 60' infravision
* +1 to attack with bows and long & short swords
|+ Notice concealed doors|1 on a d6
|+ Find secret doors|1-2 on a d6
|+ Locating secret doors|1-3 on a d6
3 Grey elf
* -3 reaction adj./non-elves
* -1 reaction adj./elves
Also the special abilities of high elves.
3 Half-elf
* 30% resistant to sleep/charm
* 60' infravision
|+ Notice concealed doors|1 on a d6
|+ Find secret doors|1-2 on a d6
|+ Locating secret doors|1-3 on a d6
2 Dwarf
3 Mountain dwarf
* +1 to hit: orcs, half-orcs, goblins, hobgoblins
* infravision	60 ft.
|+ Detect grade or slope|1-5 on d6
|+ Detect new construction|1-5 on d6
|+ Detect sliding/shifting walls|1-4 on d6
|+ Detect stonework traps|1-3 on d6
|+ Detect stonework pits|1-3 on d6
|+ Detect stonework dead falls|1-3 on d6
|+ Determine approximate depth|1-3 on d6
2 Gnome
* 20% chance of magic item failure
* +1 to hit goblins or kobolds
* infravision 60'
|+ Detect grade or slopeSUP<1>|1-5 on d6
|+ Detect unsafe walls, ceilings or floorsSUP<1>|1-7 on d10
|+ Determine approximate depth undergroundSUP<1>|1-4 on d6
|+ Determine approximate direction undergroundSUP<1>|1-3 on d6
SMALL<SUP<1> within 10'>
2 Chaos elemental-kin
* turn gaseous at will as a random gas type
* fly at will for 1d4 hours
See the A<monster description|href="../Monsters/index.pl?monster=Chaos+elemental-kin"> for more.
2 Faerie dragon
* breath weapon: euphoria gas
* invisibility at will
* 5% magic resistance per level
2 Sylph
* fly (36 A)
* invisibility at will
* levitate (constant)
* summon air elemental at 7th level (1HD/2 levels after 7th)
* 5% magic resistance per level
