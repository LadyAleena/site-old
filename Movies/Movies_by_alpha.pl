#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../files/lib';
use Base::Data qw(alpha_array);
use Base::Page qw(page);
use Base::HTML::Element qw(section paragraph list form fieldset selection input anchor);
use Base::Menu qw(alpha_menu);
use Util::Sort qw(article_sort);
use Util::Convert qw(idify textify);
use Util::GrammaticalJoin;
use Movies::LookUp qw(movie_hash options display_movie start_year end_year);

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
  return [$option_display, { value => $option }];
}

my @selects = (qw(year media format genre), 'based on');

my $cgi = CGI->new;
my $year   = $cgi->param('year')     ? encode_entities($cgi->param('year'),     '<>"') : '';
my $media  = $cgi->param('media')    ? encode_entities($cgi->param('media'),    '<>"') : '';
my $format = $cgi->param('format')   ? encode_entities($cgi->param('format'),   '<>"') : '';
my $genre  = $cgi->param('genre')    ? encode_entities($cgi->param('genre'),    '<>"') : '';
my $basis  = $cgi->param('based on') ? encode_entities($cgi->param('based on'), '<>"') : '';
my $title  = $cgi->param('title')    ? encode_entities($cgi->param('title'),    '<>"') : '';

my %options = (
  'year'     => options('years'),
  'media'    => [qw(film miniseries tv)],
  'format'   => [qw(vhs dvd bd dg)],
  'genre'    => options('genres'),
  'based on' => ['novel','short story',qw(play musical radio comics cartoon game toy)],
);

my %movies_data = movie_hash;
my $search;
my @movies;
if ( $year || $media || $genre || $format || $basis || $title ) {
  my @selections;
  push @selections, qq($title)  if $title;
  push @selections, qq($year)   if $year;
  push @selections, qq($media)  if $media;
  push @selections, qq($format) if $format;
  push @selections, qq($genre)  if $genre;
  push @selections, qq($basis)  if $basis;
  
  my $selection = @selections ? grammatical_join('and',map("<b>$_</b>",@selections)) : '';
  my $selection_text = $selection;
  
  for my $movie (values %movies_data) {
    my $item = $movie->{'title'};
  
    if ($year) {
      my $start_year = start_year($item);
      my $end_year   = end_year($item);

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
    next if $genre  && !$movie->{'genre'}{$genre};
    next if $format && (!$movie->{'format'}   || !$movie->{'format'}{$format});
    next if $basis  && (!$movie->{'based on'} || $movie->{'based on'} !~ /$basis/i);
    next if $title  && lc($movie->{'title'}) !~ /\L$title\E/i;

    push @movies, $movie->{'title'};
  }
  $search = @movies > 0 ? "You searched for $selection_text in my collection." : "No matches found for $selection_text.";
}
else {
  @movies = keys %movies_data;
}

my %alpha_movies = alpha_array(\@movies);

for my $movies (keys %alpha_movies) {
  my @movies = map(display_movie($_, { 'series' => 1, 'links' => 1 }), sort { article_sort(lc $a,lc $b) } @{$alpha_movies{$movies}});
  @{$alpha_movies{$movies}} = @movies;
}

page( 'code' => sub {
  form(3, sub {
    fieldset(4, sub {
      input(5, { 'type' => 'text', 'name' => 'title',  'placeholder' => 'title', 'style' => 'width:14em' });
      for my $select (@selects) {
        my @options = ([ucfirst($select), { 'value' => '' }], map(display_option($select, $_), @{$options{$select}}));
        selection(5, \@options, { 'name' => $select, 'style' => 'width:6.5em' });
      }
      input(5, { 'type' => 'submit', 'value' => 'List movies' });
      input(5, { 'type' => 'button', 'value' => 'Start over', 'onclick' => "location='Movies_by_alpha.pl'" });
    }, { 'legend' => 'Search...' });
  }, { 'action' => 'Movies_by_alpha.pl', 'method' => 'get', 'id' => 'Search' });
  section(3, sub {
    paragraph(4,qq(This is a list of films and television series which interest my fiancé or me in some way, we either want to just watch them or own them.));
    paragraph(4,$search) if $search;
  });
  for my $alpha (sort keys %alpha_movies) {
    section(3, sub {
      list(5, 'u', \@{$alpha_movies{$alpha}}, { 'class' => 'movie_list' });
      alpha_menu(5, \%alpha_movies, anchor('Search the list', { href => '#Search' }));
    }, { 'heading' => [2, $alpha, { id=> "section_$alpha" }] });
  };
});
