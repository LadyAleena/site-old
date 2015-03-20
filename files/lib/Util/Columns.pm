package Util::Columns;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(get_columns);

use Lingua::EN::Inflect qw(NUMWORDS);

sub get_columns {
  my ($max_cols, $amount, $number) = @_;
  if ($amount <= $max_cols ** 2) {
    for my $num (1..$max_cols) {
      if ($amount >= $num ** 2 && $amount < ($num + 1) ** 2) {
        return $number && $number =~ /^[yt1]/ ? $num : NUMWORDS($num);
      }
    }
  }
  else {
    return $number && $number =~ /^[yt1]/ ? $max_cols : NUMWORDS($max_cols);
  }
}

=heading1 NAME

B<Util::Columns> generates a number for getting columns.

=heading1 USE

B<Util::Columns> exports c<get_columns> by default.

  use Util::Colums;
  
  print get_columns($maximum_amount_of_colums, $amount_of_items_on_list, $do_you_want_a_number_returned);

=cut

1;
