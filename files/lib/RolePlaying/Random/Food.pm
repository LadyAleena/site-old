package RolePlaying::Random::Food;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_food);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use Util::MapinMap qw(map_in_map);

my %foods = (
  'fruit' => [qw(apple apricot banana blueberry cherry grape grapefruit lemon lime orange peach pear plum raspberry strawberry tomato)],
  'tuber' => ['potato','sweet potato','yam'],
  'meat'  => [qw(beef lamb chicken pork turkey fish)],
  'appetizer'    => [map( "$_ chips", qw(corn potato) ), 'pretzels', 'crackers'],
  'lucky charms' => [map_in_map({ 'after'=> 'lucky charm' }, [
    'heart','star','horseshoe','green clover','blue moon','hourglass','rainbow','red balloon',
    map("swirled $_ moon", qw(pink orange yellow green blue purple)),
    map("$_->[0] hat with a $_->[1] clover", (['green', 'dark green'], ['blue', 'pink'], ['purple', 'green'], ['dark green', 'orange'], ['yellow', 'blue'], ['orange', 'green']))
  ])],
  'mm flavors'   => [map("$_ M&Ms",('milk chocolate','peanut','dark chocolate','dark chocolate peanut','almond','peanut butter','pretzel','triple chocolate','raspberry almond','chocolate almond','mint chocolate'))],
  'beer' => ['pale ale',map( "$_ beer", qw(stout mild wheat lager lambic) )]
);

sub random_food {
  my ($user_food) = @_;
  my $food = random(\%foods, $user_food);
  return $food;
}

1;
