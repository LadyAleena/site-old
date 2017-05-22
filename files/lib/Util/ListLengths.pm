package Util::ListLengths;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(longest_value shortest_value longest_length shortest_length);

sub longest_length {
  my $longest_length = 0;
  for my $item (@_) { 
    $longest_length = length($item) if ( !$longest_length || length($item) > $longest_length );
  }
  return $longest_length;
}

sub shortest_length {
  my $shortest_length = 0;
  for my $item (@_) { 
    $shortest_length = length($item) if ( !$shortest_length || length($item) < $shortest_length );
  }
  return $shortest_length;
}

sub longest_value {
  my $longest_length = longest_length(@_);
  my $long_list;
  for my $item (@_) { 
    push @$long_list, $item if length($item) == $longest_length;
  }
  return $long_list;
}

sub shortest_value {
  my $longest_length = shortest_length(@_);
  my $short_list;
  for my $item (@_) { 
    push @$short_list, $item if length($item) == $longest_length;
  }
  return $short_list;
}

=head1 NAME

B<Util::ListLengths> returns the value of the longest or shortest value or the length of the longest or shortest value.

=head1 SYNOPSIS

  use Util::ListLengths qw(get_longest_value get_shortest_value get_longest_length get_shortest_length);
  
  my @colors = ('red', 'orange', 'yellow', 'spring', 'green', 'teal', 'cyan', 'azure',
                'blue', 'violet', 'magenta', 'pink', 'white', 'black', 'gray');

  my $longest_values = longest_value(@colors);
  
  # [
  #   'magenta'
  # ]

  my $shortest_values = shortest_value(@colors);
  
  # [
  #   'red'
  # ]

  my $longest_length = longest_length(@colors);
  # 7
  
  my $shortest_length = shortest_length(@colors);
  # 3

=head1 DESCRIPTION

=head2 longest_value

=head2 shortest_value

C<longest_value> and C<shortest_value> return an arrayref with all the values that are either the longest or the shortest.

=head2 longest_length

=head2 shortest_length

C<longest_length> and C<shortest_length> return the longest or shortest integer length of the values of an array.

=head1 AUTHOR

Lady Aleena

=cut

1;
