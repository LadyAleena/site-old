#!/usr/bin/perl
# This is the site index.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib 'files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Lady Aleena', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) } );

__DATA__
Welcome to B<Lady Aleena's> personal website. For the next several weeks, many pages will say updated. The updates may be the underlying code not content.SPAN< Some sections of this site are not suitable for mobile devices. I am working on it.|class="mobile">
2 Collections
B<Collections> is lists of A<novels|href="Collections/Fiction.pl">, A<books|href="Collections/Non-fiction.pl">, A<music|href="Collections/Music_and_comedy.pl">, A<movies|href="Collections/Movies.pl">, A<tie-ins|href="Collections/Tie-ins.pl">, and A<programs|href="Collections/Programs.pl"> I am willing to admit I own or use.
2 Fandom
B<Fandom> is lists of information from various franchises I like.
2 Movies
B<A<Movies|href="Movies">> is lists of movies which interest me, opinions of some movies, and a small section on television crossovers. The interest could be as simple as two films with the same name. Take a look at my lists to find movies to watch.
2 Role playing
B<A<Role playing|href="Role_playing">> is a collection of player created resources for AD&amp;D 2nd Edition&#169; material. Over 250 magic items  and a dozen monsters are here. There is a comprehensive, though not complete, list of proficiencies that TSR, Inc.&#8482; and Wizards of the Coast, Inc.&#8482; have put out over the years. Reference tables and random generators are included to help make 2nd Edition game play easier and a little more exciting.
2 Writing
B<Writing> is stories and poetry written by me with poetry submitted by others. Some of the stories are erotic. If you are looking for erotic images, you will not find any here. The poetry is written in various stages of my life, free form. The poems by other poets are not proofed. You, gentle reader, get them as the poets sent them to me. Have fun reading the stories and poems!
2 Miscellany
B<Miscellany> is random ideas, thoughts, and lists that I found or collated over the years. Some ideas are very old and outdated, while some I found long ago, kept for some reason, and am sharing with anyone who decides to to read them. Some of these are just plain crazy and giggle worthy, but some may turn out to be something great some day, if I ever get back to thinking about them. In the mean time, have fun looking at them and have a very nice day!
2 Acknowledgements
This website was built with the help of the ^PerlMonks^ and the users of ^#perl^ and ^#perlcafe^ channels on freenode.
My site is hosted on ^Xecu.net^, but they are not affiliated with my personal website. Please point all links to this site at CODE<A<fantasy.xecu.net|href="http://fantasy.xecu.net">>. Thank you!
