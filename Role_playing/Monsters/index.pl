#!/usr/bin/perl
#This is the Role_playing/Monsters index.
use strict;
use warnings FATAL => qw( all );

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use HTML::Entities qw(encode_entities);
use Lingua::EN::Inflect qw(A);

use lib '../../files/lib';
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use HTML::Elements qw(nav section paragraph list anchor);
use Util::Convert qw(textify searchify);
use RolePlaying::Monster qw(print_monster);
use RolePlaying::Random::Monster qw(random_monster);

my $random_monster = A(random_monster);
my @selects = ('Chaos elemental-kin', 'Daemar', 'Dark centaur', 'Demi-lycanthrope', 'Dragod', 'Eldent', 'Gobpry', 'Phase elemental', 'Rainbow dragonette', 'Throglin', 'Tralg', 'Trobold', 'Twarg', 'Zarden', 'Random monsters');
my %multi_monsters = (
  'Throglin' => ['Throglin','Freshwater throglin','Saltwater throglin'],
  'Tralg'    => ['Arctic tralg','Desert tralg','Two-headed tralg'],
  'Twarg'    => ['Hill twarg','Mountain twarg','Jungle twarg'],
);

sub monster {
  my @monsters = ('<strong>Random monster:</strong> '.random_monster);
  for my $monster (
    'amorphous monster', 'amphibian monster', 'antherion', 'avian moster', qw(beholder centaur construct dragon),
    'equine monster', qw(faerie gargantua giant goblinoid grell gremlin hag harpy humanoid illithid), 'insectoid monster',
    'lycanthrope', 'medusa', 'planar creature', 'reptilian monster', qw(sphinx undead), 'underwater monster'
  ) {
    my $monster_text = textify($monster);
    push @monsters, "<strong>Random $monster_text:</strong> ".random_monster($monster);
  }
  return \@monsters;
}

my $cgi = CGI->new;
my $select = $cgi->param('monster') ? encode_entities($cgi->param('monster'),'<>"') : undef;
my $monsters = $select && $multi_monsters{$select} ? $multi_monsters{$select} : [$select];
my $head = $select && grep(/\Q$select\E/, @selects) ? $select : undef;
my $file_menu = file_menu('monster', \@selects , $select);
page( heading => $head, 'file menu' => $file_menu, code => sub {
  if ($select && grep(/\Q$select\E/, @selects)) {
    print_monster($monsters) if $select ne 'Random monsters';
    section(3, sub { list(5,'u', monster); }) if $select eq 'Random monsters';
  }
  else {
    section (3, sub {
      paragraph(3, "You can read about several new monsters or generate a list of random monsters from the Monstrous Manual and its many appendixes. Look there's $random_monster!");
      list(5, 'u', $file_menu, { 'class' => 'two' });
    });
  }
});
