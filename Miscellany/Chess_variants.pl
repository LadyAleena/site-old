#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Data qw(get_array);
use Base::Page qw(page story);
use HTML::Elements qw(table definition_list);

# I want to add character entity pieces.

my $definition_list = get_array( 'file' => ['Miscellany', 'Royal_chess.txt'], 'headings' => ['term','definition'] );

my %chess_rows;
$chess_rows{$_} = [qw(rook knight marshal bishop cardinal queen king cardinal bishop marshal knight rook)] for (1,12);
$chess_rows{$_} = [qw(pawn squire squire novice priest princess prince priest novice squire squire pawn)] for (2,11);
$chess_rows{$_} = ['&nbsp;',('pawn') x 10,'&nbsp;'] for (3,10);

my @rows;
for my $chess_row (1..12) {
  my @row;
  for my $chess_column (1..12) {
    my $piece = $chess_rows{$chess_row}[$chess_column - 1] || '&nbsp;';
    push @row, [$piece];
  }
  push @rows, \@row;
}

my $doc_magic = {
  'pieces' => sub { definition_list(5, $definition_list) },
  'board'  => sub { table(4, { 'class' => 'royal_chess centered', 'rows' => [['data', \@rows]] }) },
};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
At one time I played chess regularly, however, I have grown rusty from not playing. I do like to come up with new rules for chess, and here are some of them. Bughouse chess is my favorite variant to play.
2 Pez chess
If Pez ever comes out with a set of chess piece dispensers, one could play Pez chess. After setting up the board, it would be a good idea for each player to have a little dish for the Pez candies. Pez chess uses the same moves and rules from normal chess except whenever a piece is captured, one candy is removed from the dispenser. The dispenser is placed back on the board, and the game resumes. Only after a dispenser is empty of candy can it be permanently captured.
This variant came from a conversation with A<Pez|href="https://twitter.com/PEZofficial" target="new">.
2 Royal chess
This is a game of capture, so there are no checks or checkmate. The standard pieces move the same. If the king is captured, the prince becomes the king. If the prince (king) is captured, the princess becomes king. If the princess (king) is captured, the queen becomes king. The captures do not have to be in that order. If the prince is captured before the king, the princess becomes the prince. If a pawn is on the outer edge on the opponent's side of the board, the pawn can be replaced by the lowest ranking member of the royal family (queen, princess, prince, king). Once the entire royal family is captured, the game is over.
I have not tested this version. If anyone does test it, please A<let me know|href="mailto:fantasy@xecu.net"> how it turned out.
3 Royal chess pieces
& pieces
3 Royal chess board
& board
