package Movies::Display;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(print_series print_program);

use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use Lingua::EN::Inflect qw(NO NUMWORDS);

use Base::Data qw(data_file);
use HTML::Elements qw(footer section heading paragraph list anchor pre);
use Util::Convert qw(idify textify filify);
use Util::Columns;
use Util::JoinDefined;
use Movies::LookUp qw(series movie display_movie display_episode years_running counts links nav_link);
use People qw(get_people);

sub like {
  my ($series, $agree, $just_like) = @_;
  my $like = $just_like && $just_like > 1 ? NO("<i>$series</i> film", $just_like, {words_below => 10}) : "<i>$series</i> film";
  my $string = $just_like && $just_like > 0 ? "I like the first $like, the rest were included for completeness." :
               $just_like eq '' ? "I or my fiancé like <i>$series</i> and would like to see it when we come upon it." : '';
  $string .= ' If you disagree with the inclusion of a film or program on this list, you can contact me through the email link above.' if $agree;
  return $string;
}

my $epgd = anchor('epguides',  { 'href' => 'http://epguides.com' });

sub print_series {
  my ($tab, $user_heading, $user_title) = @_;
  my $series = $user_title;
  my $heading = $user_heading ? $user_heading > 4 ? die("$series heading level can not be above 4!") : $user_heading : 1;
  my $local_series = series($series);

  my $counts     = $local_series->{'counts'};
  my $programs   = $local_series->{'programs'};
  
  my $series_id   = idify($series);
  my $series_text = textify($series);
  my $counts_text = counts($local_series);
  my $movie_links = links($local_series);
  my $actor_file  = 'Actors_in_'.filify($series).'.txt';
  my $people      = get_people($actor_file) ? get_people($actor_file) : undef;
  
  $tab++;
  section($tab, sub {
    paragraph($tab, $movie_links, { 'style' => 'float: right'}) if $movie_links;
    paragraph($tab, years_running($local_series)." ($counts_text)");
    if ($counts->{'tv'} > 0 || ($counts->{'film'} + $counts->{'miniseries'}) > 6) {
      my @links = map(nav_link($_), @$programs);
      unshift @links, anchor('Actors', { 'href' => "#actors_in_$series_id" }) if $people;
      list($tab, 'u', \@links, { 'class' => 'program_list two' });
    }
  });
  section($tab, sub {
    my $columns = get_columns(3, scalar @$people);
    list($tab + 1, 'u', $people, { 'class' => "actor_list $columns" });
  }, { 'heading' => [$heading + 1 , 'Actors', { 'id' => "actors_in_$series_id" }]}) if $people;
  for my $program (@$programs) {
    print_program($tab, $heading + 1, $program, $series);
  }
  if ( $heading == 1 ) {
    footer($tab, sub {
      paragraph($tab + 1, like($series_text, 1, $local_series->{'just like'}), { 'class' => 'like' });
      paragraph($tab + 1, "The episode lists would have been a pain to put together without $epgd.") if $counts->{'tv'};
    });
  }
}

sub print_program {
  my ($tab, $user_heading, $user_program, $series) = @_;
  my $program = $user_program ? $user_program : basename($0);
  my $movie = movie($program);

  my $heading = $user_heading ? $user_heading > 5 ? die("$program heading level can not be above 5!") : $user_heading : 1;
  my $id      = idify($movie->{'title'});
  my $display = textify($movie->{'title'});
  my $seasons = $movie->{'seasons'} if $movie->{'seasons'};

  my $counts_text = counts($movie);
  my $movie_is    = display_movie($movie, { 'series' => 0, 'crossover' => 1 });
  my $movie_links = links($movie);
  my $actor_file  = 'Actors_in_'.filify($program).'.txt';
  my $people      = get_people($actor_file) ? get_people($actor_file) : undef;
  
  section($tab, sub {
    $tab++;
    paragraph($tab, $movie_links, { 'style' => 'float: right' }) if $movie_links;
    paragraph($tab, years_running($movie)." ($counts_text)") if $movie->{'media'} eq 'tv';
    paragraph($tab, $movie_is);

    if ($seasons) {
      if (scalar keys %{$seasons} > 1) {
        my @links = map(nav_link($series ? $program : undef, $_), sort keys %{$seasons});
        unshift @links, anchor('Actors', { 'href' => "#actors_in_$id" }) if ($people && !$series);
        list($tab, 'u', \@links, { 'class' => 'season_list five' });
      }
      if ($people && !$series) {
        my $columns = get_columns(3,scalar @$people);
        heading($tab, $heading + 1, 'Actors', { 'id' => "actors_in_$id" });
        list($tab + 1, 'u', $people, { 'class' => "actor_list $columns" });
      }
      my $next_heading = $movie->{'counts'}{'season'} > 1 ? $heading + 1 : undef;
      for my $season (sort keys %{$seasons}) {
        print_season($tab,$next_heading,$season,$program,$series);
      }
    }
    if ( $heading == 1 ) {
      footer($tab, sub {
        paragraph($tab + 1, like($display), { 'class' => 'like' });
        paragraph($tab + 1, "The episode lists would have been a pain to put together without $epgd.")
      });
    }
  }, { 'heading' => $heading > 1 ? [2, $display, { 'id' => $id, 'class' => 'program' }] : undef });
}

sub print_season {
  my ($tab, $heading, $season, $program, $series) = @_;
  my $movie = movie($program);
  my $local_season = $movie->{'seasons'}{$season};

  my @episodes = map( display_episode($_), @{$local_season->{'episodes'}} );
  if ($heading) {
    my $season_id = $series ? idify($program,$season) : idify($season);
    my $season_text = $local_season->{title};
    my $counts_text = counts($local_season);

    heading($tab, $heading, $season_text, { 'id' => $season_id, 'class' => 'season' });
    paragraph($tab+1,"($counts_text)");
  }
  list($tab + 1, 'o', \@episodes, { 'class' => 'episode_list two' });
}

1;
