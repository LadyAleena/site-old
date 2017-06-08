package Util::Number;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(commify round pretty_number);

# commify, round, and pretty_number all make my numbers more readable.
# commify was found in the perlfaq5 to put commas in numbers.
sub commify {
  local $_  = shift;
  1 while s/^([-+]?\d+)(\d{3})/$1,$2/;
  return $_;
}

# sprintf written by james2vegas on PerlMonks.
sub round {
  my ($number, $precision) = @_;
  my $rounded = $number =~ /\./ ? sprintf("%.${precision}f", $number) : $number;
  return $rounded;
}

sub pretty_number {
  my ($number, $precision) = @_;
  my $pretty_number = commify(round($number, $precision));
  return $pretty_number;  
}

=head1 NAME

B<Util::Number> adds commas, rounds, and returns pretty numbers.

=head1 SYNOPSIS

  use Util::Number qw(commify round pretty_number);
  
  my $comma_number = commify(2468);
  # returns 2,468
  
  my $rounded_number = round(0.2468, 3);
  # returns .247
  
  my $pretty_number = pretty_number(2468.13579, 3);
  # returns 2,468.136

=head1 DESCRIPTION

B<Util::Number> contains three subroutines that make numbers prettier: C<commify>, C<round>, and C<pretty_number>.

=head2 commify

B<C<commify>> returns a number with commas between every three digits in the number. The code was found in L<the perldocs|http://perldoc.perl.org/perlfaq5.html#How-can-I-output-my-numbers-with-commas-added?>.

=head2 round

B<C<round>> rounds a decimal number by a set precision. If you want the number returned with three digits after the decimal, the precision would be set to 3.

  round($number, $precision);

=head2 pretty_number

B<C<pretty_number>> puts commify and round together so you can get rounded numbers with commas.

  pretty_number($number, $precision);

=head1 AUTHOR

Lady Aleena

=cut

1;
