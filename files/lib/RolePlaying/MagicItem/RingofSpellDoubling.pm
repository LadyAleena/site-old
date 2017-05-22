package RolePlaying::MagicItem::RingofSpellDoubling;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(make_ring random_ring);

use Lingua::EN::Inflect qw(ORD);
use List::Util qw(sum);

use Util::Number qw(commify);
use Fancy::Join::Grammatical;

my %spell_levels = (
  "wizard" => [1..9],
  "priest" => [1..7],
);

my %stats = (
  'wizard' => {
    'levels' => [1..9],
    'xp' => { 'base' => 4000,  'inc' => 400 },
    'gp' => { 'base' => 50000, 'inc' => 4000 }
  },
  'priest' => {
    'levels' => [1..7],
    'xp' => { 'base' => 6000,  'inc' => 600 },
    'gp' => { 'base' => 75000, 'inc' => 6000 }
  }
);

sub ring_value {
  my($class,$stat,@array) = @_;
  return $stats{$class}{$stat}{'base'} + ( (scalar(@array) - 1) * $stats{$class}{$stat}{'inc'} );
}

sub make_ring {
  my ($class,$levels) = @_;
  my @ring = sort @{$levels};

  my $ring_xp_value = commify(ring_value($class, 'xp', @ring));
  my $ring_gp_value = commify(ring_value($class, 'gp', @ring));

  my $ord_ring = grammatical_join( 'and', map( ORD($_), @ring ));

  $class = ucfirst $class;

  return "Ring of $class Spell Doubling which doubles $ord_ring level spells, and is worth $ring_xp_value experience and $ring_gp_value gold";
}

sub random_ring {
  my ($class) = @_;

  my @spell_type = qw(wizard priest);
  my $ring_class = $class ? $class : $spell_type[rand @spell_type];

  my @levels;
  for my $level (@{$spell_levels{$ring_class}}) {
    my $roll = int(rand(2));
    if ($roll == 1) {
      push @levels, $level;
    }
  }

  return make_ring($ring_class,\@levels);
}

1;
