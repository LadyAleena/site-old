package Movies::LookUp;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(movie series movie_hash series_hash franchise_hash genre_hash option display_movie
   start_year end_year years_running movie_links search_link crossovers);

use Lingua::EN::Inflect qw(A PL_N NUM NUMWORDS inflect);
use List::Util qw(min max first);
use Encode qw(encode);

use Base::Root qw(get_root);
use Base::Data qw(data_file get_hash);
use HTML::Elements qw(anchor);
use Util::Convert qw(filify textify idify searchify);
use Util::GrammaticalJoin;
use Util::JoinDefined;
use Util::ExternalLinks qw(external_link);

my %movies_data = get_hash(
  'file' => ['Movies','movies.txt'],
  'headings' => ['title','start year','end year',qw(media format+ Wikipedia allmovie IMDb TV.com Flixster genre+),'based on','company'],
);

my %series_data = get_hash(
  'file' => ['Movies','series.txt'],
  'headings' => [qw(title Wikipedia allmovie programs+), 'just like'],
);

my %franchises_data = get_hash(
  'file' => ['Movies','franchises.txt'],
  'headings' => [qw(title Wikipedia allmovie programs+)],
);

my %crossover_data = get_hash(
  'file' => ['Movies','crossovers.txt'],
  'headings' => ['title','crossovers+'],
);
my @crossover_headings = ('episode','season','movie','series');

# for the movies index page
my %genres;

# for the select options for my Movies_series page
my %series_select;

