package Base::LineMagic;
use strict;
use warnings FATAL => ('all');
use Exporter qw(import);
our @EXPORT_OK = qw($line_magic);

use Lingua::EN::Inflect qw(NO);

use Base::Data qw(get_hash);
use Base::HTML::Element qw(anchor);

our $line_magic;

# used in 9 places
my %inline_links = get_hash( 'file' => ['Base','inline_links.txt'] );

for my $link (keys %inline_links) {
  my $anchor = $inline_links{$link};
  $line_magic->{$link} = qq(A<$link|href="$anchor">);
}

# used in 5 places
sub make_class {
  my ($class, $title) = @_;
  my $add_title = $title && $title =~ /^[yt1]/ ? 'title ' : '';
  return qq(class="$add_title$class");
}

for (qw(massmarket trade hardcover cd cassette lp ff bd dvd vhs dg)) {
  $line_magic->{"${_}s"} = make_class($_);
  $line_magic->{$_}      = make_class($_,'yes');
}

# used in 4 places
for my $count (0..9) {
  my $charges = ucfirst NO('charge', $count, { words_below => 101 });
  $line_magic->{$charges} = qq(STRONG<$charges|class="charges">);
}

1;
