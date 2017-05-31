package Random::Thing;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_thing random_animals random_musical_instruments random_plants random_utensils);

use RolePlaying::Random qw(random);
use RolePlaying::Random::MagicItem qw(random_magic_item);
use RolePlaying::Random::Monster qw(random_monster);
use RolePlaying::Random::Weapon qw(random_weapons);

use Lingua::EN::Inflect qw(PL_N);

my %things = (
  'animals'             => [qw(animals amphibians arthropods birds fish mammals reptiles insects spiders)],
  'plants'              => [qw(plants ferns flowers mosses trees weeds)],
  'armor'               => [qw(armor helmets shields)],
  'musical instruments' => ['musical instruments', map("$_ instruments", qw(brass percussion string woodwind))],
  'utensils'            => ['utensils', map("$_ utensils", qw(cooking eating writing))],
  'magic items'         => ['magic items', 'magical '.random_magic_item],
  'monsters'            => ['monsters', PL_N(random_monster,2)],
  'weapons'             => ['weapons', random_weapons],
  'other'               => ['inanimate objects', 'religious symbols', qw(bedding boats books clothing dishes furniture jewelry rocks rugs tools wagons)],
);

sub random_thing {
  my $thing = random(\%things, @_);
  return $thing;
}

sub random_animals             { random_thing('animals'            , { 'caller' => (caller(0))[3] }) }
sub random_musical_instruments { random_thing('musical instruments', { 'caller' => (caller(0))[3] }) }
sub random_plants              { random_thing('plants'             , { 'caller' => (caller(0))[3] }) }
sub random_utensils            { random_thing('utensils'           , { 'caller' => (caller(0))[3] }) }

1;
