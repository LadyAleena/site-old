package Random::RPG::MagicItem;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_magic_items random_magic_item_action magic_item_enhancement magic_item_quirk);

use Lingua::EN::Inflect qw(A PL_N);

use Fancy::Rand   qw(fancy_rand tiny_rand);
use Random::Range qw(random_radius);
use Random::SpecialDice qw(percentile permille);

my %magic_items = (
  'liquids' => [qw(elixers oils perfumes philters pigments potions salves water)],
  'scrolls' => [qw(papers parchments scrolls)],
  'rings'   => ['rings'],
  'rods'    => ['rods'],
  'staves'  => [qw(canes gaffs staves)],
  'wands'   => ['wands'],
  'books'   => [qw(books librams manuals maps spellbooks tomes)],
  'gems and jewelry' => [qw(amulets ankhs badges bracelets brooches cameos charms crowns crystals earrings eyeglasses gems glass goggles icons leaves lenses lockets medallions monocles necklaces pearls pendants periapts phyacteries prisms scarabs scepters scopes talismans torcs), 'holy symbols'],
  'clothing'    => [qw(capes cloaks cloth coats dresses furs gowns robes shirts stockings tunics vests vestments)],
  'accessories' => [qw(anklets armbands bands boots bracers claws collars gauntlets gloves hands peglegs shoes slippers socks)],
  'girdles and helms'   => [qw(belts buckles caps circlets girdles hats headbands helmets masks sashes turbans)],
  'containers'          => [qw(bags barrels basins beakers bottles bowls boxes braziers cabinets cages cans canisters canteens cases casks cauldrons censers chalices chests coffins containers decanters flagons flasks coblets horns jars jugs kettles mugs pitchers prisons scabbards tubs urns)],
  'dust and stones'     => [qw(apples beads berries bones candles chesses dust eggs feathers fingers incense marbles pies powders rocks roses seeds smoke soaps stones tarts tooth waxes weeds), 'air spores', 'ioun stones'],
  'household items'     => [qw(anvils aprons art awls banners bellows benches blankets brooms brushes buttons carpets chairs cords cots curtains desks doors fans forks gavels hammocks handkerchiefs harnesses hasps hinges hourglasses inkwells irons keys maps ladders ladles lamps locks logs matches mirrors muzzles nails needles pans pens picks pills plates poker rakes razors ropes saws seals shakers shovels spoons stairs strings sundials tables tapestries teas telescopes tents threads thrones torches utensils vanes yokes), 'balance scales', 'candle snuffers', 'fishing poles', 'grappling irons', 'mortars and pestles', 'quill pens', 'smoking_pipes', 'spinning wheels', 'tool sets'],
  'musical instruments' => [map( "$_ instruments", qw(percussion stringed wind brass) )],
  'weird stuff'         => [qw(anchors arms astrolabes balls balloons beacons boats bridles casts castles chains chariots coins cubes devices dice disks figureheads figurines fire fountains globes horseshoes huts idols kites locators masts mobiles nests oars oracles orbs pedestals pools rudders saddles sails ships skulls sledges spheres statues transportation trees turrets wells wheels wings), 'chess games', 'crystal balls', 'decks of cards', 'spelljamming hemls'],
  'humorous items'      => ['humorous items'],
  'armor and shields'   => [qw(armor barding bonnets caparisons helmets shields)],
  'weapons'   => [qw(arrows axes ballistae blowguns bows catapults clubs daggers darts flails hammers harpoons helmseekers javelins lances maces mattocks nets paddleboard pellets polearms quivers shots sickles slings spears swords whips), 'battering rams', 'explosive devices', 'spelljamming rams', 'throwing stars'],
  'artifacts' => ['artifacts'],
);

my %reverse_magic_items;
for my $key (keys %magic_items) {
    $reverse_magic_items{$_} = $key for @{$magic_items{$key}};
}

