package Movie;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(movie series franchise genre movie_option start_year end_year
  display_movie display_simple_movie display_option print_franchise print_series print_movie);

use File::Spec;
use Lingua::EN::Inflect qw(A PL_N NUM NO NUMWORDS inflect);
use List::Util qw(min max first);
use Encode qw(encode);

use Base::Path qw(base_path);
use Base::Data qw(data_file get_hash get_data);
use HTML::Elements qw(footer section heading paragraph list span anchor);
use Fancy::Join::Defined;
use Fancy::Join::Grammatical;
use Util::Columns;
use Util::Convert qw(filify textify idify searchify);
use Util::ExternalLinks;
use People qw(people_list);

my $movies = get_hash(
  'file' => ['Movies','movies.txt'],
  'headings' => ['title','start year','end year',qw(media format+ Wikipedia allmovie IMDb TV.com Flixster genre+ source company)],
);

my $seriess = get_hash(
  'file' => ['Movies','series.txt'],
  'headings' => [qw(title Wikipedia allmovie programs+), 'just like'],
);

my $franchises = get_hash(
  'file' => ['Movies','franchises.txt'],
  'headings' => [qw(title Wikipedia allmovie programs+), 'just like'],
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
# my ($first,$last);
for my $movie (values %$movies) {
  my $title = $movie->{'title'};

  # populating the years option
  # my $start = start_year($movie);
  # my $end   = end_year($movie);

  # if (!defined($first) || $first > $start) {
  #   $first = $start;
  # }

  # if (!defined($last) || $last < $end) {
  #   $last = $end;
  # }

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
  my $file;
  my @headings;
  if (-f $show_file) {
    open($file, '<', $show_file) || die "Can not open $show_file $!";
    @headings = ('title', 'crossovers');
  }
  else {
    next;
  }
  my @data = <$file>;
  chomp @data;

  my $season;
  my $inc;
  for my $line (@data) {
    if ($line eq '.') {
      $inc++;
      $movie->{'counts'}{'season'}++;
      my $season_num = sprintf "%02s", $inc;
      $season = "season $season_num";
      $movie->{'seasons'}{$season}{'title'} = 'Season '.NUMWORDS($inc);
    }
    else {
      $movie->{'counts'}{'episode'}++;
      $movie->{'seasons'}{$season}{'counts'}{'episode'}++;
      my @episode_values = split(/\|/, $line);
      my %episode;
      @episode{@headings} = @episode_values;

      if ($episode{'crossovers'}) {
        my @r_crosses = split(/;/,$episode{'crossovers'});
        $episode{'crossovers'} = undef;
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

for my $sseries (values %$seriess) {
  my $title = $sseries->{'title'};

  my @start_years;
  my @end_years;
  
  for my $program (@{$sseries->{'programs'}}) {
    $movies->{$program}{'series'}{$title} = scalar @{$sseries->{'programs'}};

    my $movie = movie($program);
    push @start_years, start_year($movie);
    push @end_years,   end_year($movie);

    my $movie_media = $movie->{'media'} || '';
    $sseries->{'counts'}{$movie_media}++;
    my $movie_counts = $movie->{'counts'};
    if ($movie_counts) {
      for my $type (qw(season episode)) {
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
    if ($seriess->{$program}) {
      $seriess->{$program}{'franchise'} = $title;
      
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
#  'year'   => [$first..$last],
  'media'  => [qw(film miniseries tv)],
  'format' => [qw(vhs dvd bd dg)],
  'genre'  => [sort keys %$genres],
  'source' => ['novel','short story', 'fairy tale', qw(play musical radio comics cartoon game toy)],
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
  get_data($seriess, $in, $caller);
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
sub movie_option {
  my ($in, $caller) = @_;
  get_data($options, $in, $caller);
}

# The following group of subroutines all lead to display_movie with the exceptions of end_year and years_running.

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
  if ($movie->{'media'} eq 'tv' && $movie->{'end year'}) {
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
sub movie_links {
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

# returns a string of what I felt is important about a movie.
sub about {
  my ($movie) = @_;

  my $start = $movie->{'genre'}{'non-fiction'} ? 'about' : 'with';
  my @abouts;
  for my $genre (values %{$movie->{'genre'}}) {
    push @abouts, grep($_ ne 'main',@$genre);
  }
  my $about = @abouts ? "$start ".grammatical_join('and', @abouts) : undef;

  return $about;
}

# returns what the movie is based on and by who.
sub basis {
  my ($movie) = @_;
  my $raw_base = join_defined(' by ', ($movie->{'source'}, $movie->{'company'}));
  my $basis = $movie->{'source'} ? "based on the $raw_base" : undef;
  return $basis;
}

# returns a string for a single crossover. The input is a hash ref.
sub crossover {
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
    my $id = $cseries && $seriess->{$cseries} ? [grep(defined,($program,$season_text))] : $program && $movies->{$program} && $season_text ? [$season_text] : undef;
    $crossover_text = search_link($search,$id).qq($episode_text);
  }

  return $crossover_text;
}

# returns a string for all of the crossovers for a movie or episode.
sub crossovers {
  my ($movie) = @_;
  
  my @crossovers = @{$movie->{'crossovers'}};
  my @crosses = map(crossover($_),@crossovers);
  my $c_link = anchor('crossed', { 'href' => 'Crossovers' });
  my $cross = scalar(@crosses) > 0 ? "$c_link with ".grammatical_join('and',@crosses).'.' : undef;
  return $cross;
}

# creates a link to the Movies_by_series page. It is used in series_text, crossover, and elsewhere.
# Unlike most of the above functions, this one can be used to create links to series as well as movies.
sub search_link {
  my ($movie, $id) = @_;

  my $search = undef;
  my $texti  = textify($movie);
  if (($seriess->{$movie} && $id) || (($movies->{$movie} && $movies->{$movie}->{'media'} eq 'tv') && $id)) {
    $search = searchify($movie,$id);
    $texti  = $movies->{$id->[0]} ? textify($id->[0]) : textify($movie); 
  }
  elsif($seriess->{$movie} || ($movies->{$movie} && $movies->{$movie}->{'media'} eq 'tv')) {
    $search = searchify($movie);
  }

  my $text = "<i>$texti</i>";
  my $root = base_path('path');
  my $path = File::Spec->abs2rel("$root/Movies/Movies_by_series.pl");
  my $search_text = $search ? anchor($text, { 'href' => "$path?series=$search" }) : $text;

  return $search_text; 
}

# returns a string listing all of the series in which a movie belongs with links.
sub series_text {
  my ($movie) = @_;

  my @series = $movie->{'series'} ? map(search_link($_), sort { $movie->{'series'}{$b} <=> $movie->{'series'}{$a} } keys %{$movie->{'series'}}) : ();
  my $lists_text = grammatical_join('and', @series);
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
  my ($movie, $opt) = @_;

  my $title  = $movie->{'title'};
  my $text   = !$movie->{'series'} && $movie->{'seasons'} ? anchor(textify($title), { 'href' => 'Movies_by_series.pl?series='.searchify($title) }) :
                                                            textify($title);
  my $id     = idify($title);

  my $start  = $movie->{'start year'} && $movie->{'start year'} ne 'tbd' ? $movie->{'start year'}     : undef;
  my $media  = $movie->{'media'} eq 'tv'         ? 'television series'                                : $movie->{'media'};
  my $run    = $movie->{'media'} eq 'tv'         ? run_time($movie)                                   : undef;
  my $parts  = $movie->{'media'} eq 'miniseries' ? mini_parts($movie)                                 : undef;
  my $basis  = $movie->{'source'}                ? basis($movie)                                      : undef;
  my $genre  = $movie->{'genre'}                 ? grammatical_join('and', sort keys %{$movie->{'genre'}}) : undef;
  my $about  = about($movie);

  my $mseries = $opt->{'series'} ? series_text($movie) : undef;

  my $verb = $movie->{'start year'} eq 'tbd' ? 'might be' : $movie->{'start year'} > $current_year ? 'will be' : 'is';
  my $movie_is    = A(join_defined(' ', ($start, $parts, $genre, $media, $about, $mseries, $basis, $run))).'.';
  my $crossover   = $opt->{'crossover'} && $movie->{'crossovers'} ? 'It '.crossovers($movie)   : undef;
  my $links       = $opt->{'links'} ? movie_links($movie) : undef;
  my $movie_line  = join_defined(' ', ($movie_is, $crossover, $links));

  return span($text, { 'id' => $id, 'class' => 'title'}). " $verb $movie_line";
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

sub like {
  my ($program, $agree, $just_like) = @_;
  my $like   = $just_like && $just_like =~ /d+/ && $just_like > 1 ? NO("<i>$program</i> film", $just_like, {words_below => 10}) : "<i>$program</i> film";
  my $string = $just_like && $just_like eq 'n' ? '' : $just_like && $just_like > 0 ? "I like the first $like, the rest were included for completeness." :
               "I or my fiancé like <i>$program</i> and would like to see it when we come upon it." ;
  $string .= ' If you disagree with the inclusion of a film or program on this list, you can contact me through the email link above.' if $agree;
  return $string;
}

my $epgd = anchor('epguides',  { 'href' => 'http://epguides.com' });

# returns episode title with any crossovers
sub tv_episode {
  my ($episode) = @_;

  my $episode_name   = textify($episode->{'title'});
  my $episode_date   = $episode->{'date'} ? "($episode->{'date'})" : undef;
  my $crossover_text = $episode->{'crossovers'} ? crossovers($episode) : undef;

  my $episode_text;
  if ($episode_name =~ m/^((|Unaired )Pilot|Un(nam|titl)ed)(|, Part \d+)$/ || $episode_name =~ m/^(?:Episode|Part) \d+$/) {
    $episode_text = $episode_name;
  }
  elsif ($episode_name =~ m/, Part \w+$/) {
    $episode_text = unquote_parts($episode_name);
  }
  elsif ($episode_name =~ m/\saka\s/) {
    my @episode_names = map(unquote_parts($_), split(/ aka /, $episode_name));
    $episode_text = join(" <small>a.k.a.</small> ", @episode_names);
  }
  else {
    $episode_text = qq("$episode_name");
  }

  return join_defined(' ', ($episode_text, $crossover_text));
}

sub tv_season {
  my ($heading, $in_season, $program, $series) = @_;
  my $movie = movie($program);
  my $local_season = $movie->{'seasons'}{$in_season};

  my $out_heading;
  my $out_counts;
  if ($heading) {
    my $season_id = $series ? idify($program, $in_season) : idify($in_season);
    my $season_text = $local_season->{title};
    my $counts_text = counts($local_season);

    $out_heading = [$heading, $season_text, { 'id' => $season_id, 'class' => 'season' }];
    $out_counts  = "($counts_text)";
  }
  my @episodes = map( tv_episode($_), @{$local_season->{'episodes'}} );
  my $out_list = ['o', \@episodes, { 'class' => 'episode_list two' }];
  
  return {
    'heading' => $out_heading ? $out_heading : undef,
    'counts'  => $out_counts  ? $out_counts  : undef,
    'list'    => $out_list    ? $out_list    : undef
  };
}

sub print_franchise {
  my ($tab, $in_heading, $in_title) = @_;
  die "You put in just the franchise name didn't you, so I stopped" if ($tab !~ /\d+/ || $in_heading !~ /\d+/);
  my $heading         = $in_heading ? $in_heading > 3 ? die('print_franchise heading level can not be above 3!') : $in_heading : 1;
  my $franchise       = $in_title;

  my $local_franchise = franchise($franchise);
  my $counts          = $local_franchise->{'counts'};
  my $programs        = $local_franchise->{'programs'};

  my $franchise_id    = idify($franchise);
  my $franchise_text  = textify($franchise);
  my $counts_text     = counts($local_franchise);
  my $movie_links     = movie_links($local_franchise);

  $tab++;
  section($tab, sub {
    paragraph($tab, $movie_links, { 'style' => 'float: right'}) if $movie_links;
    paragraph($tab, years_running($local_franchise)." ($counts_text)");
    my @links = map(nav_link($_), @$programs);
    list($tab, 'u', \@links, { 'class' => 'program_list two' });
  });
  for my $program (@$programs) {
    if ($seriess->{$program}) {
      print_series($tab, $heading + 1, $program);
    }
    else {
      print_movie($tab, $heading + 1, $program);
    }
  }
  if ( $heading == 1 ) {
    footer($tab, sub {
      paragraph($tab + 1, like($franchise_text, 1, $local_franchise->{'just like'}), { 'class' => 'like' });
      paragraph($tab + 1, "The episode lists would have been a pain to put together without $epgd.") if $counts->{'tv'};
    });
  }
}

sub print_series {
  my ($tab, $in_heading, $in_title) = @_;
  die "You put in just the series name didn't you, so I stopped" if ($tab !~ /\d+/ || $in_heading !~ /\d+/);
  my $heading      = $in_heading ? $in_heading > 4 ? die('print_series heading level can not be above 4!') : $in_heading : 1;
  my $series       = $in_title;

  my $local_series = series($series, 'print_series');
  my $counts       = $local_series->{'counts'};
  my $programs     = $local_series->{'programs'};

  my $series_id    = idify($series);
  my $series_text  = textify($series);
  my $counts_text  = counts($local_series);
  my $movie_links  = movie_links($local_series);

  my $actor_file   = 'Actors_in_'.filify($series).'.txt';
  my $people       = people_list($actor_file) ? people_list($actor_file) : undef;
  
  section($tab, sub {
    paragraph($tab + 1, $movie_links, { 'style' => 'float: right'}) if $movie_links;
    paragraph($tab + 1, years_running($local_series)." ($counts_text)");
    if (( $counts->{'tv'} && $counts->{'tv'} > 0) || (($counts->{'film'} || 0) + ($counts->{'miniseries'} || 0)) > 10) {
      my @links = map(nav_link($_), @$programs);
      unshift @links, anchor('Actors', { 'href' => "#actors_in_$series_id" }) if $people;
      my $cols = number_of_columns(3, scalar @links, 1);
      list($tab + 1, 'u', \@links, { 'class' => "program_list $cols" });
    }
  });
  section($tab, sub {
    my $cols = number_of_columns(3, scalar @$people, 1);
    list($tab + 2, 'u', $people, { 'class' => "actor_list $cols" });
  }, { 'heading' => [$heading + 1 , 'Actors', { 'id' => "actors_in_$series_id" }]}) if $people;
  if ($counts->{'tv'}) {
    print_movie($tab, $heading + 1, $_, $series) for @$programs;
  }
  else {
    my $section_heading = $counts->{'film'} && $counts->{'miniseries'} ? 'Films and miniseries' :
                          $counts->{'film'} ? 'Films' : $counts->{'miniseries'} ? 'Miniseries' : undef;
    section($tab, sub {
      paragraph($tab, display_movie(movie($_, 'print_series'), { 'crossover' => 1, 'links' => 1 })) for @$programs;
    }, { 'heading' => $section_heading ? [$heading + 1, $section_heading] : undef });
  }
  if ( $heading == 1 ) {
    footer($tab, sub {
      paragraph($tab + 1, like($series_text, 1, $local_series->{'just like'}), { 'class' => 'like' });
      paragraph($tab + 1, "The episode lists would have been a pain to put together without $epgd.") if $counts->{'tv'};
    });
  }
}

sub print_movie {
  my ($tab, $in_heading, $in_title, $in_series) = @_;
  die "You put in just the movie name didn't you, so I stopped" if ($tab !~ /\d+/ || $in_heading !~ /\d+/);
  my $heading = $in_heading ? $in_heading > 5 ? die('print_program heading level can not be above 5!') : $in_heading : 1;
  my $program = $in_title;

  my $movie   = movie($program, 'print_movie');
  my $id      = idify($movie->{'title'});
  my $display = textify($movie->{'title'});
  my $seasons = $movie->{'seasons'} ? $movie->{'seasons'} : undef;

  my $counts_text = counts($movie) ? '('.counts($movie).')'  : undef;
  my $movie_is    = display_movie($movie, { 'crossover' => 1 });
  my $movie_links = movie_links($movie);
  my $actor_file  = 'Actors_in_'.filify($program).'.txt';
  my $people      = people_list($actor_file) ? people_list($actor_file) : undef;

  section($tab, sub {
    $tab += $heading > 1 ? 2 : 3;
    paragraph($tab, $movie_links, { 'style' => 'float: right' }) if $movie_links;
    paragraph($tab, join_defined(' ', (years_running($movie), $counts_text))) if $movie->{'media'} eq 'tv';
    paragraph($tab, $movie_is);

    if ($seasons) {
      if (scalar keys %{$seasons} > 1) {
        my @links = map(nav_link($in_series ? $program : undef, $_), sort keys %{$seasons});
        unshift @links, anchor('Actors', { 'href' => "#actors_in_$id" }) if ($people && !$in_series);
        my $cols = number_of_columns(4, scalar @links, 1);
        list($tab, 'u', \@links, { 'class' => "season_list $cols" });
      }
      if ($people && !$in_series) {
        my $cols = number_of_columns(3, scalar @$people, 1);
        heading($tab, $heading + 1, 'People', { 'id' => "actors_in_$id" });
        list   ($tab + 1, 'u', $people, { 'class' => "actor_list $cols" });
      }
      my $next_heading = $movie->{'counts'}{'season'} > 1 || $people ? $heading + 1 : undef;
      for my $season (sort keys %{$seasons}) {
        my $in_season = tv_season($next_heading, $season, $program, $in_series);
        heading  ($tab, @{$in_season->{'heading'}})  if $in_season->{'heading'};
        paragraph($tab + 1, $in_season->{'counts'})  if $in_season->{'counts'};
        list     ($tab + 1, @{$in_season->{'list'}}) if $in_season->{'list'};
      }
    }
  }, { 
    'heading' => $heading  > 1 ? [2, $display, { 'id' => $id, 'class' => 'program' }] : undef,
    'footer'  => $heading == 1 ? [sub {
      paragraph($tab + 1, like($display), { 'class' => 'like' });
      paragraph($tab + 1, "The episode lists would have been a pain to put together without $epgd.")
    }] : undef,
  });
}

1;
