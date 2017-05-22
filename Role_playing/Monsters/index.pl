#!/usr/bin/perl
#This is the Role_playing/Monsters index.
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::PathInfo;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);
use Lingua::EN::Inflect qw(A);

use lib '../../files/lib';
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use HTML::Elements qw(section paragraph list);
use Util::Convert qw(textify searchify);
use RolePlaying::Monster qw(print_monster);
use RolePlaying::Random::Monster qw(random_monster random_monster_list);

my $random_monster = A(random_monster);
my @selects = ('Chaos elemental-kin', 'Daemar', 'Dark centaur', 'Demi-lycanthrope', 'Dragod', 'Eldent', 'Gobpry', 'Phase elemental', 'Rainbow dragonette', 'Throglin', 'Tralg', 'Trobold', 'Twarg', 'Zarden', 'Random monsters');

my $cgi = CGI::Minimal->new;
my $select = $cgi->param('monster') ? encode_entities($cgi->param('monster'),'<>"') : undef;

my $head = $select && grep(/\Q$select\E/, @selects) ? $select : undef;
my $file_menu = file_menu('monster', \@selects , $select);

page( 'heading' => $head, 'file menu' => $file_menu, code => sub {
  if ($select && grep(/\Q$select\E/, @selects)) {
    print_monster($select) if $select ne 'Random monsters';
    section(3, sub { list(5, 'u', random_monster_list) }) if $select eq 'Random monsters';
  }
  else {
    section (3, sub {
      paragraph(3, "You can read about several new monsters or generate a list of random monsters from the <i>Monstrous Manual</i> and its many appendixes. Look there's $random_monster!");
      list(5, 'u', $file_menu, { 'class' => 'two' });
    });
  }
});
