#!/usr/bin/perl
# This is the site index.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib 'files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);
use Base::Root qw(get_root);

my $root_link = get_root('link');
my $root_name = get_root('name');
$line_magic->{'bare'} = qq(A<$root_link|href="$root_link">);

page( 'heading' => $root_name, 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) } );

__DATA__
Welcome to B<Lady Aleena's> personal website.
2 Collections
B<Collections> is lists of A<novels|href="Collections/Fiction.pl">, A<books|href="Collections/Non-fiction.pl">, A<music|href="Collections/Music_and_comedy.pl">, A<movies|href="Collections/Movies.pl">, A<tie-ins|href="Collections/Tie-ins.pl">, and A<programs|href="Collections/Programs.pl"> I am willing to admit I own or use.
2 Fandom
B<Fandom> is lists of information from within various novels which I like.
2 Movies
B<A<Movies|href="Movies">> is lists of movies which interest me, opinions of some movies, and a small section on television crossovers. The interest could be as simple as two films with the same name. Take a look at my lists to find movies to watch.
2 Role playing
B<Role playing> is one of the larger resources for AD&amp;D 2nd Edition material on the web. Over 250 magic items are available and categorized as they would be listed if they were in the I<Encyclopedia Magica>© TSR, Inc. There are a dozen monsters for dungeon masters to pit against their players. There is a comprehensive, though not complete, list of proficiencies that TSR, Inc.™ and Wizards of the Coast, Inc.™ have been put out over the years. Reference tables and random generators are included to help make 2nd Edition game play easier and a little more exciting. Conversions to other editions are welcome.
Many thanks to ^Robert Anderson^, Johnny Brant, Nathan Brown, ^Gabriel Elias^, ^Randy Furuyama^, ^Alan Gray^, Dan Grieg, Joshua Moore, Rob McDonald, ^Charlie Przybylek^, and Rich Rayburn for their contributions.
2 Writing
B<Writing> is stories and poetry written by me with poetry submitted by others. Some of the stories are erotic. If you are looking for erotic images, you will not find any here. The poetry is written in various stages of my life, free form. The poems by other poets are not proofed. You, gentle reader, get them as the poets sent them to me. Have fun reading the stories and poems!
2 Miscellany
B<Miscellany> is random ideas and thoughts or lists that I have found or collated over the years. Some ideas are very old and outdated, while some I found long ago, kept for some reason, and am now sharing with anyone who decides to to read them. Some of these are just plain crazy and giggle worthy, but some may turn out to be something great some day if I ever get back to thinking about them. In the mean time, just have fun looking at them and have a very nice day!
2 Acknowledgements
This website was built with the help of the ^PerlMonks^ and the users of ^#perl^ and ^#perlcafe^ channels on freenode. It is always undergoing construction. I apologize for broken or missing pages. I am always learning how to write this site better, so there will be times when I am switching over to a new format making the current pages hard to read.
My site is hosted on ^Xecu.net^, however they are not affiliated with my personal website. Please point all links to this site at CODE<^bare^>. Thank you!
2 Reciprocated links
* ^Allahweh's Domain^
* ^Heroes' and Villains' Lorebook^
* ^Everchanging Book of Names^
* ^The Paper Filter^
