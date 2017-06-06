package Base::LineMagic;
use strict;
use warnings FATAL => ('all');
use Exporter qw(import);
our @EXPORT_OK = qw($line_magic);

use File::Spec;
use Lingua::EN::Inflect qw(NO);

use Base::Path qw(base_path);
use Util::Convert qw(idify);
use Util::Data qw(data_file make_hash);

our $line_magic;

# used in 9 places
my $inline_links = make_hash( 'file' => ['Base','inline_links.txt'] );

for my $link (keys %$inline_links) {
  my $anchor = $inline_links->{$link};
  $line_magic->{$link} = qq(A<$link|href="$anchor" target="ex_tab">);
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
  $line_magic->{$charges} = qq(STRONG<$charges:>);
}

# used in 2 places
my $program_links = make_hash( 'file' => ['Miscellany','Programs.txt'] );

for my $link (keys %$program_links) {
  my $link_dest = $program_links->{$link};
  $line_magic->{$link} = qq(A<$link|href="http://$link_dest" target="ex_tab">);
}

$line_magic->{'magic items of the specialist'} = 'A<magic items of the specialist|href="magic_items_of_the_specialist.pl">';

# to be used on any story involving my player characters
open(my $pc_fh, '<', data_file('Role_playing/Player_characters','blank_list.txt')) || die $!;
my @pcs = <$pc_fh>;
chomp @pcs;

for my $pc (@pcs) {
  my $root = base_path('path');
  my $id   = idify($pc);
  my $path = File::Spec->abs2rel("$root/Role_playing/Player_characters/index.pl#$id");
  $line_magic->{$pc} = qq(A<$pc|href="$path">);

  my ($first, $last) = split(' ', $pc, 2);
  $line_magic->{$first} = qq(A<$first|href="$path">);
}

1;
