package RPG::InterspeciesAge;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(interspecies_age);

use Util::Number qw(round);

my %ages;
while (my $line = <DATA>) {
  my ($race, $start, $venerable, $max) = split(/\|/, $line);
  $ages{$race}{'start'}      = $start;
  $ages{$race}{'middle age'} = $venerable * 0.5;
  $ages{$race}{'old age'}    = ($venerable * 2) / 3;
  $ages{$race}{'venerable'}  = $venerable;
  $ages{$race}{'max age'}    = $max;
};

sub interspecies_age {
  my ($opt) = @_;

  my ($start, $middle, $venerable, $max, $old);
  my $divisor;
  for my $race (keys %$opt) {
    my $race_ages  = $ages{$race};
    my $base_ven   = $race_ages->{'venerable'};
    my $multiplier = $opt->{$race};
    $divisor   += $multiplier;
    $start     += $race_ages->{'start'} * $multiplier;
    $middle    += ($base_ven * 0.5) * $multiplier;
    $old       += (($base_ven * 2) / 3) * $multiplier;
    $venerable += $race_ages->{'venerable'} * $opt->{$race};
    $max       += $race_ages->{'max age'} * $opt->{$race};
  }

  my %new_ages = (
    'start'      => round(0, $start     / $divisor),
    'middle age' => round(0, $middle    / $divisor),
    'old age'    => round(0, $old       / $divisor),
    'venerable'  => round(0, $venerable / $divisor),
    'max age'    => round(0, $max       / $divisor)
  );
  
  return \%new_ages;
}

1;

__DATA__
dwarf|40|250|450
elf|100|350|750
gnome|60|200|500
halfling|15|100|200
sea elf|100|300|600
human|15|90|130
lizard man|15|110|120
triton|20|150|300
