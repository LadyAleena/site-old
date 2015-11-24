#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(anchor img);

my @images = ('Babylon 5', 'Ghostbusters', 'legend');
my $doc_magic;
for (@images) {
  (my $image = $_) =~ s/ /_/g;
  my $link = "../../files/images/Movies/Crossovers/$image.png";
  $doc_magic->{$_} = sub { print anchor( img({ 'src' => $link, 'alt' => $_, 'style' => 'float: right;' }), { 'href' => $link, 'target' => 'new', 'class' => 'inline' }) };
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
These crossovers are completely contained within themselves. They are not part of any bigger continuity–yet.
2 Ghostbuster meets Casper
& Ghostbusters
from films
Dr. Raymond Stantz from I<Ghostbusters> appeared on I<Casper>. I<Ghostbusters> spun off I<Ghostbusters II>. I<Casper> spun off two prequels: I<Casper: A Spirited Beginning> and I<Casper Meets Wendy>.
2 Babylon 5
& Babylon 5
from TNT and Nickelodeon
Before I<A<Babylon 5|href="Movies_by_series.pl?series=Babylon+5#Babylon_5">> spun off six television films and I<A<Crusade|href="Movies_by_series.pl?series=Babylon+5#Crusade">>, in the episode "There All Honor Lies", Captain John Sheridan is presented with a teddy bear which is supposed to be a representation of him. He disapproves and throws it out of an airlock. The teddy bear ends up on I<Space Cases> "Who Goes Where".
2 Very small continuities
* Randolph and Mortimer Duke from I<Trading Places> appeared on I<Coming to America>.
2 Legend
& legend
Series with two or more colors were on multiple networks. The main color is the series last network.
