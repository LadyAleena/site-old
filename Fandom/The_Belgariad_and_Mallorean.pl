#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
There are two continents on the world of the A<Belgariad and Malloreon|href="../Collections/Fiction.pl#Belgarion_saga"> created by David and Leigh Eddings. There are fourteen kingdoms on those continents with Nyissa and Ulgoland being the only current theocracies.
2 The West
B<The West> includes the four independent kingdoms of Aloria, Sendaria, Arendia, Tol Nedra, Maragor, Nyissa, and Ulgoland. Belgarion, the Rivan King, is the overlord of the West.
3 Aloria
B<Aloria> was once a large kingdom in the north on the western continent until Belgarath ordered it divided into four independent kingdoms. The god of the Alorns is B<Belar>, the bear god.
4 Cherek
B<Cherek> is a kingdom on the western continent. Its capital city is Val Alorn. It borders Drasnia to the east, the Gulf of Cherek to the south, and the Sea of Winds to the west. The current king is Anheg.
4 Drasnia
B<Drasnia> is a kingdom on the western continent. Its capital city is Boktor. It borders Cherek to the west, Gar of Nadrak to the east, Algeria to the southeast, and the Gulf of Cherek to the southwest. The current king is Kheva.
4 Algeria
B<Algeria> is a kingdom on the western continent. Its capital city is call the Stronghold, as it is not really a city, more of a man-made mountain. It borders Sendaria and Ulgoland to the west, Mishrak ac Thull and Gar of Nadrak to the east, and Drasnia to the north. It also has a border with the Vale of Aldur. The current king is Cho-Hag.
4 Riva
B<Riva>, also known as The Isle of the Winds, is an island nation on the western continent. Its capital is also named Riva. It borders the Sea of Wind to the northeast and the Great Western Sea to the southwest. The current king is Belgarion who go rules with Ce'Nedra, his Nedran queen.
3 Arendia
B<Arendia> is a kingdom on the western continent. Its capital city is Vo Mimbre. It borders Sendaria to the north, Ulgoland to the east, and Tol Nedra to the south. The Great Western Sea is to the west. It once had four duchies, now it has only two. The god of the Arends is B<Chaldan>, the bull god.
* Mimbre is the southern duchy which contains the kingdom's capital, Vo Mimbre.
* Astur is the northern duchy. Its capital is Vo Astur.
* Wacune was destroyed in a civil war with the Mimbrates and Asturians. Its capital is Vo Wacue.
* Erat is now the independent kingdom of Sendaria created by Polgara.
3 Sendaria
B<Sendaria> is a kingdom on the western continent. Its capital is Sendar. It borders Arendia to the southwest, Ulgoland to the south, and Algeria to the southeast. The Sea of the Winds is to the northwest and the Gulf of Cherek is to the northeat. The Sendarans are a secualr people and worship all of the gods equally. The current king is Fulrach.
3 Ulgoland
B<Ulgoland> is a nation on the western continent. Its capital and only city is Prolgu. It borders Arendia to the west, Algaria to the northeast, and Tol Nedra to the southeast. The Ulgos live within a vast cave system within the mountains of Ulgoland to protect them from other monsters that live on the mountains and the outside world. The god of the Ulgos is B<UL>, the father of all of the other gods. The high priest Gorin rules the Ulgos, and every high priest takes that name upon accessention.
3 Tol Nedra
B<Tol Nedra> is a kingdom, though they style it as an empire, on the western continent. Its capital city is Tol Honeth. It borders Arendia to the north, Nyissa to the south, and Maragor to the east. The Great Western Sea is to the west. The god of the Nedrans is B<Nedra>, the lion god. The current Emperor is Ran Borune XXIV, who was Duke Varana.
Within the borders of Tol Nedra is the B<Wood of the Dryads> in the south between Tol Borune and Nyissa. It is ruled by Xantha, Quenn of the Dryads. The woods are protected from logging by the Borunes, who upon occassion marry Dryads.
3 Maragor
B<Maragor> is a kingdom on the western continent. Its capital city was Mar Amon. It borders Tol Nedra to the west, Ulgoland to the north, and Cthol Murgos to the south and east. The god of the Marags is Mara, the bat god. This kingdom suffered genocide at the hands of the Nedrans. It is currently being repopulated by the last living Marag woman Taiba with Relg, her Ulgo husband.
3 Nyissa
B<Nyissa> is a kingdom on the western continent. Its capital city is Sthiss Tor. It boarders Tol Nedra to the north and Cthol Murgos to the east and south. The Great Western Sea is to the west. The god of the Nyissans is B<Issa>, the snake god. The high priestesses and queens of Nyissa are all named Salmissra after the original woman who Issa fell in love with.
3 The Vale of Aldur
The B<Vale of Aldur> is a small area on the western continent where the Disiples of B<Aldur>, the owl god, live. Belgarath, Poledra, their daugher Polgara and her husband Durnik, twins Beltira and Belkira, and Polgara and Durnik's twin children.
2 The East
B<The East> is considered all lands held by the Angaraks, though not all within are Angarak. Cthol Murgos, Mishrak ac Thull, and Gar of Nadrak are on the in the east and south on the western continent. The Angarak Ancient Mallorea is on the eastern continent along with Dalasia, the Seven Kingdoms of Karanda, and The Melcene Empire. The god of the Angaraks is B<Eriond>, the horse god. Their former god was B<Torak>, the dragon god. Emperor Zakath rules all of the East.
3 Cthol Murgos
B<Cthol Murgos> is the largest nation on the western continent, covering the entire southern portion of it. Its capital city is Rak Cthol. To the northeast is Nyissa and Maragor and the northwest is Mishrak ac Thull. The current king is Urgit.
3 Mishrak ac Thull
B<Mishrak ac Thull> is a kingdom on the western continent. Its capital city is Thull Mordu. It boarders Gar og Nadrak to the north, Algaria to the west, and Cthol Murgos to the south. The current king is Nathel.
3 Gar og Nadrak
B<Gar og Nadrak> is a kingdom on the western continent. Its capital city is Yar Nadrak. It borders Drasnia and Algeria to the west and Mishrak ac Thull to the south. It also borders an area called the Land of the Morindim. The current king is Drosta Lek Thun.
3 Land of the Morindim
B<Land of the Morindim> is an area of the western continent controlled by the Morindim. It borders Gar of Nadrak to the south. The Morindim are distantly related to the Karandans. They worship and summon demons. On occassion, they use a land bridge to the eastern continent to return to Karanda.
3 Mallorea
B<Mallorea> is an empire which encompasses the entire eastern continent and includes several groups of nations. The Emperor is also the overlord of Cthol Murgos, Mishrak ac Thull, and Gar og Nadrak on the western continent.
* Ancient Mallorea - the northwesten Angarak kingdom in Mallorea
* The Seven Kingdoms of Karanda - in the north east
* The Dalasian Protectorates - nearly the entire south except the east coast
* The Melcene Empire - in the south east and includes the island of Melcena
