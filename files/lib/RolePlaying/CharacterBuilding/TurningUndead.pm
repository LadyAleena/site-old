package RolePlaying::CharacterBuilding::TurningUndead;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(turning_undead_table_rows);

use RolePlaying::CharacterBuilding::Class qw(convert_class get_level);

my @turns = (qw(20 19 16 13 10 7 4 T T D D), 'D*');
my @undead = (<DATA>);
chomp @undead;
my $base_turning = 4;

sub turning_undead_table_rows {
  my (%opt) = @_;
  my $classes = [map( convert_class($_, 'TurningUndead'), @{$opt{'classes'}})];
  my $class   = ( grep( /(?:priest|paladin)/, @$classes ) )[0];
  my $level   = $opt{'level'} ? $opt{'level'} : get_level($class, $opt{'experience'});
  
  die "Paladins can't turn undead before 3rd level, stopped" if ($class eq 'paladin' && $level < 3);
  
  my $max_turning_level = 15;
  
  # Paladins turn undead as two levels lower.
  my $turning_level = $class eq 'paladin' ? $level - 2 : $level;
  # The turning level is the level up to level 9.
  # After level 9 it is every 2 levels.
  if ($turning_level > 9) {
    $turning_level = int($level / 2) + 5;
    
    # There is no advancement over level 20, which is turning level 15.
    if ($turning_level > $max_turning_level) {
      $turning_level = $max_turning_level;
    }
  }

  # I didn't want to put in a lot of D* at the end of the @turns array.
  if ($turning_level > 8) {
    my $push = $turning_level - 8;
    push @turns, 'D*' for (1..$push);
  }

  # I just wanted to grab what a priest could turn from @turns.
  my $max_turning = $base_turning + $turning_level;
  my @undead_turns = @turns;
  my @turnings = reverse splice(@undead_turns, 0, $max_turning);

  # Getting the array of arrayrefs which I can feed into a table.
  my @turning_undead;
  for (0..$#turnings) {
    push @turning_undead, [$undead[$_], $turnings[$_]] if defined($undead[$_]);
  }
  
  my @rows = (
    [ 'header', [['Undead', 'Turn roll']] ],
    [ 'whead',  \@turning_undead]
  );
  
  return \@rows;
}

1;

__DATA__
Skeleton or 1 HD
Zombie
Ghoul or 2 HD
Shadow or 3-4 HD
Wight of 5 HD
Ghast
Wraith or 6 HD
Mummy of 7 HD
Spectre or 8 HD
Vampire or 9 HD
Ghost or 10 HD
Lich or 11+ HD
Special**
