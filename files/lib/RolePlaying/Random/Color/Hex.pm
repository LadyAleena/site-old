package RolePlaying::Random::Color::Hex;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_hex_color random_hex_color_with_number);

my $num = 0;
my %hex_colors;
for my $hex_code (0..9, "a".."f") {
  $hex_colors{$hex_code} = $num * 17;
  ++$num;
}

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

sub random_hex_color_with_number {
  my $hex_color = random_hex_color;
  return $hex_color.' ('.join(' ', map($hex_colors{$_}, split('',$hex_color))).')';
}

1;
