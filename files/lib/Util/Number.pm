package Util::Number;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(commify round pretty_number);

# commify, round, and pretty_number all make my numbers more readable.
# commify was found in the perldocs to put commas in numbers.
sub commify {
  local $_  = shift;
  1 while s/^([-+]?\d+)(\d{3})/$1,$2/;
  return $_;
}

# sprintf written by james2vegas on PerlMonks.
sub round {
  my ($precision, $number) = @_;
  my $rounded = $number =~ /\./ ? sprintf("%.${precision}f", $number) : $number;
  return $rounded;
}

sub pretty_number {
  my ($precision, $raw_number) = @_;
  my $pretty_number = commify(round($precision, $raw_number));
  return $pretty_number;  
}

=head1 NAME

B<Util::Number> adds commas, rounds, and returns pretty numbers.

=head1 Author

Lady Aleena

=cut

1;
