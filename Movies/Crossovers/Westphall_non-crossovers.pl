#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(anchor img);

my @small_images = ('Mary Tyler Moore', 'Burkes Law', 'The Lone Ranger', 'Columbo', 'Dragnet', 'legend');
my @images = ('All in the Families', 'Hawaii Five', 'The Man from UNCLE', @small_images);
my $doc_magic;
for my $titie (@images) {
  (my $image = $titie ) =~ s/ /_/g;
  my $link = "../../files/images/Movies/Crossovers/$image.png";
  $doc_magic->{$titie} = sub { print anchor( img({ 'src' => $link, 'alt' => $titie, 'style' => grep(/$titie/, @small_images) ? 'float:right' : undef }), { 'href' => $link, 'target' => 'new', 'class' => 'inline' }) };
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
All of these crossovers are part of the Tommy Westphall Universe. Some crossover enthusiasts have created crossovers where it does not make much sense. Here are those I consider non-crosses, however there may still be crossovers in these non-crosses.
2 Drag a big net
& Dragnet
by NBC and ABC
I<Dragnet> spun off a film of the same name in 1954, I<Dragnet 1967>, I<Dragnet 1966>, I<Dragnet> (1987), I<The New Dragnet>, and I<Dragnet> (2003) which was renamed I<L.A. Dragnet>.
The character Jim Reed from I<Dragnet 1967> Q<The Phony Police Racket> and Q<The Big Search> went on to appear as a regular on I<Adam-12>. Once on I<Adam-12>, he and Pete Malloy appeared on I<Dragnet 1967> Q<Internal Affairs: DR-20> and I<Emergency!> Q<Emergency!>. I<Adam-12> Q<The Radical> concludes on I<The D.A.> Q<People vs. Saydo>. I<Adam-12> spun off I<The New Adam-12>.
I<The D.A.> is a spin off of two television films: I<The D.A.: Murder One> and I<The D.A.: Conspiracy to Kill>.
John Gage and Roy DeSoto from I<Emergency!> appeared on I<Adam-12> Q<Lost and Found> and I<Sierra> Q<The Urban Rangers>. I<Emergency!> spun off six television films. I<Emergency!> Q<Girl on the Balance Beam> has an unconfirmed crossover with several series from an appearance or mention of A<Trans Global Airlines|href="Big_fake_companies#Trans_Global_Airlines">.
Either station or squad 51 from I<Emergency!> appeared on I<CHiPs> Q<Cry Wolf>, Q<MAIT Team>, and Q<Hot Wheels>. I<CHiPs> spun off I<CHiPs '99>.
2 The Man from U.N.C.L.E. Gets Smart
from ABC, NBC, CBS, and FOX
On I<A<The Man from U.N.C.L.E.|href="../Movies_by_series.pl?series=U.N.C.L.E.#The_Man_from_U.N.C.L.E._1964">> Q<The Bow-Wow Affair>, the character Guido Panzini appeared. Guido Panzini would go on to appear on I<McHale's Navy> Q<McHale's Country Club Caper> and I<One Day at a Time> Q<Panzini>.
I<McHale's Navy> spun off I<Broadside> and had two theatrical films with the main cast and one theatrical film with Quinton McHale's son Quinton McHale, Jr.
I<The Man from U.N.C.L.E.> spun off I<A<The Girl from U.N.C.L.E.|href="../Movies_by_series.pl?series=U.N.C.L.E.#The_Girl_from_U.N.C.L.E.">> There were eight theatrical films released which were made using episodes from the series. The last theatrical film I<A<The Return of the Man from U.N.C.L.E.|href="../Movies_by_series.pl?series=U.N.C.L.E.#The_Return_of_the_Man_from_U.N.C.L.E.">> was new.
I<The Man from U.N.C.L.E.> characters Napoleon Solo and Illya Kuryakin appear on I<Please Don't Eat the Daisies> Q<Say UNCLE>. I<The Girl from U.N.C.L.E.> character April Dancer appeared on I<Please Don't Eat the Daisies> Q<Remember Lake Serene?>
I<A<Get Smart, Again!|href="../Movies_by_series.pl?series=Get+Smart+(1965)#Get_Smart_Again">>, the second film sequel to I<A<Get Smart|href="../Movies_by_series.pl?series=Get+Smart+(1965)">>, mentioned T.H.R.U.S.H., the evil organization from I<The Man from U.N.C.L.E.> I<The Nude Bomb> is the first film sequel to I<Get Smart>. I<Get Smart> also spun off another television series with the same name in 1995. SMALL<(A<I'm not home!|href="#Im_not_home">)>
The 2008 I<A<Get Smart|href="../Movies_by_series.pl?series=Get+Smart+(2008)">> film and its spin off are not within the same continuity.
& The Man from UNCLE
2 All in the Families
from CBS, NBC, ABC, and UPN
I<All in the Family> resulted in a total of six other series. Edith Bunker's cousin, Maude Findlay received her own series, I<Maude>. The Bunker's neighbors, George and Louise Jefferson, spun off to their own show, I<The Jeffersons>. I<All in the Family> spun off I<Archie Bunker's Place>. Archie and Edith Bunker's daughter, Gloria divorced her husband and received her own series, I<Gloria>. The Bunker's house appeared with new occupants many years later in I<704 Hauser>.
Florida Evans of I<Maude> spun off to her own series, I<Good Times>. The series I<Hanging In> is considered a spin-off of I<Maude>, however its stories are not connected to this cosmology. Also, Barbara Rhoades played Maggie Gallagher on I<Hanging In> and Maggie Chandler on I<Soap>. Because Gallagher &ne; Chandler, there was B<no> crossover. I<Soap> spun off I<Benson>.
Florence Johnston of I<The Jefferson's> briefly had her own series, I<Checking In>. George Jefferson appeared on the pilot of I<E/R>. The Jeffersons appeared on the finale of I<The Fresh Prince of Bel-Air> along with Philip Drummond and Arnold Jackson-Drummond of I<Diff'rent Strokes>.
Hilary Banks of I<The Fresh Prince of Bel-Air> appeared on I<Out All Night> Q<The Great Pretender> and I<Blossom> Q<Wake Up Little Suzy>. Carlton and Ashley Banks, also from I<The Fresh Prince of Bel-Air>, appeared on I<In the House> Q<Dog Catchers>.
Mrs. Garrett of I<Diff'rent Strokes> spun off to I<The Facts of Life>. I<Diff'rent Strokes> and I<Hello, Larry> shared three crossover episodes Q<The Trip>, Q<Feudin' and Fussin'>, and Q<Thanksgiving Crossover> on both series. SMALL<(A<I'm not home!|href="#Im_not_home">)> Arnold Jackson-Drummond made an appearance on I<Silver Spoons> Q<The Great Computer Caper>.
If Greg Morris appeared on I<The Jeffersons> three-part Q<Mission Incredible> as his character Barney Collier from I<Mission: Impossible>, this continuity would cross with Q<A<Lucy's Diagnosis|href="Westphall_crossovers.pl#Lucys_Diagnosis">>.
& All in the Families
2 Hawaii Five-Oh-No!
from CBS
I<A<Hawaii 5-0|href="../Movies_by_series.pl?series=Hawaii+Five-0">> is a remake of I<A<Hawaii 5-O|href="../Movies_by_series.pl?series=Hawaii+Five-O">> and used footage from the original's episode "Wooden Model of a Rat" in the episode "Kalele". While Ed Asner reprised his character August March from the original in the remake, the back story is very different between the series.
& Hawaii Five
3 Magnum P.I.
from CBS
In I<Magnum P.I.> "Skin Deep", Thomas Magnum mentioned Steve McGarrett of I<A<Hawaii 5-O|href="../Movies_by_series.pl?series=Hawaii+Five-O">>. I<Magnum P.I.> Q<Ki'is Don't Lie> ends on I<Simon & Simon> Q<Emeralds Are Not a Girl's Best Friend>. I<Magnum P.I.> Q<Novel Connection> ends on I<Murder, She Wrote> Q<Magnum on Ice>.
I<Murder, She Wrote> spun off I<The Law & Harry McGraw>.
A.J. Simon from I<Simon & Simon> appeared on I<Whiz Kids> Q<Deadly Access>, then Richie and Irene Adler of I<Whiz Kids> appeared on I<Simon & Simon> Q<Fly the Alibi Skies>.
3 JAG and NCIS
from CBS, The CW, and NBC
I<A<JAG|href="../Movies_by_series.pl?series=JAG">> was on NBC for one season before moving to CBS. It has been severed from Westphall because it used stock footage of A<Oceanic Airlines|href="Big_fake_companies/Oceanic_Airlines#Stock_footage"> from the film I<Executive Decision> not the logo from I<Lost>.
Edward Sheffield from I<JAG> first appeared on I<A<First Monday|href="../Movies_by_series.pl?series=First+Monday">> in three episodes.
I<JAG> Q<Ice Queen> and Q<Meltdown> were the backdoor pilot for I<A<NCIS|href="../Movies_by_series.pl?series=NCIS#NCIS">>.
I<NCIS> two-part Q<Legend> was the backdoor pilot to I<A<NCIS: Los Angeles|href="../Movies_by_series.pl?series=NCIS#NCIS:_Los_Angeles">>. I<NCIS> two-part Q<Crescent City> was the backdoor pilot to I<A<NCIS: New Orleans|href="../Movies_by_series.pl?series=NCIS#NCIS:_New_Orleans">>.
Kensi Blye from I<NCIS: Los Angeles> appeared on I<Hawaii 5-0> "Ka Hakaka Maika'i". G. Callen and Sam Hannah from I<NCIS: Los Angeles> appeared on I<A<Hawaii 5-0|href="../Movies_by_series.pl?series=Hawaii+Five-0#season_02">> Q<Pa Make Loa> which concluded on I<NCIS: Los Angeles> Q<Touch of Death> with Daniel Williams and Chin Ho Kelly from I<Hawaii 5-0> appearing.
Hetty Lange from I<NCIS: Los Angeles> appeared on I<A<Scorpion|href="../Movies_by_series.pl?series=Scorpion#season_01">> Q<True Colors>.
Dominic Alonzo from I<A<Arrow|href="../Movies_by_series.pl?series=Arrowverse#Arrow">> Q<The Undertaking> was mentioned on I<Hawaii Five-0> Q<Ho'oilina>. I<Arrow> spun off I<A<The Flash|href="../Movies_by_series.pl?series=Arrowverse#The_Flash">> and I<A<Legends of Tomorrow|href="../Movies_by_series.pl?series=Arrowverse#Legends_of_Tomorrow">>. John Constantine from I<A<Constantine|href="../Movies_by_series.pl?series=Constantine+(2014)">> appeared on I<Arrow> Q<Haunted>. The titular character from I<The Flash> will appear on I<A<Supergirl|href="../Movies_by_series.pl?series=Supergirl+(2015)">> Q<World's Finest>.
2 No News for the Detectives
A A<crossover|href="http://tommywestphall.livejournal.com/25863.html"> between I<Columbo>, I<A<Wonder Woman|href="../Movies_by_series.pl?series=Wonder+Woman+(1975)">>, I<A<Matt Houston|href="../Movies_by_series.pl?series=Matt+Houston">>, I<A<Remington Steele|href="../Movies_by_series.pl?series=Remington+Steele">>, I<A<Moonlighting|href="../Movies_by_series.pl?series=Moonlighting">>, I<City of Angels>, I<Burke's Law> (1994), and I<24> for allegedly using the I<Los Angeles Tribune>, the fictional newspaper from I<Lou Grant>, was attempted. With the amount of networks involved and no discernible connections, I do not see this as a crossover.
3 Mary Tyler Moore
& Mary Tyler Moore
from CBS
I<The Mary Tyler Moore Show> spun off four series: I<Rhoda>, I<Phyllis>, I<Lou Grant>, and I<Mary and Rhoda>. SMALL<(A<I'm not home!|href="Im_not_home">)>
3 Columbo
& Columbo
from NBC and ABC
I<Columbo> spun off the non-contiguous I<Mrs. Columbo>. I<Mrs. Columbo> went through three name changes: I<Kate Columbo>, I<Kate the Detective>, and I<Kate Loves a Mystery>. 
3 Burke's Law
& Burkes Law
from ABC and CBS
I<Burke's Law> (1963) was renamed I<Amos Burke, Secret Agent> in season three. It spun off I<Burke's Law> (1994).
The titular character of I<Honey West> appeared on I<Burke's Law> (1963) Q<Who Killed the Jackpot?> and I<Burke's Law> (1994) Q<Who Killed Nick Hazard?>.
3 Moonlighting
from ABC
Max from I<A<Hart to Hart|href="../Movies_by_series.pl?series=Hart+to+Hart">> appeared on I<A<Moonlighting|href="../Movies_by_series.pl?series=Moonlighting">> Q<It's a Wonderful Job>. In the next I<Moonlighting> episode, Q<The Straight Poop>, Pierce Brosnan from I<Remington Steele> appeared as A<himself|href="index.pl#People_not_considered">.
2 Holy defenestration, Batman!
from ABC, NBC, and CBS
On I<A<Batman|href="../Movies_by_series.pl?series=Batman+(1966)">> many actors have stuck their heads out of a window while Batman and Robin were climbing a wall. In rare cases, a character would stick his head out of a window. These are not crossovers by my definition, though others include them.
When Bill Dana stuck his head out of a window, he appeared as A<himself|href="index.pl#People_not_considered"> not Jose Jimenez from I<The Bill Dana Show>. SMALL<(A<Lucy Makes Room for Daddy|href="Westphall_crossovers.pl#Lucy_Makes_Room_for_Daddy">)>
I<A<The Addams Family|href="../Movies_by_series.pl?series=The+Addams+Family+(1964)">> was canceled several months prior to Lurch sticking his head out of a window on I<Batman>.
I<Batman> was set in the 60s, so when Colonel Klink from the World War II era's I<Hogan's Heroes> stuck his head out of a window, he was very out of date. SMALL<(A<Hooterville|href="Westphall_crossovers.pl#Hooterville">)>
& The Lone Ranger
A crossover did not happen when I<A<The Green Hornet|href="../Movies_by_series.pl?series=The+Green+Hornet+(1966)">> and Kato stuck their heads out of a window in season two of I<Batman>. Near the end of season two, there was a crossover when I<The Green Hornet> and Kato appeared on the I<Batman> episodes Q<A Piece of the Action> and Q<Batman's Satisfaction>. I<The Green Hornet> is a nephew of I<The Lone Ranger> in their respective radio shows. The radio shows were by the same company and then made into television series by the same people, so their crossover works.
2 I'm not home!
Many series have been linked because of the series I<Hi Honey, I'm Home!>. I<Hi Honey, I'm Home!> takes the characters out of their original continuities and places them into another. Since they are outside their original continuity, they are not the same characters. So the following do I<not> cross with each other or anything above.
* I<A<Adventures of Superman|href="../Movies_by_series.pl?series=Adventures+of+Superman">>
* I<The Donna Reed Show> or I<Dennis The Menace> though they did cross.
* I<The Many Loves of Dobie Gillis>
* I<Hazel>
* I<The Munsters> and its spin-offs
* I<My Mother the Car>
* I<Get Smart> SMALL<(A<The Man from U.N.C.L.E. Gets Smart|href="#The_Man_from_U.N.C.L.E._Gets_Smart">)>
* I<The Mary Tyler Moore Show> SMALL<(A<Mary Tyler Moore|href="#Mary_Tyler_Moore">)>
* I<Hello, Larry> SMALL<(A<All in the Families|href="#All_in_the_Families">)>
* I<The Cosby Show> and its spin-off I<A Different World>
* All the following, while not contiguous with the above, are contiguous with each other starting with I<A<I Love Lucy|href="Westphall_crossovers.pl">>.
** I<The Dick Van Dyke Show> and I<Gomer Pyle, U.S.M.C.> SMALL<(A<Lucy Makes Room for Daddy|href="Westphall_crossovers.pl#Lucy_Makes_Room_for_Daddy">)>
** I<The Honeymooners> and I<The Lucy Show> SMALL<(A<Lucy's Diagnosis|href="Westphall_crossovers.pl#Lucys_Diagnosis">)>
** I<Leave it to Beaver> SMALL<(A<Leave It to Beaver to cross over|href="Westphall_crossovers.pl#Leave_It_to_Beaver_to_cross_over">)>
** I<Mister Ed> and I<The Brady Bunch> SMALL<(A<Hooterville|href="Westphall_crossovers.pl#Hooterville">)>
2 Legend
& legend
Series with two or more colors were on multiple networks. The main color is the series last network.
