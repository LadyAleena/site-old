#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);
use URI::Encode qw(uri_encode);

use lib "../files/lib";
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use HTML::Elements qw(section paragraph list);
use Util::Sort qw(article_sort);
use Util::Convert qw(textify);
use Movies::LookUp qw(movie series_hash genre_hash search_link);

my %series = series_hash;
my %genres = genre_hash;

sub make_link {
  my ($in_title) = @_;
  my $movie = movie($in_title);
  my $title = textify($in_title);
  my $start_year = $movie->{'start year'};
  
  my $item;
  if ($movie->{'series'} && @{$movie->{'series'}} > 1) {
    my ($biggest) = sort { scalar @{$series{$b}{'programs'}} <=> scalar @{$series{$a}{'programs'}} } @{$movie->{'series'}};
    $item = search_link($biggest, [$movie->{'title'}]);
  }
  elsif ($movie->{'series'} && @{$movie->{'series'}} == 1) {
    $item = search_link($movie->{'series'}[0], [$movie->{'title'}]);
  }
  elsif ($movie->{'seasons'}) {
    $item = search_link($movie->{'title'});
  }
  else {
    $item = "<i>$title</i>";
  }
  $item .= " ($start_year)";
  
  return $item;
}

my $cgi = CGI::Minimal->new;
my $select = encode_entities($cgi->param('genre'),'<>"');
my $head = $select && $genres{$select} ? ucfirst "$select movies" : undef;
my $file_menu = file_menu('genre', [sort keys %genres] , $select);
page( 'heading' => $head, 'file menu' => $file_menu, 'code' => sub {
  my $heading;
  section(3, sub {
    if ($select && $genres{$select}) {
      my @subgenres = (sort grep(!/main/, keys %{$genres{$select}}));
      unshift @subgenres, 'main' if $genres{$select}{'main'};

      for my $subgenre (@subgenres) {
        my @movies = map { make_link($_) } sort { article_sort(lc $a,lc $b) } @{$genres{$select}{$subgenre}};
        my $class = scalar(@movies) < 36 ? 'one' : scalar(@movies) > 70 ? 'three' : 'two';
        my $style = scalar(@movies) > 70 ? 'font-size:smaller' : undef;
        section(4, sub {
          list(6, 'u', \@movies, { 'class' => $class, 'style' => $style });
        }, { 'heading' => $subgenre ne 'main' ? [3, ucfirst $subgenre] : undef });
      }
    }
    else {
      $heading = [2, 'Pick a genre'];
      list(5, 'u', $file_menu, { 'class' => 'three' });
    }
  }, { 'heading' => $heading });
});
