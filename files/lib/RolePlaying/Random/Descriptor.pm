package RolePlaying::Random::Descriptor;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_descriptor);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

my %descriptors = (
  'good'     => [qw(good great wonderful glorious)],
  'quality'  => [qw(excellent good average poor terrible)],
  'rarity'   => ['common', 'uncommon', 'rare', 'very rare', 'unique'],
  'reaction' => [qw(hostile unfriendly indifferent friendly)],
);

sub random_descriptor {
  my ($user_descriptor) = @_;
  my $descriptor = random(\%descriptors, $user_descriptor);
  return $descriptor;  
}

1;
