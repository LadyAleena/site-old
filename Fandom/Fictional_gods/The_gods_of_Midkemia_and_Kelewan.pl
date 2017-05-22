#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
The gods created by A<Raymond E. Feist|href="../../Collections/Fiction.pl#Raymond_E._Feist">.
2 Midkemia
3 Greater powers
* Ishap - The balancer
* Abram-Sev - The giver of laws, the thunderer
* Ev-Dem - The worker from within, the calculator of odd
* Graf - The weaver of wishes
* Helbinor - The abstainer
* Arch-Indar - the goddess of good
* Nalar - The god of evil
3 Lesser powers
* Astalon, also known as Ynothanos - The just, the builder
* Ban-ath, also known as Dav-lu - The artful dodger, the prankster, the night walker, the silent thief of precious commodities
* Dala, also known as Indarna - Shield of the weak, goddess of passive strength, the protector
* Guis-wa, also known as Fimbulstarn - The bayer after the moons, the red-jawed hunter, the reveller in forbidden knowledge, the wanter of all things
* Ka-hooli, also known as Albar - The howler after fugitives, the tireless pursuer, the warrior god of vengeance, the unraveller of mysteries into truth
* Kilian, also known as Ka-Ya-taha - The singer of green silences, the gatherer of quiet pleasures, the goddess of love
* Lims-Kragma, also known as Zandros - The drawer of nets, The mistress of death
* Prandur, also known as Jehan-suz - The burner of cities, the spreader of confusion, the light bringer
* Ruthia, also known as Ilyandros - The dancer through men's hearts, the goddess of loved scorned, the lady of luck
* Silban, also known as Ma-wan-ta - The earth mother, the bringer of harvests, sleeper without dreams
* Sung, also known as La-Timsa - The white, the follower of the one path
* Tith, also known as Onan-ka - The war god, the tactician, the happy warrior
2 Kelewan
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
