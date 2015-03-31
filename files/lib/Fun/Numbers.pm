package Fun::Numbers;
use strict;
use warnings;

use List::Util qw(sum);

## Primes function

# primes gets a list of primes between 1 and a specified number.
# If the user wants all primes from 1 to 100, the usage would be...
# primes(100);

sub primes {
  my $last_number = shift;
  my @primes;
  for my $number (1..$last_number) {
    # all numbers ending in 2, 4, 6, 8, or 0 are divisible by 2.
    # all numbers ending in 5 or 0 are divisible by 5.
    next if $number =~ /(2|4|5|6|8|0)$/;

    # numbers where the sum of the digits are evenly divisible by 3 are divisible by 3.
    next if sum(split(//,$number)) % 3 == 0;
    
    # numbers where the sum of the digits are evenly divisible by 9 are divisible by 9.
    next if sum(split(//,$number)) % 9 == 0;
    
    # There are other tests like the two above, however, they require breaking the number
    # and doing other calculations based on the number. I decided to skip those as they 
    # are computation heavy.

    my $match = 0;
    for my $divisor (2..$last_number) {
      $match++, last if ($number != $divisor && $number % $divisor == 0);
    }
    push @primes, $number if $match == 0;
    
    # adding 2, 3, and 5 back to the list since they were excluded above.
    push @primes, (2,3,5) if $number == 1;
  }
  return @primes;
}

## Fraction functions

# fraction_value returns the fractional value of a number.
# If the user wants 78/99 of 28, the usage would be...
# fraction_value(78, 99, 28);

sub fraction_value {
  my ($numerator, $denominator, $number) = @_;
  return ($number / $denominator) * $numerator;
}

# fractions_values returns a hash of all the fractional values of a number.
# If the user wants the values of 1/2 to 98/99 of 28, the usage would be...
# fractions_values(99, 28);
# fractions_values function written with the help of mofino and go|dfish in #perlcafe on freenode.

sub fractions_values {
  my ($max_denom, $number) = @_;
  my $max_denominator = $max_denom ? $max_denom : 4;

  my %fractions;
  for my $numerator (1..$max_denominator) {
    for my $denominator (($numerator + 1)..$max_denominator) {
      my $fraction = "$numerator/$denominator";
      $fractions{$fraction} = fraction_value($numerator, $denominator, $number);
    }
  }

  return %fractions;
}

## Roman numerals functions

# The use of lowercase letters to represent larger numbers is from Math::Roman.
# The use of underscore after to represent larger numbers is from Text::Roman.
# The use of underscore before to represent larger numbers is for completeness.

my %big_Roman_numerals = (
  'simple' => {
    'lowercase' => [qw(v x l c d m)],
    'underscore after'  => [qw(V_ X_ L_ C_ D_ M_)],
    'underscore before' => [qw(_V _X _L _C _D _M)]
  },
  'complex' => {
    'lowercase' => [qw(Mv Mx xl xc cd cm)],
    'underscore after'  => [qw(MV_ MX_ X_L_ X_C_ C_D_ C_M_)],
    'underscore before' => [qw(M_V M_X _X_L _X_C _C_D _C_M)]
  }
);


# list_Roman_numerals_values returns a hash with the values of the individual Roman numerals.
# If the user wants the Roman numerals for 4,000 and higher notated by an underscore after the letter, the usage would be..
# list_Roman_numerals_values('underscore after');
# The other two options are 'lowercase' and 'underscore before'.

sub list_Roman_numerals_values {
  my ($big_numeral) = @_;
  
  my @RSN = (qw(I V X L C D M),     @{$big_Roman_numerals{'simple'}{$big_numeral}});  # Roman simple numerals
  my @RCN = (qw(IV IX XL XC CD CM), @{$big_Roman_numerals{'complex'}{$big_numeral}}); # Roman complex numerals

  my %R2A; # Roman to Arabic
  @R2A{@RSN, @RCN} = qw(
      1 5 10 50 100 500 1000 5000 10000 50000 100000 500000 1000000
      4 9 40 90 400 900 4000 9000 40000 90000 400000 900000
  ); # numeric values
  
  return %R2A;
}

# list_values_Roman_numerals returns a hash with the individual Roman numerals of the values.
# It is the reverse of list_Roman_numerals_values with the same usage.

sub list_values_Roman_numerals {
  my ($big_numeral) = @_;
  my %A2R = reverse list_Roman_numerals_values($big_numeral);
  return %A2R; # Arabic to Roman
}

# Roman_overline returns a string with the large Roman numerals in an HTML span to achieve the overline.
# If the user wants the overline on 'mdxcMvXVIII', the usage would be...
# Roman_overline('mdxcMvXVIII', 'lowercase');
# Thanks to ikegami and runrig for their assistance in the CB the the regexen.

sub Roman_overline {
  my ($string, $notation) = @_;

  if ($notation eq 'lowercase') {
    $string =~ s/(\b|[VXLCDM]+)([vxlcdm]+)(\b|[IVXLCDM]+)/$1<span class="overline">\U$2\E<\/span>$3/g;
  }
  if ($notation =~ /underscore/) {
    if ($notation =~ /after/) {
      $string =~ s/((\w_)+)/<span class="overline">$1<\/span>/g;
    }
    if ($notation =~ /before/) {
      $string =~ s/((_\w)+)/<span class="overline">$1<\/span>/g;
    }
    $string =~ s/_//g;
  }

  return $string;
}

1;
