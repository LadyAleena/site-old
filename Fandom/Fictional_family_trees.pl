#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use IO::All;

use lib '../files/lib';
use Base::Page qw(page story);
use Base::Data qw(file_list data_directory data_file);
use HTML::Elements qw(pre);
use Util::Convert qw(textify);
use Util::FamilyTree qw(make_tree);

my $directory = 'Fandom/Fictional_family_trees';
my @files = file_list(data_directory($directory));

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
& Journey
2 The Mummy
& Mummy
2 Buffy the Vampire Slayer vampires
& Buffy vampires
