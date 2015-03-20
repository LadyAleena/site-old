package Util::FancySplit;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(fancy_split);

# written with help, but I'm embarrassed I didn't note them.
sub fancy_split {
  my ($character, $string, $number) = @_;
  
  my @split_array = split(/$character/,$string);

  my $rejoined;
  for (my $i = 0; $i < @split_array; $i += $number) {
    my $max = $i + $number - 1 > $#split_array ? $#split_array : $i + $number - 1;
    push @{$rejoined}, join($character, @split_array[$i..$max])
  }

  return $rejoined;
}

=head1 NAME

Util::FancySplit - split a string into groups.

=head1 SYNOPSIS

  my $string = "red, orange, yellow, spring, green, teal, cyan, azure, blue, violet, magenta, pink, white, black, gray";
  my @array = fancy_split(', ', $string, 2);

  [
    'red,orange',
    'yellow,spring',
    'green,teal',
    'cyan,azure',
    'blue,violet',
    'magenta,pink',
    'white,black',
    'gray'
  ];

=head1 DESCRIPTION

The C<fancy_split> function, exported by default, returns a referenced array split by a user specified amount. It takes two paraments: the size of the groups and the string to be split. The size can be any whole number.

=head1 AUTHOR

Lady Aleena

=cut

1;
