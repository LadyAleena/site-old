#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use File::Slurp qw(read_file);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::HTML::Element qw(pre);
use Base::LineMagic qw($line_magic);
use Base::Data qw(data_directory get_directory);
use Util::Convert qw(textify);

my $directory = data_directory('Miscellany/Geek_codes');
my @files = get_directory($directory);

my $doc_magic;
for my $file (@files) {
  $doc_magic->{textify($file)} = sub {
    open(my $geek_file, '<', "$directory/$file") || die "$file not found";
    pre(5,sub { print read_file($geek_file) });
  }
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic, 'line magic' => $line_magic }) });

__DATA__
Along with the ^Geek Code^ written by Robert Hayden, here are a few additions, use the standard pluses or minuses in each group.
2 Babylon 5
& Babylon 5
2 Buffy the Vampire Slayer
& Buffy the Vampire Slayer
2 Star Trek
& Star Trek
2 Stargate
& Stargate
2 The X-Files
& The X-Files
2 Relationships
& relationships
