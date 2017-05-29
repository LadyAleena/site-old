package Random::Title;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_title);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

my %titles = (
  'noble male'   => [qw(emperor king prince archduke duke count viscount baron squire master lord)],
  'noble female' => [qw(empress queen princess archduchess duchess countess viscountess baroness dame mistress lady)],
  'military'     => [qw(marshal general colonel major captain lieutenant sergeant corporal private)],
  'naval'        => [qw(admiral captain commander lieutenant ensign seaman)],
  'government'   => [qw(president secretary senator governor director commissioner mayor administrator manager)],
);

sub random_title {
  my ($user_title) = @_;
  my $title = random(\%titles, $user_title);
  return $title;
}

=head1 NAME

B<Random::Title> generates random titles given to people.

=head1 AUTHOR

Lady Aleena

=cut

1;
