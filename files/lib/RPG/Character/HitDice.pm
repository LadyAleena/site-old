package RPG::Character::HitDice;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(hit_dice roll_hit_points);

use Games::Dice qw(roll);
use POSIX qw(ceil);

use RPG::Character::Class qw(convert_class class_level);

my %classes;
while (my $line = <DATA>) {
  my ($class,$die,$max_level,$plus) = split(/\|/,$line);
  $classes{$class}{die}       = $die;
  $classes{$class}{max_level} = $max_level;
  $classes{$class}{plus}      = $plus;
}

sub hit_dice {
  my ($class,$opt) = @_;
  
  my $die;
  if (ref($class) eq 'ARRAY') {
    my @die_array = map(hit_dice($_,$opt),@{$class});
    $die = [@die_array];
  }
  else {
    $class = convert_class($class,'HitDice');
    my $level = $opt->{'level'} ? $opt->{'level'} : class_level($class, $opt->{'experience'});

    my $max_level = $classes{$class}{max_level};

    $die = $classes{$class}{die};
    if ($level <= $max_level) {
      $die = $level.$die;
    }
    elsif ($level > $max_level) {
      my $plus = $classes{$class}{plus};
      $die = $max_level.$die.' + '.$plus * ($level - $max_level);
    }
  }
  return $die;
}

sub roll_hit_points {
  my ($class,$opt) = @_;
  
  my $roll;
  if (ref($class) eq 'ARRAY') {
    $roll += roll(hit_dice($_,$opt)) for @{$class};
    $roll = ceil($roll / scalar(@{$class}));
  }
  else {
    my $level = $opt->{level} ? $opt->{level} : class_level($class,$opt->{experience});

    my $dice = hit_dice($class, {level => $level });
    $roll = roll($dice);
  }
  return $roll;
}

=head1 NAME

B<RPG::Character::HitDice> returns the die type and amount of dice needed to roll the hit points for your character with C<hit_dice> or just rolls your character's hit points with C<roll_hit_points>.

=head1 DESCRIPTION

For both C<hit_dice> and C<roll_hit_points>, you will need your chracter's class or classes and level or experience points. Neither of the two functions are exported by default, so you will have to call them.

  use RPG::Character::HitDice qw(hit_dice roll_hit_points);

The classes are C<warrior>, C<rogue>, C<priest>, C<wizard>, C<psionisist>, C<chaos warden>, or C<theopsyelementalist>. The latter two classes are my creations.

=head2 C<hit_dice>

  hit_dice($class, { level => $level });

or

  hit_dice($class, { experience => $xp });
  hit_dice([$class1,$class2], { experience => $xp});
  
=head2 C<roll_hit_points>

  roll_hit_points($class, { level => $level });

or

  roll_hit_points($class, { experience => $xp });
  roll_hit_points([$class1,$class2], { experience => $xp});

=head1 AUTHOR

Lady Aleena

=cut

1;

__DATA__
warrior|d10|9|3
rogue|d6|10|2
priest|d8|9|2
wizard|d4|10|1
psionisist|d6|9|2
chaos warden|d8|10|2
theopsyelementalist|d6|9|2
