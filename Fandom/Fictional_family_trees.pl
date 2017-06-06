#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use IO::All;

use lib '../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(pre);
use Util::Convert qw(textify);
use Util::Data qw(file_list file_directory data_file);
use Util::FamilyTree qw(make_tree);

my $directory = 'Fandom/Fictional_family_trees';
my @files = file_list(file_directory($directory));

my $doc_magic;
for my $file (@files) {
  $doc_magic->{textify($file)} = sub {
    my $read = io(data_file($directory, $file))->slurp;
    my $tree = make_tree($read);
    pre(5, sub { print $tree })
  }
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
These are miscellaneous family trees I have collected over time.
2 Journey to the Center of the Earth
The Anderson family created by the I<A<Journey to the Center of the Earth|href="../Movies/Movies_by_series.pl?series=Journey">> (2008) series
& Journey
2 The Mummy
The Carnahan/O'Connell family created by I<A<The Mummy|href="../Movies_by_series.pl?series=The+Mummy+(1999)">> (1999) series
& Mummy
2 Buffy the Vampire Slayer vampires
The family of vampires created in the I<A<Buffy the Vampire Slayer|href="../Movies_by_series.pl?series=Buffy+the+Vampire+Slayer">> series
& Buffy vampires
