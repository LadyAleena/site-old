package Movie::LookUp;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(movie series franchise genre option
  display_movie display_simple_movie display_episode display_option
  start_year end_year years_running counts links nav_link);

use Lingua::EN::Inflect qw(A PL_N NUM NO NUMWORDS inflect);
use List::Util qw(min max first);
use Encode qw(encode);

use Base::Root qw(get_root);
use Base::Data qw(data_file get_hash get_data);
use HTML::Elements qw(anchor);
use Util::Convert qw(filify textify idify searchify);
use Util::GrammaticalJoin;
use Util::JoinDefined;
use Util::ExternalLinks qw(external_links);

my $movies = get_hash(
  'file' => ['Movies','movies.txt'],
  'headings' => ['title','start year','end year',qw(media format+ Wikipedia allmovie IMDb TV.com Flixster genre+),'based on','company'],
);

my $series = get_hash(
  'file' => ['Movies','series.txt'],
  'headings' => [qw(title Wikipedia allmovie programs+), 'just like'],
);

my $franchises = get_hash(
  'file' => ['Movies','franchises.txt'],
  'headings' => [qw(title Wikipedia allmovie programs+)],
);

my $crossovers = get_hash(
  'file' => ['Movies','crossovers.txt'],
  'headings' => [qw(title crossovers+)],
);
my @crossover_headings = qw(episode season movie series);

# for the movies index page
my $genres;

# for the select options for my Movies_series page
my $series_select;

