package Util::JoinDefined;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(join_defined);

sub join_defined {
  my ($joiner, $list) = @_;
  return join($joiner,grep(defined,(@$list)));
}

=head1 NAME

Util::JoinDefined - join only defined values in a list.

=head1 SYNOPSIS

  my $base_colors = ['red',undef,'green',undef,'blue',undef];
  my $colors = join_defined(',',$base_colors);
  # red,green,blue

=head1 DESCRIPTION

The C<joined_defined> function, exported by default, returns a string of only defined values from a list. It takes two parameters: the character which will join the list and a reference to the list.
 
=head1 AUTHOR

Lady Aleena

=cut

1;
