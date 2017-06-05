package Random::RPG::SavingThrow;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(random_saving_throw);

use Fancy::Rand qw(fancy_rand);

my %saving_throws = (
  'paralyzation/poison/death magic' => [qw(paralyzation poison), 'death magic'],
  'rods/staves/wands' => [qw(rods staves wands)],
  'petrifaction/polymorph' => [qw(petrifaction polymorph)],
  'breath weapon' => ['breath weapon'],
  'spells' => ['spells']
);

sub random_saving_throw {
  my ($user_saving_throw, $user_additions) = @_;
  my $saving_throw = fancy_rand(\%saving_throws, $user_saving_throw, { caller => 'random_saving_throw', additions => $user_additions ? $user_additions : undef });
  return $saving_throw;
}

=head1 NAME

B<Random::RPG::SavingThrow> selects random saving throws from I<Advanced Dungeons & Dragons, Second Edition>.

=head1 SYNOPSIS

  use Random::RPG::SavingThrow qw(random_saving_throw);

=head1 AUTHOR

Lady Aleena

=cut

1;
