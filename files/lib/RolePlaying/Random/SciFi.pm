package RolePlaying::Random::SciFi;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_HHGTTG_sector random_MIB_agent);

my @letters = ('A'..'Z');
my @Greeks = qw(Alpha Beta Gamma Delta Epsilon Digamma Zeta Eta Theta Iota Kappa Lambda Mu Nu Xi Omicron Pi San Qoppa Rho Sigma Tau Upsilon Phi Chi Psi Omega Sampi);
my @types = qw(Active Heavy Light Over Plural Passive Single Under);

sub random_letter {
  return $letters[rand @letters];
}

sub random_letters {
  my ($number) = @_;
  my $letter = sub { random_letter };
  my $letters;
  $letters .= &$letter for (1..$number);
  return $letters;
}

sub random_HHGTTG_sector {
  my $Greek = $Greeks[rand @Greeks];
  my $type = $types[rand @types];
  return random_letters(2)." ".$type." ".random_letter." ".$Greek;
}

sub random_MIB_agent {
  my @letters = (1,2);
  my $letter  = $letters[rand @letters];
  return random_letters($letter);
}

1;