my $current_year = (localtime())[5] + 1900;
my ($first,$last);
for my $movie (values %movies_data) {
  my $title = $movie->{'title'};

  # populating the years option
  my $start = $movie->{'start year'} ne 'tbd' ? start_year($movie->{'title'}) : $first;
  my $end   = ($movie->{'end year'} && $movie->{'end year'} ne 'tbd') ? end_year($movie->{'title'}) : $last;

  if (!defined($first) || $first > $start) {
    $first = $start;
  }

  if (!defined($last) || $last < $end) {
    $last = $end;
  }

  # splitting media, $parts is used later.
  my ($media,$parts) = split(/:/,$movie->{'media'});
  $movie->{'media'} = $media;

  # splitting format (I own), also adding what seasons I own of TV series.
  my @formats = $movie->{'format'} ? @{$movie->{'format'}} : ();
  $movie->{'format'} = undef;
  for my $r_format (@formats) {
    my ($format,$r_seasons) = split(/:/,$r_format);
    my $seasons = [eval($r_seasons)] if $r_seasons;
    $movie->{'format'}{$format} = $seasons ? scalar(@$seasons) : 1;
    if ($movie->{'media'} eq 'tv' && $seasons) {
      for my $season (@$seasons) {
        my $season_text = sprintf('season %02s',$season);
        $movie->{'seasons'}{$season_text}{'own'} = $format;
      }
    }
  }
  if (@formats) {
    my ($biggest) = sort { $movie->{'format'}{$b} <=> $movie->{'format'}{$a}  } keys %{$movie->{'format'}};
    $movie->{'format'}{'primary'} = $biggest;
  }

  # making external links
  my @links;
  for my $site (qw(Wikipedia allmovie IMDb TV.com Flixster)) {
    next if !$movie->{$site};
    my $link_page = $movie->{$site};
    push @links, external_link($site,$link_page);
  }
  $movie->{'external links'} = @links ? \@links : undef;

  # splitting genre
  die "$movie->{'title'} has no genre!" if !$movie->{'genre'};
  my @genres = @{$movie->{'genre'}};
  $movie->{'genre'} = undef;
  for my $r_genre (@genres) {
    my ($genre,$theme) = split(/:/,$r_genre);
    my @themes = $theme ? split(/,/,$theme) : ('main');
    $movie->{'genre'}{$genre} = \@themes;
    push @{$genres{$genre}{$_}}, $title for @themes; # populating %genres
  }

  # adding to the counts in the movie and its series entries for miniseries
  $movie->{'counts'}{'episodes'} = $parts if $parts;

  # adding to the counts in the movie for award shows
  if ($movie->{'genre'}{'award show'}) {
    my $episodes = ($current_year - $movie->{'start year'}) + 1;
    $movie->{'counts'}{'episodes'} += $episodes;
  }

  # adding crossovers from %crossovers
  if ($crossover_data{$title}) {
    my @r_crossovers = @{$crossover_data{$title}{'crossovers'}};
    for my $r_crossover (@r_crossovers) {
      my %crosses;
      @crosses{@crossover_headings} = split(/\//,$r_crossover);
      push @{$movie->{'crossovers'}}, \%crosses;
    }
  }

  next if ($movie->{'media'} ne 'tv' || $movie->{'genre'}{'award show'});
  # adding TV episodes
  my $show_file = data_file('Movies/Episode_lists', encode('UTF-8',filify($title)).".txt");
  next unless ($show_file && -f $show_file);
  open(my $file, '<', $show_file);
  my @data = <$file>;
  chomp(@data);

  my $season;
  my $inc;
  for my $line (@data) {
    chomp($line);
    if ($line eq '.') {
      $inc++;
      $movie->{'counts'}{'seasons'} = $inc;
      my $season_num = sprintf "%02s", $inc;
      $season = "season $season_num";
    }
    else {
      $movie->{'counts'}{'episodes'}++;
      $movie->{'seasons'}{$season}{'counts'}{'episodes'}++;
      my ($ep_title, $ep_crossover) = split(/\|/, $line);
      my %episode;
      $episode{'title'} = $ep_title;

      if ($ep_crossover) {
        my @r_crosses = split(/;/,$ep_crossover);
        for my $cross (@r_crosses) {
          my %crosses;
          @crosses{@crossover_headings} = map { length($_) ? $_ : undef } split(/\//,$cross);
          push @{$episode{'crossovers'}}, \%crosses;
        }
      }

      push @{$movie->{'seasons'}{$season}{'episodes'}}, \%episode;
    }
  }

  # adding to the series select list, it may be deleted later if it is in a series below.
  $series_select{$title} = 'single';
}

for my $series (values %series_data) {
  my $title = $series->{'title'};

  my @start_years;
  my @end_years;

  for my $program (@{$series->{'programs'}}) {
    push @{$movies_data{$program}{'series'}}, $title;

    push @start_years, start_year($program) if start_year($program) ne 'tbd';
    push @end_years, end_year($program) if end_year($program) ne 'tbd';

    my $movie_media = media($program);
    $series->{'counts'}{$movie_media}++;
    my $movie_counts = $movies_data{$program}{'counts'};
    if ($movie_counts) {
      for my $type ('seasons','episodes') {
        $series->{'counts'}{$type} += $movie_counts->{$type} if $movie_counts->{$type};
      }
    }

    # I put all TV series in %series_select. If they are in a larger series, I don't want them listed separately.
    delete $series_select{$program} if $series_select{$program} && $movies_data{$program}{'media'} =~ /tv/;
  }

  $series->{'start year'} = min(@start_years);
  $series->{'end year'} = max(@end_years);

  # making external links
  my @links;
  for my $site (qw(Wikipedia allmovie)) {
    next if !$series->{$site};
    my $link_id = $series->{$site};
    push @links, external_link($site,$link_id);
  }
  $series->{'external links'} = @links ? \@links : undef;

  $series_select{$title} = 'series';
}

my %options = (
  'series' => \%series_select,
  'years'  => [$first..$last],
  'genres' => [sort keys %genres],
);

# returns the entire movies hash.
sub movie_hash {
  return %movies_data;
}

# returns a hash ref for a single movie.
sub movie {
  my ($movie,$caller) = @_;
  if (!$movies_data{$movie}) {
    warn $caller ? "$caller: $movie not in database" : "$movie not in database";
  }
  return $movies_data{$movie} ? $movies_data{$movie} : undef;
}

# returns the entire series hash.
sub series_hash {
  return %series_data;
}

# returns a hash ref for a single series.
sub series {
  my ($series,$caller) = @_;
  if (!$series_data{$series}) {
    warn $caller ? "$caller: $series not in database" : "$series not in database";
  }
  return $series_data{$series};
}

# returns the entire franchise hash.
sub franchise_hash {
  return %franchises_data;
}

# returns a hash ref for a single franchise.
sub franchise {
  my ($franchise,$caller) = @_;
  if (!$franchises_data{$franchise}) {
    warn $caller ? "$caller: $franchise not in database" : "$franchise not in database";
  }
  return $franchises_data{$franchise};
}

# returns the genres hash.
sub genre_hash {
  return %genres;
}

# returns an option from the options hash.
sub option {
  my $option = shift;
  warn "options: $option not available" if !$options{$option};
  return $options{$option};
}

# The following group of subroutines all lead to display_movie with the exceptions of end_year and years_running.

sub start_year {
  my ($imovie) = @_;
  my $movie = movie($imovie,'start_year');
  return $movie->{'start year'};
}

# returns a numeric end year for comparisons.
sub end_year {
  my ($imovie) = @_;
  my $movie = movie($imovie,'end_year');

  return $movie->{'end year'} ? ($movie->{'end year'} eq 'tbd' ? $current_year : $movie->{'end year'}) : $movie->{'start year'};
}

# returns a string with the start year to end year.
sub years_running {
  my ($imovie) = @_;
  my $movie = movie($imovie,'years_running');

  my $start_year = start_year($movie->{'title'});
  my $end_year   = end_year($movie->{'title'});
  my $string     = $start_year;
     $string    .= " - $end_year" if $start_year ne $end_year;
  return $string;
}

# returns a string with the run time of a television series.
sub run_time {
  my ($imovie) = @_;
  my $movie = movie($imovie,'run_time');

  my $run_text = undef;
  if ($movie->{'media'} eq 'tv') {
    if ($movie->{'end year'} eq 'tbd') {
      $run_text = "which is still running";
    }
    elsif (end_year($movie->{'title'}) - start_year($movie->{'title'}) > 0) {
      my $run_time = end_year($movie->{'title'}) - start_year($movie->{'title'});
      $run_text = inflect("which ran for NUMWORDS($run_time) PL_N(year,$run_time)");
    }
  }
  return $run_text;
}

# returns the media type of a movie.
sub media { 
  my ($imovie) = @_;
  my $movie = movie($imovie,'media');

  my $media = $movie->{'media'} eq 'tv' ? 'television series' : $movie->{'media'};
  return $media;
}

# returns a string with the amount of parts in a miniseries w/numbers as words.
sub mini_parts { 
  my ($imovie) = @_;
  my $movie = movie($imovie,'mini_parts');

  my $r_parts = $movie->{'media'} eq 'miniseries' ? $movie->{'counts'}{'episodes'} : 0;
  my $parts   = $r_parts > 0 ? NUMWORDS($r_parts)."-part" : undef;

  return $parts;
}

# returns a string of the genres in which a movie falls.
sub genre {
  my ($imovie) = @_;
  my $movie = movie($imovie,'genre');

  my @genres = keys %{$movie->{'genre'}};
  my $genre = @genres ? grammatical_join('and',@genres) : undef;

  return $genre;
}

# returns a string of what I felt is important about a movie.
sub about {
  my ($imovie) = @_;
  my $movie = movie($imovie,'about');

  my @abouts;
  for my $genre (values %{$movie->{'genre'}}) {
    push @abouts, grep($_ ne 'main',@$genre);
  }
  my $about = @abouts ? 'about '.grammatical_join('and',@abouts) : undef;

  return $about;
}

# returns what the movie is based on and by who.
sub basis {
  my ($imovie) = @_;
  my $movie = movie($imovie,'basis');

  my $basis = $movie->{'based on'} ? qq(based on the $movie->{'based on'} by $movie->{'company'}) : undef;

  return $basis;
}

# search_link creates a link to the Movies_by_series page. It is used in series_text, get_crossover, and elsewhere.
# Unlike most of the above functions, this one can be used to create links to series as well as movies.
sub search_link {
  my ($movie, $id) = @_;

  my $search = undef;
  my $texti  = textify($movie);
  if (($series_data{$movie} && $id) || ($movies_data{$movie} && $id)) {
    $search = searchify($movie,$id);
    $texti  = $movies_data{$id->[0]} ? textify($id->[0]) : textify($movie); 
  }
  elsif($series_data{$movie} || $movies_data{$movie}) {
    $search = searchify($movie);
  }

  my $text = "<i>$texti</i>";
  my $root_link = get_root('link');
  my $search_text = $search ? anchor($text, { 'href' => "$root_link/Movies/Movies_by_series.pl?series=$search" }) : $text;

  return $search_text; 
}

# returns a string listing all of the series in which a movie belongs with links.
sub series_text {
  my ($imovie) = @_;
  my $movie = movie($imovie,'series_text');

  my @series = $movie->{'series'} ? map(search_link($_), @{$movie->{'series'}}) : ();
  my $lists_text = grammatical_join('and',@series);
  my $series_text = $lists_text ? "part of the $lists_text series" : undef;

  return $series_text;
}

# returns a string listing all external links of a movie with links.
sub movie_links {
  my ($list,$ititle) = @_;
  my $title = $list eq 'movies' ? movie($ititle,'movie_links') : series($ititle,'movie_links');

  my $links = $title->{'external links'} ? '<span class="links" style="font-size:smaller">('.join(', ',@{$title->{'external links'}}).')</span>' : undef;
  return $links;
}

# returns a string for a single crossover. The input is a hash ref.
sub get_crossover {
  my ($crossover) = @_;
  my $episode = $crossover->{'episode'};
  my $season  = $crossover->{'season'};
  my $program = $crossover->{'movie'};
  my $series  = $crossover->{'series'};

  my $crossover_text = undef;
  if ($episode || $season || $program || $series) {
    my $season_text = $season ? "season $season" : undef;
    my $episode_text = $episode ? textify(qq( "$episode")) : '';
    my $search = $series ? $series : $program ? $program : undef;
    my $id = $series && $series_data{$series} ? [grep(defined,($program,$season_text))] : $program && $movies_data{$program} && $season_text ? [$season_text] : undef;
    $crossover_text = search_link($search,$id).qq($episode_text);
  }

  return $crossover_text;
}

# returns a string for all of the crossovers for a movie or episode.
sub crossovers {
  my ($crossovers) = @_;
  my @crosses = map(get_crossover($_),@$crossovers);
  my $cross = scalar(@crosses) > 0 ? "crossed with ".grammatical_join('and',@crosses).'.' : undef;
  return $cross;
}

# The preceding group of subroutines all lead to display_movie with the exceptions of end_year and years_running.

# returns a sentence or two for a movie.
# The first parameter is the movie name (the key in the hash), the second is a hash ref with the named parameters: series, links, and crossovers.
sub display_movie {
  my ($imovie,$opt) = @_;

  my $movie   = movie($imovie); # used to get a movie's crossovers.

  my $text   = textify($imovie);
  my $id     = idify($imovie);
  my $start  = start_year($imovie);
  my $parts  = mini_parts($imovie);
  my $media  = media($imovie);
  my $series = $opt->{'series'} ? series_text($imovie) : undef;
  my $basis  = basis($imovie);
  my $run    = run_time($imovie);
  my $genre  = genre($imovie);
  my $about  = about($imovie);

  my $movie_is    = A(join_defined(' ',[$start,$parts,$genre,$media,$about,$series,$basis,$run])).'.';
  my $crossover   = $opt->{'crossover'} && $movie->{'crossovers'} ? 'It '.crossovers($movie->{'crossovers'}) : undef;
  my $movie_line  = join_defined(' ',[$movie_is,$crossover]);
  my $links       = $opt->{'links'} ? ' '.movie_links('movies',$imovie) : '' ;

  return qq(<span id="$id" class="title">$text</span> is $movie_line $links);
}

1;
