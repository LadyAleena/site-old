package Random::SpecialDice;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_die percentile permille permyriad d16);

use Games::Dice qw(roll roll_array);

sub random_die {
  my $roll = shift;
  my @dice = qw(1d4 1d6 1d8 1d10 1d12 1d20);
  my $die = $dice[rand @dice];
  return $roll ? roll($die) : $die;
}

sub d16 {
  my $d6 = roll('1d6');
  my $d8 = roll('1d8');
  
  my $d16 = $d6 < 4 ? $d8 : $d8 + 8;
  
  return $d16;
}

sub percentile {
  my @rolls = roll_array('2d10');
  $_ = 0 for grep {$_ == 10} @rolls; # Thank you GrandFather.

  my $roll = join('',@rolls);
     $roll =~ s/^0//;

  my $percentile = $roll == '00' ? 100 : $roll;

  return $percentile;
}

sub permille {
  my @rolls = roll_array('3d10');
  $_ = 0 for grep {$_ == 10} @rolls; # Thank you GrandFather.

  my $roll = join('', @rolls);
     $roll =~ s/^0//;

  my $permille = $roll == '000' ? 1000 : $roll;

  return $permille;

}

sub permyriad {
  my @rolls = roll_array('4d10');
  $_ = 0 for grep {$_ == 10} @rolls; # Thank you GrandFather.

  my $roll = join('',@rolls);
     $roll =~ s/^0//;

  my $permyriad = $roll == '0000' ? 10000 : $roll;
  
  return $permyriad;
}

=head1 NAME

B<Random::SpecialDice> rolls for a random die, d16, percentile, permille, and permyriad.

=head1 SYNOPSIS

  use Random::SpecialDice qw(random_die percentile permille permyriad d16);
  
  my $die        = random_die;    # returns a die (1d4, 1d6, 1d8, 1d10, 1d12, 1d20)
  my $rolled_die = random_die(1); # rolls the random die and returns the result
  my $percent    = percentile;    # rolls a percentile using d10s
  my $permille   = permille;      # rolls a permille using d10s
  my $permyriad  = permyriad;     # rolls a permyriad using d10s
  
=head1 AUTHOR

Lady Aleena with help from GrandFather on PerlMonks.

=cut

1;
