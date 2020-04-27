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

my $magic = crossover_magic( dots => '../..' );
page( 'code' => sub { story(*DATA, { 'doc magic' => $magic, 'line magic' => $magic }) });

__DATA__
These B<general crossovers> are completely contained within themselves. They are not part of any bigger continuity, yet.
2 Ghostbuster meets Casper
I<A<Casper|href="Arriving_to_Westphall.pl#Ghostbuster_meets_Casper">> has a small crossover that put it into A<Westphall|href="Arriving_to_Westphall.pl#Father_Guido_Sarducci">.
2 Alice's Hazzard
& Alices Hazzard
Jefferson Davis 'Boss' Hogg and Officer Enos Strate from I<Dukes of Hazzard> appear in I<Alice> Q<Mel Is Hogg-Tied>.
Prior to the crossover, I<Alice> spun off I<Flo>, and I<The Dukes of Hazzard> spun off I<Enos>. After the crossover, I<The Dukes of Hazzard> spun off two contiguous films and two non-contiguos films.
This continuity is ^TH-9^.
2 Babylon 5 Cases
& Babylon 5 Cases
from PTEN, TNT, and Nickelodeon
Before I<^Babylon 5^> spun off six television films and I<^Crusade^>, Captain John Sheridan is presented with a teddy bear which is supposed to be a representation of him in the episode Q<There All Honor Lies>. He disapproves and throws it out of an airlock. The teddy bear ends up in I<^Space Cases^> Q<Who Goes Where>.
This continuity is ^TH-17^.
2 Better Fast and Furious
& Better Fast
I<Better Luck Tomorrow> was directed by Justin Lin and starred Sung Kang as Han Hu. Justin Lin directed I<^The Fast and the Furious: Tokyo Drift^> and brought Sung Kang as Han Seoul-Oh. It was established Seoul-Oh was a false name.
2 Spy Machete
& Spy Machete
Isador "Machete" Cortez, played by Danny Trejo, first appeared in the I<^Spy Kids^> series before being given his own I<^Machete^> series.
2 Terminator in the Abyss
& Terminator Abyss
from FOX
The TV anchorman from I<^The Terminator^>, played by Joe Farago, appeared in I<The Abyss>. The Benthic Petroleum company from I<The Abyss> appeared in I<^Terminator 2: Judgment Day^>. I<Terminator 2: Judgment Day> is followed by three more films and I<^Terminator: The Sarah Connor Chronicles^> televsion series.
2 View Scream
& View Scream
The characters Jay and Silent Bob, played by Jason Mewes and Kevin Smith, are fairly recognizable and can be seen outside the ^View Askewniverse^ in I<^Scream 3^>. I can not determine the chronology of the crossover within the continuity. I<Scream 3> was released the year after I<^Dogma^>.
In an interview, Kevin Smith confirmed Justin Long's character in I<Jay and Silent Bob Reboot> is Brandon St. Randy from I<Zack and Miri Make a Porno>.
2 The Marvel Cinematic Universe
& MCU
The Marvel Cinematic Universe is a very large continuity that began in 2008 with I<^Iron Man^>. There are a few crossovers that have crept into the MCU.
In I<^Guardians of the Galaxy^>, Taneleer Tivan has collected many things including I<Howard the Duck> and slugs from I<Slither>.
While the continuities have not merged, J. K. Simmons reprised his character J. Jonah Jameson from I<^Spider-Man^> in I<^Spider-Man: Far from Home^>.
2 Very small continuities
* Randolph and Mortimer Duke from I<Trading Places> appeared on I<Coming to America>.
* Stanley Anderson played the President in I<The Rock> and I<Armageddon>; both were directed by Michael Bay. There is further speculation that Captain John Patrick Mason, played by Sean Connery, is a retired James Bond, which would greatly expand this continuity.
* Special Agent Ray Nicolette, played by Michael Keaton, from I<Jackie Brown> appeared in I<Out of Sight>; both are based on Elmore Leonard novels.
2 Key
& key
* Made for television films will have the color of the network.
* Series with two or more colors were on multiple networks. The main color is the series last network.
