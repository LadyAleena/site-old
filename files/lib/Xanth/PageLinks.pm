package Xanth::PageLinks;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(locations_page_link species_page_link timeline_link);

use Fancy::Join    qw(join_defined);
use HTML::Elements qw(anchor);
use Util::Convert  qw(textify idify searchify);
use Xanth::Util    qw(get_article);

# Begin getting link to Locations.pl

sub locations_page_link {
  my ($main, $section) = @_;

  my $location = $section ? $section : $main;
  my $text     = textify(join(', ', reverse split(/, /,$location)));
  my $id       = $location =~ /^Xanth Reality/ ? idify("Xanth reality") : idify($location);
  my $link     = anchor($text, { href => "Locations.pl#$id"});
  my $article  = $main ne 'Mundania' ? get_article($location) : undef;
  my $out      = join_defined(' ', ($article, $link));
  
  return $out;  
}

# End getting link to Locations.pl
# Begin getting link to Species.pl

sub species_page_link {
  my $species = shift;

  my $text = textify($species);
  my $id   = idify($species);
  my $link = anchor($text, { href => "Species.pl#$id"});
  
  return $link;  
}

# End getting link to Species.pl
# Being getting link to Timeline.pl

sub timeline_link {
  my $in = shift;
     $in =~ s/\.\d+//;
  my $id = idify($in);
  my $link = $in ? anchor($in, { href => "Timeline.pl#$id" }) : undef;
  return $link;
}

# End getting link to Timeline.pl

1;
