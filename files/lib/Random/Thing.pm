package Random::Thing;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
use Lingua::EN::Inflect qw(PL_N);

use Fancy::Rand qw(fancy_rand);
use Random::RPG::MagicItem qw(random_magic_items);
use Random::RPG::Monster   qw(random_monster);
use Random::RPG::Weapon    qw(random_weapons);

our @EXPORT_OK = qw(random_things random_animals random_armor random_musical_instruments random_plants random_utensils
                    random_magic_items random_monster random_weapons);

my %things = (
  'animals'             => [qw(animals amphibians arthropods birds fish mammals reptiles insects spiders)],
  'plants'              => [qw(plants ferns flowers mosses trees weeds)],
  'armor'               => [qw(armor helmets shields)],
  'musical instruments' => ['musical instruments', map("$_ instruments", qw(brass percussion string woodwind))],
  'utensils'            => ['utensils', map("$_ utensils", qw(cooking eating writing))],
  'magic items'         => ['magical '.random_magic_items('all', ['items'])],
  'monsters'            => ['monsters', PL_N(random_monster, 2)],
  'weapons'             => [random_weapons('all', ['weapons'])],
  'other'               => ['inanimate objects', 'religious symbols', qw(bedding boats books clothing dishes furniture jewelry rocks rugs tools wagons)],
);

sub random_things {
  my ($user_thing, $user_additions) = @_;
  my $thing = fancy_rand(\%things, $user_thing, { caller => 'random_thing', additions => $user_additions ? $user_additions : undef });
  return $thing;
}

sub random_animals             { my $user_addition = shift; random_things('animals' , $user_addition) }
sub random_armor               { my $user_addition = shift; random_things('armor'   , $user_addition) }
sub random_plants              { my $user_addition = shift; random_things('plants'  , $user_addition) }
sub random_utensils            { my $user_addition = shift; random_things('utensils', $user_addition) }
sub random_musical_instruments { my $user_addition = shift; random_things('musical instruments', $user_addition) }

=head1 NAME

B<Random::Thing> selects random things.

=head1 AUTHOR

Lady Aleena

=cut

1;
