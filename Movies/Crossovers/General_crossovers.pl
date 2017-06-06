#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(anchor img);
use Util::Data qw(file_directory);
use Util::Line qw(line);

my @images = ('Babylon 5', 'Ghostbusters', 'Terminator', 'Spy Machete', 'View Scream', 'legend');
my $doc_magic;
my $directory = file_directory('Movies/Crossovers', 'images');
for (@images) {
  (my $image = $_) =~ s/ /_/g;
  my $link = "$directory/$image.png";
  $doc_magic->{$_} = sub { line(6, anchor( img({ 'src' => $link, 'alt' => $_, 'class' => 'right' }), { 'href' => $link, 'target' => 'new', 'class' => 'inline' }))};
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
These crossovers are completely contained within themselves. They are not part of any bigger continuity, yet.
2 Ghostbuster meets Casper
& Ghostbusters
Dr. Raymond Stantz, played by Dan Aykroyd, from I<Ghostbusters> appeared on I<Casper>. I<Ghostbusters> spun off I<Ghostbusters II>. I<Casper> spun off two prequels: I<Casper: A Spirited Beginning> and I<Casper Meets Wendy>.
2 Babylon 5
& Babylon 5
from PTEN, TNT, and Nickelodeon
Before I<A<Babylon 5|href="Movies_by_series.pl?series=Babylon+5#Babylon_5">> spun off six television films and I<A<Crusade|href="Movies_by_series.pl?series=Babylon+5#Crusade">>, in the episode "There All Honor Lies", Captain John Sheridan is presented with a teddy bear which is supposed to be a representation of him. He disapproves and throws it out of an airlock. The teddy bear ends up on I<Space Cases> "Who Goes Where".
2 Terminator in the Abyss
& Terminator
from FOX
The TV anchorman from I<A<The Terminator|href="Movies_by_series.pl?series=Terminator#The_Terminator">>, played by Joe Farago, appeared in I<The Abyss>. The Benthic Petroleum company from I<The Abyss> appeared in I<A<Terminator 2: Judgment Day|href="Movies_by_series.pl?series=Terminator#Terminator_2_Judgment_Day">>. I<Terminator 2: Judgment Day> is followed by three more films and I<Terminator: The Sarah Connor Chronicles> televsion series.
2 Machete
& Spy Machete
Isador "Machete" Cortez, played by Danny Trejo, first appeared in the I<Spy Kids> franchise before being given his own I<Machete> franchise.
2 View Scream
& View Scream
The characters Jay and Silent Bob are fairly recognizable and can be seen outside the View Askewniverse specifically in I<Scream 3>. I can not determine the chronology of the crossover within the continuity. I<Scream 3> was released the year after I<Dogma>.
2 Very small continuities
* Randolph and Mortimer Duke from I<Trading Places> appeared on I<Coming to America>.
* Stanley Anderson played the President in I<The Rock> and I<Armageddon>; both were directed by Michael Bay.
* Special Agent Ray Nicolette from I<Jackie Brown> appeared in I<Out of Sight>; both are based on Elmore Leonard novels.
2 Legend
& legend
Series with two or more colors were on multiple networks. The main color is the series last network.
