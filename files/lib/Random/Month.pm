package Random::Month;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(random_month);

use Fancy::Rand qw(fancy_rand);

my %months = (
  'English'      => [qw(January February March April May June July August Spetember October November December)],
  'English abbr' => [qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Now Dec)],
  'Dutch'        => [qw(januari februari maart april mei juni juli augustus september oktober november december)],
  'French'       => [qw(janvier février mars avril mai juin juillet août septembre octobre novembre décembre)],
  'German'       => [qw(Januar Februar März April Mai Juni Juli August September Oktober November Dezember)],
  'Greek'        => [qw(Ianuários Fevruários Mártios Aprílios Máios Iúnios Iúlios Avghustos Septémvrios Októvrios Noémvrios Thekémvrios)],
  'Italian'      => [qw(gennaio febbraio marzo aprile maggio giugno luglio agosto settembre ottobre novembre dicembre)],
  'Spanish'      => [qw(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)],
);
# I wrote this hash for another reason, but Date::Calc killed the need for the original purpose.

sub random_month {
  my ($user_language, $user_additions) = @_;
  my $random_month = fancy_rand(\%months, $user_language, { caller => 'random_month', additions => $user_additions ? $user_additions : undef });
  return $random_month;
}

=head1 NAME

B<Random::Month> selects a random month by language.

=head1 SYNOPSIS

  use Random::Month qw(random_month);

  my $random_month = random_month();
  my $random_English_month = random_month('English');
  my $random_Dutch_month   = random_month('Dutch');
  my $random_French_month  = random_month('French');
  my $random_German_month  = random_month('German');
  my $random_Greek_month   = random_month('Greek');
  my $random_Italian_month = random_month('Italian');
  my $random_Spanish_month = rnadom_month('Spanish');

  my $random_English_month_abbr = random_month('English abbr');

  print random_month('help') # get random_month options

=head1 AUTHOR

Lady Aleena

=cut

1;
