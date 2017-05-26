package RolePlaying::Random::Military;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_military);

use Games::Dice qw(roll);

sub squad {
  my $roll = roll('1d8');
  return $roll;
}

sub platoon {
  my $roll = roll('2d3');
  my @platoon;
  push @platoon, squad for (1..$roll);
  
  return [@platoon];
}

sub company {
  my $roll = roll('2d2');
  my @company;
  push @company, platoon for (1..$roll);
  
  return [@company];
}

sub battalion {
  my $roll = roll('2d2');
  my @battalion;
  push @battalion, company for (1..$roll);
  
  return [@battalion];
}

sub regiment {
  my $roll = roll('2d2');
  my @regiment;
  push @regiment, battalion for (1..$roll);
  
  return [@regiment];
}

sub brigade {
  my $roll = roll('2d2');
  my @brigade;
  push @brigade, regiment for (1..$roll);
  
  return [@brigade];
}

sub division {
  my $roll = roll('2d2');
  my @division;
  push @division, brigade for (1..$roll);
  
  return [@division];
}

sub army {
  my $roll = roll('2d2');
  my @army;
  push @army, division for (1..$roll);
  
  return [@army];
}

# Get the unit.
sub military {
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


sub random_military {
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
  return { 'unit type' => $unit, 'unit' => military($unit) }
}

1;
