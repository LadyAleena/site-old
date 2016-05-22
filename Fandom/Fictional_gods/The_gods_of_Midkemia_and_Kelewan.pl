#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
The gods created by Raymond E. Feist.
2 Midkemia
3 Greater powers
* Ishap - The Balancer
* Abram-Sev - The giver of laws, the thunderer
* Ev-Dem - The worker from within, the calculator of odd
* Graf - The weaver of wishes
* Helbinor - The abstainer
* Arch-Indar - The Goddess of Good
* Nalar - The God of Evil
3 Lesser powers
* Astalon - The just, the builder
* Ban-ath - The artful dodger, the prankster, the night walker, the silent thief of precious commodities
* Dala - Shield of the weak, goddess of passive strength, the protector
* Guis-wa - Also known as Fimbulstarn. The bayer after the moons, the red-jawed hunter, the reveller in forbidden knowledge, the wanter of all things
* Ka-hooli - The howler after fugitives, the tireless pursuer, the warrior god of vengeance, the unraveller of mysteries into truth
* Kilian - The singer of green silences, the gatherer of quiet pleasures, the goddess of love
* Lims-Kragma - Also known as Zandros. The drawer of nets, The mistress of death
* Prandur - Also known as Jehan-suz. The burner of cities, the spreader of confusion, the light bringer
* Ruthia - The dancer through men's hearts, the goddess of loved scorned, the lady of luck
* Silban - The earth mother, the bringer of harvests, sleeper without dreams
* Sung - Also known as La-Timsa. The white, the follower of the one path
* Tith-Onan-ka - The war god, the tactician, the happy warrior
2 Kelewan
3 Greater powers
* Chochocan - The Good God, The Healer, The Bringer Of Rest
* Fa - The Sleeper, Master of the Night, The Retriever
* Hilbantucan - The Architect, The Silent Builder, The Master of Works
* Jastur - God of War, Bringer of Terror, The Revenger
* Juran - The Just, Master of Life, God of the Home, Father of Winds, God of Justice
* Keburchi - God of Chaos
* Lashima - Goddess of the Inner Light. Goddess of Wisdom, Queen of the Sky, Mother of Birds, Builder of Clouds
* Oxalaca - The Master of Oceans, Builder of Ships, Master of Fishers
* Sibi - Goddess of Death, Lover of All, Dancer in the Darkness
* Thanaxaca - Master of Song, Lord of the Dance, Father of the Arts
* Zamach - The Leveler, The Fountain of Knowledge, The Master of Justice
3 Lesser powers
* Alihama - Goddess of Travelers
* Baracan - Lord of Swords, Singer of Battle, God of Honour
* Hantukama - Goddess of Mercy, God of Healing, Bringer of Blessed Health, Cloud Rider
* Hilio - The Teacher, Master of Wisdom, Judge of Life
* Iskisu - God of Trickery and Chance
* Juru - Lord of Sailors, Father of Waves, Lord of Fish
* Kelesha - Goddess of Brides, Goddess of Mercy
* Lulondi - God of Farmers
* Milianxana - Goddess of Singers, Mother of Happiness, Mistress of wine, Goddess of Love
* Nictac - Lord of Thieves, Master of Assassins, King of Spys, Protector of Travelers
* Salana - Mistress of Rain, Harvest Mother, Mother of Beasts, Mother of truth
* Tomachca - Bringer of Peace, Lover of Children, Protector of Orphans
* Turkamu - The Red God, The Killer God, Brother to Death, Eater of Hearts, The Silently Waiting One
* Tuth - Master of Levels, Hewer of Stone, God of Builders, Lord of Laborers
* Zurgauli - God of Ill Luck
