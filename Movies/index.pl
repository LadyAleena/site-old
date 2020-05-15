#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use Encode;
use HTML::Entities qw(encode_entities);
use Lingua::EN::Inflect qw(PL_N);

use lib '../files/lib';
use Base::Page      qw(page story);
use Fancy::Join     qw(grammatical_join);
use HTML::Elements  qw(section nav div paragraph list form fieldset selection details input anchor);
use Util::Movie     qw(movie genre movie_option display_option textify_movie
                       start_year end_year
                       display_movie display_simple_movie
                       print_series print_movie);
use Util::Columns;
use Util::Convert   qw(idify);
use Util::Data      qw(file_directory alpha_hash alpha_array first_alpha);
use Util::Menu      qw(alpha_menu file_menu);
use Util::Sort      qw(article_sort);

my ($sec,$min,$hour,$mday,$mon,$ltyear,$wday,$yday,$isdst) = localtime();
my $current_year = ($ltyear + 1900);

sub get_cgi_param {
  my ($cgi, $param) = @_;
  my $ret = $cgi->param($param);
  return ($ret ? encode_entities($ret, '<>"') : '');
}

sub get_genre {
  my ($genre_type, $opt) = @_;
  my $text = $genre_type =~ /(?<!fantas)y|show|dram|musical|police procedural|spoof|slasher|western/ ? PL_N($genre_type) :
             $opt->{'movie'} && $opt->{'movie'} =~ /^yt1/ ? "$genre_type movies" :
             $genre_type;
  return $text;
}

sub get_media {
  my $media_type = shift;
  my $text = $media_type eq 'film'    ? 'films' :
             $media_type eq 'tv'      ? 'television series' :
             $media_type eq 'tv film' ? 'television films' :
             $media_type;
  return $text;
}

sub movies_beginning {
  my $first = shift;
  my $text = $first eq '#' ? 'a number'    :
             $first eq '!' ? 'punctuation' :
             $first =~ /^\p{Alpha}/i ? uc($first) :
             undef;
  return "List of movies beginning with $text" if $text;
}

my $cgi = CGI::Minimal->new;
my $title    = get_cgi_param($cgi, 'title');
my $year     = get_cgi_param($cgi, 'year');
my $media    = get_cgi_param($cgi, 'media');
my $genre    = get_cgi_param($cgi, 'genre');
my $source   = get_cgi_param($cgi, 'source');
my $alpha    = get_cgi_param($cgi, 'alpha');
my $series   = get_cgi_param($cgi, 'series');
my $opinions = get_cgi_param($cgi, 'opinions');
my $genre_list = get_cgi_param($cgi, 'genre list');

my @selects = qw(genre media source);
my %select_options = map { $_ => movie_option($_) } @selects;

my $movies_data = movie('data');
my $search;
my @movies;
if ( $title || $year || $genre || $media || $source || $alpha ) {
  my @selections;
  push @selections, $title  if $title;
  push @selections, $year   if $year;
  push @selections, get_genre($genre) if $genre;
  push @selections, get_media($media) if $media;
  push @selections, PL_N($source) if $source;

  my $selection = @selections ? grammatical_join(' ', map("<b>$_</b>", @selections)) : '';
  my $selection_text = $selection;

  for my $movie (values %$movies_data) {
    my $item = $movie->{'title'};

    if ($year) {
      my $start_year = start_year($movie);
      my $end_year   = end_year($movie);

      if ($start_year !~ /\d/ || $end_year !~ /\d/) {
        if ($start_year ne $year || $end_year ne $year) {
          next;
        }
      }
      else {
        if ($year < $start_year || $year > $end_year) {
          next;
        };
      }
    }
    next if $media  && $movie->{'media'} ne $media;
    next if $genre  && !grep($genre =~ /$_/i , @{$movie->{'genre'}});
    next if $source && (!$movie->{'source'} || $movie->{'source'} !~ /\b$source(?!ing)/i);
    next if $title  && lc($movie->{'title'}) !~ /\Q$title\E/i;
    next if $alpha  && first_alpha($movie->{'title'}) ne $alpha;

    push @movies, $movie->{'title'};
  }

  $search = @movies > 0 ? "You searched for $selection_text in my collection." : "No matches found for $selection_text.";
}
else {
  @movies = keys %$movies_data;
}

my $alpha_movies = alpha_array(\@movies);
for my $movies (keys %$alpha_movies) {
  my @movies = map(display_movie($movies_data->{$_}, { 'series' => 1, 'links' => 1, 'crossover' => 1 }), sort { article_sort(lc $a, lc $b) } @{$alpha_movies->{$movies}});
  @{$alpha_movies->{$movies}} = @movies;
}
my $alpha_menu = scalar(@movies) > 10 ?
                 alpha_menu($alpha_movies, { 'addition' => anchor('Search the list', { href => '#Search' }), 'join' => ' | ' }) :
                 undef;

my $browse_alpha = alpha_hash($movies_data);
my $browse_alpha_menu = alpha_menu($browse_alpha, { 'param' => 'alpha', 'join' => ' | ', 'addition' => anchor("&nbsp;Series list&nbsp;", { href => '?series=list' })  });

my $open_directory = file_directory('Movies', 'data');

my $series_select  = movie_option('series');
my @series_selects = keys %$series_select;
my $series_alpha_movies = alpha_array(\@series_selects);
my $series_alpha_menu   = alpha_menu($series_alpha_movies, { 'join' => ' | ' });

my $genre_select    = genre('data');
my $genre_link_list = [
  map  { anchor(ucfirst $_, { 'href' => "index.pl?genre+list=$_" }); } (sort keys %$genre_select)
];

