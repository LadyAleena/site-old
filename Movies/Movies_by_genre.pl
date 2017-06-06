#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib "../files/lib";
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use HTML::Elements qw(section paragraph list);
use Util::Movie qw(display_simple_movie movie genre);
use Util::Sort qw(article_sort);

my $genres = genre('data');

my $cgi = CGI::Minimal->new;
my $select = encode_entities($cgi->param('genre'),'<>"');
my $head = $select && $genres->{$select} ? ucfirst "$select movies" : undef;
my $file_menu = file_menu('genre', [sort keys %$genres] , $select);

page( 'heading' => $head, 'file menu' => $file_menu, 'code' => sub {
  my $heading;
  section(3, sub {
    if ($select && $genres->{$select}) {
      my @subgenres = (sort grep(!/main/, keys %{$genres->{$select}}));
      unshift @subgenres, 'main' if $genres->{$select}{'main'};

      for my $subgenre (@subgenres) {
        my @movies = map { display_simple_movie(movie($_)) } sort { article_sort(lc $a, lc $b) } @{$genres->{$select}{$subgenre}};
        my $class = scalar(@movies) > 72 ? 'three' : scalar(@movies) > 36 ? 'two' : 'one';
        my $style = $class eq 'three' ? 'font-size:smaller' : undef;
        section(4, sub {
          my $genre = $subgenre ne 'main' ? $subgenre : $select;
          paragraph(6, "This is a list of $genre movies I have gathered.");
          list(6, 'u', \@movies, { 'class' => $class, 'style' => $style });
        }, { 'heading' => $subgenre ne 'main' ? [3, ucfirst $subgenre] : undef });
      }
    }
    else {
      paragraph(6, "Click a genre to see a list of movies.");
      list(5, 'u', $file_menu, { 'class' => 'three' });
    }
  });
});
