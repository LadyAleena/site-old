package RolePlaying::Random::Thing;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_thing);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use RolePlaying::Random::MagicItem qw(random_magic_item);
use RolePlaying::Random::Monster qw(random_monster);
use RolePlaying::Random::Weapon qw(random_weapons);

use Lingua::EN::Inflect qw(PL_N);

my %things = (
  'plants'            => ['plants', qw(ferns flowers mosses trees weeds)],
  'animals'           => ['animals', qw(amphibians arthropods birds fish insects mammals reptiles)],
  'inanimate objects' => [
    'inanimate objects', 'musical instruments', 'religious symbols',
    qw(armor bedding boats books clothing dishes drinks food furniture jewelry rocks rugs tools wagons),
    map("$_ utensils",qw(cooking eating writing))
  ],
  'magic items'       => ['magic items', 'magical '.random_magic_item],
  'monsters'          => ['monsters', PL_N(random_monster,2)],
  'weapons'           => ['weapons', random_weapons]
);

sub random_thing {
  my ($user_thing) = @_;
  my $thing = random(\%things, $user_thing);
  return $thing;
}

1;
