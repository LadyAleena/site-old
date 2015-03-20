package RolePlaying::Random::Class;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_class random_class_special);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

use Lingua::EN::Inflect qw(PL_N);

my %classes = (
  'warrior'    => ['fighter','paladin','ranger'],
  'rogue'      => ['thief','bard'],
  'priest'     => ['cleric','priest','druid','shaman'],
  'wizard'     => ['mage','wizard'],
  'psionisist' => ['psionisist'],
);

sub random_class {
  my ($user_class) = @_;
  my $class = random(\%classes, $user_class);
  return $class;
}

my %class_specials_info = (
  'warrior' => 'attacks',
  'thief'   => 'backstabs',
  'priest'  => 'turns undead',
  'wizard'  => 'reads scrolls'
);

my @class_specials = (map("$class_specials_info{$_} as a $_ of the same level. If already a $_, $class_specials_info{$_} at 1 level higher.",keys %class_specials_info));

sub random_class_special {
  return $class_specials[rand @class_specials]
}

1;
