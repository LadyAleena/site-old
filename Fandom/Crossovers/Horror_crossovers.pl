#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page     qw(page story);
use HTML::Elements qw(anchor object div figure list);
use Util::Convert  qw(textify searchify);
use Util::Data     qw(file_list file_directory data_file);
use Util::Line     qw(line);
use Util::Movie    qw(movie_option series);

use Util::Crossover::LineMagic qw(crossover_magic);

my $magic = crossover_magic( big => ['Horror'], dots => '../..' );
page( 'code' => sub { story(*DATA, { 'doc magic' => $magic, 'line magic' => $magic }) });

__DATA__
These B<horror crossovers> are completely contained within themselves. They are not part of any bigger continuity, yet.
2 Howling Gremlins
& Howling Gremlins
Lew Landers, a news reporter played by Jim McKrell, first appeared in I<^The Howling^> then I<^Gremlins^>.
2 Frozen Hatchet
& Frozen Hatchet
Parker O'Neil, from I<Frozen> and played by Emma Bell, appeaered on television in a news report about the events in I<Frozen> on I<Hatchet II>.
2 A Big Scare
The Necronomicon from I<^The Evil Dead^> has appeared in I<^Jason Goes to Hell: The Final Friday^> and I<^Pumpkinhead II: Blood Wings^>.
Michael Myers hockey mask from I<^Halloween (1978)^>, Jason Voorhees mask from I<^Friday the 13th (1980)^>, and Freddy Kreuger's glove from I<^A Nightmare on Elm Street^> appeared in a storage room in I<^Bride of Chucky^>.
& Horror
2 Key
& key
* Made for television films will have the color of the network.
* Series with two or more colors were on multiple networks. The main color is the series last network.
