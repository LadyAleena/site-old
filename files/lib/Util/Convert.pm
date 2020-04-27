package Util::Convert;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(filify hashtagify idify linkify searchify textify);

use Lingua::EN::Inflect qw(NUMWORDS);
use URI::Encode qw(uri_encode);

use Base::Path qw(base_path);

sub filify {
  my ($filename) = @_;
  $filename =~ s/<.*?>//g;
  $filename =~ s/[<>:"\/\\|?*\.]//g;
  $filename =~ s/ /_/g;
  return $filename;
}

sub hashtagify {
  my ($hashtag) = @_;
  $hashtag =~ s/&/and/g;
  $hashtag =~ s/\W//g;
  $hashtag =~ s/^/#/;
  return $hashtag;
}

sub idify {
  my @base = @_;
  my @ids = map {
    $_ =~ s/<.+?>//g;
    $_ =~ s/^(\d+([stnrdh]{2}|))/NUMWORDS($1)/e;
    $_ =~ s/\.\w{2,5}?$//;
    $_ =~ s/&amp/and/g;
    $_ =~ s/&/and/g;
    $_ =~ s/Æ/Ae/g;
    $_ =~ s/Ç/C/g;
    $_ =~ s/Ü/U/g;
    $_ =~ s/(é|ê)/e/g;
    $_ =~ s/#/No/g;
    $_ =~ s/ /_/g;
    $_ =~ s/[^\w:.\-]//g;
    $_;
  } grep {defined($_)} @base;
  return join('_',@ids);
}

sub linkify {
  my ($link) = @_;
#  $link =~ s/&/%26/g;
#  return uri_encode($link);
   return $link;
}

sub searchify {
  my ($text, $section) = @_;
  my $search = $text;
  $search =~ s/(?:_|\s|%20)/+/g;
  $search =~ s/^#/%23/;
  $search =~ s/&/%26/;
  $search .= '#'.idify(@$section) if $section;
  return $search;
}

sub textify {
  my ($text, $opt) = @_;
  my $root_link = base_path('link');
  $text =~ s/$root_link\///;
  $text =~ s/_/ /g;
  $text =~ s/ (Mr|Mrs|Ms|Dr) / $1. /g;
  $text =~ s/\s&\s/ &amp; /g;
  $text =~ s/\.{3}/&#8230;/g;
  $text =~ s/(\w|\b|\s|^)'(\w|\b|\s|$)/$1&#700;$2/g;
  $text =~ s/<.+?>//g      unless ($opt->{'html'}   && $opt->{'html'}   =~ /^[ytk1]/);
  $text =~ s/\s\(.*?\)$//  unless ($opt->{'parens'} && $opt->{'parens'} =~ /^[ytk1]/);
  $text =~ s/\.\w{2,5}?$// unless $text =~ /\.(?:com|net|org)$/;
#  $text =~ s/(?<!\A)((?<! )\p{uppercase})/ $1/g; # from Kenosis, kcott, and tye on PerlMonks
  return $text;
}

=head1 NAME

B<Util::Convert> converts strings into various formats.

=head1 SYNOPSIS

  my $string = 'Mr & Mrs Smith';

  my $text    = textify($string);    # returns Mr. &amp; Mrs. Smith
  my $id      = idify($string);      # returns Mr_and_Mrs_Smith
  my $search  = searchify($string);  # returns Mr+%26+Mrs+Smith
  my $file    = filify($string);     # returns Mr_&_Mrs_Smith
  my $hashtag = hashtagify($string); # returns #MrandMrsSmith

=head1 textify

C<textify> has two parameters.

The first parameter is the text that you want to make into an HTML friendly string.

  textify('<i>This & That</i> (2020)') # returns This &amp; That

The second paramter is a hash with two options.

If C<html> is specified, then HTML is not stripped out of the text string.

  textify('<i>This & That</i> (2020)', { html => 'yes' }) # returns <i>This &amp; That</i>

If C<parens> is specified, parenteses are not stripped out of the text string.

  textify('<i>This & That</i> (2020)',  { parens => 'yes' }) # returns This &amp; That (2020)

=head1 idify

C<idify> accepts a list of paramters that will be joined together to make one id.

  idify('This', 'That') # returns This_That

=head1 searchify

C<searchify> has two parameters.

The first paramenter is the text that you want to make into a search item.

  searchify('This and That') # returns This+%26+That

The second parameter is the optional section that is made into an id.

  searchify('This and That', 'The other thing') # returns This+%26+That#The_other_thing

=head1 AUTHOR

Lady Aleena

=cut

1;
