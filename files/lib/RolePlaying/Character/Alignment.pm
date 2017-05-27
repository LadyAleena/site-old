package RolePlaying::Character::Alignment;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(expand_alignment);

sub expand_alignment {
  my ($var) = @_;
  $var = uc $var;
  $var =~ s/^(-\w|\w\+|\w\(\w\)|\w)(-\w|\w\+|\w\(\w\)|\w)$/$1 and $2/;
  $var =~ s/\((\w)\)/ with $1 tendencies/g;
  $var =~ s/(\w)\+/true $1/g;
  $var =~ s/-/non-/g;
  $var =~ s/T N/true neutral/;
  $var =~ s/N/neutral/g;
  $var =~ s/L/lawful/;
  $var =~ s/C/chaotic/;
  $var =~ s/G/good/;
  $var =~ s/E/evil/;
  $var =~ s/^(\w+) and (\w+)$/$1 $2/;
  return $var;
}

=head1 NAME

B<RolePlaying::Character::Alignment> generates random and expands alignments for AD&D 2nd Edition.

=head1 SYNOPSIS

To use this module to expand alignment abbreviations from their two character forms.

  use RolePlaying::Character::Alignment qw(expand_alignment);

Samples...

  expand_alignment('CG')                # returns "chaotic good".
  expand_alignment('LE')                # returns "lawful evil".

There is no default for expand_alignment.

=head1 AUTHOR

Lady Aleena with lots of help from DrForr, whoppix, and rindolf in the #perlcafe on freenode.

=cut

1;
