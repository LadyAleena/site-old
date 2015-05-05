package RolePlaying::CharacterMutation;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(random_mutations);

use Games::Dice qw(roll);
use Lingua::EN::Inflect qw(PL_N A ORD);
use List::Util qw(sum max);

use Util::Convert qw(textify);
use RolePlaying::Random qw(tinyrand);

use RolePlaying::Random::Misc           qw(dice divinity proficiency_type sign);
use RolePlaying::Random::Class          qw(random_class random_class_special);
use RolePlaying::Random::Event          qw(random_event);
use RolePlaying::Random::Insanity       qw(random_mental_condition);
use RolePlaying::Random::MagicItem      qw(random_magic_item_special);
use RolePlaying::Random::Monster        qw(random_monster);
use RolePlaying::Random::Range          qw(random_range random_radius);
use RolePlaying::Random::SavingThrow    qw(random_saving_throw);
use RolePlaying::Random::SpecialAttack  qw(random_attack random_special_attack);
use RolePlaying::Random::Spell          qw(random_spell_casting random_spell_group random_spell_resistance);
use RolePlaying::Random::Thing          qw(random_thing);
use RolePlaying::Random::Time           qw(random_time_unit random_frequency);
use RolePlaying::Random::Weapon         qw(random_weapons random_magic_weapon random_weapon_damage);
use RolePlaying::Random::WildPsionics   qw(random_wild_psionic_talent);
use RolePlaying::Random::Body::Modification qw(random_body_modification random_body_color_change random_aura);
use RolePlaying::Random::Body::Function     qw(random_body_functions);

use RolePlaying::CharacterBuilding::AbilityScores qw(random_ability random_game_effect);

# This script randomly generates enhancements, diminishments, and mutations of player characters.
# Written by Lady Aleena
# Acknowledgements
# Perl Monks: Anno, bradenshep, Corion, ikegami, Limbic~Region, Petruchio, shmem, Sidhekin, wfsp, ysth and the rest of the community that has been so kind to me.

sub game_rolls {
  my @game_rolls = (
    random_ability.' checks',
    'on non-weapon proficiency checks',
    'to saving throws'.tinyrand('',' vs. '.random_saving_throw(tinyrand('keys','all'))),
    'Armor Class',
    'THAC0 modifier',
    'to Surprise'
  );
  return $game_rolls[rand @game_rolls];
}

sub parent_knows {
  return tinyrand('',' that '.tinyrand(qw(father mother)).' knows');
}

sub learning {
  my @learning = (
    PL_N(proficiency_type).parent_knows,
    'any language other than racial language',
    tinyrand(random_ability.' based',random_class('keys')).' non-weapon proficiencies',
    random_weapons('damage type'),
    'the '.random_spell_group('psionisist')
  );
  return $learning[rand @learning];
}

sub events {
  my @events = (
    'magic is used '.random_radius('touch', 'imperial'),
    'every '.random_event,
    'seeing '.A(random_monster)
  );
  my $event = $events[rand @events];
  return $event;
}

sub miscellaneous_magic {
  my @miscellaneous = (
    'magic dead',
    'a magic attracter',
    'addicted to magic energies',
    tinyrand(qw(blessed cursed)),
    'a '.random_range('simple','imperial').' radius '.tinyrand('wild magic','magic dead').' zone',
    A(random_monster('lycanthrope')),
    'fated to become '.A(random_monster('undead','keys')).' upon death',
    'a '.tinyrand(qw(major minor)).' '.tinyrand(qw(hero villain)).' in a prophesy',
    '<b>'.A(divinity).'</b> and should be retired'
  );
  return $miscellaneous[rand @miscellaneous];
}

sub effects {
  my @effects = (
    'wild magic surge after '.events,
    random_body_color_change.tinyrand(' after '.events,' at will'),
    random_body_functions.tinyrand(' after '.events,''),
    random_mental_condition.tinyrand(' after '.events,''),
    miscellaneous_magic.tinyrand(' after '.events,'')
  );
  my $effect = $effects[rand @effects];
  return $effect;
}