my $current_year = (localtime())[5] + 1900;
my ($first,$last);
for my $movie (values %$movies) {
  my $title = $movie->{'title'};

  # populating the years option
  my $start = start_year($movie);
  my $end   = end_year($movie);

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

  # splitting genre
  die "$movie->{'title'} has no genre!" if !$movie->{'genre'};
  my @genres = @{$movie->{'genre'}};
  $movie->{'genre'} = undef;
  for my $r_genre (@genres) {
    my ($genre,$theme) = split(/:/,$r_genre);
    my @themes = $theme ? split(/,/,$theme) : ('main');
    $movie->{'genre'}{$genre} = \@themes;
    push @{$genres->{$genre}{$_}}, $title for @themes; # populating $genres
  }

  # adding to the counts in the movie for miniseries
  $movie->{'counts'}{'episode'} = $parts if $parts;

  # adding to the counts in the movie for award shows
  if ($movie->{'genre'}{'award show'}) {
    my $episodes = ($current_year - $movie->{'start year'}) + 1;
    $movie->{'counts'}{'episode'} = $episodes;
  }

  # adding crossovers from %crossovers
  if ($crossovers->{$title}) {
    my @r_crossovers = @{$crossovers->{$title}{'crossovers'}};
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
      $movie->{'counts'}{'season'} = $inc;
      my $season_num = sprintf "%02s", $inc;
      $season = "season $season_num";
      $movie->{'seasons'}{$season}{'title'} = 'Season '.NUMWORDS($inc);
    }
    else {
      $movie->{'counts'}{'episode'}++;
      $movie->{'seasons'}{$season}{'counts'}{'episode'}++;
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
  $series_select->{$title} = 'single';
}

for my $sseries (values %$series) {
  my $title = $sseries->{'title'};

  my @start_years;
  my @end_years;

  for my $program (@{$sseries->{'programs'}}) {
    $movies->{$program}{'series'}{$title} = scalar @{$sseries->{'programs'}};

    my $movie = movie($program);
    push @start_years, start_year($movie);
    push @end_years,   end_year($movie);

    my $movie_media = $movie->{'media'};
    $sseries->{'counts'}{$movie_media}++;
    my $movie_counts = $movie->{'counts'};
    if ($movie_counts) {
      for my $type ('season','episode') {
        $sseries->{'counts'}{$type} += $movie_counts->{$type} if $movie_counts->{$type};
      }
    }

    # I put all TV series in $series_select. If they are in a larger series, I don't want them listed separately.
    delete $series_select->{$program} if $series_select->{$program} && $movies->{$program}{'media'} =~ /tv/;
  }

  $sseries->{'start year'} = min(@start_years);
  $sseries->{'end year'} = max(@end_years);

  $series_select->{$title} = 'series';
}

for my $franchise (values %$franchises) {
  my $title = $franchise->{'title'};

  my @start_years;
  my @end_years;

  for my $program (@{$franchise->{'programs'}}) {
    if ($series->{$program}) {
      $series->{$program}{'franchise'} = $title;
      
      my $fseries = series($program);
      push @start_years, start_year($fseries);
      push @end_years,   end_year($fseries);

      $franchise->{'counts'}{'series'}++;
      for my $media (keys %{$fseries->{'counts'}}) {
        $franchise->{'counts'}{$media} += $fseries->{'counts'}{$media};
      }
    }
    elsif ($movies->{$program}) {
      $movies->{$program}{'franchise'} = $title;

      my $movie = movie($program);
      push @start_years, start_year($movie);
      push @end_years,   end_year($movie);

      my $movie_media = $movie->{'media'};
      $franchise->{'counts'}{$movie_media}++;
      my $movie_counts = $movie->{'counts'};
      if ($movie_counts) {
        for my $type ('season','episode') {
          $franchise->{'counts'}{$type} += $movie_counts->{$type} if $movie_counts->{$type};
        }
      }
    }
  }

  $franchise->{'start year'} = min(@start_years);
  $franchise->{'end year'} = max(@end_years);
}

my $options = {
  'year'   => [$first..$last],
  'media'  => [qw(film miniseries tv)],
  'format' => [qw(vhs dvd bd dg)],
  'genre'  => [sort keys %$genres],
  'based on' => ['novel','short story',qw(play musical radio comics cartoon game toy)],
  'series' => $series_select,
};

# returns a single movie, the movies 'list', or all movies 'data'
sub movie {
  my ($in, $caller) = @_;
  get_data($movies, $in, $caller);
}

# returns a series movie, the series 'list', or all series 'data'
sub series {
  my ($in, $caller) = @_;
  get_data($series, $in, $caller);
}

# returns a single franchise, the franchises 'list', or all franchises 'data'
sub franchise {
  my ($in, $caller) = @_;
  get_data($franchises, $in, $caller);
}

# returns a single genre, the genres 'list', or all genres 'data'
sub genre {
  my ($in, $caller) = @_;
  get_data($genres, $in, $caller);
}

# returns a single option, the options 'list', or all options 'data'
sub option {
  my ($in, $caller) = @_;
  get_data($options, $in, $caller);
}

# The following group of subroutines all lead to display_movie with the exceptions of end_year and years_running.

sub title {
  my ($movie) = @_;
  return $movie->{'title'};
}

# returns the 'counts' if the item.
sub counts {
  my ($movie) = @_;
  my $counts = $movie->{'counts'};
  my @counting;
  for my $media (qw(series film miniseries tv season episode)) {
    next if !$counts->{$media};
    if ($media eq 'tv') {
      push @counting,  "$counts->{$media} television series";
    }
    elsif ($media =~ /series/) {
      push @counting, "$counts->{$media} $media";
    }
    else {
      push @counting, NO($media, $counts->{$media});
    }
  }
  return join(', ',@counting);
}

# returns a numeric start year for comparisons.
sub start_year {
  my ($movie) = @_;
  my $start = ($movie->{'start year'} && $movie->{'start year'} ne 'tbd') ? $movie->{'start year'} : $current_year;
  return $start;
}

# returns a numeric end year for comparisons.
sub end_year {
  my ($movie) = @_;
  my $end = $movie->{'end year'} ? ($movie->{'end year'} eq 'tbd' ? $current_year : $movie->{'end year'}) : start_year($movie);
  return $end;
}

# returns a string with the start year to end year.
sub years_running {
  my ($movie) = @_;
  my $running  = $movie->{'start year'};
  my $end_year = end_year($movie);
     $running .= " - $end_year" if $running ne $end_year;
  return $running;
}

# returns a string with the run time of a television series.
sub run_time {
  my ($movie) = @_;

  my $run_text = undef;
  if ($movie->{'media'} eq 'tv') {
    if ($movie->{'end year'} eq 'tbd') {
      $run_text = "which is still running";
    }
    elsif (end_year($movie) - start_year($movie) > 0) {
      my $run_time = end_year($movie) - start_year($movie);
      $run_text = inflect("which ran for NUMWORDS($run_time) PL_N(year,$run_time)");
    }
  }
  return $run_text;
}

# returns a string of external links, used in display_movie and in Movies::Display
sub links {
  my ($movie) = @_;
  my $title = $movie->{'title'};
  $movie->{'Google'} = searchify($title);
  my @links;
  for my $site (qw(Google Wikipedia allmovie IMDb TV.com Flixster)) {
    next if !$movie->{$site};
    my $link_page = $movie->{$site};
    push @links, [$site, $link_page, $title];
  }
  my $links = @links ? external_links(\@links) : undef;
  return $links;
}

# returns the media type of a movie.
sub media { 
  my ($movie) = @_;
  my $media = $movie->{'media'} eq 'tv' ? 'television series' : $movie->{'media'};
  return $media;
}

# returns a string of the genres in which a movie falls.
sub genre_s {
  my ($movie) = @_;

  my @genres = keys %{$movie->{'genre'}};
  my $genre = @genres ? grammatical_join('and', @genres) : undef;

  return $genre;
}

# returns a string of what I felt is important about a movie.
sub about {
  my ($movie) = @_;

  my @abouts;
  for my $genre (values %{$movie->{'genre'}}) {
    push @abouts, grep($_ ne 'main',@$genre);
  }
  my $about = @abouts ? 'with '.grammatical_join('and', @abouts) : undef;

  return $about;
}

# returns what the movie is based on and by who.
sub basis {
  my ($movie) = @_;
  my $raw_base = join_defined(' by ', [$movie->{'based on'}, $movie->{'company'}]);
  my $basis = $movie->{'based on'} ? "based on the $raw_base" : undef;
  return $basis;
}

# returns a string for a single crossover. The input is a hash ref.
sub get_crossover {
  my ($crossover) = @_;
  my $episode = $crossover->{'episode'};
  my $season  = $crossover->{'season'};
  my $program = $crossover->{'movie'};
  my $cseries = $crossover->{'series'};

  my $crossover_text = undef;
  if ($episode || $season || $program || $cseries) {
    my $season_text = $season ? "season $season" : undef;
    my $episode_text = $episode ? textify(qq( "$episode")) : '';
    my $search = $cseries ? $cseries : $program ? $program : undef;
    my $id = $cseries && $series->{$cseries} ? [grep(defined,($program,$season_text))] : $program && $movies->{$program} && $season_text ? [$season_text] : undef;
    $crossover_text = search_link($search,$id).qq($episode_text);
  }

  return $crossover_text;
}

# returns a string for all of the crossovers for a movie or episode.
sub crossovers {
  my ($movie) = @_;
  
  my @crossovers = @{$movie->{'crossovers'}};
  my @crosses = map(get_crossover($_),@crossovers);
  my $cross = scalar(@crosses) > 0 ? "crossed with ".grammatical_join('and',@crosses).'.' : undef;
  return $cross;
}

# creates a link to the Movies_by_series page. It is used in series_text, get_crossover, and elsewhere.
# Unlike most of the above functions, this one can be used to create links to series as well as movies.
sub search_link {
  my ($movie, $id) = @_;

  my $search = undef;
  my $texti  = textify($movie);
  if (($series->{$movie} && $id) || ($movies->{$movie} && $id)) {
    $search = searchify($movie,$id);
    $texti  = $movies->{$id->[0]} ? textify($id->[0]) : textify($movie); 
  }
  elsif($series->{$movie} || $movies->{$movie}) {
    $search = searchify($movie);
  }

  my $text = "<i>$texti</i>";
  my $root_link = get_root('link');
  my $search_text = $search ? anchor($text, { 'href' => "$root_link/Movies/Movies_by_series.pl?series=$search" }) : $text;

  return $search_text; 
}

# returns a string listing all of the series in which a movie belongs with links.
sub series_text {
  my ($movie) = @_;

  my @series = $movie->{'series'} ? map(search_link($_), keys %{$movie->{'series'}}) : ();
  my $lists_text = grammatical_join('and',@series);
  my $series_text = $lists_text ? "part of the $lists_text series" : undef;

  return $series_text;
}

# returns a string with the amount of parts in a miniseries w/numbers as words.
sub mini_parts { 
  my ($movie) = @_;

  my $r_parts = $movie->{'counts'}{'episode'} ? $movie->{'counts'}{'episode'} : undef;
  my $parts   = $r_parts ? NUMWORDS($r_parts)."-part" : undef;

  return $parts;
}

# The preceding group of subroutines all lead to display_movie with the exceptions of end_year and years_running.

# returns a sentence or two for a movie.
# The first parameter is the individual movie hash ref,
# the second is a hash ref with the named parameters: series, links, and crossovers.
sub display_movie {
  my ($movie,$opt) = @_;

  my $title  = $movie->{'title'};
  my $text   = textify($title);
  my $id     = idify($title);

  my $start  = $movie->{'start year'} && $movie->{'start year'} ne 'tbd' ? $movie->{'start year'} : undef;
  my $parts  = $movie->{'media'} eq 'miniseries' ? mini_parts($movie) : undef;
  my $media  = media($movie);
  my $basis  = basis($movie);
  my $run    = run_time($movie);
  my $genre  = genre_s($movie);
  my $about  = about($movie);
  my $mseries = $opt->{'series'} ? series_text($movie) : undef;

  my $movie_is    = A(join_defined(' ',[$start,$parts,$genre,$media,$about,$mseries,$basis,$run])).'.';
  my $crossover   = $opt->{'crossover'} && $movie->{'crossovers'}     ? 'It '.crossovers($movie)   : undef;
  my $links       = $opt->{'links'} ? links($movie) : undef;
  my $movie_line  = join_defined(' ',[$movie_is,$crossover,$links]);

  return qq(<span id="$id" class="title">$text</span> is $movie_line);
}

# returns the title in italics and the start year in parentheses.
sub display_simple_movie {
  my ($movie) = @_;
  my $title = textify($movie->{'title'});
  my $start = $movie->{'start year'} ? $movie->{'start year'} : undef;
  
  my $item;
  if ($movie->{'series'}) {
    my $group;
    my @list = keys %{$movie->{'series'}};
    if (keys %{$movie->{'series'}} > 1) {
      ($group) = sort { $movie->{'series'}{$b} <=> $movie->{'series'}{$a} } keys %{$movie->{'series'}};
    }
    else {
      $group = $list[0];
    }
    $item = search_link($group, [$movie->{'title'}]);
  }
  elsif ($movie->{'seasons'}) {
    $item = search_link($movie->{'title'});
  }
  else {
    $item = "<i>$title</i>";
  }
  $item .= $start ? " ($start)" : undef;
  
  return $item;
}

# separates the parts out of the episode title
sub unquote_parts {
  my ($string) = @_;
  if ($string =~ m/, Part \w+$/) {
    $string =~ s/(.+?),\s(Part \w+)/"$1", $2/;
    return $string;
  }
  else {
    return qq("$string");
  }
}

# returns episode title with any crossovers
sub display_episode {
  my ($episode) = @_;

  my $episode_name = textify($episode->{'title'});
  my $crossover_text = $episode->{'crossovers'} ? crossovers($episode) : undef;

  my $episode_text;
  if ($episode_name =~ m/^((|Unaired )Pilot|Un(nam|titl)ed)(|, Part \d+)$/ || $episode =~ m/^(Episode|Part) \d+/) {
    $episode_text = $episode_name;
  }
  elsif ($episode_name =~ m/, Part \w+$/) {
    $episode_text = unquote_parts($episode_name);
  }
  elsif ($episode_name =~ m/\saka\s/) {
    my @episode_names = map(unquote_parts($_),split(/ aka /,$episode_name));
    $episode_text = join(" <small>a.k.a.</small> ",@episode_names);
  }
  else {
    $episode_text = qq("$episode_name");
  }

  return join_defined(' ',[$episode_text, $crossover_text]);
}

# returns an array ref with certain options munged.
sub display_option {
  my ($select, $option) = @_;
  my $option_display;
  if ($select eq 'media') {
    $option_display = $option eq 'tv' ? uc($option) : ucfirst($option);
  }
  elsif ($select eq 'format') {
    $option_display = uc($option);
  }
  else {
    $option_display = $option;
  }
  return [$option_display, { 'value' => $option }];
}

# returns the navigation link
sub nav_link {
  my $id = ucfirst idify(@_);
  my $text = textify(pop @_);

  if ($text =~ m/^season/) {
    my @season_title = split(' ', $text);
    $text = ucfirst $season_title[0]." ".NUMWORDS($season_title[1]);
  }

  return anchor($text, { 'href' => "#$id" });
}

1;
