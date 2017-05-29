package RolePlaying::Random::Color::Hex;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_hex_color hex_color_with_number);

use Fancy::Split qw(fancy_split);

my $num = 0;
my %hex_colors;
for my $hex_code (0..9, "a".."f") {
  $hex_colors{$hex_code} = $num * 17;
  ++$num;
}

my %hex_math;
@hex_math{0..9, "a".."f"} = (0..15);

sub random_hex_code {
  my $code = (keys %hex_colors)[rand keys %hex_colors];
  return $code;
}

sub random_hex_color {
  my $hex_color;
  for (1..6) {
     $hex_color .= random_hex_code;
  }
  return $hex_color;
}

sub hex_color_with_number {
  my $in_color = shift;
  my $hex_color = $in_color ? $in_color : random_hex_color;
  my $values = fancy_split('', $hex_color, 2);

  my $rgb;
  for my $raw_hex (@$values) {
    my ($value1, $value2) = split(//, $raw_hex, 2);
    push @$rgb, ($hex_math{$value1} * 16) + $hex_math{$value2};
  }
  return "$hex_color (".join(' ', @$rgb).")";
}

=head1 NAME

B<Random::Color::Hex> returns random colors.

=head1 AUTHOR

Lady Aleena

=cut

1;
