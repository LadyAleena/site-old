#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use Math::BigInt;

use lib '../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(table);
use Util::Number qw(commify);

my @scale = qw(m d tr tetr pent hex hept oct enn dec hendec dodec triskaidec tetrakaidec pentakaidec hexakaidec heptakaidec octokaidec ennaekaidec icosadec icosihen icosid icositr icositetr icosipent icosihex icosihept icosioct icosienn);

my $i = 1;
my @rows;
for (map($_."illion",@scale)) {
  my $number = commify(Math::BigInt->new(10**(3*$i++)));
  push @rows, [$_, [$number, { 'class' => 'number' }]];
}

my $doc_magic = { 'scale' => sub { table(4, { 'class' => 'numberation_scale', 'rows' => [['header', [['Name', 'Number']]], ['data', \@rows]] }) } };

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
I decided to come up with my own numeration scale based on the amount of commas in the number.
& scale
