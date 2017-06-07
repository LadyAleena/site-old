#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(table);
use RPG::Character::Alignment qw(expand_alignment);

my @y_axis = qw(L+ L L(N) -C N(L) N N(C) -L C(N) C C+);
my @x_axis = qw(G+ G G(N) -E N(G) N N(E) -G E(N) E E+);

my $x_num = 1;
my $y_num = 1;

my @rows;
for my $x_axis (@x_axis) {
  my @row;
  for my $y_axis (@y_axis) {
    my $class = undef;
    if ($x_num % 4 == 0 || $y_num % 4 == 0) {
      $class = 'divider';
    }
    if (($x_num == 2 || $x_num == 6 || $x_num == 10) && ($y_num == 2 || $y_num == 6 || $y_num == 10)) {
      $class = 'core';
    }
    my $alignment = $y_axis.$x_axis;
       $alignment =~ s/^NN$/N+/;
    my $title = expand_alignment($alignment);
    push @row, [qq(<abbr title="$title">$alignment</abbr>), { class => $class }];
    ++$y_num;
  }
  push @rows, [@row];
  ++$x_num;
  $y_num = 1;
}

my $doc_magic = { alignments => sub { table(3, { class => 'expanded_alignment centered', rows => [['data',\@rows]] }) }};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
Are there times when you can't choose an alignment for your character with so few choices? That has come to an end. Here are 112 new alignments to choose from. A (+) next to an alignment means your character is true (alignment). A (-) next to an alignment means your character is just not that alignment. An alignment in parentheses means your character has those tendencies.
This chart has been copied and modified A<here|href="http://easydamus.com/alignmenttracking.html" target="new_tab">.
2 The Alignments
& alignments
