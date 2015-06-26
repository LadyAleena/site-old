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
Welcome to my place online.
2 Role playing
Welcome to one of the larger resources for AD&amp;D 2nd Edition material on the web. Over 250 magic items are available and categorized as they would be listed if they were in the I<Encyclopedia Magica>© TSR, Inc. There are a dozen monsters for dungeon masters to pit against their players. There is a comprehensive, though not complete, list of proficiencies that TSR, Inc.™ and Wizards of the Coast, Inc.™ have been put out over the years. Reference tables and random generators are included to help make 2nd Edition game play easier and a little more exciting. Conversions to other editions are welcome.
Many thanks to ^Robert Anderson^, Johnny Brant, Nathan Brown, ^Gabriel Elias^, ^Randy Furuyama^, ^Alan Gray^, Dan Grieg, Joshua Moore, Rob McDonald, ^Charlie Przybylek^, and Rich Rayburn for their contributions.
2 Writing
All of the stories and most of the poetry are written by me. Some of the stories are erotic. If you are looking for erotic images, you will not find any here. The poetry is written in various stages of my life, free form. The poems by other poets are not proofed. You, gentle reader, get them as the poets sent them to me. Have fun reading the stories and poems!
STRONG<NOTE:> If you at one time submitted poetry to me and can not find it, I removed your poetry because your e-mail address is no longer valid. Send me an e-mail with your updated address, and I will readd your poetry.
2 Movies
The lists of movies here are those which I or my fiancé have an interest. The interest could be as simple as two films with the same name. I like reading about horror films, but I don't watch many. The horror genre happens to have a lot of series. If you want a list of movies to watch, take a look at our list. You can get more information about them from ^Wikipedia^, ^Allmovie^, ^IMDb^, ^TV.com^, and ^Flixster^ where noted.
2 Collections
The lists are just my personal collections of books and music.
2 Miscellany
These are random ideas and thoughts or lists that I have found or collated over the years. Some are very old and outdated ideas, while some are things I found long ago, kept for some reason, and am now sharing with anyone who decides to to read them. Some of these are just plain crazy and giggle worthy, but some may turn out to be something great some day if I ever get back to thinking about them. In the mean time, just have fun looking at them and have a very nice day!
2 Reciprocated links
* ^Allahweh's Domain^
* ^Heroes' and Villains' Lorebook^
* ^Everchanging Book of Names^
* ^The Paper Filter^
2 Notes
B<Lady Aleena> is my personal website and was built with the help of the ^PerlMonks^ and the users of ^#perl^ and ^#perlcafe^ channels on freenode. It is always undergoing construction. I apologize for broken or missing pages. I am always learning how to write this site better, so there will be times when I am switching over to a new format making the current pages hard to read.
This site is hosted on ^Xecu.net^, however they are not affiliated with my personal website. Please point all links to this site at CODE<^bare^>. Thank you!
