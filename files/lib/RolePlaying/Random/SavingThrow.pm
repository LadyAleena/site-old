package RolePlaying::Random::SavingThrow;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(random_saving_throw);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

my %saving_throws = (
  'paralyzation/poison/death magic' => [qw(paralyzation poison), 'death magic'],
  'rods/staves/wands' => [qw(rods staves wands)],
  'petrifaction/polymorph' => [qw(petrifaction polymorph)],
  'breath weapon' => ['breath weapon'],
  'spells' => ['spells']
);

sub random_saving_throw {
  my ($user_saving_throw) = @_;
  my $saving_throw = random(\%saving_throws, $user_saving_throw);
  return $saving_throw;
}

1;
