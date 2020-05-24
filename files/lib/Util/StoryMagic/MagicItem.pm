package Util::StoryMagic::MagicItem;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(magic_item_magic);

use Lingua::EN::Inflect qw(NO);

sub magic_item_magic {
  my $magic;

  for my $count (0..9) {
    my $charges = ucfirst NO('charge', $count, { words_below => 101 });
    $magic->{$charges} = qq(STRONG<$charges:>);
  }

  $magic->{'XP'} = 'ABBR<XP|title="experience point value">';
  $magic->{'GP'} = 'ABBR<GP|title="gold piece value">';
  $magic->{'MR'} = 'ABBR<MR|title="magic resistance">';

  return $magic;
}

1;
