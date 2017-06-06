package Base::Inline;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(inline);

# see also an alternative written by an Anonymous Monk on PerlMonks (http://www.perlmonks.org/?node_id=1028699)

use Text::Balanced qw(extract_bracketed extract_multiple);

use Fancy::Splice qw(fancy_splice);

my $allowed = join('|', qw(A ABBR ACRONYM B BIG CITE CODE DFN EM I KBD Q SAMP SMALL SPAN STRONG SUB SUP TT VAR));

sub inline {
  my ($text) = @_;
  $text =~ s/\s\<!.+$//;

  my $brackets = fancy_splice(2, extract_multiple( $text, [ sub { extract_bracketed($_[0],'<>', qr(.*?(?=<)) ) } ] ));

  my $end = undef;
  if (scalar @{$brackets->[-1]} == 1) {
    $end = shift @{$brackets->[-1]};
    pop @{$brackets};
  }

  my $line;
  for my $bracket (@$brackets) {
    (my $start = $bracket->[0]) =~ s/^(.+|)\b(.+)$/$1/;
    (my $tag   = $bracket->[0]) =~ s/^(.+|)\b(.+)$/$2/;

    if ($tag && $tag =~ /^(.+|)($allowed)$/) {
      $start .= $1;
      $tag = lc $2;
    }
    else {
      $tag = lc $tag;
    }

    (my $tagged = $bracket->[1]) =~ s/^\<(.+)\>$/$1/;
    my @in_parts = split(/\|/,$tagged);
    my $attribute = scalar @in_parts > 1 &&  $in_parts[-1] !~ /\>/ ? ' '.pop @in_parts : '';
    my $in_tag = join('|',@in_parts);

    $in_tag = $in_tag =~ /\</ ? inline($in_tag) : $in_tag;
    
    $line .= "$start<$tag$attribute>$in_tag</$tag>";
  }
  $line .= $end if $end;

  return $line;
}

1;
