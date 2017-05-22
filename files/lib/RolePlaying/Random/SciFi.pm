package RolePlaying::Random::SciFi;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_HHGTTG_sector random_MIB_agent);

use RolePlaying::Random::Misc qw(random_alpha random_Greek_letter);

sub random_letters {
  my ($number) = @_;
  my $letter = sub { random_alpha };
  my $letters;
  $letters .= &$letter for (1..$number);
  return $letters;
}

sub random_HHGTTG_sector {
  my @types = qw(Active Heavy Light Over Plural Passive Single Under);
  my $Greek = sub { random_Greek_letter };
  my $type  = sub { $types[rand @types] };
  return random_letters(2)." ".$type." ".random_letter." ".$Greek;
}

sub random_MIB_agent {
  my @letters = (1,2);
  my $letter  = sub { random_alpha };
  return random_letters($letter);
}

1;
