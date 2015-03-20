package RolePlaying::Random::MagicItem;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_magic_item random_magic_item_special);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random tinyrand);
use RolePlaying::Random::Range qw(random_radius);
use RolePlaying::Random::Time qw(random_time_unit);

use Lingua::EN::Inflect qw(A);

my %magic_items = (
  'liquids' => [qw(oils perfumes philters pigments potions salves water)],
  'scrolls' => [qw(papers parchments scrolls)],
  'rings'   => ['rings'],
  'rods'    => ['rods'],
  'staves'  => [qw(canes gaffs staves)],
  'wands'   => ['wands'],
  'books'   => [qw(books librams manuals maps spellbooks tomes)],
  'gems and jewelry' => [qw(amulets ankhs badges bracelets brooches cameos charms crowns crystals earrings eyeglasses gems glass goggles icons leaves lenses lockets medallions monocles necklaces pearls pendants periapts phyacteries prisms scarabs scepters scopes talismans torcs), 'holy symbols'],
  'clothing' => [qw(capes cloaks cloth coats dresses furs gowns robes shirts stockings tunics vests vestments)],
  'boots, gloves, and accessories' => [qw(anklets armbands bands boots bracers claws collars gauntlets gloves hands peglegs shoes slippers socks)],
  'girdles and helms' => [qw(belts buckles caps circlets girdles hats headbands helmets masks sashes turbans)],
  'containers'        => [qw(bags barrels basins beakers bottles bowls boxes braziers cabinets cages cans canisters canteens cases casks cauldrons censers chalices chests coffins containers decanters flagons flasks coblets horns jars jugs kettles mugs pitchers prisons scabbards tubs urns)],
  'dust and stones'   => [qw(apples beads berries bones candles chesses dust eggs feathers fingers incense marbles pies powders rocks roses seeds smoke soaps stones tarts tooth waxes weeds), 'air spores', 'ioun stones'],
  'household items'   => [qw(anvils aprons art awls banners bellows benches blankets brooms brushes buttons carpets chairs cords cots curtains desks doors fans forks gavels hammocks handkerchiefs harnesses hasps hinges hourglasses inkwells irons keys maps ladders ladles lamps locks logs matches mirrors muzzles nails needles pans pens picks pills plates poker rakes razors ropes saws seals shakers shovels spoons stairs strings sundials tables tapestries teas telescopes tents threads thrones torches utensils vanes yokes), 'balance scales', 'candle snuffers', 'fishing poles', 'grappling irons', 'mortars and pestles', 'quill pens', 'smoking_pipes', 'spinning wheels', 'tool sets'],
  'musical instruments' => [map( "$_ instruments", qw(percussion stringed wind brass) )],
  'weird stuff'       => [qw(anchors arms astrolabes balls balloons beacons boats bridles casts castles chains chariots coins cubes devices dice disks figureheads figurines fire fountains globes horseshoes huts idols kites locators masts mobiles nests oars oracles orbs pedestals pools rudders saddles sails ships skulls sledges spheres statues transportation trees turrets wells wheels wings), 'chess games', 'crystal balls', 'decks of cards', 'spelljamming hemls'],
  'humorous items'    => ['humorous items'],
  'armor and shields' => [qw(armor barding bonnets caparisons helmets shields)],
  'weapons'   => [qw(arrows axes ballistae blowguns bows catapults clubs daggers darts flails hammers harpoons helmseekers javelins lances maces mattocks nets paddleboard pellets polearms quivers shot sickles slings spears swords whips), 'battering rams', 'explosive devices', 'spelljamming rams', 'throwing stars'],
  'artifacts' => ['artifacts'],
);

sub random_magic_item {
  my ($user_item) = @_;
  my $magic_item = random(\%magic_items, $user_item);
  return $magic_item;
}

sub random_magic_item_special {
  my $item = tinyrand('magic items','magical '.random_magic_item);
  my @verbs = ('causes '.tinyrand(qw(dys mal)).'functions in', qw(attracts drains destroys interupts recharges repels));
  my $verb = $verbs[rand @verbs];
  my $end = tinyrand('',' in '.A(random_time_unit('general')));
  my $magic_item = tinyrand(
    'can '.tinyrand('use all', 'not use any').' '.$item,
    $verb.' '.$item.' '.random_radius('touch','imperial').$end
  );
  return $magic_item;
}

1;
