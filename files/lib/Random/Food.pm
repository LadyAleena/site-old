package Random::Food;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_food random_drink);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use Fancy::Map qw(fancy_map);

my %foods = (
  'fruit' => [qw(apple apricot banana blueberry cherry grape grapefruit lemon lime orange peach pear plum raspberry strawberry tomato)],
  'tuber' => ['potato','sweet potato','yam'],
  'meat'  => [qw(beef lamb chicken pork turkey fish)],
  'junk food'    => [ map( "$_ chips", qw(corn potato) ), 'pretzels', 'crackers'],
  'Lucky Charms' => [ fancy_map({ 'after'=> 'lucky charm' }, [
    'heart','star','horseshoe','green clover','blue moon','hourglass','rainbow','red balloon',
    map( "swirled $_ moon", qw(pink orange yellow green blue purple) ),
    map( "$_->[0] hat with a $_->[1] clover", (['green', 'dark green'], ['blue', 'pink'], ['purple', 'green'], ['dark green', 'orange'], ['yellow', 'blue'], ['orange', 'green']) ),
    map( "$_->[0] and $_->[1] swirled diamond", (['dark green', 'yellow'], ['purple', 'pink'], ['blue', 'green'], ['pink', 'white'], ['green', 'orange']) )
  ])],
  'Klondike bar' => [ map( "$_ Klondike bar", ('original', 'dark chocolate', 'double chocolate', 'neopolitan', 'mint chocolate chip', 'rocky road', 'cookie dough swirl', 'brownie fudge swirl', 'caramel pretzel', 's\'mores', 'Oreo', 'Reese\'s', 'Krunch', 'Heath')) ],
  'M&Ms'         => [ map( "$_ M&Ms",('milk chocolate', 'peanut', 'dark chocolate', 'dark chocolate peanut', 'almond', 'peanut butter', 'pretzel', 'triple chocolate', 'raspberry almond', 'chocolate almond', 'mint chocolate')) ],
);

my %drinks = (
  'beer'      => ['pale ale', map( "$_ beer", qw(stout mild wheat lager lambic) )],
  'hot drink' => [qw(coffee tea cider)],
  'juice'     => ['lemonade', map("$_ juice", qw(apple grape orange cranberry grapefruit tomato))],
  'Kool-Aid'  => [ map( "$_ Kool-Aid", ( 'Apple', 'Arctic Green Apple', 'Berry Blue', 'Black Cherry', 'Blastin\' Berry Cherry', 'Blue Berry Blast', 'Blue Moon Berry', 'Bunch Berry', 'Candy Apple', 'Cherry', 'Cherry Cracker', 'Chocolate', 'Cola', 'Eerie Orange', 'Frutas,Vermelhas', 'Golden Nectar', 'Grape', 'Grape Blackberry', 'Grape Tang', 'Great Blue-dini', 'Great Blueberry', 'Groselha', 'Guaraná', 'Ice Blue Raspberry Lemonade', 'Incrediberry', 'Jamaica', 'Kickin-Kiwi-Lime', 'Kolita', 'Lemon', 'Lemon Ice', 'Lemon-Lime', 'Lemonade', 'Lemonade Sparkle', 'Lime', 'Man-o-Mangoberry', 'Mandarina-Tangerine', 'Mango', 'Melon Mango', 'Mountainberry Punch', 'Oh-Yeah Orange-Pineapple', 'Orange', 'Orange Enerjooz', 'Peach', 'Piña-Pineapple', 'Pink Lemonade', 'Pink Swimmingo', 'Purplesaurus Rex', 'Rainbow Punch', 'Raspberry', 'Roarin\' Raspberry Cranberry', 'Rock-a-Dile Red', 'Root Beer', 'Scary Black Cherry', 'Scary Blackberry', 'Shaking Starfruit', 'Sharkleberry Fin', 'Slammin\' Strawberry-Kiwi', 'Soarin\' Strawberry-Lemonade', 'Solar Strawberry-Starfruit', 'Strawberry', 'Strawberry Falls Punch', 'Strawberry Splash', 'Strawberry Split', 'Strawberry-Raspberry', 'Summer Punch', 'Sunshine Punch', 'Surfin\' Berry Punch', 'Swirlin\' Strawberry-Starfruit', 'Tamarindo', 'Tangerine', 'Tropical Punch', 'Watermelon', 'Watermelon-Cherry' )) ],
)

sub random_food {
  my ($user_food) = @_;
  my $food = random(\%foods, $user_food);
  return $food;
}

sub random_drink {
  my ($user_drink) = @_;
  my $drink = random(\%drinks, $user_drink);
  return $drink;
}

=head1 NAME

B<Random::Food> returns either a random food or drink.

=head1 SYNOPSIS

  use Random::Food qw(random_food random_drink);

  my $food  = random_food;              # returns any food on the list
  my $fruit = random_food('fruit');     # returns a fruit
  my $tuber = random_food('tuber');     # returns a tuber
  my $meat  = random_food('meat');      # returns a meat
  my $junk  = random_food('junk food'); # returns a junk food
  my $Lucky_Charm  = random_food('Lucky Charms'); # returns a magically delicious Lucky Charm
  my $Klondike_bar = random_food('Klondike bar'); # returns a Klondike bar flavor
  my $MaM          = random_food('M&Ms');         # returns an M&M flavor

  my $drink = random_drink;              # returns any drink on the list
  my $beer  = random_drink('beer');      # returns a beer or ale
  my $hot   = random_drink('hot drink'); # returns a hot drink
  my $juice = random_drink('juice');     # returns a juice
  my $KoolAid = random_drink('Kool-Aid'); # returns a Kool-Aid flavor

=head1 AUTHOR

Lady Aleena

=cut

1;
