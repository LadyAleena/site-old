#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../files/lib';
use Base::Page qw(page);
use Base::Menu qw(file_menu alpha_menu);
use HTML::Elements qw(section nav list);
use Util::Movie qw(movie_option print_franchise print_series print_movie);
use Util::Columns;
use Util::Data qw(alpha_array);
use Util::Sort qw(article_sort);

my $cgi           = CGI::Minimal->new;
my $select        = encode_entities($cgi->param('series'),'<>"');
my $series_select = movie_option('series');
my @selects       = sort {article_sort(lc $a, lc $b)} keys %$series_select;
my $file_menu     = file_menu('series', \@selects, $select);
my $alpha_movies  = alpha_array(\@selects);
my $alpha_menu    = alpha_menu($alpha_movies, { 'join' => ' | ' });

my $body_head  = $select && $series_select->{$select} ? $select : undef;
my $body_class = $select && $series_select->{$select} ? 'movie_series' : undef;

page( 'heading' => $body_head, 'file menu' => $file_menu, 'class' => $body_class, 'code' => sub {
  if ($select && $series_select->{$select}) {
    if ($series_select->{$select} eq 'series') {
      print_series(4, 1, $select);
    }
    else {
      print_movie(3, 1, $select);
    }
  }
  else {
    for my $alpha (sort keys %$alpha_movies) {
      my $class = number_of_columns(3, scalar @{$alpha_movies->{$alpha}}, 1);
      section(3, sub {
        list(5, 'u', file_menu('series', $alpha_movies->{$alpha}), { 'class' => $class, 'style' => 'font-size:smaller' });
        nav(5, $alpha_menu, { 'class' => 'alpha_menu' });
      }, { 'heading' => [2, $alpha, { 'id' => "section_$alpha" }] });
    }
  }
});
