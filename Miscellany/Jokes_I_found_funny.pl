#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../files/lib';
use Base::HTML qw(html story);
use Base::HTML::Element qw(list anchor);

my @items = <<List_end =~ m/(.+\n)/g;
Creation of Pussy
Does the Damn Thing work?
M R DUCKS
The New Priest
Now I'm old and feeble, and my pilot light is out
The purpose of the cluss in furmpaling is to remove
Pussy is a funny creature
Revised Retirement Policy
Seminars For Men
The Shit List
So, you don't know Jack Schitt?
List_end

my @funnies;
for (@items) {
  my $item_link = encode_entities($_);
     $item_link =~ s/ /+/g;
  push @funnies, anchor($_, { 'href' => "http://www.google.com/search?hl=en&amp;lr=&amp;safe=off&amp;q=$item_link&amp;btnG=Search" });
}

my $doc_magic = { 'funnies' => sub { list(3,'u',\@funnies) } };

html( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a list of jokes that I have found funny over the years. The links are to Google searches for the items in this list with safe searches turned B<off>. I hope you find them as humorous as I did.
& funnies
