package Fancy::Join::Grammatical;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);

our $VERSION   = '1.0';
our @EXPORT_OK = qw(grammatical_join);

# Written with the help of DrForr in #perlcafe on freenode.
sub grammatical_join {
  my $conj = shift(@_) . ' '; 
  return $_[0] if @_ <= 1;
  return join( ' '.$conj, @_ ) if @_ == 2;
  my $punc = grep( /,/, @_ ) ? '; ' : ', ';
  push @_, $conj.pop;
  join($punc, @_);
}

=head1 NAME

B<Fancy::Join::Grammatical> joins a list with a final conjunction.

=head1 SYNOPSIS

  Use Fancy::Join::Grammatical qw(grammatical_join);

  my @color_array = ('red', 'yellow', 'green', 'cyan', 'blue', 'magenta');
  my $colors = grammatical_join('and', @color_array);
  # red, yellow, green, cyan, blue, and magenta

=head1 DESCRIPTION

C<grammatical_join> can be exported and returns a string of joined array values with commas and a comma with a conjunction between the last two values. It takes two parameters: the conjunction and the array. If any values within the array already have commas, semicolons will be used in place of commas.

=head1 SEE ALSO

L<Lingua::EN::Inflect> has C<WORDLIST> and L<Lingua::EN::Inflexion> has C<wordlist> which does a little more than C<grammatical_join>.

=head1 AUTHOR

Lady Aleena

=cut

1;
