package Util::Columns;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(number_of_columns);

use Lingua::EN::Inflect qw(NUMWORDS);

sub number_of_columns {
  my ($max_cols, $amount, $word) = @_;
  if ($amount <= $max_cols ** 2) {
    for my $num (1..$max_cols) {
      if ($amount >= $num ** 2 && $amount < ($num + 1) ** 2) {
        return $word && $word =~ /^[yt1]/i ? NUMWORDS($num) : $num;
      }
    }
  }
  else {
    return $word && $word =~ /^[yt1]/i ? NUMWORDS($max_cols) : $max_cols;
  }
}

=head1 NAME

B<Util::Columns> generates a number for getting columns based on exponential numbers.

=head1 SYNOPSIS

  use Util::Colums;
  
  print number_of_columns($maximum_amount_of_colums, $amount_of_items_on_list, $do_you_want_a_number_word_returned);

=head1 DESCRIPTION

B<Util::Columns> exports C<number_of_columns> by default.

C<number_of_columns> takes three parameters. The first parameter is the maximum amount of columns allowed. The second parameter is the amount of items on the list. The third parameter is the option to return a number word instead of an integer.

=head1 AUTHOR

Lady Aleena

=cut

1;
