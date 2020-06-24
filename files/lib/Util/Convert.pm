package Util::Convert;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(textify idify searchify filify hashtagify linkify);

use Encode;
use Lingua::EN::Inflect qw(NUMWORDS);

use Util::Path qw(base_path);

sub textify {
  my ($text, $opt) = @_;
  my $root_link = base_path('link');
  $text = decode('UTF-8', $text) if ($opt->{'decode'} && $opt->{'decode'} =~ /^[ytk1]/);
  $text =~ s/$root_link\///;
  $text =~ s/_/ /g;
  $text =~ s/\b(M[rsx]|Mrs|Dr|St|[SJ]r)\b(?!\.)/$1./g;
  # The following is an more robust version of the preceding, but it is overkill.
  # $text =~ s/(?<!Rev\s)\b(M[rsx]|Mrs|[FPBD]r|Rev|Ven|St|[SJ]r|Esq)\b(?!\.)/$1./g;
  $text =~ s/\s&\s/ &amp; /g;
  $text =~ s/\.{3}/&#8230;/g;
  $text =~ s/(\w|\b|\s|^)'(\w|\b|\s|$)/$1&#700;$2/g;
  $text =~ s/<.+?>//g      unless ($opt->{'html'}   && $opt->{'html'}   =~ /^[ytk1]/);
  $text =~ s/\s\(.*?\)$//  unless ($opt->{'parens'} && $opt->{'parens'} =~ /^[ytk1]/);
  $text =~ s/(.)\.\w{2,5}?$/$1/ unless $text =~ /\w\.(?:com|net|org)$/;
#  $text =~ s/(?<!\A)((?<! )\p{uppercase})/ $1/g; # from Kenosis, kcott, and tye on PerlMonks
  return encode('UTF-8', $text);
}

sub idify {
  my @base = @_;
  my @ids = map {
    $_ =~ s/<.+?>//g;
    $_ =~ s/^(\d+([stnrdh]{2}|))/NUMWORDS($1)/e;
    $_ =~ s/(.)\.\w{2,5}?$/$1/;
    $_ =~ s/&amp/and/g;
    $_ =~ s/&/and/g;
    $_ =~ s/Æ/Ae/g;
    $_ =~ s/Ç/C/g;
    $_ =~ s/Ü/U/g;
    $_ =~ s/(è|é|ê)/e/g;
    $_ =~ s/#/No/g;
    $_ =~ s/ /_/g;
    $_ =~ s/[^\w:.\-]//g;
    $_;
  } grep {defined($_)} @base;
  return encode('UTF-8',join('_',@ids));
}

sub searchify {
  my ($search, $section) = @_;
  $search =~ s/<.+?>//g;
  $search =~ s/(?:_|\s|%20)/+/g;
  $search =~ s/^#/%23/;
  $search =~ s/&/%26/;
  $search =~ s/(.)\.\w{2,5}?$/$1/;
  $search .= '#'.idify(@$section) if $section;
  return $search;
}

sub filify {
  my ($filename) = @_;
  $filename =~ s/<.*?>//g;
  $filename =~ s/[<>:"\/\\|?*\.]//g;
  $filename =~ s/ /_/g;
  return $filename;
}

sub hashtagify {
  my ($hashtag) = @_;
  $hashtag =~ s/<.+?>//g;
  $hashtag =~ s/(.)\.\w{2,5}?$/$1/;
  $hashtag =~ s/&amp/and/g;
  $hashtag =~ s/&/and/g;
  $hashtag =~ s/\W//g;
  $hashtag =~ s/^/#/;
  return $hashtag;
}

sub linkify {
  my ($link) = @_;
  $link =~ s/<.+?>//g;
  $link =~ s/ /_/g;
  return $link;
}

=head1 NAME

B<Util::Convert> converts strings into various formats.

=head1 SYNOPSIS

  my $string = 'Mr & Mrs Smith';

  my $text    = textify($string);    # returns Mr. &amp; Mrs. Smith
  my $id      = idify($array);       # returns Mr_and_Mrs_Smith
  my $search  = searchify($string);  # returns Mr+%26+Mrs+Smith
  my $file    = filify($string);     # returns Mr_&_Mrs_Smith
  my $hashtag = hashtagify($string); # returns #MrandMrsSmith

=head1 General notes

All of the subroutines remove html tags from the string with C<textify> having the option to leave them in the string.
They also strip off file extensions from the ends of strings with the exception of C<filify>.

=head1 textify

C<textify> returns an HTML friendly UTF-8 encoded string and has two parameters.

The first parameter is the text that you want to make into an HTML friendly string.

  textify('<i>This & That</i> (2020)') # returns This &amp; That

The second paramter is a hash with three options. The options can be set to 'yes', 'true', 'keep', or the number 1.

If C<html> is specified, then HTML is not stripped out of the text string.

  textify('<i>This & That</i> (2020)', { html => 'yes' }) # returns "<i>This &amp; That</i>"

If C<parens> is specified, parenteses are not stripped out of the text string.

  textify('<i>This & That</i> (2020)',  { parens => 'yes' }) # returns "This &amp; That (2020)"

If C<decode> is specified, the string will be UTF-8 decoded before it is reencoded to UTF-8.

  textify('This & That', { decode => 'yes' })

=head1 idify

C<idify> returns a string for use as an id. It accepts a list of paramters that will be joined together to make one id.

  idify('This & That')  # returns This_and_That
  idify('This', 'That') # returns This_That

=head1 searchify

C<searchify> returns a string for use as a URL search parameter and has two parameters.

The first paramenter is the text that you want to make into a search item.

  searchify('This & That') # returns This+%26+That

The second parameter is the optional section that is made into an id. This parameter uses L</"idify">, so must be an array reference.

  searchify('This & That', ['The other thing']) # returns This+%26+That#The_other_thing

=head1 filify

C<filify> returns a string to be used as a file name. All characters not allowed in file names are removed from the string.

  filify('This & That') # returns This_&_That

=head1 hashtagify

C<hashtagify> returns a string that can be used as a hashtag.

  hashtagify('This & That') # returns #ThisandThat

=head1 AUTHOR

Lady Aleena

=cut

1;
