package Random::Descriptor;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_descriptor);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

my %descriptors = (
  'good'     => [qw(good great wonderful glorious)],
  'bad'      => [qw(bad horrible awful atrocious)],
  'quality'  => [qw(excellent good average poor terrible)],
  'rarity'   => ['common', 'uncommon', 'rare', 'very rare', 'unique'],
  'reaction' => [qw(hostile unfriendly indifferent friendly)],
);

sub random_descriptor {
  my ($user_descriptor) = @_;
  my $descriptor = random(\%descriptors, $user_descriptor);
  return $descriptor;  
}

=head1 NAME

B<Random::Descriptor> returns a random descriptor.

=head1 SYNOPSIS

  use Random::Descriptor qw(random_descriptor);

  my $descriptor = random_descriptor;           # returns any descriptor
  my $good     = random_descriptor('good');     # returns a random good descriptor
  my $bad      = random_descriptor('bad');      # returns a random bad descriptor
  my $quality  = random_descriptor('quality');  # returns a random quality
  my $rarity   = random_descriptor('rarity');   # returns a random rarity
  my $reaction = random_descriptor('reaction'); # returns a random reaction
  
=head1 AUTHOR

Lady Aleena

=cut

1;
