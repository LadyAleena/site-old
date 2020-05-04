#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../files/lib';
use Base::Page qw(page);
use HTML::Elements qw(section nav list);
use Util::Movie qw(movie_option print_series print_movie textify_movie);
use Util::Columns;
use Util::Data qw(alpha_array);
use Util::Menu qw(file_menu alpha_menu);
use Util::Sort qw(article_sort);

my $cgi        = CGI::Minimal->new;
my $series_opt = encode_entities($cgi->param('series'),'<>"');

my $series_select = movie_option('series');
my @selects       = keys %$series_select;
my $alpha_movies  = alpha_array(\@selects);
my $alpha_menu    = alpha_menu($alpha_movies, { 'join' => ' | ' });

my $body_head  = $series_opt && $series_select->{$series_opt} ? textify_movie($series_opt) : undef;
my $body_class = $series_opt && $series_select->{$series_opt} ? 'movie_series' : undef;

page( 'heading' => $body_head, 'class' => $body_class, 'code' => sub {
  if ($series_opt && $series_select->{$series_opt}) {
    if ($series_select->{$series_opt} eq 'series') {
      print_series(4, 1, $series_opt);
    }
    else {
      print_movie(3, 1, $series_opt);
    }
  }
  else {
    for my $alpha (sort keys %$alpha_movies) {
      my $class = number_of_columns(3, scalar @{$alpha_movies->{$alpha}}, 1);
      section(3, sub {
        list(5, 'u', file_menu('series', [sort { article_sort($a, $b) } @{$alpha_movies->{$alpha}}]), { 'class' => $class, 'style' => 'font-size:smaller' });
        nav(5, $alpha_menu, { 'class' => 'alpha_menu' });
      }, { 'heading' => [2, $alpha, { 'id' => "section_$alpha" }] });
    }
  }
});
