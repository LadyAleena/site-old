#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use File::Slurp qw(read_file);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::Data qw(data_directory get_directory data_file);
use Base::LineMagic qw($line_magic);
use HTML::Elements qw(pre);
use Util::Convert qw(textify);

my $directory = 'Miscellany/Geek_codes';
my @files = get_directory(data_directory($directory));

my $doc_magic;
for my $file (@files) {
  my $read = read_file(data_file($directory, $file));
  $doc_magic->{textify($file)} = sub { pre(5, sub { print $read })}
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
