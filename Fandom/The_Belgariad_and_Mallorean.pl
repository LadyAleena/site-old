#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
These are the gods and lands of the Belgariad and Mallorean created by David and Leigh Eddings.
2 The gods
* Overpower - UL
* Greater powers
** Aldur - owl god of none
** Belar - bear god of Aloria
** Chaldan - bull god of Arendia
** Eriond - new horse god of the Angarak
** Issa - snake god of Nyissa
** Mara - bat god of Maragor
** Nedra - lion god of Tol Nedra
** Torak - dead dragon god of the Angarak
2 The lands
There are two continents on this world with fourteen kingdoms with Nyissa and Ulgoland being the only current theocracies.
3 The West
B<The West> includes the four independent kingdoms of Aloria, Sendaria, Arendia, Tol Nedra, Maragor, Nyissa, and Ulgoland. Belgarion, the Rivan King, is the overlord of the West.
3 Aloria
B<Aloria> was once a large kingdom in the north on the western continent until Belgarath ordered it divided into four independent kingdoms.
* Cherek
* Drasnia 
* Algeria
* Riva is also known as The Isle of the Winds.
3 Arendia
B<Arendia> is a kingdom on the western continent. It once had four duchies, now it has only two.
* Mimbre is the southern duchy which contains the kingdom's capital, Vo Mimbre.
* Astur is the northern duchy
* Wacune was destroyed in a civil war with the Mimbrates and Asturians
* Erat is now the independent kingdom of Sendaria created by Polgara
3 The East
B<The East> is considered all lands held by the Angaraks, though not all within are Angarak.
* Gar og Nadrak
* Mishrak ac Thull
* Cthol Murgos
* Mallorea
4 Mallorea
B<Mallorea> is an empire which encompasses the entire eastern continent and includes several groups of nations. The Emperor is also the overlord of Cthol Murgos, Mishrak ac Thull, and Gar og Nadrak on the western continent.
* Ancient Mallorea - the northwesten Angarak kingdom in Mallorea
* The Seven Kingdoms of Karanda - in the north east
* The Dalasian Protectorates - nearly the entire south except the east coast
* The Melcene Empire - in the south east and includes the island of Melcena
