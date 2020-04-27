#!/usr/bin/perl
# This is the Westphall index page
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../../files/lib';
use Base::Page     qw(page story);
use Util::Crossover::LineMagic qw(crossover_magic);

my $magic = crossover_magic( big => ['Westphall'], dots => '../../..' );
page(
  'heading' => 'Verified and Expanded Westphall crossovers',
  'code' => sub { story(*DATA, {
    'doc magic' => $magic,
    'line magic' => $magic
  }) }
);

__DATA__
These crossovers are part of the A<Tommy Westphall Universe|href="https://thetommywestphall.wordpress.com" target="new">. Tommy Westphall was a child on ^St. Elsewhere^ who had autism. In the series finale, it was implied that the entire series took place in his imagination.
Westphall does not include film crossovers, but I included them for completeness in some cases.
So far I connected A<Thomas Holbrook's|href="http://www.poobala.com/crossoverlistb.html#byreality" target="new"> groups 1, 2, 4, 6, 10, 12, 14 to 16, 18, 21, 24, 27, 29 to 34, and 38.
& Westphall
Click the image for a better view. The series are placed as close to chronological as possible and are closest to their strongest link.
>0 STRONG<Notes:>
*| note two
* A &#9660; goes to another section on this page.
* A &#9650; goes to the top page and a specific rule.
* A &#9664; goes to another crossover page.
* A &#9654; goes to a page off of this site.
2 Crossing to <i>St. Elsewhere</i>
Several series crossed into I<^St. Elsewhere^> while was running. Those series were I<Trapper John, M.D.>, I<The White Shadow>, I<The Bob Newhart Show>, and I<Cheers>.
Elliot Carlin from I<The Bob Newhart Show>A<&#9660;|href="#The_Bob_Newhart_Show" title="The Bob Newhart Show"> appeared in I<St. Elsewhere> Q<Close Encounters>.
Carla Tortelli, Norm Peterson, and Cliff Clavin from I<Cheers>A<&#9660|href="#Mad_About_Friends_Cheers" title="Mad About Friends, Cheers!"> appeared in I<St. Elsewhere> Q<Cheers>.
2 The Bob Newhart Show
from CBS and NBC
Elliot Carlin from I<The Bob Newhart Show> appeared in I<Newhart> Q<I Married Dick> where he met Dick Louden. Larry, Darryl, and Darryl from I<Newhart> appeared in I<Coach> Q<Leaving Orlando> parts two and three.A<&#9660|href="#Viva_Las_Vegas" title="Viva Las Vegas">
Jerry Robinson from I<The Bob Newhart Show> appeared in I<Bob> Q<Better To Have Loved And Flossed>.
Carol Bondurant from I<The Bob Newhart Show> appeared in I<Murphy Brown> Q<Anything But Cured>.A<&#9660|href="#Murphy_Brown" title="Murphy Brown">
The last scene of I<The Bob Newhart 19th Anniversary Special> revealed Dr. Robert Hartley from I<The Bob Newhart Show> dreamt I<Newhart>. During a discussion about the dream with Howard Borden on I<The Bob Newhart Show 19th Anniversary>, Howard mentioned he dreamt he was Roger Healey from I<I Dream Of Jeannie>.
I<The Bob Newhart Show> came into this continuity through I<St. Elsewhere>, which is implied to be all in the mind of Tommy Westphall. The connections from I<The Bob Newhart Show> could be considered a dream within a fantasy.
3 Viva Las Vegas
from ABC and ITV
I<Grace Under Fire> Q<Vegas>, I<Coach> Q<Viva Las Ratings>, I<The Drew Carey Show> Q<Drew Gets Married> A<&#9660;|href="#The_Drew_Carey_Show" title="The Drew Carey Show">, and I<Ellen> Q<Secrets & Ellen> had characters in Las Vegas on the same night with the following crossover characters.
* Luther Horatio Van Dam from I<Coach> and Drew Carey from I<The Drew Carey Show> appeared in I<Grace Under Fire> Q<Vegas>.
* Drew Carey and Mimi from I<The Drew Carey Show> and Paige Clark and Spence Kovak from I<Ellen> appeared in I<Coach> Q<Viva Las Ratings>.
* Grace Kelly from I<Grace Under Fire>, Luther Horatio Van Dam from I<Coach>, Paige Clark and Spence Kovak from I<Ellen> appeared in I<The Drew Carey Show> Q<Drew Gets Married>.
* Grace Kelly from I<Grace Under Fire> and Drew Carey from I<The Drew Carey Show> appeared in I<Ellen> Q<Secrets & Ellen>.
3 Ellen's friends
I<These Friends Of Mine> was renamed to I<Ellen>.
Mr. Roper from I<Three's Company> appeared in I<Ellen> Q<Roommates>. I<Three's Company> spun off I<The Ropers> and I<Three's A Crowd>. I<Three's Company> is a non-contiguous spin-off of I<Man About the House> which has two spin-offs, I<George and Mildred> and I<Robin's Nest>.
3 The Drew Carey Show
from ABC, NBC, CBS, TNT, and UPN
Detective James Martinez from I<NYPD Blue> appeared in I<The Drew Carey Show> Q<New York and Queens>. Buck Naked from I<Hill Street Blues>, which had one spin-off I<Beverly Hills Buntz>, appeared in several episodes of I<NYPD Blue>. Lt. Howard Hunter from I<Hill Street Blues> appeared in I<Cop Rock> Q<Cop-a-Felliac>; Victor Sifuentes and Abby Perkins from I<^L.A. Law^> appeared in I<Cop Rock> Q<Potts Don't Fail Me Now>. Eli Levinson and Denise Iannello from I<Civil Wars> were also on I<L.A. Law>. John Irvin from I<NYPD Blue> appeared in I<Public Morals>.
I<The Drew Carey Show> Q<Up on the Roof> has Drew Carey watching I<Tool Time> from I<Home Improvement>.
I<Home Improvement> spun off I<Buddies>. Brad Taylor from I<Home Improvement> appeared in I<Thunder Alley> Q<First Date>. Several characters from I<Home Improvement> appeared in I<Soul Man>: Tim Taylor on Q<Communion Wine and Convicts>, Al Borland on Q<Cinderella and the Funeral>, and Brad Taylor on Q<Public Embarrassment and Todd's First Sermon>. Revered Mike Weber from I<Soul Man> appeared in I<Home Improvement> Q<Losing My Religion>.
Mimi Bobeck Carey from I<The Drew Carey Show> appeared in I<Two Guys, a Girl and a Pizza Place>, retitled to I<Two Guys and a Girl>, Q<Two Guys, a Girl and a Psycho Halloween>; I<The Hughleys>Q<Young Guns>A<&#9660|href="#Sabrina_and_Steve" title="Sabrina and Steve">; and I<The Norm Show>, retitled to I<Norm>, Q<Norm vs. Schoolin'>.
Drew Carey appeared in I<The Geena Davis Show> Q<Momma Bear>.
3 Sabrina and Steve
from ABC, UPN/CW, BET, NBC, CBS, Nick at Nite, and Netflix
On the same night, Maya Wilkes from I<Girlfriends> appeared in I<Moesha> Q<That's My Mama>, Darryl Hughley from I<The Hughleys> appeared in I<The Parkers> Q<Who's Your Mama?>, Nikki Parker from I<The Parkers> appeared in I<The Hughleys> Q<Forty Acres and a Fool>, and Niecy Jackson from I<Moesha> appeared in I<Girlfriends> Q<Old Dog>. I<The Parkers> is a spin-off of I<Moesha>. I<Girlfriends> spun off I<The Game>. Hakeem Campbell and Niecy Jackson from I<Moesha> appeared in I<Clueless> Q<Prom Misses, Prom Misses>.
Sabrina Spellman from I<Sabrina, the Teenage Witch> appeared in I<Clueless> Q<Mr. Wright>, I<Boy Meets World> Q<The Witches of Pennbrook> and Q<No Guts, No Cory>, I<Teen Angel> Q<One Dog Night>, and I<You Wish> Q<Genie Without a Cause>.
Dana Foster from I<Step by Step> met Cory on I<Boy Meets World> Q<The Happiest Show On Earth>. I<Boy Meets World> spun off I<Girl Meets World>.A<&#9660;|href="#Disney_Channel_Live-Action_Universe" title="Disney Channel Live-Action Universe">
Steve Urkel from I<Family Matters>, a spin-off of I<Perfect Strangers>, appeared in I<Full House> Q<Ol' Brown Eyes> and Q<Stephanie Gets Framed>; I<Step by Step> Q<The Dance> and Q<A Star Is Born>; I<Meego> Q<Love and Money> and Q<The Truth About Cars and Dogs>.
Michelle Tanner of I<Full House> appeared in I<Hangin' With Mr. Cooper> Q<Hangin' with Michelle>.
I<Full House> spun off I<Fuller House>.
I<Meego> Q<Mommy 'n' Meego>, an unaired episode, crossed with I<Gilligan's Island>. I<Gilligan's Island> spun off three made-for-television films.
3 Happy Days
I<Perfect Strangers> Q<Games People Play> mentioned Cunningham Hardware in Milwalkee, WI from I<Happy Days>.
I<Happy Days> spun offs I<Laverne & Shirley>, I<Blansky's Beauties>, I<Mork & Mindy>, I<Out of the Blue>, and I<Joanie Loves Chachi>. I<Happy Days> spun-off from an episode of the anthology series I<Love, American Style>. I<Love, American Style> had one spin-off I<The New Love, American Style>.
Andrew 'Squiggy' Squiggman from I<Laverne & Shirley> appeared in I<Scary Movie>. I<Scary Movie> spun off four more films.
Marion Cunningham from I<Happy Days>, Carol Brady from I<The Brady Bunch>A<&#9660;|href="#The_Love_Boat" title="The Love Boat">, Elyse Keaton from I<Family Ties>A<&#9660;|href="#Leave_It_to_Beaver_to_cross_over" title="Leave It to Beaver to cross over">, Vanessa Huxtable from I<The Cosby Show>, and Lisa Landry from I<Sister, Sister> appeared in I<Instant Mom> Q<Not Your Mother's Day>.
I<The Cosby Show> spun off I<A Different World>
3 Disney Channel Live-Action Universe
from NBC and the Disney Channel
I<Good Morning, Miss Bliss> was sold to NBC and retitled to I<Saved by the Bell>. I<Saved by the Bell> spun-off I<Saved by the Bell: The New Class> and I<Saved by the Bell: The College Years>. Years later, I<That's So Raven> was set in the same high school.
I<That's So Raven> spun off I<Cory in the House> and I<Raven's Home>.
President Richard Martinez from I<Cory in the House> appeared in I<Hannah Montana> Q<Take This Job and Love It>.
Zack and Cody Martin and Marion Moseby from I<The Suite Life on Deck> appeared in I<I'm in the Band> Q<Weasels on Deck>.
Austin Moon, Ally Dawson, Trish de la Rosa, and Dez Wade from I<Austin & Ally> appeared in I<Jessie> Q<Nanny in Miami>.
Jessie Prescott and the Rosses from I<Jessie> appeared in I<Austin & Ally> Q<Big Dreams & Big Apples>. Jessie also appeared in I<Good Luck Charlie> Q<Good Luck Jessie: NYC Christmas>.
Joey and Parker Rooney from I<Liv and Maddie> appeared in I<Jessie> Q<Jessie's Aloha Holidays with Parker and Joey>.
Marion Moseby from I<The Suite Life on Deck> appeared in I<Jessie> Q<Karate Kid-tastrophe>.
I<The Suite Life of Zack & Cody> spun off I<The Suite Life on Deck> and I<The Suite Life Movie>.
I<Hannah Montana> spun off I<Hannah Montana: The Movie>.
I<Wizards of Waverly Place> spun off I<Wizards of Waverly Place: The Movie> and I<The Wizards Return: Alex vs. Alex>.
4 That's So Suite Life of Hannah Montana
Zack and Cody Martin and Marion Moseby from I<The Suite Life of Zack & Cody> appeared in I<That's So Raven> Q<Checkin' Out>. Raven Baxter from I<That's So Raven> and Hannah Montana from I<Hannah Montana> appeared in I<The Suite Life of Zack and Cody> Q<That's So Suite Life of Hannah Montana>.
4 Wizards on Deck with Hannah Montana
Zack and Cody Martin, London Tipton, Bailey Pickett, and Marion Moseby from I<The Suite Life on Deck> appeared in I<Wizards of Waverly Place> Q<Cast-Away (to Another Show)> and I<Hannah Montana> Q<Super(stitious) Girl>. Hannah Montana and Lola Luftnagle from I<Hannah Montana> appeared in I<The Suite Life on Deck> Q<Double-Crossed>.
4 Disney Channel's Monstober 2015
For Disney Channel's Monstober 2015, seven series participated in the event.
* Logan Watson and Delia Delfano from I<I Didn't Do It> appeared in I<Jessie> Q<The Ghostest with the Mostest>.
* Austin Moon and Ally Dawson from I<Austin & Ally> appeared in I<Girl Meets World> Q<Girl Meets World: Of Terror 2>.
* Trish de la Rosa and Dez Wade from I<Austin & Ally> appeared in I<I Didn't Do It> Q<The Bite Club>.
* Emma and Zuri Ross from I<Jessie> appeared in I<K.C. Undercover> Q<All Howls Eve>.
* Riley Matthews and Lucas Friar from I<Girl Meets World> appeared in I<Best Friends Whenever> Q<Cyd and Shelby's Haunted Escape>.
* Ernie and Judy Cooper from I<K.C. Undercover> appeared in I<Austin & Ally>.
* Cyd Ripley and Shelby Marcus from I<Best Friends Whenever> appeared in I<Liv and Maddie> Q<Haunt-A-Rooney>.
2 Murphy Brown
from CBS
Al Floss from I<The Famous Teddy Z> appeared in I<Murphy Brown> Q<And the Whiner Is>. The cast of I<Murphy Brown> were seen on television in I<Love & War> Q<A Nation Turns Its Lonely Eyes to You>. Murphy Brown from I<Muphy Brown> appeared in I<Ink> Q<Murphy's Law>.
Meg Tynan from I<Love & War> appeared in I<Double Rush> Q<Comings and Goings>. Jack Stein from I<Love & War> appeared in three episodes of I<Ink>.
Liz Taylor's lost black pearls led to a crossover between I<The Nanny> Q<Where's the Pearls?>, I<Can't Hurry Love> Q<The Elizabeth Taylor Episode>, I<Murphy Brown> Q<Trick or Retreat>, and I<High Society> Q<The Family Jewels>.
Jim Dial of I<Murphy Brown> appeared in television in I<The Nanny> Q<The Tart with Heart>. Sylvia Fine from I<The Nanny> appeared in I<The Simple Life> Q<The Other Mother>.
Ray Barone of I<Everybody Loves Raymond> appeared in I<The Nanny> Q<The Reunion Show>. I<Everybody Loves Raymond> and I<The King Of Queens> had several crossovers.
Frank and Ray Barone from I<Everybody Loves Raymond> appeared in I<Cosby> Q<Lucas Raymondicus>.
Doug Heffernan appeared in I<Everybody Loves Raymond> Q<The Lone Barone> and I<Cosby> Q<Judgment Day> on the same night. Ray, Robert, and Frank Barone appeared on I<The Kings of Queens> Q<Road Rayge> too.
Ray Barone from I<Everybody Loves Raymond>, Doug Heffernan from I<The King Of Queens>, and Hilton Lucas from I<Cosby> appeared in I<Becker> Q<Drive, They Said>.
Isaac Washington from I<The Love Boat> appeared in I<King of Queens> Q<Taste Buds>.A<&#9660;|href="#The_Love_Boat" title="The Love Boat">
2 Charlie's Angels Love Boats
This section and The Love Boat are not Q<officially> part of the Westphall universe yet.
I<Charlie's Angels> spun off two films and a non-contiguous television series also named I<Charlie's Angels>. Dan Tanna from I<Vega$> appeared in I<Charlie's Angels> Q<Angels in Vegas>. The entire cast from I<The Love Boat> appeared in I<Charlie's Angels> Q<Love Boat Angels>.
3 The Love Boat
I<The Love Boat> spun off a reunion film called I<The Love Boat: A Valentine Voyage> and I<The Love Boat: The Next Wave>.
On 22 November 1980 I<Love Boat> Q<Secretary to the Stars> story continued on I<Fantasy Island> Q<The Love Doctor>. I<Fantasy Island> spun off I<Fantasy Island> (1998).
Betty and Margaret Anderson from I<Father Knows Best>; June, Wally, and Beaver Cleaver from I<Leave It to Beaver>A<&#9660;|href="#Leave_It_to_Beaver_to_cross_over" title="Leave It to Beaver to cross over">; and Mike and Carol Brady from I<The Brady Bunch>A<&#9660;|href="#Hooterville" title="Hooterville"> all appeared in the final episode of I<The Love Boat> Q<Who Killed Maxwell Thorn?>.
Julie McCoy, Doctor Adam Bricker (Doc), Isaac Washington, and Vicki Stubing from I<The Love Boat> appeared in I<Martin> Q<Goin' Overboard>.
3 Leave It to Beaver to cross over
from CBS, ABC, Disney Channel, FOX, NBC, and The WB
I<Leave It to Beaver> spun off I<Still the Beaver> which was renamed I<The New Leave It to Beaver>.A<&#9664;|href="Westphall_non-crossovers.pl#Im_not_home" title="I'm not home!"> Eddie Haskell from I<Leave it to Beaver> appeared in I<Parker Lewis Can't Lose> Q<Father Knows Less|id="PLCL_2_1">. Before Eddie Haskell's appearance, Bud Bundy of I<Married with Children> appeared in I<Parker Lewis Can't Lose> Q<Musso & Frank|id="PLCL_1_9">. After Eddie Haskell's appearance, Andrew Keaton of I<Family Ties> appeared in I<Parker Lewis Can't Lose> Q<Civil Wars|id="PLCL_2_17">.
I<Married with Children> spun off I<Top of the Heap> that spun off I<Vinnie & Bobby>. Marcy Rhoades D'Arcy from I<Married with Children> appeared in I<Nikki> Q<Technical Knockup>. Father Guido Sarducci appeared in I<Married with Children> Q<Requiem for a Dead Briard>.A<&#9660;|href="#Father_Guido_Sarducci" title="Father Guido Sarducci">
I<Family Ties> spun off I<The Art of Being Nick>. Steven and Andrew Keaton of I<Family Ties> appeared in I<Day by Day> Q<Trading Places>. Alex P. Keaton of I<Family Ties> was mentioned on I<Spin City> Q<Goodbye: Part 1>. Paul Lassiter from I<Spin City> appeared in I<Something So Right> Q<Something About the 'Men' in Menstruation>. I<Spin City> Q<Internal Affairs> ended with a segue into I<Sports Night>.
3 Hooterville and <i>The Brady Bunch</i>
from CBS and ABC
I<The Beverly Hillbillies>, I<Petticoat Junction>, and I<Green Acres> shared a large number of characters crossing over, most notably the character Sam Drucker who was a regular on I<Petticoat Junction> and I<Green Acres>. Granny Daisy Moses from I<The Beverly Hillbillies> appeared in I<Mister Ed> Q<Love and the Single Horse>.A<&#9664;|href="Westphall_non-crossovers.pl#Im_not_home" title="I'm not home!"> Colonel Hogan of I<Hogan's Heroes> was mentioned in I<Green Acres> Q<Wings Over Hooterville>.A<&#9664;|href="Westerns_in_Crisis.pl#Holy_defenestration_Batman" title="Holy defenestration, Batman!">
I<The Beverly Hillbillies> spun off I<The Return of the Beverly Hillbillies>. I<Green Acres> spun off I<Return to Green Acres>.
Hank Thackery, a minor character from I<Petticoat Junction>, may be the same Thackery on I<The Brady Bunch> Q<The Possible Dream>. I<The Brady Bunch> spun off I<The Brady Bunch Hour>, I<The Brady Girls Get Married>, I<The Brady Brides>, I<A Very Brady Christmas>, and I<The Bradys>.
3 Father Guido Sarducci
Father Guido Sarducci, played by Don Novello appeared first on I<Saturday Night Live>. He then appeared in I<Square Pegs> Q<Pac Man Fever>, I<^Tales of the City^>, I<Blossom> Q<Kiss and Tell>, I<^Casper^>, I<Married with Children> Q<Requiem for a Dead Briard>, and I<Unhappily Ever After> Q<Exorcising Jennie>.
4 Tales of the City
I<^Tales of the City^> spun off I<More Tales of the City> and I<Further Tales of the City>.
4 All in the Families
from CBS, NBC, ABC, and UPN
I<All in the Family> resulted in a total of six other series. Edith Bunker's cousin, Maude Findlay received her own series, I<Maude>. The Bunker's neighbors, George and Louise Jefferson, spun off to their own show, I<The Jeffersons>. I<All in the Family> spun off I<Archie Bunker's Place>. Archie and Edith Bunker's daughter, Gloria divorced her husband and received her own series, I<Gloria>. The Bunker's house appeared with new occupants many years later in I<704 Hauser>.
Florida Evans of I<Maude> spun off to her own series, I<Good Times>. The series I<Hanging In> is considered a spin-off of I<Maude>, however its stories are not connected to this continuity. Also, Barbara Rhoades played Maggie Gallagher on I<Hanging In> and Maggie Chandler on I<Soap>. Because Gallagher &ne; Chandler, there was B<no> crossover. I<Soap> spun off I<Benson>.
Florence Johnston of I<The Jefferson's> briefly had her own series, I<Checking In>. George Jefferson appeared in the pilot of I<E/R>. The Jeffersons appeared in the finale of I<The Fresh Prince of Bel-Air> along with Philip Drummond and Arnold Jackson-Drummond of I<Diff'rent Strokes>.
Hilary Banks of I<The Fresh Prince of Bel-Air> appeared in I<Out All Night> Q<The Great Pretender> and I<Blossom> Q<Wake Up Little Suzy>. Carlton and Ashley Banks, also from I<The Fresh Prince of Bel-Air>, appeared in I<In the House> Q<Dog Catchers>.
Mrs. Garrett of I<Diff'rent Strokes> spun off to I<The Facts of Life>. I<Diff'rent Strokes> and I<Hello, Larry> shared three crossover episodes Q<The Trip>, Q<Feudin' and Fussin'>, and Q<Thanksgiving Crossover> on both series.A<&#9664;|href="Westphall_non-crossovers.pl#Im_not_home" title="I'm not home!"> Arnold Jackson-Drummond made an appearance on I<Silver Spoons> Q<The Great Computer Caper>.
If Greg Morris appeared in I<The Jeffersons> three-part Q<Mission Incredible> as his character Barney Collier from I<Mission: Impossible>, this continuity would cross with Q<A<Lucy's Diagnosis|href="#Lucys_Diagnosis">>.
4 Ghostbuster meets Casper
Dr. Raymond Stantz, played by Dan Aykroyd, from I<^Ghostbusters^> also appeared in I<^Casper^>. I<Ghostbusters> spun off I<Ghostbusters II> and the non-contiguous I<Ghostbusters> (2016). I<Casper> spun off two prequels: I<Casper: A Spirited Beginning> and I<Casper Meets Wendy>.
2 Make Room for Daddy
Several characters from I<The Dick Van Dyke Show> appeared in other series.
* Maurice Sorrell appeared in I<The Danny Thomas Show> Q<TIME<The Woman Behind the Jokes|datetime="1963-10-21">>.
* Sally Rogers and Maurice Sorrell appeared in I<Herman's Head> Q<TIME<When Hairy Met Hermy|datetime="1993-10-07">>. SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)>
* Alan Brady appeared in I<Mad About You> Q<TIME<The Alan Brady Show|datetime="1995-02-16">>. SMALL<(A<Mad About Friends, Cheers!|href="#Mad_About_Friends_Cheers">)>
* Rob Petrie appeared in I<Diagnosis Murder> Q<TIME<Obsession: Part 2|datetime="1998-05-14">>.
A crossover between I<The Dick Van Dyke Show> and I<Richard Diamond, Private Detective> was attempted with Sam played by Mary Tyler Moore on I<Richard Diamond>. Mary Tyler Moore played Laura Petrie on I<The Dick Van Dyke Show> so there was B<NO> cross.
I<Make Room for Daddy> was renamed to I<The Danny Thomas Show>, and it spun off I<Make Room For Granddaddy>.
Danny Williams from I<Make Room for Daddy> appeared in I<The Joey Bishop Show> Q<This Is Your Life>.
José Jiménez appeared in eight episodes of I<Make Room for Daddy> before spinning off to his own series I<The Bill Dana Show>. SMALL<(A<Holy defenestration, Batman!|href="Westphall_non-crossovers.pl#Holy_defenestration_Batman">)>
Andy Taylor appeared in I<Make Room for Daddy> Q<Danny Meets Andy Griffith> which lead to the creation of I<The Andy Griffith Show>. I<The Andy Griffith Show> had three spin-offs: I<Gomer Pyle, U.S.M.C.> SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)>, I<Mayberry R.F.D.>, and I<The New Andy Griffith Show>.
Barney Fife from I<The Andy Griffith Show> appeared in I<The Joey Bishop Show> Q<Joey's Hideaway Cabin>. Howard Sprague from I<The Andy Griffith Show> appeared in I<It's Garry Shandling's Show> Q<The Day Howard Moved In>.
Pvt. Gomer Pyle from I<Gomer Pyle, U.S.M.C.> appeared in I<The Lucy Show> Q<Lucy Gets Caught Up in the Draft>. SMALL<(A<Lucy's Diagnosis|href="#Lucys_Diagnosis">)>
3 Here's Lucy
from CBS and NBC
Ralph Kramden from I<The Honeymooners> appeared in I<Here's Lucy> Q<Lucy Visits Jack Benny>. SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)>  I<The Jackie Gleason Show> turned Q<The Honeymooners> sketches into I<The Honeymooners> which returned to I<The Jackie Gleason Show> after being canceled.
Mary Jane Lewis from I<The Lucy Show> appeared in I<Here's Lucy> Q<A Date for Lucy> and recurs thereafter.
Bob Collins from I<The Bob Cummings Show> appeared in I<The George Burns and Gracie Allen Show> Q<A Marital Mix-Up> and I<Here's Lucy> Q<Lucy's Punctured Romance>. I<The Bob Cummings Show> spun off I<The New Bob Cummings Show> and aired in syndication as I<Love That Bob>.
Joe Mannix from I<Mannix> appeared in I<Here's Lucy> Q<Lucy and Mannix Are Held Hostage> and I<Diagnosis Murder> Q<Hard-Boiled Murder>.A<&#9660|href="#Diagnosing_Murder" title="Diagnosing Murder">
Lucy Carter from I<Here's Lucy> appeared in I<Make Room for Granddaddy> Q<Lucy and the Lecher>.A<&#9660|href="#Make_Room_for_Daddy" title="Make Room for Daddy">
3 Diagnosing Murder
from CBS, NBC, and ABC
After Joe Mannix from I<Mannix> appeared on I<Diagnosis Murder>, several other series crossed into it.
Cinnamon Carter from I<Mission: Impossible> appeared in I<Diagnosis Murder> Q<Discards>. I<Mission: Impossible> spun off I<Mission: Impossible> (1988).
Ben Matlock from I<Matlock> appeared in the two-part I<Diagnosis Murder> Q<Murder Two>.
I<Promised Land> Q<Total Security> concludes on I<Diagnosis Murder> Q<Promises to Keep>.
I<Diagnosis Murder> is a spin off of I<Jake and the Fatman>. I<Promised Land> is a spin off of I<Touched By an Angel>.
A<Etruscan horse Morley|href="Big_fake_companies/Morley.pl#Etruscan_horse"> cigarettes, originating on I<^Psycho^>, appeared in I<Naked City> Q<Tombstone for a Derelict>, I<Mission: Impossible> Q<Operation 'Heart'>, I<Mannix> Q<All Around the Money Tree>, I<Seinfeld> Q<The Invitations>, and I<Friends> Q<The One Where Rachel Smokes>. They are not the same as A<red box Morley brand|href="#Red_box_Morley">. SMALL<(A<Mad About Friends, Cheers!|href="#Mad_About_Friends_Cheers">)>
I<Diagnosis Murder> used stock footage of A<Oceanic Airlines|href="Big_fake_companies/Oceanic_Airlines#Stock_footage"> from the film I<Executive Decision> not the logo from I<Lost>. Crossovers with I<^JAG^> SMALL<(A<JAG and NCIS|href="JAG_and_NCIS">)> and I<War at Home> have been severed because they used the same stock footage.
3 Danny Thomas Makes Room for Lucy
from CBS, ABC, NBC, and Showtime
Danny Williams from I<The Danny Thomas Show> and the rest of the Williams family appeared in I<The Lucy-Desi Comedy Hour> Q<Lucy Makes Room for Danny>. Lucy and Ricky Ricardo appeared in I<The Danny Thomas Show> Q<Lucy Upsets the Williams Household>.
After I<I Love Lucy> was renamed to I<The Lucy-Desi Comedy Hour>, Susie McNamera from I<Private Secretary> appeared in the first episode Q<Lucy Takes a Cruise to Havana>.
Lucy Richardo from I<The Lucy-Desi Comedy Hour> appeared in I<The Ann Sothern Show> Q<The Lucy Story>.
B<No> crossover occurred when George Reeves from I<The Adventures of Superman> appeared in I<I Love Lucy> Q<Lucy and Superman> as himself. He stayed in character for the children in the audience. SMALL<(A<people not considered|href="index.pl#People_not_considered">)>
2 Mad About Friends, Cheers!
from NBC and ABC
Cosmo Kramer from I<Seinfeld> appeared in I<Mad About You> Q<The Apartment>.
On I<Mad About You> Q<Pandora's Box>, Jamie Buchman causes a blackout which was shared on I<Madman of the People> Q<Birthday in the Big House> and I<Friends> Q<The One with the Blackout>.
Jamie Buchman, Fran Devanow, and Urusla Buffay from I<Mad About You> appeared in I<Friends> Q<The One with Two Parts: Part 1>. I<Mad About You> and I<Friends> characters Ursula and Phoebe Buffay are twin sisters.
Phoebe Buffay from I<Friends> appeared in I<Hope and Gloria> Q<A New York Story> when Hope and Gloria stopped by the Central Perk coffee shop.
Ross Geller from I<Friends> appeared in I<The Single Guy> Q<Neighbors>. On the same night, Chandler Bing from I<Friends> and Jonathan Eliot from I<The Single Guy> appeared in I<Caroline in the City> Q<Caroline and the Folks>.
I<Friends> spun off I<Joey>.
Daphne Moon and Niles Crane from I<Frasier> appeared in I<Caroline in the City> Q<Caroline and the Bad Back>. Daphne reads I<Caroline in the City> comic strip.
I<Cheers> spun off I<The Tortellis> and I<Frasier>.
Norm Peterson and Cliff Clavin from I<Cheers> appeared in I<Wings> Q<The Story of Joe>. Frasier and Lilith Sternin-Crane, also from I<Cheers>, appeared in I<Wings> Q<Planes, Trains and Visiting Cranes>.
John Hemingway from I<The John Larroquette Show> Q<More Changes> called Dr. Frasier Crane's radio show on I<Frasier>. I<The John Larroquette Show>'s A<Yoydyne|href="Big_fake_companies"> connection with I<Star Trek> and I<Angel> has been severed, though both appear later with other crossovers. SMALL<(A<Weyland-Yutani|href="#Weyland-Yutani">)>
Carla Tortelli, Norm Peterson, and Cliff Clavin from I<Cheers> appeared in I<^St. Elsewhere^> Q<Cheers>. SMALL<(A<St. Elsewhere: Tommy's head|href="#St._Elsewhere:_Tommys_head">)>
Melville's restaurant above Cheers was mentioned on I<Boston Legal> Q<Desperately Seeking Shirley>, a spin off of I<The Practice>. SMALL<(A<The Practice|href="#The_Practice">)>
2 The Practice
from ABC, NBC, and FOX
Several characters of I<The Practice> appeared in I<Ally McBeal> Q<The Inmates>, which ended on I<The Practice> Q<Axe Murderer>. Bobby Donnell from I<The Practice> also appeared in I<Ally McBeal> Q<These Are the Days>. I<Ally McBeal> was renamed I<Ally>.
Kevin Riley from I<Boston Public> appeared in I<The Practice> Q<The Day After>. Ellenor Frutt and Jimmy Berluti from I<The Practice> appeared in I<Boston Public> Q<Chapter Thirteen>.
Doctor Ben Gideon from I<Gideon's Crossing> appeared in I<The Practice> Q<Gideon's Crossover>. Ellenor Frutt from I<The Practice> appeared in I<Gideon's Crossing> Q<Flashpoint>.
Judge Isabel Hernandez from I<Miss Match> appeared in I<Boston Legal> Q<Head Cases> and Q<Chitty Chitty Bang Bang>.
2 Key
& key
* Made for television films will have the color of the network.
* Series with two or more colors were on multiple networks. The main color is the series last network.
