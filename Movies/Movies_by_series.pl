#!/usr/bin/perl
use strict;
use warnings;

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../files/lib';
use Base::Data qw(alpha_array);
use Base::Page qw(page);
use Base::Menu qw(file_menu alpha_menu);
use HTML::Elements qw(section heading paragraph list);
use Util::Sort qw(article_sort);
use Util::Columns qw(get_columns);
use Movies::Display qw(print_series print_program);
use Movies::LookUp qw(option);

my $cgi = CGI::Minimal->new;
my $select = encode_entities($cgi->param('series'),'<>"');
my $series_select = option('series');
my @selects = sort {article_sort(lc $a,lc $b)} keys %$series_select;
my $file_menu = file_menu('series', \@selects, $select);
my %alpha_list = alpha_array(\@selects);

my $head = $select && $series_select->{$select} ? qq(<i>$select</i>) : undef;
page( 'heading' => $head, 'file menu' => $file_menu, 'code' => sub {
  if ($select && $series_select->{$select}) {
    if ($series_select->{$select} eq 'series') {
      print_series(2,1,$select);
    }
    else {
      print_program(2,1,$select);
    }
  }
  else {
    section(3, sub {
      for my $alpha (sort keys %alpha_list) {
        heading(5, 3, $alpha, { 'id' => $alpha });
        list(6, 'u', file_menu('series', $alpha_list{$alpha}), { 'class' => get_columns(3, scalar @{$alpha_list{$alpha}}), 'style' => 'font-size:smaller' });
        alpha_menu( 6, \%alpha_list);
      }
    }, { 'heading' => [2, 'Pick a series'] });
  }
});
