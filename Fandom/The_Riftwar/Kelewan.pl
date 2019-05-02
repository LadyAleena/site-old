#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
2 Races
3 Humans
4 Thuril
The B<Thuril> are similar in appearance to the Tsurani, though they have their own language and customs. An uneasy peace exists between the Tsurani and the Thuril; however the current border has existed for some time.  They are also descended from refugees of the Chaos War, arriving at the same time as the Tsurani.  On their original world they were allied with winged snakes, but these creatures died out and remain only as mythological symbols.
4 Tsurani
The B<Tsurani> are a human race, with elements of Japanese, Korean, Chinese and Aztec cultures.  Their average height is approximately 5 feet; a man of 5'7" is considered tall.  They are descended from a race that fled to Kelewan during the original Chaos Wars. The Tsurani Empire is divided into clans and houses, there are also Great Ones, Tsurani magicians who follow the Greater Path, they belonged to nowhere except the assembly and were outside the law until Mara of the Acoma, whose son was later Emperor of Tsuranuanni, stops them being outside the law.
3 Cho'ja
The B<Cho'ja> are an ant-like race. They can speak both their own language and the language of the Tsurani with whom they are allied. A Cho'ja mine present on Tsurani lands can bring about great trade opportunities from the minerals derived by Cho'ja workers, and new Cho'ja queens often negotiate with Tsurani leaders when deciding where to establish a nest. The Cho'ja originally had magical abilities, though the domination of the Cho'ja by Tsurani magicians drove them underground. The Cho'ja can also make silk of great quality. It is possible to ride a Cho'ja as they have nubs on their lower stomach.
3 Lasura
The B<Lasura>, known as the Thun by the humans of Kelewan, are almost identical to centaurs. They are a nomadic people who inhabited Kelewan before the arrival of the Tsurani and Thuril at the time of the great rift. The Lasura have been driven back to the frozen tundra to the north of Kelewan, however young male Lasura must make a raid once each year and return with one Tsurani head to prove their worth to the herd.
2 Gods
3 Greater powers
* Chochocan - The good god, the healer, the bringer of rest
* Fa - The sleeper, master of the night, the retriever
* Hilbantucan - The architect, the silent builder, the master of works
* Jastur - God of war, bringer of terror, the revenger
* Juran - The just, master of life, god of the home, father of winds, god of justice
* Keburchi - God of chaos
* Lashima - Goddess of the inner light. goddess of wisdom, queen of the sky, mother of birds, builder of clouds
* Oxalaca - The master of oceans, builder of ships, master of fishers
* Sibi - Goddess of death, lover of all, dancer in the darkness
* Thanaxaca - Master of song, lord of the dance, father of the arts
* Zamach - The leveler, the fountain of knowledge, the master of justice
3 Lesser powers
* Alihama - Goddess of travelers
* Baracan - Lord of swords, singer of battle, god of honour
* Hantukama - Goddess of mercy, god of healing, bringer of blessed health, cloud rider
* Hilio - The teacher, master of wisdom, judge of life
* Iskisu - God of trickery and chance
* Juru - Lord of sailors, father of waves, lord of fish
* Kelesha - Goddess of brides, goddess of mercy
* Lulondi - God of farmers
* Milianxana - Goddess of singers, mother of happiness, mistress of wine, goddess of love
* Nictac - Lord of thieves, master of assassins, king of spys, protector of travelers
* Salana - Mistress of rain, harvest mother, mother of beasts, mother of truth
* Tomachca - Bringer of peace, lover of children, protector of orphans
* Turkamu - The red god, the killer god, brother to death, eater of hearts, the silently waiting one
* Tuth - Master of levels, hewer of stone, god of builders, lord of laborers
* Zurgauli - God of ill luck