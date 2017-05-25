package RolePlaying::Random::Food;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_food);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use Fancy::Map qw(fancy_map);

my %foods = (
  'fruit' => [qw(apple apricot banana blueberry cherry grape grapefruit lemon lime orange peach pear plum raspberry strawberry tomato)],
  'tuber' => ['potato','sweet potato','yam'],
  'meat'  => [qw(beef lamb chicken pork turkey fish)],
  'appetizer'    => [map( "$_ chips", qw(corn potato) ), 'pretzels', 'crackers'],
  'Lucky Charms' => [fancy_map({ 'after'=> 'lucky charm' }, [
    'heart','star','horseshoe','green clover','blue moon','hourglass','rainbow','red balloon',
    map( "swirled $_ moon", qw(pink orange yellow green blue purple) ),
    map( "$_->[0] hat with a $_->[1] clover", (['green', 'dark green'], ['blue', 'pink'], ['purple', 'green'], ['dark green', 'orange'], ['yellow', 'blue'], ['orange', 'green']) ),
    map( "$_->[0] and $_->[1] swirled diamond", (['dark green', 'yellow'], ['purple', 'pink'], ['blue', 'green'], ['pink', 'white'], ['green', 'orange']) )
  ])],
  'Klondike bar flavors' => [map( ucfirst "$_ Klondike bar", ('original', 'dark chocolate', 'double chocolate', 'neopolitan', 'mint chocolate chip', 'rocky road', 'cookie dough swirl', 'brownie fidge swirl', 'caramel pretzel', 's\'mores', 'Oreo', 'Reese\'s', 'Krunch', 'Heath'))],
  'Kool-Aid flavors'     => [ map( "$_ Kool-Aid", ( 'Apple', 'Arctic Green Apple', 'Berry Blue', 'Black Cherry', 'Blastin\' Berry Cherry', 'Blue Berry Blast', 'Blue Moon Berry', 'Bunch Berry', 'Candy Apple', 'Cherry', 'Cherry Cracker', 'Chocolate', 'Cola', 'Eerie Orange', 'Frutas,Vermelhas', 'Golden Nectar', 'Grape', 'Grape Blackberry', 'Grape Tang', 'Great Blue-dini', 'Great Blueberry', 'Groselha', 'Guaraná', 'Ice Blue Raspberry Lemonade', 'Incrediberry', 'Jamaica', 'Kickin-Kiwi-Lime', 'Kolita', 'Lemon', 'Lemon Ice', 'Lemon-Lime', 'Lemonade', 'Lemonade Sparkle', 'Lime', 'Man-o-Mangoberry', 'Mandarina-Tangerine', 'Mango', 'Melon Mango', 'Mountainberry Punch', 'Oh-Yeah Orange-Pineapple', 'Orange', 'Orange Enerjooz', 'Peach', 'Piña-Pineapple', 'Pink Lemonade', 'Pink Swimmingo', 'Purplesaurus Rex', 'Rainbow Punch', 'Raspberry', 'Roarin\' Raspberry Cranberry', 'Rock-a-Dile Red', 'Root Beer', 'Scary Black Cherry', 'Scary Blackberry', 'Shaking Starfruit', 'Sharkleberry Fin', 'Slammin\' Strawberry-Kiwi', 'Soarin\' Strawberry-Lemonade', 'Solar Strawberry-Starfruit', 'Strawberry', 'Strawberry Falls Punch', 'Strawberry Splash', 'Strawberry Split', 'Strawberry-Raspberry', 'Summer Punch', 'Sunshine Punch', 'Surfin\' Berry Punch', 'Swirlin\' Strawberry-Starfruit', 'Tamarindo', 'Tangerine', 'Tropical Punch', 'Watermelon', 'Watermelon-Cherry' ))],
  'MM flavors'           => [map("$_ M&Ms",('milk chocolate','peanut','dark chocolate','dark chocolate peanut','almond','peanut butter','pretzel','triple chocolate','raspberry almond','chocolate almond','mint chocolate'))],
  'beer' => ['pale ale',map( "$_ beer", qw(stout mild wheat lager lambic) )]
);

sub random_food {
  my ($user_food) = @_;
  my $food = random(\%foods, $user_food);
  return $food;
}

1;
