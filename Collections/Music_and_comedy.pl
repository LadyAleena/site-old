#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::HTML qw(html story);
use Base::HTML::Element qw(list);
use Base::LineMagic qw($line_magic);
use People qw(get_people);

my $people = {
  'musicians' => [get_people('Musicians.txt')],
  'comedians' => [get_people('Comedians.txt')],
};

my $doc_magic = {
  'musicians' => sub { list(3, 'u', $people->{'musicians'}, { 'class' => 'three' }) },
  'comedians' => sub { list(3, 'u', $people->{'comedians'}, { 'class' => 'three' }) },
};

html( code => sub { story(*DATA, { 'doc magic' => $doc_magic, 'line magic' => $line_magic }) });

__DATA__
This is my music and comedy collection of SPAN<LPs|^lps^>, SPAN<45s|^ffs^>, SPAN<cassettes|^cassettes^>, and SPAN<CDs|^cds^>. If it is not on a CD, I have not heard it in a long long time. SPAN<&#9785;|class="bigger">
2 Music
My entire music collection is here with the exception of soundtracks. They can be found on my A<tie-ins|href="Tie-ins.pl"> page.
3 My music collection
* I<Voices Carry|^lp^> (1985) by 'til Tuesday
* I<ABBA Gold: Greatest Hits|^cd^> (1992) by ABBA
* I<The Sign|^cd^> (1994) by Ace of Base
* I<Pandora's Box|^cd^> (1991) by Aerosmith
* I<"Never Gonna Give You Up"/"Never Gonna Give You Up"|^ff^> (1987) by Rick Astley
* I<Different Light|^lp^> (1986) by The Bangles
* I<The Ultimate Bee Gees|^cd^> (2009) by Bee Gees
* I<Best Shots|^cd^> (1989) by Pat Benatar
* I<Branigan 2|^lp^> (1983) by Laura Branigan
* I<No Fences|^cd^> (1990) by Garth Brooks
* I<Now &amp; Then|^cassette^> (1973) by The Carpenters
* I<"Glory of Love"/"On the Line"|^ff^> (1986) by Peter Cetera
* I<Heyday|^lp^> (1986) by The Church
* I<Too Much Monkey Business|^cassette^> (1984) by Eric Clapton
* I<Rhythm of the Night|^lp^> (1985) by DeBarge
* I<Greatest Purple|^cassette^> (1985) by Deep Purple
* I<The Gate to the Mind's Eye|^cd^> (1994) by Thomas Dolby
* I<Eagles Live|^cd^> (1980) by Eagles
* I<Wild, Wild West|^lp^> extended mix (1988) by Escape Club
* I<"Vienna Calling"/"Tango the Night"|^ff^> (1985) by Falco
* I<Greatest Hits|^cd^> (1988) by Fleetwood Mac
* I<Purple Haze|^cassette^> (1987) by Jimi Hendrix
* I<Silent Flight: The New Age Christmas Experience|^cassette^> (1989) by John Hodian
* I<Cracked Rear View|^cd^> (1994) by Hootie and the Blowfish
* I<Rebel Yell|^cd^> (1983) by Billy Idol <!-- lp -->
* I<Rhythm Nation 1814|^cd^> (1989) by Janet Jackson
* I<pure and simple|^cassette^> (1994) by Joan Jett and the Blackhearts
* I<The Hits|^cd^> (2010) by Billy Joel
* I<Something About the Way You Look Tonight|^cd^> (1997) by Elton John
* I<World Machine|^lp^> (1985) by Level 42
* I<"Living in a Box"|^ff^> (1987) by Living in a Box
* I<Then and Now|^cd^> (1987) by Don McLean
* I<FLM|^cassette^> (1987) by Mel &amp; Kim
* I<Uh-Huh|^cassette^> (1983) by John Cougar Mellencamp
* I<"Pop Goes the World"/"The End of the World"|^ff^> (1987) by Men Without Hats
* I<Business as Usual|^cd^> (1981) by Men at Work
* I<Primitive Love|^cd^> (1985) by Miami Sound Machine
* I<The Other Side of Life|^lp^> (1986) by The Moody Blues
* I<Jagged Little Pill|^cd^> (1995) by Alanis Morissette
* I<Decade of Decadence|^cd^> (1991) by Motley Crue
* I<"True Faith"/"1963"|^ff^> (1987) by New Order
* I<Aldo Nova|^cassette^> (1981) by Aldo Nova
* I<Cat Scratch Fever|^cassette^> (1977) by Ted Nugent
* I<Woman Thing Music, Vol. 2|^cd^> (0000) by Pauley P
* I<Here You Come Again|^cassette^> (1977) by Dolly Parton
* I<You're Gonna Get It|^cassette^> (1978) by Tom Petty
* I<The Hits|^cd^> (1988) by REO Speedwagon
* I<Icon|^cd^> (2012) by Lionel Richie
* I<Icon|^cd^> (2013) by Simple Minds
* I<Tao|^lp^> (1985) by Rick Springfield
* I<"Hourglass"/"Wedding Bells"|^ff^> (1987) by Squeeze
* I<Fly Like an Eagle|^cassette^> (1976) by Steve Miller Band
* I<Christmas Strait to You|^cassette^> (1986) by George Strait
* I<Kilroy Was Here|^cd^> (1983) by Styx
* I<Eye of the Tiger|^lp^> (1982) by Survivor
* I<Toto IV|^lp^> (1982) by Toto
* I<Come Out and Play|^cassette^> (1985) by Twisted Sister
* I<Rattle and Hum|^cd^> (1988) by U2
* I<A Fifth of Beethoven|^lp^> (1976) by The Walter Murphy Band
* I<Everybody Wang Chung Tonight: Wang Chung's Greatest Hits|^cd^> (1997) by Wang Chung
* I<Magnetic Heaven|^lp^> (1986) by Wax
* I<Wilson Phillips|^cd^> (1990) by Wilson Phillips
* I<Ten|^cd^> (1990) by Y &amp; T
* I<Greatest Hits|^cd^> (1992) by ZZ Top
4 The Beatles and solo
* I<Meet the Beatles|^lp^> (1964)
* I<Cloud Nine|^lp^> (1987) by George Harrison
4 Bon Jovi +
* I<Slippery When Wet|^cd^> (1986)
* I<Keep the Faith|^cd^> (1992)
4 Chicago|Chicago (band) +
* I<Chicago 16|^lp^> (1982)
* I<Live in Toronto|^cassette^> (1984)
4 Culture Club +
* I<Kissing to be Clever|^cd^> (1982)
* I<"The War Song"/"La Cancion De Guerra"|^ff^> (1984)
* I<Best of Culture Club|^cd^> (1994)
4 Def Leppard +
* I<High N' Dry|^cassette^> (1981)
* I<Hysteria|^cd^> (1987)
4 Depeche Mode +
* I<101|^cd^> (1989)
* I<Songs of Faith and Devotion|^cd^> (1993)
4 Duran Duran, Arcadia, and The Power Station
* I<Duran Duran|^cd^> (1981) <!-- & cassette -->
* I<Rio|^cd^> (1982) <!-- & cassette -->
* I<Seven and the Ragged Tiger|^cd^> (1983) <!-- & lp -->
* I<Arena|^lp^> (1984)
* I<Wild Boys|^lp^> extended mix (1984)
* I<Rio|^lp^> extended mix (1985)
* I<The Power Station|^lp^> (1985) by The Power Station
* I<So Red the Rose|^lp^> (1985) by Arcadia
* I<Notorious|^lp^> (1986)
* I<Notorious|^lp^> extended mix (1986)
* I<Skin Trade|^lp^> extended mix (1987)
* I<The Presidential Suite|^lp^> extended mix (1987)
* I<Big Thing|^cassette^> (1988)
* I<Decade|^cd^> (1989)
* I<Duran Duran|^cd^> (1993)
* I<Greatest|^cd^> (1998)
* I<Astronaut|^cd^> (2004)
4 Enya +
* I<Watermark|^cd^> (1988)
* I<Shepherd Moons|^cd^> (1991)
* I<The Celts|^cd^> (1992)
* I<The Memory of Trees|^cd^> (1995)
4 Genesis and Phil Collins
* I<We Can't Dance|^cd^> (1991)
* I<The Way We Walk, Volume One: The Shorts|^cd^> (1992)
* I<...Hits|^cd^> (1998) by Phil Collins 
4 Hall & Oates +
* I<Private Eyes|^lp^> (1981)
* I<H2O|^lp^> (1982)
* I<Rock &amp; Soul|^lp^> (1983)
* I<Big Bam Boom|^lp^> (1984)
* I<The Very Best of Daryl Hall &amp; John Oates|^cd^> (2001)
4 Heart|Heart (band) +
* I<Heart|^cd^> (1985)
* I<Bad Animals|^cd^> (1987)
4 INXS +
* I<"Devil Inside"/"On the Rocks"|^ff^> (1987)
* I<Kick|^cd^> (1987)
* I<"Need You Tonight"/"I'm Coming"|^ff^> (1987)
* I<"New Sensation"/"Guns in the Sky"|^ff^> (1987)
4 Loverboy +
* I<Loverboy|^cassette^> (1980)
* I<Keep It Up|^lp^> (1983)
4 Madonna|Madonna (entertainer) +
* I<True Blue|^cd^> (1986)
* I<"Causing a Commotion"/"Jimmy, Jimmy"|^ff^> (1987)
* I<Like a Prayer|^cd^> (1989)
4 Reba McEntire +
* I<Merry Christmas to You|^cassette^> (1987)
* I<Read My Mind|^cd^> (1994)
4 Meat Loaf +
* I<Bat Out of Hell|^cd^> (1977)
* I<Bat out of Hell II|^cd^> (1993)
4 Olivia Newton-John +
* I<Physical|^cd^> (1981) <!-- lp -->
* I<Soul Kiss|^cassette^> (1985)
* I<Gold|^cd^> (2005)
4 Pet Shop Boys +
* I<"Always on My Mind"/"Do I Have To?"|^ff^> (1987)
* I<"It's a Sin"/"You Know Where You Went Wrong"|^ff^> (1987)
* I<"What Have I Done To Deserve This?"/"A New Life"|^ff^> (1987) <!-- x2 -->
4 The Police and Sting
* I<The Dream of the Blue Turtles|^cassette^> (1985)
* I<…Nothing Like the Sun|^cassette^> (1987)
* I<The Very Best of Sting &amp; The Police|^cd^> (1997)
4 Prince & The Revolution
* I<1999|^cd^> (1982)
* I<Purple Rain|^cd^> (1984)
* I<"Purple Rain"/"God"|^ff^> (1984)
* I<"Mountains"/"Alexa De Paris"|^ff^> (1986)
* I<Batman|^cd^> (1989)
4 Queen|Queen (band) +
* I<Live Killers|^cd^> (1979)
* I<Flash Gordon|^cd^> (1980)
* I<Greatest Hits|^cd^> (1981)
* I<Hot Space|^cassette^> (1982)
* I<A Kind of Magic|^cd^> (1986)
* I<Classic Queen|^cd^> (1992)
* I<Highlander: The Immortal Edition|^cd^> (2002)
4 Simply Red +
* I<a new flame|^cd^> (1989)
* I<Blue|^cd^> (1998)
4 various
* I<The 80s Greatest Hits*Arena Rock|^cd^> (1992)
* I<Blast Off|^lp^> (0000)
* I<A Christmas Music Festival|^cassette^> (1970)
* I<Christmas Rock|^cassette^> (1988)
* I<A Classical Christmas|^cassette^> (1993)
* I<I'm Dreaming of a White Christmas|^cassette^> (1990)
* I<Joy to the World|^cassette^> (1990)
* I<Santa Claus is Coming to Town|^cassette^> (1989)
* I<Sing Along Family Christmas|^cassette^> (1993)
* I<Totally '80s|^cassette^> (0000)
* I<Ultimate Collection #1 Hits of the '80s|^cd^> (1996)
* I<A Very Special Christmas|^cd^> (1987)
* I<A Very Special Christmas 2|^cd^> (1992)
* I<A Very Special Christmas 3|^cd^> (1997)
* I<Waveforms|^cd^> (0000)
* I<Z104 FM Hot Hits Album|^lp^> (0000)
3 Musicians and bands I like
These artists are musicians and bands I like including soundtrack composers.
& musicians
2 Comedy
3 My comedy collection
* I<You Might Be a Redneck If…|^cd^> (1993) by Jeff Foxworthy
4 Bill Cosby +
* I<Bill Cosby is a Very Funny Fellow, RIGHT!|^cd^> (1963)
* I<"I Started Out as a Child"|^cd^> (1964)
* I<Wonderfulness|^cd^> (1966)
* I<It's True, It's True!|^cd^> (1969)
3 Comedians I like
& comedians