my %magic_item_enhancement = (
  'liquids' =>  1,
  'scrolls' => 10,
  'rings'   =>  3,
  'rods'    => 15,
  'staves'  =>  7,
  'wands'   =>  8,
  'books'   =>  3,
  'gems and jewelry' => 1,
  'clothing'    => 6,
  'accessories' => 5,
  'girdles and helms'   =>  5,
  'containers'          =>  3,
  'dust and stones'     =>  2,
  'household items'     =>  1,
  'musical instruments' =>  4,
  'weird stuff'         =>  2,
  'humorous items'      => 20,
  'armor and shields'   =>  6,
  'weapons'             =>  1,
);

my %magic_item_quirk = (
  armor    => { low => 407, high => 412 },
  elixers  => { low =>  35, high =>  36 },
  philters => { low => 442, high => 443 },
  powders  => { low => 765, high => 767 },
  potions  => { low => 843, high => 844 },
  rings    => { low => 739, high => 741 },
  rods     => { low => 728, high => 742 },
  scrolls  => { low => 731, high => 740 },
  shields  => { low => 922, high => 927 },
  staves   => { low => 698, high => 704 },
  weapons  => { low =>   2, high =>   2 },
  enhancement => { low => 71, high => 80 },
);

my %quirks_roll;
$quirks_roll{$_} = 0 for  (1..86);
$quirks_roll{$_} = 1 for (87..94);
$quirks_roll{$_} = 2 for (95..98);
$quirks_roll{$_} = 3 for (99..100);

sub random_magic_items {
  my ($user_magic_item, $user_additions) = @_;
  my $magic_item = fancy_rand(\%magic_items, $user_magic_item, { caller => 'random_magic_items', additions => $user_additions ? $user_additions : undef });
  return $magic_item;
}

sub magic_item_enhancement {
  my ($magic_item) = @_;
  $magic_item = $magic_item !~ /.+s$/ ? PL_N($magic_item) : $magic_item;
  my $group = $reverse_magic_items{$magic_item} ? $reverse_magic_items{$magic_item} : $magic_item;
  return $group && permille() <= $magic_item_enhancement{$group} ? 1 : 0;
}

sub magic_item_quirk {
  my ($magic_item) = @_;
  $magic_item = $reverse_magic_items{$magic_item} && $reverse_magic_items{$magic_item} eq 'weapons' ? 'weapons' : $magic_item;

  my $quirked = 0;
  if ($magic_item_quirk{$magic_item}) {
    my $quirk_rolls = $magic_item_quirk{$magic_item};
    my $roll = $magic_item eq 'enhancement' ? percentile() : permille();

    if ($magic_item eq 'weapons') {
      my $next_roll = $roll >= $quirk_rolls->{low} && $roll <= $quirk_rolls->{high} ? percentile() : 0;
      $quirked = $next_roll == 64 ? 1 : 0;
    }
    else {
      $quirked = $roll >= $quirk_rolls->{low} && $roll <= $quirk_rolls->{high} ? 1 : 0;
    }
  }

  my $quirks = $quirked ? $quirks_roll{percentile()} : 0;
  
  return $quirks;
}

sub magic_item_verb {
  my ($magic_item) = @_;
  my @verbs = ('causes '.tiny_rand(qw(dys mal)).'functions in', qw(attracts drains destroys interupts recharges repels enhances));
  my $base_verb = tiny_rand(@verbs);
  my $verb = $base_verb eq 'enhances' ? magic_item_enhancement($magic_item) ? 'enhances' : magic_item_verb($magic_item) : $base_verb;
  return $verb;
}

sub random_magic_item_action {
  my $magic_item = random_magic_items('all', ['items']);
  my $verb = magic_item_verb($magic_item);

  my $magic_item_action = tiny_rand(
    'can '.tiny_rand('use all', 'not use any')." magic $magic_item",
    "$verb magic $magic_item ".random_radius('touch','imperial')
  );

  return $magic_item_action;
}

=head1 NAME

B<Random::RPG::MagicItem> selects random magic items from I<Advanced Dungeons & Dragons, Second Edition>.

=head1 SYNOPSIS

  use Random::RPG::MagicItem qw(random_magic_items random_magic_item_action);

=head1 AUTHOR

Lady Aleena

=cut

1;