sub random_mutation {
  my @mutations = (
    'no unusual effect',
    'ability modifier',
    'game effect modifier',
    sub { return '<strong>Body modification:</strong> '.random_body_modification },
    sub { return '<strong>Special Attack:</strong> '.random_special_attack },
    sub { return random_class_special },
    sub { return random_spell_casting(random_frequency) },
    sub { return random_magic_item_special },
    'wild psionic talent',
    sub { return sign.roll('1d10').' '.game_rolls },
    sub { return random_spell_resistance },
    sub { return random_weapon_damage.tinyrand('',' from '.random_magic_weapon) },
    'birth level',
    'max level',
    sub { return 'can '.tinyrand('only','not').' learn '.learning },
    sub { return 'can '.tinyrand('only','not').' use '.random_weapons('material') },
    sub { return 'can '.tinyrand('only','not').' make '.PL_N(random_event) },
    sub { return 'knows one '.proficiency_type.parent_knows },
    sub { return 'knows all '.PL_N(proficiency_type).parent_knows },
    sub { return 'attracts '.random_class.' followers' },
    sub { return tinyrand(qw(attracts repels)).' all '.random_thing('animals').' '.random_radius('touch','imperial') },
    sub { return tinyrand('communicates with','knows history of').' '.random_thing.' '.random_radius('touch','imperial') },
    sub { return 'has '.A(random_aura) },
    sub { return 'touch '.random_attack('touch special') },
    sub { return effects.tinyrand('',tinyrand('',' for '.A(random_time_unit('all')))) },
    sub { return 'is '.miscellaneous_magic }
  );

  my $mutation = $mutations[rand @mutations];
  return ref($mutation) eq 'CODE' ? &$mutation : $mutation;
}

sub random_mutations {
  my ($user_rolls) = @_;
  my $rolls = $user_rolls ? $user_rolls : roll(dice);

  my @effects;
  for (1..$rolls) {
    push @effects, random_mutation;
  };

  my %effects_count;
  ++$effects_count{$_} for @effects;
  delete $effects_count{'no unusual effect'};
  
  my @mutations;
  for my $effect (keys %effects_count) {
    my $value = $effects_count{$effect};
    if ($effect eq 'ability modifier') {
      my %abilities;
      $abilities{random_ability()}++ for (1..$value);
      for my $ability (keys %abilities) {
        my $rolls = $abilities{$ability};
        my $modifier = sum(map(sign.roll(dice),(1..$rolls)));
        $abilities{$ability} = $modifier > 0 ? "+$modifier" : $modifier;
      }

      for my $ability (qw(strength dexterity constitution intelligence wisdom charisma)) {
        if ($abilities{$ability} && $abilities{$ability} != 0) {
          push @mutations, "<strong>Ability score modifier:</strong> $ability ".$abilities{$ability};
        }
      }
    }
    elsif ($effect eq 'game effect modifier') {
      my %game_effects;
      $game_effects{random_game_effect()}++ for (1..$value);
      for my $game_effect (keys %game_effects) {
        my $rolls = $game_effects{$game_effect};
        my $modifier = sum(map(sign.roll(dice),(1..$rolls)));
        $game_effects{$game_effect} = $modifier > 0 ? "+$modifier" : $modifier;
      }
      
      for my $game_effect (sort keys %game_effects) {
        push @mutations, "<strong>Game effect modifier:</strong> $game_effect ".$game_effects{$game_effect};
      }
    }
    elsif ($effect eq 'birth level') {
      my @levels = map(roll(dice),(1..$value));
      my $birth_level = ORD(max(@levels));
      push @mutations, "born already at $birth_level level";
    }
    elsif ($effect eq 'max level') {
      my @levels = map(roll('5d4'),(1..$value));
      my $max_level = ORD(int(sum(@levels) / (scalar @levels / 2)));
      push @mutations, "can not advance past $max_level level";
    }
    elsif ($effect eq 'wild psionic talent') {
      my $psionics = random_wild_psionic_talent($value);
      push @mutations, $psionics if $psionics;
    }
    else {
      push @mutations, $value > 1 ? "$effect <em>($value)</em>" : $effect;
    }
  }

  @mutations = sort { textify($a) cmp textify($b) } @mutations;
  return \@mutations;
}

1;
