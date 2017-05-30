package Random::Alpha;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_alpha);

use RolePlaying::Random qw(random);

my @vowels = (0,4,8,14,20);

my %alphabet = (
  'upper case'       => ['A'..'Z'],
  'lower case'       => ['a'..'z']
);
$alphabet{'upper vowels'} = [@{$alphabet{'upper case'}}[@vowels]];
$alphabet{'lower vowels'} = [@{$alphabet{'lower case'}}[@vowels]];
$alphabet{'below lines'}  = [@{$alphabet{'lower case'}}[9,15,16,24]];
$alphabet{'crosses and dots'} = [@{$alphabet{'lower case'}}[5,8,9,19]];

$alphabet{'Greek'} = [qw(Alpha Beta Gamma Delta Epsilon Digamma Zeta Eta Theta Iota Kappa Lambda Mu Nu Xi Omicron Pi San Qoppa Rho Sigma Tau Upsilon Phi Chi Psi Omega Sampi)];

sub random_alpha {
  my ($user_alpha) = @_;
  my $random_alpha = random(\%alphabet, $user_alpha);
  return $random_alpha;
}

=head1 NAME

B<Random::Alpha> returns random letters of the English alphabet.

=head1 SYNOPSIS

  use Random::Alpha qw(random_alpha);
  
  my $upper_case   = random_alpha('upper');            # returns an upper case letter
  my $lower_case   = random_alpha('lower');            # returns a lower case letter
  my $upper_vowel  = random_alpha('upper vowels');     # returns an A, E, I, O, or U
  my $lower_vowel  = random_alpha('lower vowels');     # returns an a, e, i, o, or u
  my $below_line   = random_alpha('below lines');      # returns a j, p, q, or y
  my $cross_or_dot = random_alpha('crosses and dots'); # returns an f, i, j, or t

  my $Greek        = random_alpha('Greek'); # returns a Greek letter spelled out
  
=head1 AUTHOR

Lady Aleena

=cut

1;
