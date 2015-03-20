package RolePlaying::Random::Name::Pattern;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_name);

=head1 Pattern

This module generates random names by a specified pattern, based on Random Name by Jason Seeley.

=head2 Authors

Lady Aleena with help of simcop2387 of #perlcafe and #buubot on freenode and from the PerlMonks and others in #perlcafe.

=head2 Use

To use this module, please enter the following.

	use Games::Random::Name::Pattern qw(random_name);

When you want to generate a random name with this module, see the table below to build your pattern.

=head3 Patterns

  L   any single letter
  Z   any single letter or a combination of letters
  c   any single consonant
  v   any single vowel
  C   any double consonant bb dd gg kk ll mm nn pp rr ss tt zz
  V   any double vowel     aa ee oo uu
  B   any combination of consonants
  A   any combination of vowels
  D   any single or combination of consonants
  E   any single or combination of vowels
  e   a or e # not yet implemented
  u   o or u # not yet implemented

  a   ea ia oa ua
  b   mb rb
  h   ch gh ph sh th wh
  i   ai ei oi ui
  k   ck lk nk sk wk
  l   bl cl fl gl pl sl
  n   gn kn mn sn
  p   mp rp sp
  r   br cr dr fr gr mr pr sr tr wr
  t   nt rt st
  w   dw gw sw tw
  y   ay ey oy uy
  x   ng qu rth
  o   ae ao au eo eu ie io ou ue
  
  #   any single digit
  ^   capitalize next character

The simplest sample pattern is 

  random_name(cv);  #returns a random name with a single consonent and a single vowel.

  random_name(vc);  #returns the opposite by creating a name starting with a single vowel followed by a single consonent.

=head3 Repetition

If you want to repeat the next character in the pattern, put the amount of repeats directly in front of the character.

  random_name('L2v') #will return any letter first followed by any two single vowels.
  
If you want to repeat a group in the pattern, put the amount of repeats directly in front of the character, however you must surround the repeat in parentheses.

  random_name('L2(vc)') #will return any letter first follow by two repeated syllables each comprised of a single vowel and a single consonent.
=cut

my %alpha = (
  letters => ["a" .. "z"],
  consonants => {
    single => [qw(b c d f g h j k l m n p q r s t v w x y z)],
    combo_b => [qw(mb rb)],
    combo_h => [qw(ch gh ph sh th wh)],
    combo_k => [qw(ck lk nk sk wk)],
    combo_l => [qw(bl cl fl gl pl sl)],
    combo_n => [qw(gn kn mn sn)],
    combo_p => [qw(mp rp sp)],
    combo_r => [qw(br cr dr fr gr mr pr sr tr wr)],
    combo_t => [qw(nt rt st)],
    combo_w => [qw(dw gw sw tw)],
    combo_other => [qw(ng qu rth)],
    double => [qw(bb dd gg kk ll mm nn pp rr ss tt zz)],
  },
  vowels => {
    single => [qw(a e i o u)],
    combo_a => [qw(ea ia oa ua)],
    combo_i => [qw(ai ei oi ui)],
    combo_y => [qw(ay ey oy uy)],
    combo => [qw(ae ao au eo eu ie io ou ue)],
    double => [qw(aa ee oo uu)],
  },
  integers => [0 .. 9],
);
$alpha{consonants}{all_combos} = [
  @{$alpha{consonants}{combo_b}},
  @{$alpha{consonants}{combo_h}},
  @{$alpha{consonants}{combo_k}},
  @{$alpha{consonants}{combo_l}},
  @{$alpha{consonants}{combo_n}},
  @{$alpha{consonants}{combo_p}},
  @{$alpha{consonants}{combo_r}},
  @{$alpha{consonants}{combo_t}},
  @{$alpha{consonants}{combo_w}},
  @{$alpha{consonants}{combo_other}},
  @{$alpha{consonants}{double}},
];
$alpha{vowels}{all_combos} = [
  @{$alpha{vowels}{combo_a}},
  @{$alpha{vowels}{combo_i}},
  @{$alpha{vowels}{combo_y}},
  @{$alpha{vowels}{combo}},
  @{$alpha{vowels}{double}},
];
$alpha{consonants}{all} = [
  @{$alpha{consonants}{single}},
  @{$alpha{consonants}{all_combos}},
  @{$alpha{consonants}{single}},
];
$alpha{vowels}{all} = [
  @{$alpha{vowels}{single}},
  @{$alpha{vowels}{all_combos}},
  @{$alpha{vowels}{single}},
];
$alpha{all} = [
  @{$alpha{letters}},
  @{$alpha{consonants}{all_combos}},
  @{$alpha{letters}},
  @{$alpha{vowels}{all_combos}},
  @{$alpha{letters}},
];

sub random_letter {
  my ($letter) = @_;
  my $key;
  my $subkey;

  $key = 'letters'    if ($letter eq 'L');
  $key = 'all'        if ($letter eq 'Z');
  $key = 'consonants' if ($letter =~ m!(c|b|h|k|l|n|p|r|t|w|x|C|B|D)!);
  $key = 'vowels'     if ($letter =~ m!(v|a|i|y|o|V|A|E)!);
  $key = 'integers'   if ($letter eq '#');
  
  $subkey = 'single'     if ($letter =~ m!(c|v)!);
  $subkey = 'double'     if ($letter =~ m!(C|V)!);
  $subkey = 'all_combos' if ($letter =~ m!(B|A)!);
  $subkey = 'all'        if ($letter =~ m!(D|E)!);
  
  $subkey = "combo_$letter" if $letter =~ m/[bhklnprtwaiyo]/;
  $subkey = 'combo_other'   if ($letter eq "x");

  if (defined $key) {
    unless (defined $subkey) {
      return ${$alpha{$key}}[rand @{$alpha{$key}}];
    }
    else {
      return ${$alpha{$key}{$subkey}}[rand @{$alpha{$key}{$subkey}}];
    }
  }
  else {
    return $letter;
  }
}

sub random_name {
  my ($string) = @_;
  $string =~ s!(\d+)\(([^)]+)\)!$2 x $1!ge;
  $string =~ s!(\d+)(.)!$2 x $1!ge;
  my $result;
  for my $letter (split('',$string)) {
    $result .= random_letter($letter);
  }
  $result =~ s!\^(.)!\u$1!g;
  return $result;
}

1;
