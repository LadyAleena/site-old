#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use HTML::Entities qw(encode_entities);

use lib '../../files/lib';
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use HTML::Elements qw(section paragraph list span pre);
use RolePlaying::WordFind qw(print_word_find);

my %finds = (
  'Monsters Galore' => 'HUMAN',
  'Undead'          => 'UNDEAD SLAYER'
);

my $cgi = CGI::Minimal->new;
my $select = encode_entities($cgi->param('word find'),'<>"');
my $head = $select && $finds{$select} ? $select : undef;
my $file_menu = file_menu('word find', [sort keys %finds], $select);

page( 'heading' => $head, 'file menu' => $file_menu, 'code' => sub {
  if ($select && $finds{$select}) {
    my $lonely = span($finds{$select}, { 'class' => 'word_find' });
    my $lone = "There is a lone $lonely in there too.";
    my $word_find = print_word_find($select, $finds{$select});

    section(3, sub {
      pre(3, sub { print $word_find->{'board'} }, { 'class' => 'word_find'});
    });
    section(3, sub {
      list(4, 'u', $word_find->{'list'}, { class => 'four' });
      paragraph(4, join(' ', ($lone, $word_find->{'lonely'})));
    }, { 'heading' => [2, 'Find these monsters'] });
  }
  else {
    section(3, sub {
      paragraph(5, "Please select a puzzle:");
      list(5, 'u', $file_menu);
    });
  }
});
