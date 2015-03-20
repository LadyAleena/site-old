package Util::TransformName;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(name_transform);

use List::MoreUtils qw(firstidx lastidx);

my @roman_numerals = qw(I II III IV V VI VII VIII IX X);
my $roman_numerals_string = join('|',@roman_numerals);

sub name_transform {
  my ($name,$opt) = @_;
  
  # If a suffix is so long it needs a comma, let's get it here.
  my ($base_name,$pre_suffix) = split(/, /,$name);
  
  # Split the rest of the name by the spaces.
  my @name = split(/ /,$base_name);
  
  # Now check the first array item to see if it is a common prefix.
  # Some are there for fun.
  my $prefix = $name[0] =~ /(?:Lady|Lord|[MD][rs]|Mrs|Miss|Pres|Gov|Sen|Officer)(?:|\.)/ ? shift @name : '';
  
  # Now check the last item of the array to see if it matches some common suffixes.
  # More Roman numerals can be aded.
  my $suffix = $pre_suffix ? $pre_suffix : 
               $name[-1] =~ /(?:Jr|Sr|Esq|$roman_numerals_string)(?:|\.)/ ? pop @name : '';
  
  # All values left should be the bare name. If only the first name is left,
  # it will be treated as the last name and sorted as such.
  # The option 'name_order' set to 1, true, yes, reverse, or first reverses the name order.
  # The option 'particle' set to 1, true, or yes will ignore the nobiliary particles de, van, or von.
  # The option 'joined' set to 1, true, or yes will not join last names which are created with an i or y.
  ## Be careful with 'joined'. It may pick up a middle initial I or Y and join the first name with surname.
  
  my $particle = firstidx { $_ =~ /^(?:v[ao]n|de)$/i } @name;
  my $joined   = lastidx  { $_ =~ /^[iy]$/i } @name;
  if (!$opt->{joined} && $joined == 1) {
    unshift @name, '';
    $joined++
  }
  
  my $surname = $opt->{name_order} && $opt->{name_order} =~ /^[1tyrf]/i ? shift @name :
                !$opt->{joined}    && $joined > -1   ? join(' ',splice(@name,$joined - 1,$#name)) :
                !$opt->{particle}  && $particle > -1 ? join(' ',splice(@name,$particle,$#name)) : pop @name;

  my $first_name  = shift @name // '';
  
  # Every name left should be middle names.
  my $other_names = @name ? join(' ',@name) : '';
  
  return [$surname,$first_name,$other_names,$prefix,$suffix];
}

1;
