#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../../files/lib';
use Base::Page qw(page story);
use Util::Crossover::LineMagic qw(crossover_magic);

my $magic = crossover_magic( big => ['Westphall'], dots => '../../..' );
page( 'code' => sub { story(*DATA, { 'doc magic' => $magic, 'line magic' => $magic }) });

__DATA__
Four series crossed into ^St. Elsewhere^, the home of Tommy Westphall: I<^M*A*S*H (1972)^>, I<The White Shadow>, I<The Bob Newhart Show>, and I<Cheers>.
& Arriving to Westphall
>0 STRONG<Notes:>
*| note two
* A &#9660; goes to another section on this page.
* A &#9650; goes to the top page and a specific rule.
* A &#9664; goes to another crossover page.
* A &#9654; goes to a page off of this site.
2 No cross with <i>Julia</i>
A crossover between I<^St. Elsewhere^> and I<Julia> was attempted, however, the Dr. Morton Chegley characters were played by two different actors with an almost fifty year age difference so there was B<NO> cross.
2 <i>M*A*S*H</i>
from CBS
Dr. B. J. Hunnicut from I<^M*A*S*H (1972)^> was mentioned by Dr. Mark Craig on I<^St. Elsewhere^> Q<Santa Claus Is Dead>.
I<M*A*S*H> is a non-contiguous spin-off of the film I<^MASH^>. The film also spun off I<Trapper John, M.D.> that is also non-contiguous with the film.
I<M*A*S*H> spun off I<AfterMASH>, I<W*A*L*T*E*R>, and I<The Fighting Nightinggales>.
2 <i>The White Shadow</i>
from CBS and FOX
Warren Coolidge from I<The White Shadow> appeared in over twenty episodes of I<^St. Elsewhere^>. After joining I<St. Elsewhere>, he appeared in I<Method & Red> Q<Da Shootout>.A<&#9664;|href="Departing_from_Westphall.pl" title="Departing from Westphall">
2 <i>The Bob Newhart Show</i>
from CBS, ABC, and NBC
Elliot Carlin from I<The Bob Newhart Show> appeared in I<^St. Elsewhere^> Q<Close Encounters>. He then appeared in I<Newhart> Q<I Married Dick> where he met Dick Louden. The last scene of I<Newhart> Q<The Last Newhart> revealed Dr. Robert Hartley from I<The Bob Newhart Show> dreamt I<Newhart>. The connections from I<Newhart> could be considered Robert Hartley's dream within Tommy Westphall's fantasy.
Larry, Darryl, and Darryl from I<Newhart> appeared in I<Coach> Q<Leaving Orlando> parts two and three. I<Coach> was part of the A<Viva Las Vegas|href="#Viva_Las_Vegas" title="Viva Las Vegas"> event that included crossovers with three other series.
Jerry Robinson from I<The Bob Newhart Show> appeared in I<Bob> Q<Better To Have Loved And Flossed>.
Carol Bondurant and Robert Hartley from I<The Bob Newhart Show> appeared in I<Murphy Brown> Q<Anything But Cured>. I<Murphy Brown> was part of a crossover event centered around A<Liz Taylor's lost black pearls|href="Liz_Taylor"> that crossed three more series.
During a discussion about the dream with Howard Borden on I<The Bob Newhart Show: The 19th Anniversary Special>, Howard mentioned he dreamt he was Roger Healey from I<I Dream of Jeannie>.
3 Viva Las Vegas
from ABC
I<Grace Under Fire> Q<Vegas>, I<Coach> Q<Viva Las Ratings>, I<The Drew Carey Show> Q<Drew Gets Married> A<&#9660;|href="#The_Drew_Carey_Show" title="The Drew Carey Show">, and I<Ellen> Q<Secrets & Ellen> had characters in Las Vegas on the same night with the following crossover characters.
* Luther Horatio Van Dam from I<Coach> and Drew Carey from I<The Drew Carey Show> appeared in I<Grace Under Fire> Q<Vegas>.
* Drew Carey and Mimi from I<The Drew Carey Show> and Paige Clark and Spence Kovak from I<Ellen> appeared in I<Coach> Q<Viva Las Ratings>.
* Grace Kelly from I<Grace Under Fire>, Luther Horatio Van Dam from I<Coach>, Paige Clark and Spence Kovak from I<Ellen> appeared in I<The Drew Carey Show> Q<Drew Gets Married>.
* Grace Kelly from I<Grace Under Fire> and Drew Carey from I<The Drew Carey Show> appeared in I<Ellen> Q<Secrets & Ellen>.
3 Ellen's friends
from ABC and ITV
I<These Friends Of Mine> was renamed to I<Ellen>.
Mr. Roper from I<Three's Company> appeared in I<Ellen> Q<Roommates>. I<Three's Company> spun off I<The Ropers> and I<Three's A Crowd>. I<Three's Company> is a non-contiguous spin-off of I<Man About the House> which has two spin-offs, I<George and Mildred> and I<Robin's Nest>.
3 The Drew Carey Show
from ABC, NBC, CBS, TNT, and UPN
Detective James Martinez from I<NYPD Blue> appeared in I<The Drew Carey Show> Q<New York and Queens>. Buck Naked from I<Hill Street Blues>, which had one spin-off I<Beverly Hills Buntz>, appeared in several episodes of I<NYPD Blue>. Lt. Howard Hunter from I<Hill Street Blues> appeared in I<Cop Rock> Q<Cop-a-Felliac>; Victor Sifuentes and Abby Perkins from I<^L.A. Law^> appeared in I<Cop Rock> Q<Potts Don't Fail Me Now>. Eli Levinson and Denise Iannello from I<Civil Wars> were also on I<L.A. Law>. John Irvin from I<NYPD Blue> appeared in I<Public Morals>.
I<The Drew Carey Show> Q<Up on the Roof> has Drew Carey watching I<Tool Time> from I<Home Improvement>.
I<Home Improvement> spun off I<Buddies>. Brad Taylor from I<Home Improvement> appeared in I<Thunder Alley> Q<First Date>. Several characters from I<Home Improvement> appeared in I<Soul Man>: Tim Taylor on Q<Communion Wine and Convicts>, Al Borland on Q<Cinderella and the Funeral>, and Brad Taylor on Q<Public Embarrassment and Todd's First Sermon>. Revered Mike Weber from I<Soul Man> appeared in I<Home Improvement> Q<Losing My Religion>.
Mimi Bobeck Carey from I<The Drew Carey Show> appeared in I<Two Guys, a Girl and a Pizza Place>, retitled to I<Two Guys and a Girl>, Q<Two Guys, a Girl and a Psycho Halloween>; I<The Hughleys>Q<Young Guns>A<&#9660|href="#Sabrina_and_Steve" title="Sabrina and Steve">; and I<The Norm Show>, retitled to I<Norm>, Q<Norm vs. Schoolin'>.
Drew Carey appeared in I<The Geena Davis Show> Q<Momma Bear>.
2 <i>Cheers</i>
from NBC
Carla Tortelli, Norm Peterson, and Cliff Clavin from I<Cheers> appeared in I<^St. Elsewhere^> Q<Cheers>.
2 Key
& key
* Made for television films will have the color of the network.
* Series with two or more colors were on multiple networks. The main color is the series last network.
