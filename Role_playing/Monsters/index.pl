#!/usr/bin/perl
#This is the Role_playing/Monsters index.
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);
use Lingua::EN::Inflect qw(A);

use lib '../../files/lib';
use Base::Page qw(page passage);
use Base::Menu qw(file_menu);
use HTML::Elements qw(section paragraph list);
use Random::RPG::Monster qw(random_monster random_monster_list);
use RPG::Monster qw(monster_info);

my $multi_monsters = {
  'Throglin' => ['Throglin', 'Freshwater throglin', 'Saltwater throglin'],
  'Tralg'    => ['Arctic tralg', 'Desert tralg', 'Two-headed tralg'],
  'Twarg'    => ['Hill twarg', 'Mountain twarg', 'Jungle twarg'],
};

my $random_monster = A(random_monster);
my @selects = ('Chaos elemental-kin', 'Daemar', 'Dark centaur', 'Demi-lycanthrope', 'Dragod', 'Eldent', 'Gobpry', 'Phase elemental', 'Rainbow dragonette', 'Throglin', 'Tralg', 'Trobold', 'Twarg', 'Zarden', 'Random monsters');

my $cgi = CGI::Minimal->new;
my $select = $cgi->param('monster') ? encode_entities($cgi->param('monster'),'<>"') : undef;

my $head = $select && grep(/\Q$select\E/, @selects) ? $select : undef;
my $file_menu = file_menu('monster', \@selects , $select);

page( 'heading' => $head, 'file menu' => $file_menu, code => sub {
  if ($select && grep(/\Q$select\E/, @selects)) {
    if ($select ne 'Random monsters') {
      if ($multi_monsters->{$select}) {
        my $monster_attributes;
        my $monster_descriptions;
        for my $sub_monster (@{$multi_monsters->{$select}}) {
          my $new_monster = monster_info(3, $sub_monster, { slurp => 'yes' });
          my $attributes = $new_monster->{attributes};
          my $description = $new_monster->{description} ? $new_monster->{description} : undef;

          push @$monster_attributes, $attributes;
          push @$monster_descriptions, { heading => $sub_monster, description => $description};
        }
        section(3, sub {
          for my $list (@$monster_attributes) {
            list(4, 'u', $list, { class => 'monster multi' }); # the lists for all the monsters are printed before descriptions
          }
        });
        for my $monster_description (@$monster_descriptions) {
          # the descriptions for all the monsters are printed after the lists
          section(3, sub {
            print passage(5, $monster_description->{description}) if $monster_description->{description};
          }, { heading => [2, $monster_description->{heading}] });
        }
      }
      else {
        my $new_monster = monster_info(2, $select, { slurp => 'yes' });
        my $attributes  = $new_monster->{attributes};
        section(3, sub {
          list(4, 'u', $attributes, { class => 'monster two' });
        });
        section(3, sub {
          print passage(4, $new_monster->{description}) if $new_monster->{description};
        });
      }
    }
    else {
      section(3, sub { list(5, 'u', random_monster_list) });
    }
  }
  else {
    section (3, sub {
      paragraph(3, "You can read about several new monsters or generate a list of random monsters from the <i>Monstrous Manual</i> and its many appendixes. Look there's $random_monster!");
      list(5, 'u', $file_menu, { 'class' => 'two' });
    });
  }
});
