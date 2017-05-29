package Random::Water;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_water);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

my %waters = (
  'running'  => [qw(spring streamlet rivulet run brook creek stream estuary fjord river)],
  'standing' => [qw(drop puddle pool pond lake lagoon bay sea bight sound ocean)],
  'precipitation' => [qw(rain snow sleet hail)]
);

sub random_water {
  my ($user_water) = @_;
  my $water = random(\%waters, $user_water);
  return $water;
}

=head1 NAME

B<Random::Water> returns random running or standing water and precipitation.

=head1 AUTHOR

Lady Aleena

=cut

1;
