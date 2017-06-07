package Random::Size;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_size);

use Fancy::Rand qw(fancy_rand);

my %relative_sizes = (
  'amount'  => ['more',    'less'],
  'density' => ['thicker', 'thinner'],
  'depth'   => ['deeper',  'shallower'],
  'height'  => ['taller',  'shorter'],
  'length'  => ['longer',  'shorter'],
  'speed'   => ['faster',  'slower'],
  'weight'  => ['heavier', 'lighter'],
  'width'   => ['wider',   'narrower'],
  'general' => ['bigger',  'smaller']
);
$relative_sizes{'consistency'} = $relative_sizes{'density'};

sub random_size {
  my ($user_size, $user_additions) = @_;
  my $size = fancy_rand(\%relative_sizes, $user_size, { caller => 'random_size', additions => $user_additions ? $user_additions : undef });
  return $size;
}

=head1 NAME

B<Random::Size> selects random relative sizes.

=head1 SYNOPSIS

  use RolePlaying::Random::Size qw(random_size);
  
  random_size('amount')  # selects either more or less.
  random_size('consistency') # selects either thicker or thinner.
  random_size('density') # selects either thicker or thinner.
  random_size('depth')   # selects either deeper or shallower.
  random_size('height')  # selects either taller or shorter.
  random_size('length')  # selects either longer or shorter.
  random_size('speed')   # selects either faster or slower.
  random_size('weight')  # selects either heavier or lighter.
  random_size('width')   # selects either wider or narrower.
  random_size('general') # selects either bigger or smaller.
  random_size('keys')    # selects a random selection from the keys above.
  random_size('all')     # selects a random selection from all of the above except keys.
  random_size('list')    # selects the hash from which the randomness was generated.
  random_size('help')    # selects a helpful message if you forget what your options are.

=head1 DESCRIPTION

The options for B<random_size> are: amount, consistency, density, depth, height, length, speed, weight, width, or general.

If you can not remember what you want, you can always use C<random_size('help')> to retrieve the list of options.

=head1 AUTHOR

Lady Aleena

=cut

1;
