package Xanth::LineMagic;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(Xanth_line_magic);

use Util::Convert qw(textify idify searchify);
use Util::Data qw(data_file make_hash);

use Xanth::Util  qw(character_link);
use Xanth::Novel qw(novel_link);
use Xanth::PageLinks qw(timeline_link);

my $headings = [qw(Name species origin location gender talent description book chapter)];
my $characters = make_hash(
  'file' => ['Fandom/Xanth','characters.txt'],
  'headings' => $headings,
);

my $see_char = make_hash(
  'file' => ['Fandom/Xanth', 'see_character.txt'],
);

open(my $book_file, '<', data_file('Fandom/Xanth', 'books.txt'));
my @book_list = map { chomp $_; $_ } <$book_file>;

sub Xanth_line_magic {
  my $type = shift;
  
  my $Xanth_line_magic;

  for my $book (@book_list) {
    my $search = searchify($book);
    if ($type eq 'page') {
      $Xanth_line_magic->{$book} = qq(A<I<$book>|href="Characters.pl?novel=$search">);
    }
    elsif ($type eq 'character') {
      $Xanth_line_magic->{$book} = novel_link($book);
    }
  }

  for my $key ( keys %$characters ) {
    my $name   = textify($key);
    if ($type eq 'page') {
      my $search = $see_char->{$key} ? searchify($see_char->{$key}) : searchify($key);
      $Xanth_line_magic->{$key}      = qq(A<$name|href="Characters.pl?character=$search">);
      $Xanth_line_magic->{"$key\'s"} = qq(A<$name\'s|href="Characters.pl?character=$search">);
    }
    elsif ($type eq 'character') {
      $Xanth_line_magic->{$key}      = character_link($key);
      $Xanth_line_magic->{"$key\'s"} = character_link($name, "$name\'s");
    }
  }

  for my $num (0..1200) {
    my $id = idify($num);

    if ($type eq 'page') {
      $Xanth_line_magic->{$num}     = qq(A<$num|href="Timeline.pl#$id">);
      $Xanth_line_magic->{"id$num"} = qq(SPAN<$num|id="$id">);
    }
    elsif ($type eq 'character') {
      $Xanth_line_magic->{$num}     = timeline_link($num);
    }
  }
  
  return $Xanth_line_magic;

}

1;
