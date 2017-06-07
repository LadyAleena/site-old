package Random::Alpha;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_alpha);

use Fancy::Rand qw(fancy_rand);

my @vowels = (0,4,8,14,20);

my %alphabet = (
  'upper case'       => ['A'..'Z'],
  'lower case'       => ['a'..'z']
);
$alphabet{'upper vowels'} = [@{$alphabet{'upper case'}}[@vowels]];
$alphabet{'lower vowels'} = [@{$alphabet{'lower case'}}[@vowels]];
$alphabet{'ascenders'}    = ['b', 'd', 'f', 'h', 'k', 'l', 't'],
$alphabet{'descenders'}   = ['g', 'j', 'p', 'q', 'y'];
$alphabet{'crosses and dots'} = ['f', 'i', 'j', 't'];

$alphabet{'Greek'} = [qw(Alpha Beta Gamma Delta Epsilon Digamma Zeta Eta Theta Iota Kappa Lambda Mu Nu Xi Omicron Pi San Qoppa Rho Sigma Tau Upsilon Phi Chi Psi Omega Sampi)];

sub random_alpha {
  my ($user_alpha, $user_additions) = @_;
  my $random_alpha = fancy_rand(\%alphabet, $user_alpha, { caller => 'random_alpha', additions => $user_additions ? $user_additions : undef });
  return $random_alpha;
}

=head1 NAME

B<Random::Alpha> selects random letters of the English alphabet.

=head1 SYNOPSIS

  use Random::Alpha qw(random_alpha);
  
  my $upper_case   = random_alpha('upper');            # selects an upper case letter
  my $lower_case   = random_alpha('lower');            # selects a lower case letter
  my $upper_vowel  = random_alpha('upper vowels');     # selects an A, E, I, O, or U
  my $lower_vowel  = random_alpha('lower vowels');     # selects an a, e, i, o, or u
  my $ascender     = random_alpha('ascenders');        # selects a b, d, f, h, k, l, or t
  my $descender    = random_alpha('descenders');       # selects a g, j, p, q, or y
  my $cross_or_dot = random_alpha('crosses and dots'); # selects an f, i, j, or t

  my $Greek        = random_alpha('Greek'); # selects a Greek letter spelled out
  
=head1 AUTHOR

Lady Aleena

=cut

1;
