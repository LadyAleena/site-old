package Fancy::Join::Defined;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);

our $VERSION = '1.0';
our @EXPORT = qw(join_defined);

sub join_defined {
  my $joiner = shift @_;
  return join($joiner, grep(defined, @_));
}

=head1 NAME

B<Fancy::Join::Defined> joins only defined values in a list.

=head1 SYNOPSIS

  my @base_colors = ('red', undef, 'green', undef, 'blue', undef);
  my $colors = join_defined(',', @base_colors);
  # red, green, blue

=head1 DESCRIPTION

C<join_defined> is exported by default and returns a string of only defined values from a list. It takes two parameters: the character which will join the list and a reference to the list.
 
=head1 AUTHOR

Lady Aleena

=cut

1;
