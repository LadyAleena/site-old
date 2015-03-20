package RolePlaying::CharacterBuilding::WizardSkills;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw();

sub get_specialty_powers {
  my ($specialty) = @_;
  my @powers = (
    "+2 to save vs. $specialty spells",
    "-2 to opponents' saves vs. $specialty spells",
    "Cast 1 $specialty spell as if 1d4 levels higher a day",
    "Memorize 1 extra $specialty spell"
  );
  return \@powers;
}

sub get_magic_item_creation {
  my ($class, $level) = @_;
  my @creations;
  push @creations, 'scrolls' if ( $class eq 'wizard' && $level >= 9 || $class eq 'priest' && $level >= 7 );
  push @creations, 'potions' if ( $level >= 9 );
  push @creations, 'other magic items', if ( $level >= 11 );
  
  return \@creations;
}

# unfinished

1;
