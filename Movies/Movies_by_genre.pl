#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib "../files/lib";
use Base::Page qw(page);
use HTML::Elements qw(section paragraph list anchor);
use Util::Movie qw(display_simple_movie movie genre);
use Util::Sort qw(article_sort);

my $genres = genre('data');

my $cgi    = CGI::Minimal->new;
my $select = encode_entities($cgi->param('genre'),'<>"');
my $head   = $select && $genres->{$select} ? ucfirst "$select movies" : undef;

page( 'heading' => $head, 'code' => sub {
  if ($select && $genres->{$select}) {
    section(3, sub {
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
    });
    section(3, sub {
      my $list = [
        map  { anchor(ucfirst $_, { 'href' => "?genre=$_" }) }
        sort
        grep { !/$select/ } keys %$genres
      ];
      list(5, 'u', $list, { 'class' => 'four' });
    }, { 'heading' => [2, 'Other genres'] });
  }
  else {
    section(3, sub {
      my $list = [
        map  { anchor(ucfirst $_, { 'href' => "?genre=$_" }); } (sort keys %$genres)
      ];
      paragraph(6, "Click a genre to see a list of movies.");
      list(5, 'u', $list, { 'class' => 'four' });
    });
  }
});
