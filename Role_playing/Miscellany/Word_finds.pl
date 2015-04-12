#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use HTML::Entities qw(encode_entities);

use lib '../../files/lib';
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use RolePlaying::WordFind qw(print_word_find);

my %finds = (
  'Monsters Galore' => 'HUMAN',
  'Undead'          => 'UNDEAD SLAYER'
);

my $cgi = CGI->new;
my $select = encode_entities($cgi->param('word find'),'<>"');
my $head = $select && $finds{$select} ? $select : undef;
page( 'heading' => $head, 'file menu' => file_menu('word find', [sort keys %finds], $select), 'code' => sub {
  print_word_find($select,$finds{$select}) if ($select && $finds{$select});
});
