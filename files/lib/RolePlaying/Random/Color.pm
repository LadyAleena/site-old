package RolePlaying::Random::Color;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_color);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

my %colors = (
  'additive primary'      => [qw(red green blue)],
  'additive secondary'    => [qw(yellow cyan magenta)],
  'subtractive primary'   => [qw(red yellow blue)],
  'subtractive secondary' => [qw(orange green violet)],
  'pure' => [qw(white black red yellow green blue)],
  'gray' => [qw(white gray black)],
  'eye'  => [qw(amber black blue brown gray green hazel red violet)],
  'hair' => [qw(auburn brown black blond gray red white)],
  'star' => [qw(blue red orange yellow white)],
  'rainbow'  => [qw(red orange yellow green blue indigo violet)],
  'spectral' => [qw(infrared red orange yellow green blue violet ultraviolet)],
  'flower'   => [qw(amaranth cornflower fern heliotrope lavender lilac orchid rose violet)],
  'fruit'    => [qw(apricot lemon lime olive peach pear plum pumpkin raspberry tangerine tomato)],
  'metallic' => [qw(brass bronze cobalt copper gold platinum silver steel tin)],
  'organic mineral' => [qw(amber coral ivory seashell)],
  'karate belt' => [qw(white orange yellow gold green blue red purple brown black)],
  'Pern dragon' => [qw(blue green brown bronze gold)],
);
$colors{'additive'}         = [map( @{$colors{$_}}, ('additive primary','additive secondary') )];
$colors{'additive plus'}    = [map( @{$colors{$_}}, ('additive','gray') )];
$colors{'subtractive'}      = [map( @{$colors{$_}}, ('subtractive primary','subtractive secondary') )];
$colors{'subtractive plus'} = [map( @{$colors{$_}}, ('subtractive','gray') )];

sub random_color {
  my ($user_color) = @_;
  my $color = random(\%colors, $user_color);
  return $color;
}

1;
