package Util::Convert;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(filify idify linkify textify searchify hashtagify);

use Lingua::EN::Inflect qw(NUMWORDS);
use URI::Encode qw(uri_encode);

use Base::Root qw(get_root);

sub filify {
  my ($filename) = @_;
  $filename =~ s/<.*?>//g;
  $filename =~ s/[<>:"\/\\|?*\.]//g;
  $filename =~ s/ /_/g;
  return $filename;
}

sub idify {
  my @base = @_;
  my @ids = map {
    $_ =~ s/<.+?>//g;
    $_ =~ s/^(\d+([stnrdh]{2}|))/NUMWORDS($1)/e;
    $_ =~ s/\.\w{2,5}?$//;
    $_ =~ s/&/and/g;
    $_ =~ s/Æ/Ae/g;
    $_ =~ s/Ç/C/g;
    $_ =~ s/Ü/U/g;
    $_ =~ s/(é|ê)/e/g;
    $_ =~ s/ /_/g;
    $_ =~ s/[^\w:.\-]//g;
    $_;
  } @base;
  return join('_',grep(defined,@ids));
}

sub linkify {
  my ($link) = @_;
  my $root_path = get_root('path');
  my $root_link = get_root('link');
  $link =~ s/$root_path/$root_link/;
#  $link =~ s/&/%26/g;
#  return uri_encode($link);
   return $link;
}

sub textify {
  my ($text, $opt) = @_;
  my $root_link = get_root('link');
  $text =~ s/$root_link\///;
  $text =~ s/<.+?>//g;
  $text =~ s/_/ /g;
  $text =~ s/\s\(.*?\)$// if !$opt->{'parens'};
  $text =~ s/\s&\s/ &amp; /g;
  $text =~ s/_(Mr|Mrs|Ms|Dr)_/_$1._/g;
  $text =~ s/\.\w{2,5}?$// unless $text =~ /\.(?:com|net|org)$/;
#  $text =~ s/(?<!\A)((?<! )\p{uppercase})/ $1/g; # from Kenosis, kcott, and tye on PerlMonks
  return $text;
}

sub searchify {
  my ($text, $section) = @_;
  (my $search = uri_encode($text,'&')) =~ s/(?:_|%20)/+/g;
  $search .= '#'.idify(@$section) if $section;
  return $search;
}

sub hashtagify {
  my ($hashtag) = @_;
  $hashtag =~ s/&/and/g;
  $hashtag =~ s/\W//g;
  $hashtag =~ s/^/#/;
  return $hashtag;
}

=head1 NAME

Util::Convert - converts strings into various formats.

=head1 SYNOPSIS

  my $string = 'Mr and Mrs Smith';
  
  my $file    = filify($string);     # returns Mr_&_Mrs_Smith
  my $id      = idify($string);      # returns Mr_and_Mrs_Smith
  my $text    = textify($string);    # returns Mr &amp; Mrs Smith
  my $search  = searchify($string);  # returns Mr+%26+Mrs+Smith
  my $hashtag = hashtagify($string); # returns #MrandMrsSmith
  
=cut
1;
