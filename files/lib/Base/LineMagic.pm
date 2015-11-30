package Base::LineMagic;
use strict;
use warnings FATAL => ('all');
use Exporter qw(import);
our @EXPORT_OK = qw($line_magic);

use Lingua::EN::Inflect qw(NO);

use Base::Root qw(get_root);
use Base::Data qw(data_file get_hash);
use Util::Convert qw(idify);

our $line_magic;

# used in 9 places
my $inline_links = get_hash( 'file' => ['Base','inline_links.txt'] );

for my $link (keys %$inline_links) {
  my $anchor = $inline_links->{$link};
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

# used in 2 places
my $program_links = get_hash( 'file' => ['Miscellany','Programs.txt'] );

for my $link (keys %$program_links) {
  my $link_dest = $program_links->{$link};
  $line_magic->{$link} = qq(A<$link|href="http://$link_dest">);
}


# to be used on any story involving my player characters
open(my $pc_fh, '<', data_file('Role_playing/Player_characters','blank_list.txt')) or die $!;
my @pcs = <$pc_fh>;
chomp @pcs;

for my $pc (@pcs) {
  my $root = get_root('link');
  my $id   = idify($pc);
  $line_magic->{$pc} = qq(A<$pc|href="$root/Role_playing/Player_characters/#$id">);
  
  my ($first, $last) = split(' ', $pc, 2);
  $line_magic->{$first} = qq(A<$first|href="$root/Role_playing/Player_characters/#$id">);
}

1;
