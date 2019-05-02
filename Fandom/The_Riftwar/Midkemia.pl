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
4 Ashuntai
The B<Ashuntai> are also known as the Brotherhood of the Horse in the Empire of Great Kesh. They are plainsmen who treat all women as property.
4 Benedrifi
The B<Benedrifi> are a hillpeople tribe of the Rainshadow mountains who are fair-skinned and reclusive in the Empire of Great Kesh.
4 Brijaners
The B<Brijaners> are raiders and traders along the Great Sea to the East of Triagia in the Empire of Great Kesh.
4 Cosodi
4 Desertmen of the Jal-pur
4 Dingazi
The B<Dingazi> are mostly cattle-herders in the Empire of Great Kesh.
4 Isalani
The B<Isalani> are an oriental people of Shing Lai and nearby territories in the Empire of Great Kesh.
4 Izmalis
The B<Izmalis> are a reclusive group of spies and assassins in the Empire of Great Kesh.
4 Jajormir
The B<Jajormir> are another race in the Empire of Great Kesh.
4 Keshian Truebloods
The B<Keshian Truebloods> are the original people of the Empire of Kesh. They are a dark-skinned and very prideful people.
4 Oshoni
The B<Oshoni> are lion hunters in the Empire of Great Kesh.
3 Elves
During the age before the Chaos Wars, the elves were one race, as slaves under the Dragon Lords. The elves who tended the fields and forests were the precursors to the modern-day eledhel, also known as the light ones. Those who served their masters were the ancestors to the moredhel who became known as the dark ones. The Eldar, known as the wise ones, were the wisest and most powerful of the elves who served as loremasters and keepers of treasures plundered by the Dragon Lords. They were presumed to have perished together with their masters.
The eledhel and the moredhel do not differ much. They are most distinct in their ways of thinking. On the rare occasian that a moredhel turns away from his ways, an event known as the returning, and reaches the eledhel he is considerd one of them. For an outsider, from that moment on they look just like one of the rare dark skinned eledhel.
When the Dragon Lords were defeated by the new gods of Midkemia, Ashen-Shugar freed the elves from their slavery, bidding them to pursue their own destiny amidst the new races (humans, dwarves, etc) which came to Midkemia during the Chaos Wars. The eledhel removed themselves to the forest-city of Elvandar, seeking to forge their own destiny with the lesser races. The moredhel, long influenced by their masters' aggression, sought to regain the former grandeur of their masters by collecting relics and weapons of the Dragon Lords. The glamredhel, became known as the mad ones or wild ones, were much like the eledhel who also aimed to control their own fate, though in a more warlike manner. To that end, they constructed two mighty city-fortresses, Sar-Isbandia (called Armengar by the humans) and Sar-Sargoth. The glamredhel were later driven to extinction in a massive genocidal war by the moredhel, their city-fortresses taken by the moredhel. 
When a rift was established between Midkemia and Kelewan, it was found that the Eldar had survived the Chaos Wars and now live under the frozen ice, where another forest-city flourishes.
Many years before the Riftwar, a moredhel chieftain Murmandamus once united the moredhel clans of the north in a Great Uprising to conquer the Kingdom. When the army was defeated, the moredhel clans scattered and fled back to the Northlands, never again uniting under a single true leader.
After the war between Kelewan and Midkemia, the moredhel, goblins, and several bands of renegade humans again united for a couple years to wage war against the Kingdom, seen in I<Silverthorn> and I<A Darkness at Sethanon>, under a false Murmandamus, who was actually just a powerful Pantathian priest in a magical disguise. Under his leadership and magic powered by death, the Valheru were briefly freed again upon Midkemia, only to be immediately cast out again due to the combined efforts of Pug; Prince Arutha; Tomas/Asgen-Shugar; Macros, the black sorcerer; the Great Ones Hochopepa and Elhagar; Dolgan and his armies; Black Guy and his Hadati refugees; Amos Trask; Dukes Martin and Laurie; Squires James and Locklear; Baru, the Hadati who killed Murmandamus' general in I<Silverthorn>; Galain and his small elven host; the Sethanon garrison; a greater dragon; and several other prominent characters.
The final group of elves is the ocedhel. They are the "people from across the sea." They are from the continent of Novindus. Very few survived the war with the Emerald Queen as told in the books of the SerpentWar saga.
The home of the elves is Elvandar.
3 Dwarves
B<Dwarves> are a long-lived race, living to be hundreds of years in age. The main Dwarves are the dwarves of the West. Most often the Grey Towers dwarves led by Dolgan, of Tholin's line, from the village Caldara. There is another dwarven kingdom in the West; the Stone Mountain dwarves, led by Harthorn, of Hogar's line, at village Delmoria. In the east, the dwarves make their home at Dorgin, under the banner of King Halfdan. There is mention of a dwarven city, Sarakan, across the sea on the continent of Novindus, found in the Ratn'gary Mountains.
3 Valheru
B<Valheru> were the first race on Midkemia, and among the most powerful in the known universe. They rode on the backs of great dragons, travelling throughout the cosmos in search of plunder for millions of years. Arrogantly presuming themselves to be gods, they also created lesser races to serve as slaves. 
As a result of their wanton acts of destruction throughout the universe, energy was released from what was once mighty civilisations. Reaching a critical point, these energies formed a new pantheon of gods. While the new gods strove among themselves, the Valheru, exhorted by Draken-Korin, attempted to overthrow the new order of gods. Ashen-Shugar was the only Dragon Lord to disapprove of his son's plan, but he did nothing but watch as the other Dragon Lords rose to battle the gods.
Space and time became warped as the Valheru battled the gods in the time known as the Chaos Wars. Of a hundred gods, only sixteen survived, but the Valheru were defeated. If the greatest of the Valheru, Ashen-Shugar, had joined, the gods may have been utterly destroyed. With the exception of Ashen-Shugar, the Valheru were cast away into another dimension to prevent them from returning to their homeworld, Midkemia.
4 Known Valheru
* B<Ashen-Shugar> - Lord of the Eagles Reaches; son of Hali-Marmora; father and husband to Alma-Lodaka; father of Draken-Korin; the last of the Valheru; reincarnated in the body of Tomas Megarson, son of Megar and Magya of Crydee, Prince Consort of Queen Aglaranna and Warleader of Elvendar, father of Calis. 
* B<Draken-Korin> - Lord of Tigers, son of Ashen-Shugar and Alma-Lodaka, slain by Ashen-Shugar at the end of the Chaos Wars; returned briefly to activate the Lifestone but was slain again by Tomas/Ashen-Shugar.
* B<Alma-Lodaka> - the Emerald Queen of Serpents; daughter and wife of Ashen-Shugar; mother of Draken-Korin; nearly reincarnated in a body of Lady Clovis, also known as Jorna, wife of Nakor then of Macros, mother of Miranda by Macros.
* B<Algon-Kokoon> - Tyrant of Wind Valley, slain by Ashen-Shugar
* B<Alrin-Stolda> - Monarch of the Black Lake
* B<Hali-Marmora> - Mother of Ashen-Shugar; slain by Ashen-Shugar
* B<Lowris-Takara> - King of Bats; Ashen-Shugar's first Dragon Lord kill
* B<Lyron-Baktos> - Lord of the Dragons; whose talisman was used to incapacitate the Oracle of Aal
* B<Kindo-Raber> - Master of Serpents; tore apart by the Dasati
4 Tomas
Tomas Megarson was born a kitchen boy in Castle Crydee. Due to the manipulations of the sorcerer Macros the Black, he merged with the essence of the long-dead Dragon Lord, Ashen-Shugar, to be a weapon against the outworld invaders.
For a while, the newly melded being was consumed by the battle-madness of the Valheru, before the compassion of a human boy won through, and Tomas the human, mastered the powers of a Dragon Lord. While the elves, whom he sought refuge with, feared dominion from the Dragon Lord, Tomas assuaged their fears, becoming merely the prince consort of their Queen Aglaranna.
Due to some unforeseen circumstances, the human-turned-Valheru and the Elf Queen conceived a child possessing the heritage of all three races. Calis, son of Tomas and Aglaranna, would be unique throughout the world, neither human nor elf. He would also be instrumental during the Serpentwar invasion, first by creating the Crimson Eagles military commandoes, then later dismantling a powerful artifact capable of draining all life in the world.
Finally accepting his lot in fate, Calis settled down in Elvandar with a widowed elf, also adopting twins who were refugees from the recent war.
3 Dragons
B<Dragons> are the most ancient race in Midkemia after the Valheru or Dragon Lords. They served the Valheru as mounts. Since the fall of the Dragon Lords, the dragons have generally isolated themselves from contact with any other race. A notable character, Rhuagh, was an ancient gold dragon who lived in the Mac Mordain Cadal mines. He befriended Macros the Black. Many years later, Tomas and the dwarf chieftain Dolgan would stand on his deathwatch as he told them of his life. His daughter, Ryath, aided Pug and Tomas in their search for Macros the Black. She perished in battle with a Dreadlord, though her body lived on as a vessel for the Oracle of Aal. In return for her sacrifice, Pug took in her daughter Ryana, to his island where she would be cared for until she could survive on her own.
3 Giants
B<Giants> are on average of twelve feet tall. They form no civilized society, living as little more than wild animals in the Northlands. The moredhel were known to recruit giants into their army.
3 Gwali
Little is known of the B<gwali>. They are a shy forest species which stand about four feet tall. They are able to come and go without anyone being able to track then, even the elves. They are non-violent except for in extreme circumstances. Usually they stay hidden from strangers.
3 Pantathians
The B<Pantathians> are a race of serpent-men bent on returning their evil goddess, Alma-Lodaka, to this plane of existence. They will go to great lengths, including going to their deaths, to accomplish their goal.
3 Other creatures
Trolls, goblins, and a race of tiger-men are also on Midkemia, however they are rarely seen and little is known about them. There are also a lot of races and creatures introduced from other worlds which are not Midkemia or Kelewan which can be seen as students of Pug on Sorcerers Isle. Others are met in the Hall of Worlds.
2 Gods
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