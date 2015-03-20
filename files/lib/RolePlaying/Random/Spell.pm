package RolePlaying::Random::Spell;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_spell_casting random_spell_group random_spell_resistance random_spell_level random_spell_frequency);

# sub-part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(tinyrand);

use Games::Dice qw(roll);
use Lingua::EN::Inflect qw(ORD);

my %spells = (
  wizard => {
    groups => [qw(abjuration air alteration conjuration/summoning divination earth enchantment/charm fire illusion/phantasm invocation/evocation necromancy water)],
    group_label => 'school',
    levels => [1..9],
  },
  priest => {
    groups => [qw(air all animal astral chaos charm combat creation divination earth fire guardian healing law necromantic numbers plant protection summoning sun thought time travelers war wards water weather)],
    group_label => 'sphere',
    levels => [1..7],
  },
  psionisist => {
    groups => [qw(clairsentience psychokinesis psychometalolism psychoportation telepathy metapsionics)],
    group_label => 'discipline',
    subgroups => [qw(devotions sciences)],
  },
);

sub resist_roll {
  return roll('1d100');
}

sub random_spell_class {
  my ($all) = @_;
  
  my @classes = keys %spells;
  push @classes, 'all' if $all;

  return $classes[rand @classes];
}

sub random_spell_level {
  my ($user_class) = @_;
  my $class = $user_class ? $user_class : random_spell_class;
  my $level_list = $class eq 'psionisist' ? 'subgroups' : 'levels';
  my @levels = @{$spells{$class}{$level_list}};
  my $r_level = $levels[rand @levels];
  my $level = $class eq 'psionisist' ? "$r_level in the" : $r_level == 1 ? ORD($r_level).' level' : 'up to '.ORD($r_level).' level';
  
  return $level;
}

sub random_spell_frequency {
  my ($user_class) = @_;
  my $class = $user_class ? $user_class : random_spell_class;
  my @frequency = ('common','uncommon','rare','very rare');
  my $spell_frequency = $frequency[rand @frequency];
  my $spell_frequency_text = $class eq 'psionisist' ? random_spell_level('psionisist') : $spell_frequency eq 'common' ? $spell_frequency : "up to $spell_frequency";
  return $spell_frequency_text;
}

sub random_spell_group {
  my ($user_class) = @_;

  my $class = $user_class ? $user_class : random_spell_class;
  my @groups = @{$spells{$class}{'groups'}};
  my $spell_group = $groups[rand @groups];

  my $group_label = $spells{$class}{'group_label'};
  my $label = $class eq 'psionisist' ? "psionic $group_label" : "$group_label $class spells";

  return "$spell_group $label";
}

sub random_spell_resistance {
  my $class = random_spell_class(1);

  my $resist_roll = resist_roll;
  my @resistances = ('immune', "is ${resist_roll}% magic resistant", 'has no resistance');
  my $resistance = $resistances[rand @resistances];

  if ($class ne 'all') {
    my $spell_type = random_spell_group($class);
    return "$resistance to $spell_type";
  }
  else {
    return "$resistance to all spells and psionics";
  }
}

sub random_spell_casting {
  my ($time_frequency) = @_;

  my $class = random_spell_class;
  my $spell_frequency = tinyrand(random_spell_frequency($class),random_spell_level($class));
  my $spell_type = random_spell_group($class);
  my $verb = $class eq 'psionisist' ? 'uses' : 'casts';

  return join(' ',grep(length,($verb,$spell_frequency,$spell_type)))." as a natural ability $time_frequency <small>(See the $class progession.)</small>";
}

1;
