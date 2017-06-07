package Random::Descriptor;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_descriptor);

use Fancy::Rand qw(fancy_rand);

my %descriptors = (
  'good'     => [qw(good great wonderful glorious)],
  'bad'      => [qw(bad horrible awful atrocious)],
  'quality'  => [qw(excellent good average poor terrible)],
  'rarity'   => ['common', 'uncommon', 'rare', 'very rare', 'unique'],
  'reaction' => [qw(hostile unfriendly indifferent friendly)],
);

sub random_descriptor {
  my ($user_descriptor, $user_additions) = @_;
  my $descriptor = fancy_rand(\%descriptors, $user_descriptor, { caller => 'random_descriptor', additions => $user_additions ? $user_additions : undef });
  return $descriptor;  
}

=head1 NAME

B<Random::Descriptor> selects a random descriptor.

=head1 SYNOPSIS

  use Random::Descriptor qw(random_descriptor);

  my $descriptor = random_descriptor;           # selects any descriptor
  my $good     = random_descriptor('good');     # selects a random good descriptor
  my $bad      = random_descriptor('bad');      # selects a random bad descriptor
  my $quality  = random_descriptor('quality');  # selects a random quality
  my $rarity   = random_descriptor('rarity');   # selects a random rarity
  my $reaction = random_descriptor('reaction'); # selects a random reaction
  
=head1 AUTHOR

Lady Aleena

=cut

1;
