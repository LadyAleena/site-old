package Random::SciFi;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_HHGTTG_sector random_MIB_agent);

use Random::Alpha qw(random_alpha);

sub random_letters {
  my ($number) = @_;
  my $letter = sub { random_alpha('upper') };
  my $letters;
  $letters .= &$letter for (1..$number);
  return $letters;
}

sub random_HHGTTG_sector {
  my @types = qw(Active Heavy Light Over Plural Passive Single Under);
  my $Greek = sub { random_alpha('Greek') };
  my $type  = sub { $types[rand @types] };
  return random_letters(2)." ".$type." ".random_letter." ".$Greek;
}

sub random_MIB_agent {
  my @letters = (1, 2);
  my $letter  = sub { random_alpha('upper') };
  return random_letters($letter);
}

=head1 NAME

B<Random::SciFi> returns a random I<Hitckhikers Guide to the Galaxy> sector or a random I<Men in Black> agent id.

=head1 AUTHOR

Lady Aleena

=cut

1;