my $magic;
$magic->{'search form'} = sub {
  my $tab = 4;
  section($tab, sub {
    $tab++;
    form($tab, sub {
      $tab++;
      fieldset($tab, sub {
        $tab++;
        input($tab, { 'type' => 'text',   'name' => 'title', 'placeholder' => 'Title', 'style' => 'width: 19em' });
        input($tab, { 'type' => 'number', 'name' => 'year',  'placeholder' => 'Year',  'style' => 'width: 5em', 'min' => "1911", 'max' => $current_year + 1 });
        for my $select (@selects) {
          my @options = ([ucfirst($select), { 'value' => '' }], map(display_option($select, $_), @{$select_options{$select}}));
          selection($tab, \@options, { 'name' => $select, 'style' => 'width: 10em' });
        }
        input($tab, { 'type' => 'submit', 'value' => 'List movies' });
        input($tab, { 'type' => 'button', 'value' => 'Start over', 'onclick' => "location='index.pl'" });
        nav(6, "Browse movies: $browse_alpha_menu", { 'class' => 'alpha_menu' });
      }, { 'legend' => 'Search my collection' });
    }, { 'action' => 'index.pl', 'method' => 'get', 'id' => 'movie_search_form' });
  }, { 'id' => 'movie_search' });
};

$magic->{'genre link list'} = sub {
  details(6, sub {
    list(5, 'u', $genre_link_list, { 'class' => 'four' });
  }, { 'summary' => 'List of genres' });
};


my $heading = length $series && $series_select->{$series}  ? textify_movie($series) :
              length $series && !$series_select->{$series} ? 'Movie series' :
              length $genre_list && $genre_select->{$genre_list}  ? ucfirst "$genre_list movies" :
              length $genre_list && !$genre_select->{$genre_list} ? 'Movie genres' :
              length $alpha    ? movies_beginning(decode('UTF-8',$alpha)) :
              length $opinions ? 'Movie opinions' :
              q(Lady Aleena's movie lists);

page( 'heading' => $heading, 'code' => sub {
  if ( $search || $alpha ) {
    section(3, sub {
      paragraph(4, 'This is a list of films and television series I have collected that either interest my fiancé or me or helps populate other pages. You can browse the list or search it.');
      &{$magic->{'search form'}};
      if ( $title || $year || $media || $genre || $source ) {
        paragraph(4, $search) if $search;
      }
    });
    for my $alpha_movie (sort keys %$alpha_movies) {
      my $heading = keys %$alpha_movies > 1 ? [2, $alpha_movie, { id => "section_$alpha_movie" }] : undef;
      section(3, sub {
        list(5, 'u', $alpha_movies->{$alpha_movie}, { 'class' => 'movie_list' });
        nav(5, $alpha_menu, { 'class' => 'alpha_menu' }) if $alpha_menu;
      }, { 'heading' => $heading });
    }
  }
  elsif ( length $series ) {
    if ($series && $series_select->{$series}) {
      if ($series_select->{$series} eq 'series') {
        print_series(4, 1, $series);
      }
      else {
        print_movie(3, 1, $series);
      }
    }
    else {
      for my $series_alpha (sort keys %$series_alpha_movies) {
        my $class = number_of_columns(3, scalar @{$series_alpha_movies->{$series_alpha}}, 1);
        section(3, sub {
          list(5, 'u', file_menu('series', [sort { article_sort($a, $b) } @{$series_alpha_movies->{$series_alpha}}]), { 'class' => $class, 'style' => 'font-size:smaller' });
          nav(5, "$series_alpha_menu", { 'class' => 'alpha_menu' });
        }, { 'heading' => [2, $series_alpha, { 'id' => "section_$series_alpha" }] });
      }
    }
  }
  elsif ( length $genre_list ) {
    if ($genre_select->{$genre_list}) {
      section(3, sub {
        my @subgenres = (sort grep(!/main/, keys %{$genre_select->{$genre_list}}));
        unshift @subgenres, 'main' if $genre_select->{$genre_list}{'main'};

        for my $subgenre (@subgenres) {
          my @movies = map { display_simple_movie(movie($_)) } sort { article_sort(lc $a, lc $b) } @{$genre_select->{$genre_list}{$subgenre}};
          my $class = scalar(@movies) > 72 ? 'three' : scalar(@movies) > 36 ? 'two' : 'one';
          my $style = $class eq 'three' ? 'font-size:smaller' : undef;
          section(4, sub {
            my $genre = $subgenre ne 'main' ? $subgenre : $genre_list;
            paragraph(6, "This is a list of $genre movies I have gathered.");
            list(6, 'u', \@movies, { 'class' => $class, 'style' => $style });
          }, { 'heading' => $subgenre ne 'main' ? [3, ucfirst $subgenre] : undef });
        }
      });
      section(3, sub {
        my $list = [
          map  { anchor(ucfirst $_, { 'href' => "?genre+list=$_" }) }
          sort
          grep { !/$genre_list/ } keys %$genre_select
        ];
        list(5, 'u', $list, { 'class' => 'four' });
      }, { 'heading' => [2, 'Other genres'] });
    }
    else {
      my $genre_map = anchor('genre map', { href => '../Miscellany/Genre_map.pl' });
      section(3, sub {
        paragraph(6, "Click a genre to see a list of movies. There is a $genre_map to see how the genres are connected.");
        list(5, 'u', $genre_link_list, { 'class' => 'four' });
      });
    }
  }
  elsif ( length $opinions && $opinions =~ /^[ryt1]/i ) {
    open(my $fh, '<', "$open_directory/Opinions.txt") || die $!;
    story($fh, { 'doc magic' => $magic, 'line magic' => $magic });
  }
  else {
    open(my $fh, '<', "$open_directory/index.txt") || die $!;
    story($fh, { 'doc magic' => $magic, 'line magic' => $magic });
  }
});
