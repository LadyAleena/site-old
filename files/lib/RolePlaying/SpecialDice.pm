package RolePlaying::SpecialDice;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(d16 percentile);

use Games::Dice qw(roll roll_array);

sub d16 {
  my $d6 = roll('1d6');
  my $d8 = roll('1d8');
  
  my $d16 = $d6 < 4 ? $d8 : $d8 + 8;
  
  return $d16;
}

sub percentile {
  my @rolls = roll_array('2d10');
  $_ = 0 for grep {$_ == 10} @rolls; #Thank you GrandFather.

  my $roll  = join('',@rolls);
     $roll =~ s/^0//;

  my $percentile = $roll == '00' ? 100 : $roll;

  return $percentile;
}

sub permille {
  my @rolls = roll_array('3d10');
  $_ = 0 for grep {$_ == 10} @rolls; #Thank you GrandFather.

  my $roll  = join('',@rolls);
     $roll =~ s/^0//;

  my $permille = $roll == '000' ? 1000 : $roll;

  return $permille;

}

sub permyriad {
  my @rolls = roll_array('4d10');
  $_ = 0 for grep {$_ == 10} @rolls; #Thank you GrandFather.

  my $roll  = join('',@rolls);
     $roll =~ s/^0//;

  my $permyriad = $roll == '0000' ? 10000 : $roll;
  
  return $permyriad;
}

1;
