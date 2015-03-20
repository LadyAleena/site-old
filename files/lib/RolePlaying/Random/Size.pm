package RolePlaying::Random::Size;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_size);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
# POD written

my %relative_sizes = (
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
  my ($user_size) = @_;
  my $size = random(\%relative_sizes, $user_size);
  return $size;
}

=head1 NAME

B<Rolplaying::Random::Size> - returns relative sizes.

=head1 SYNOPSIS

  use RolePlaying::Random::Size qw(random_size);
  
  random_size('consistency') # returns either thicker or thinner.
  random_size('density') # returns either thicker or thinner.
  random_size('depth')   # returns either deeper or shallower.
  random_size('height')  # returns either taller or shorter.
  random_size('length')  # returns either longer or shorter.
  random_size('speed')   # returns either faster or slower.
  random_size('weight')  # returns either heavier or lighter.
  random_size('width')   # returns either wider or narrower.
  random_size('general') # returns either bigger or smaller.
  random_size('keys')    # returns a random selection from the keys above.
  random_size('all')     # returns a random selection from all of the above except keys.
  random_size('list')    # returns the hash from which the randomness was generated.
  random_size('help')    # returns a helpful message if you forget what your options are.

=head1 DESCRIPTION

The options for B<random_size> are: consistency, density, depth, height, length, speed, weight, width, or general.

If you can not remember what you want, you can always use C<random_size('help')> to retrieve the list of options.

=head1 AUTHOR

Lady Aleena

=cut

1;
