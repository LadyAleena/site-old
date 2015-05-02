#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../files/lib';
use Base::Page qw(page);
use Base::Menu qw(file_menu alpha_menu);
use Base::Data qw(alpha_array);
use HTML::Elements qw(section paragraph list);
use Util::Sort qw(article_sort);
use Util::Columns qw(get_columns);
use Movie qw(option print_series print_program);

my $cgi = CGI::Minimal->new;
my $select = encode_entities($cgi->param('series'),'<>"');
my $series_select = option('series');
my @selects = sort {article_sort(lc $a,lc $b)} keys %$series_select;
my $file_menu = file_menu('series', \@selects, $select);
my %alpha_movies = alpha_array(\@selects);
my $alpha_menu = alpha_menu(\%alpha_movies);

my $body_head  = $select && $series_select->{$select} ? $select : undef;
my $body_class = $select && $series_select->{$select} ? 'movie_series' : undef;
page( 'heading' => $body_head, 'file menu' => $file_menu, 'class' => $body_class, 'code' => sub {
  if ($select && $series_select->{$select}) {
    if ($series_select->{$select} eq 'series') {
      print_series(2, 1, $select);
    }
    else {
      print_program(2, 1, $select);
    }
  }
  else {
    for my $alpha (sort keys %alpha_movies) {
      my $class = get_columns(3, scalar @{$alpha_movies{$alpha}});
      section(3, sub {
        list(5, 'u', file_menu('series', $alpha_movies{$alpha}), { 'class' => $class, 'style' => 'font-size:smaller' });
        paragraph(5, $alpha_menu, { 'class' => 'alpha_menu' });
      }, { 'heading' => [2, $alpha, { 'id' => "section_$alpha" }] });
    }
  }
});
