#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::HTML::Element qw(table definition_list);
use Base::Data qw(get_array);

# I want to add character entity pieces.

my @definition_list = get_array( 'headings' => ['term','definition'] );

my %chess_rows;
$chess_rows{$_} = [qw(rook knight marshal bishop cardinal queen king cardinal bishop marshal knight rook)] for (1,12);
$chess_rows{$_} = [qw(pawn squire squire novice priest princess prince priest novice squire squire pawn)] for (2,11);
$chess_rows{$_} = ['&nbsp;',('pawn') x 10,'&nbsp;'] for (3,10);

my @rows;
for my $chess_row (1..12) {
  my @row;
  for my $chess_column (1..12) {
    my $class = ($chess_row + $chess_column) % 2 ? 'odd' : 'even';
    my $piece = $chess_rows{$chess_row}[$chess_column - 1] || '&nbsp;';
    push @row, [$piece, { 'class' => "$class" }];
  }
  push @rows, \@row;
}

my $doc_magic = {
  'pieces' => sub { definition_list(5, \@definition_list) },
  'board'  => sub { table(4, { 'class' => 'royal_chess', 'rows' => [['data',\@rows]] }) },
};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a game of capture, so there are no checks or checkmate. The standard pieces move the same. If the king is captured, the prince becomes the king. If the prince (king) is captured, the princess becomes king. If the princess (king) is captured, the queen becomes king. The captures do not have to be in that order. If the prince is captured before the king, the princess becomes the prince. If a pawn is on the outer edge on the opponent's side of the board, the pawn can be replaced by the lowest ranking member of the royal family (queen, princess, prince, king). Once the entire royal family is captured, the game is over.
I have not tested this version. If anyone does test it, please A<let me know|href="mailto:fantasy@xecu.net"> how it turned out.
2 Royal chess pieces
& pieces
2 Royal chess board
& board
