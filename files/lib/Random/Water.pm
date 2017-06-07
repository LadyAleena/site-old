package Random::Water;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_water);

use Fancy::Rand qw(fancy_rand);

my %waters = (
  'running'  => [qw(spring streamlet rivulet run brook creek stream estuary fjord river)],
  'standing' => [qw(drop puddle pool pond lake lagoon bay sea bight sound ocean)],
  'precipitation' => [qw(rain snow sleet hail)]
);

sub random_water {
  my ($user_water, $user_additions) = @_;
  my $water = fancy_rand(\%waters, $user_water, { caller => 'random_water', additions => $user_additions ? $user_additions : undef });
  return $water;
}

=head1 NAME

B<Random::Water> selects random running or standing waters and precipitation.

=head1 AUTHOR

Lady Aleena

=cut

1;
