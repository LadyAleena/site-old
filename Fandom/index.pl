#!/usr/bin/perl
# This is the Fandom index.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
Welcome to Lady Aleena's somewhat obsessive B<fandom> of various novel, film, and television series. These are notes I have taken about the series I have jotted down over the years and tried to wrest some sense out of by putting them out there for anyone to read. I have an interest locations, and gods. My biggest interest is with A<I<Xanth>|href="Xanth"> by Piers Anthony followed by A<television and film crossovers|href="Crossovers">. A<I<The Belgariad> and I<Mallorean>|href="The_Belgariad_and_Mallorean.pl"> by David Eddings and A<I<The Riftwar>|href="The_Riftwar"> by Raymod E. Feist also interst me.
My notes may not be very organized, but I am trying.
2 Television and film crossovers
B<A<Television and film crossovers|href="Crossovers">> is mostly me checking the crossovers of the Westphall Universe, but it also includes a section on big fake companies that are sometimes used to create crossovers.
2 Family trees
B<A<Fictional family trees|href="Fictional_family_trees">> has family trees from television and film series that I like with big fictional families. There are more A<families|href="Xanth/Families.pl"> for Xanth in its directory.