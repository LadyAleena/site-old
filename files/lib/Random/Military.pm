package Random::Military;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_military random_military_by_location);

use Games::Dice qw(roll);

# Get the rank of the leader of the unit.
sub rank {
  my $unit = shift;

  my %ranks = (
    'squad'     => 'corporal',
    'platoon'   => 'sergeant',
    'company'   => 'lieutenant',
    'battalion' => 'captain',
    'regiment'  => 'major',
    'brigade'   => 'colonel',
    'division'  => 'general',
    'army'      => 'king',
  );

  return $ranks{$unit};
}

sub unit {
  my ($unit_type, $subunits) = @_;
  
  my $unit_leader = rank($unit_type);

  my $totals;
  $totals->{$unit_leader} = 1;
  for my $subunit (@$subunits) {
    my $unit_totals = $subunit->{totals};
    $totals->{$_} += $unit_totals->{$_} for keys %$unit_totals;
  }
  $totals->{total}++;
  
  return { 'unit' => $subunits, 'unit type' => $unit_type, 'unit leader' => $unit_leader, totals => $totals }
}

sub squad {
  my $roll = roll('2d4');
  my $unit_type = 'squad';
  my $unit_leader = rank($unit_type);
 
  my $totals;
  $totals->{$unit_leader} = 1;
  $totals->{soldiers} = $roll;
  $totals->{total}    = $roll + 1;

  return {  'soldiers' => $roll, 'unit type' => $unit_type, 'unit leader' => $unit_leader, 'totals' => $totals };
}

sub platoon {
  my $roll = roll('2d3');
  my @subunits = map { squad() } (1..$roll);
  my $unit = unit('platoon', \@subunits);
  return $unit;
}

sub company {
  my $roll = roll('2d2');
  my @subunits = map { platoon() } (1..$roll);
  my $unit = unit('company', \@subunits);
  return $unit;
}

sub battalion {
  my $roll = roll('2d2');
  my @subunits = map { company() } (1..$roll);
  my $unit = unit('battalion', \@subunits);
  return $unit;
}

sub regiment {
  my $roll = roll('2d2');
  my @subunits = map { battalion() } (1..$roll);
  my $unit = unit('regiment', \@subunits);
  return $unit;
}

sub brigade {
  my $roll = roll('2d2');
  my @subunits = map { regiment() } (1..$roll);
  my $unit = unit('brigade', \@subunits);
  return $unit;
}

sub division {
  my $roll = roll('2d2');
  my @subunits = map { brigade() } (1..$roll);
  my $unit = unit('division', \@subunits);
  return $unit;
}

sub army {
  my $roll = roll('2d2');
  my @subunits = map { division() } (1..$roll);
  my $unit = unit('army', \@subunits);
  return $unit;
}

# Get the unit.
sub random_military {
  my $group = shift;
  my %groups = (
    'squad'     => sub { &squad },
    'platoon'   => sub { &platoon },
    'company'   => sub { &company },
    'battalion' => sub { &battalion },
    'regiment'  => sub { &regiment },
    'brigade'   => sub { &brigade },
    'division'  => sub { &division },
    'army'      => sub { &army },
  );

  return &{$groups{$group}};
}

sub random_military_by_location {
  my $land_type = shift;

  my %lands = (
    'village'     => 'squad',
    'small town'  => 'platoon',
    'large town'  => 'company',
    'barony'      => 'battalion',
    'county'      => 'regiment',
    'duchy'       => 'brigade',
    'grand duchy' => 'division',
    'kingdom'     => 'army',
  );

  my $unit = $lands{$land_type};
  return random_military($unit);
}

1;
