#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../files/lib';
use Base::Page qw(page);
use Base::Menu qw(alpha_menu);
use Base::Data qw(alpha_array);
use HTML::Elements qw(section nav paragraph list form fieldset selection input anchor);
use Util::Sort qw(article_sort);
use Util::Convert qw(idify);
use Fancy::Join::Grammatical;
use Movie qw(movie movie_option display_movie display_option start_year end_year);

my $cgi = CGI::Minimal->new;
my $title  = $cgi->param('title')  ? encode_entities($cgi->param('title'),  '<>"') : '';
my $year   = $cgi->param('year')   ? encode_entities($cgi->param('year'),   '<>"') : '';
my $media  = $cgi->param('media')  ? encode_entities($cgi->param('media'),  '<>"') : '';
my $genre  = $cgi->param('genre')  ? encode_entities($cgi->param('genre'),  '<>"') : '';
my $source = $cgi->param('source') ? encode_entities($cgi->param('source'), '<>"') : '';
my $alpha  = $cgi->param('alpha')  ? encode_entities($cgi->param('alpha'),  '<>"') : '';

my @selects = qw(media genre source);
my %select_options = map { $_ => movie_option($_) } @selects;

my $movies_data = movie('data');
my $search;
my @movies;
if ( $year || $media || $genre || $source || $title ) {
  my @selections;
  push @selections, $title  if $title;
  push @selections, $year   if $year;
  push @selections, $media  if $media;
  push @selections, $genre  if $genre;
  push @selections, $source if $source;
  
  my $selection = @selections ? grammatical_join('and', map("<b>$_</b>", @selections)) : '';
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
    next if $media  &&    $movie->{'media'} ne $media;
    next if $genre  &&   !$movie->{'genre'}{$genre};
    next if $source &&  (!$movie->{'source'} || $movie->{'source'} !~ /$source/i);
    next if $title  && lc($movie->{'title'}) !~ /\L$title\E/i;

    push @movies, $movie->{'title'};
  }

  $search = @movies > 0 ? "You searched for $selection_text in my collection." : "No matches found for $selection_text.";
}
else {
  @movies = keys %$movies_data;
}

my %alpha_movies = alpha_array(\@movies);
for my $movies (keys %alpha_movies) {
  my @movies = map(display_movie($movies_data->{$_}, { 'series' => 1, 'links' => 1, 'crossover' => 1 }), sort { article_sort(lc $a, lc $b) } @{$alpha_movies{$movies}});
  @{$alpha_movies{$movies}} = @movies;
}
my $alpha_menu = scalar(@movies) > 10 ? 
                  alpha_menu(\%alpha_movies, { 'addition' => anchor('Search the list', { href => '#Search' }), 'join' => ' | ' } ) :
                  undef;

page( 'code' => sub {
  form(3, sub {
    fieldset(4, sub {
      input(5, { 'type' => 'text', 'name' => 'title',  'placeholder' => 'Title', 'style' => 'width: 14em' });
      input(5, { 'type' => 'text', 'name' => 'year',   'placeholder' => 'Year',  'style' => 'width: 10em' });
      for my $select (@selects) {
        my @options = ([ucfirst($select), { 'value' => '' }], map(display_option($select, $_), @{$select_options{$select}}));
        selection(5, \@options, { 'name' => $select, 'style' => 'width: 10em' });
      }
      input(5, { 'type' => 'submit', 'value' => 'List movies' });
      input(5, { 'type' => 'button', 'value' => 'Start over', 'onclick' => "location='Movies_by_alpha.pl'" });
    }, { 'legend' => 'Search...' });
  }, { 'action' => 'Movies_by_alpha.pl', 'method' => 'get', 'id' => 'Search' });
  section(3, sub {
    paragraph(4, 'This is a list of films and television series I have collected that either interest my fiancé or me or helps populate other pages.');
    paragraph(4, $search) if $search;
  });
  for my $alpha_movie (sort keys %alpha_movies) {
    section(3, sub {
      list(5, 'u', $alpha_movies{$alpha_movie}, { 'class' => 'movie_list' });
      nav(5, $alpha_menu, { 'class' => 'alpha_menu' }) if $alpha_menu;
    }, { 'heading' => [2, $alpha_movie, { id => "section_$alpha" }] });
  };
});
