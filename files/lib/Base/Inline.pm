package Base::Inline;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(inline);

use Text::Balanced qw(extract_bracketed extract_multiple);

use Util::FancySplice;

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

=cut
# Written by an Anonymous Monk on PerlMonks (http://www.perlmonks.org/?node_id=1028699)

use Test::More qw' no_plan ';
use Regexp::Common qw/ balanced /;

use vars qw/ $re_balanced_angles /;

sub TRACE; sub DEBUG;
*TRACE = *DEBUG = sub { print STDERR @_,"\n" };

our $re_balanced_angles = qr{\<(?:(?>[^\<\>]+)|(??{ $re_balanced_angles }))*\>}x;
 
our $allowed = join '|', qw[
A ABBR ACRONYM B BIG
CITE CODE DFN EM I KBD Q SAMP SMALL
SPAN STRONG SUB SUP TT VAR
];

sub inline {
    local $_ = $_[0];
    my $dent = $_[1] || 0;
    pos = 0;
    my $ret = "";
inlineLOOP:
    while( length > pos ){
        m{\G(\s+)}gcsx and do {
            $ret .= $1;
            next inlineLOOP;
        };
        m{\G( $allowed )( $re_balanced_angles )}gcsx and do {
            TRACE "# $dent allowed<> { $1 ( $2 ) }";
            $ret .= inline_allowed( "$1" , "$2" , $dent );
            next inlineLOOP;
        };
        m{\G([^<]+\s)}gcmx and do {
            TRACE "# $dent text { $1 }";
            $ret .= inline_text( "$1" );
            next inlineLOOP;
        };;;
        m{\G([\<\>])}gcmx and do {
            TRACE "## $dent error-stray<> { $1 } at pos(@{[pos]})";
            last inlineLOOP;
        };;;
        m{\G(\S)}gcmx and do {
            TRACE "# $dent inch-forward { $1 }";
            $ret .= inline_text( "$1" );
            next inlineLOOP;
        };;;
    }
    $ret;
}

sub inline_allowed {
    my( $tag , $stuff, $dent ) = @_;
    $stuff = $1 if $stuff =~ m{^<(.*)>$}gs;
    
    my $ret = "";
    $ret .= "<\L$tag\E" if $tag;
    
    $stuff =~ s{\|([^<>]+)$}{$ret .= " $1"; "";}gsex if defined $stuff ;
    ## inline_allowed_atts($tag,$1);
    $ret .= ">" if $tag;
    
    if( defined $stuff and length $stuff and $stuff =~ m{[<>]}g ){
        $ret .= inline( $stuff , $dent+1) ; ## recurse
    } else {
        $ret .= $stuff;
    }
    
    $ret .= "</\L$tag\E>" if $tag;
    $ret;
}

sub inline_text { join'',@_ }
