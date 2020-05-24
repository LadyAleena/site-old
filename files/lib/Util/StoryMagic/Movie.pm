package Util::StoryMagic::Movie;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(movie_magic);

use Util::Convert  qw(textify searchify);
use Util::Movie    qw(movie_option series textify_movie);

sub movie_magic {
  my %opt = @_;

  my $magic;

  # Start getting series links

    my $series = series('data', 'Util::StoryMagic::Movie');
    my $series_list = movie_option('series');
    for my $item (sort keys %$series_list) {
      my $magic_search;
      my $magic_text;
      if ($series->{$item}) {
        for my $program (@{$series->{$item}->{programs}}) {
          my $magic_key    = $item eq $program ? "$program-single" : $program;
             $magic_text   = textify($program);
             $magic_search = searchify($item, [$program]);
          $magic->{$magic_key} = qq(A<$magic_text|href="$opt{dots}/Movies/index.pl?series=$magic_search">);
        }
      }
      $magic_text = textify_movie($item, 'story');
      $magic_search = searchify($item);
      $magic->{$item} = qq(A<$magic_text|href="$opt{dots}/Movies/index.pl?series=$magic_search">);
    }

  # End getting series links

  return $magic;
}

1;
