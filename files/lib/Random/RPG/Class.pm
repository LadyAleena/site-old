package Random::RPG::Class;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_class random_class_special);

use Lingua::EN::Inflect qw(PL_N);

use Fancy::Rand qw(fancy_rand tiny_rand);

my %classes = (
  'warrior'    => ['fighter', 'paladin', 'ranger'],
  'rogue'      => ['thief', 'bard'],
  'priest'     => ['cleric', 'priest', 'druid', 'shaman'],
  'wizard'     => ['mage', 'wizard'],
  'psionisist' => ['psionisist'],
);

my %class_specials_info = (
  'warrior' => 'attacks',
  'thief'   => 'backstabs',
  'priest'  => 'turns undead',
  'wizard'  => 'creates magic items'
);

my @class_specials = (map(
  "$class_specials_info{$_} as a $_ of the same level. If already a $_, $class_specials_info{$_} at 1 level higher.",
  keys %class_specials_info
));

sub random_class {
  my ($user_class, $user_additions) = @_;
  my $class = fancy_rand(\%classes, $user_class, { caller => 'random_class', additions => $user_additions ? $user_additions : undef });
  return $class;
}

sub random_class_special {
  return tiny_rand(@class_specials);
}

=head1 NAME

B<Random::RPG::Classes> selects random adventurer classes from I<Advanced Dungeons & Dragons, Second Edition>.

=head1 SYNOPSIS

  use Random::RPG::Class qw(random_class random_class_special);

=head1 AUTHOR

Lady Aleena

=cut

1;
