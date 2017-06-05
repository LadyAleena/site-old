package Random::Color;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_color);

use Base::Data qw(data_file);
use Fancy::Rand qw(fancy_rand);

open(my $Crayola_fh, '<', data_file('Colors', 'Crayola_crayon_colors.txt')) || die "Can not open Crayola_crayon_colors.txt, $!";
my @Crayola_crayons = map { chomp($_); $_ } <$Crayola_fh>;

open(my $MandMs_fh,  '<', data_file('Colors', 'MandMs_colors.txt')) || die "Can not open MandMs_colors.txt, $!";
my @MandMs = map { chomp($_); $_ } <$MandMs_fh>;

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
  'karate belt'     => [qw(white orange yellow gold green blue red purple brown black)],
  'Crayola crayons' => [@Crayola_crayons],
  'M&Ms'            => [@MandMs],
  'Olympic rings'   => [qw(blue yellow black green red)],
  'Pern dragon'     => [qw(blue green brown bronze gold)],
);
$colors{'additive'}         = [map( @{$colors{$_}}, ('additive primary','additive secondary') )];
$colors{'additive plus'}    = [map( @{$colors{$_}}, ('additive','gray') )];
$colors{'subtractive'}      = [map( @{$colors{$_}}, ('subtractive primary','subtractive secondary') )];
$colors{'subtractive plus'} = [map( @{$colors{$_}}, ('subtractive','gray') )];

sub random_color {
  my ($user_color, $user_additions) = @_;
  my $color = fancy_rand(\%colors, $user_color, { caller => 'random_color', additions => $user_additions ? $user_additions : undef });
  return $color;
}

=head1 NAME

B<Random::Color> selects random colors.

=head1 SYNOPSIS

  my $gray                  = random_color('gray'); # selects from white, gray, and black.

  my $additive_primary      = random_color('additive primary');   # selects from red, green, and blue.
  my $additive_secondary    = random_color('additive secondary'); # selects from yellow, cyan, and magenta.
  my $additive              = random_color('additive');           # combines additivie primary and additive secondary.
  my $additive_plus         = random_color('additive plus');      # combines additive and gray.

  my $subtractive_primary   = random_color('subtractive primary');   # selects from red, yellow, and blue.
  my $subtractive_secondary = random_color('subtractive secondary'); # selects from orange, green, and violet.
  my $subtractive           = random_color('subtractive');           # combines subtractive primary and subtractive secondary.
  my $subtractive_plus      = random_color('subtractive plus');      # combines additive and gray.

  my $pure_color            = random_color('pure');
    # selects from white, black, red, yellow, green, and blue.

  my $rainbow_color         = random_color('rainbow');         
    # selects from red, orange, yellow, green, blue, indigo, and violet.

  my $spectral_color        = random_color('spectral');
    # selects from infrared, red, orange, yellow, green, blue, violet, and ultraviolet.

  my $flower_color          = random_color('flower');
    # selects from amaranth, cornflower, fern, heliotrope, laventer, lilac, orchid, rose, and violet.

  my $fruit_color           = random_color('fruit');
    # selects from apricot, lemon, lime, olive, peach, pear, plum, pumpkin, raspberry, tangerine, and tomato.

  my $metallic_color        = random_color('metallic');
    # selects from brass, bronze, cobalt, copper, gold, platinum, silver, steel, and tin.

  my $organic_mineral_color = random_color('organic mineral');
    # selects from amber, coral, ivory, and seashell.

  my $eye_color             = random_color('eye');
    # selects from amber, black, blue, brown, gray, green, hazel, red, and violet.

  my $hair_color            = random_color('hair');
    # selects from auburn, brown, black, blonde, red, gray, and white.

  my $star_color            = random_color('star');
    # selects from blue, red, orange, yellow, and white.

  my $karate_belt_color     = random_color('karate belt');
    # selects from white, orange, yellow, gold, green, blue, red, purple, brown, black.

  my $Crayola_crayon_color  = random_color('Crayola crayons');
    # selects from a long list of Crayola crayon colors.

  my $MandM_color           = random_color('M&Ms');
    # selects from a long list of M&Ms colors.

  my $Olympic_ring_color    = random_color('Olympic rings');
    # selects from blue, yellow, black, green, and red.

  my $Pern_dragon_color     = random_color('Pern dragon');
    # selects from blue, green, brown, bronze, and gold.

=head1 NOTE

I am always looking for more lists of colors to add, so please send your lists of colors.

=head1 AUTHOR

Lady Aleena

=cut

1;
