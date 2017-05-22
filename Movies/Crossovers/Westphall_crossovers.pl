#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(anchor img);

my @images = ('I Love Lucy');
my $doc_magic;
for (@images) {
  (my $image = $_) =~ s/ /_/g;
  my $link = "../../files/images/Movies/Crossovers/$image.png";
  $doc_magic->{$_} = sub { print anchor( img({ 'src' => $link, 'alt' => $_ }), { 'href' => $link, 'target' => 'new', 'class' => 'inline' }) };
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
These crossovers are part of the A<Tommy Westphall Universe|href="https://thetommywestphall.wordpress.com" target="new">. Westphall does not include film crossovers, but I included them for completeness in some cases.
So far I connected A<Thomas Holbrook's|href="http://www.poobala.com/crossoverlistb.html#byreality" target="new"> groups 2, 4, 10, 12, 14, 15, 18, 24, 27, 29, 30, 32, 33, 34, 38, and 39.
& I Love Lucy
Click the image for a better view. The series are placed closest to their strongest link.
2 Lucy Makes Room for Daddy
from CBS, ABC, NBC, and Showtime
After I<I Love Lucy> was renamed to I<The Lucy-Desi Comedy Hour>, Susie McNamera from I<Private Secretary> appeared on the first episode Q<Lucy Takes a Cruise to Havana>.
Danny Williams from I<The Danny Thomas Show> and the rest of the Williams family appeared on I<The Lucy-Desi Comedy Hour> Q<Lucy Makes Room for Danny>. Lucy and Ricky Ricardo appeared on I<The Danny Thomas Show> Q<Lucy Upsets the Williams Household>.
B<No> crossover occurred when George Reeves from I<The Adventures of Superman> appeared on I<I Love Lucy> Q<Lucy and Superman> as himself. He stayed in character for the children in the audience. SMALL<(A<people not considered|href="index.pl#People_not_considered"> and A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)>
I<Make Room for Daddy> was renamed to I<The Danny Thomas Show>, and it spun off I<Make Room For Granddaddy>.
Lucy Carter from I<Here's Lucy> appeared on I<Make Room for Granddaddy> "Lucy and the Lecher". SMALL<(A<Lucy's Diagnosis|href="#Lucys_Diagnosis">)>
Danny Williams from I<Make Room for Daddy> appeared on I<The Joey Bishop Show> Q<This Is Your Life>.
José Jiménez appeared on eight episodes of I<Make Room for Daddy> before spinning off to his own series I<The Bill Dana Show>. SMALL<(A<Holy defenestration, Batman!|href="Westphall_non-crossovers.pl#Holy_defenestration_Batman">)>
Andy Taylor appeared on I<Make Room for Daddy> Q<Danny Meets Andy Griffith> which lead to the creation of I<The Andy Griffith Show>. I<The Andy Griffith Show> had three spin-offs: I<Gomer Pyle, U.S.M.C.> SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)>, I<Mayberry R.F.D.>, and I<The New Andy Griffith Show>.
Barney Fife from I<The Andy Griffith Show> appeared on on I<The Joey Bishop Show> Q<Joey's Hideaway Cabin>. Howard Sprague from I<The Andy Griffith Show> appeared on I<It's Garry Shandling's Show> Q<The Day Howard Moved In>.
Maurice Sorrell from I<The Dick Van Dyke Show> appeared on I<The Danny Thomas Show> Q<The Woman Behind the Jokes>. Alan Brady from I<The Dick Van Dyke Show> appeared on I<Mad About You> Q<The Alan Brady Show>. SMALL<(A<Mad About Friends, Cheers!|href="#Mad_About_Friends_Cheers">)> Sally Rogers and Maurice Sorrell from I<The Dick Van Dyke Show> appeared on I<Herman's Head> Q<When Hairy Met Hermy>. SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)>
2 Lucy's Diagnosis
from NBC, CBS, and ABC
Ralph Kramden from I<The Honeymooners> appeared on I<Here's Lucy> Q<Lucy Visits Jack Benny>. SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)>  I<The Jackie Gleason Show> turned Q<The Honeymooners> sketches into I<The Honeymooners> which returned to I<The Jackie Gleason Show> after being canceled.
Mary Jane Lewis from I<The Lucy Show> appeared on I<Here's Lucy> "A Date for Lucy" and recurs thereafter.
Joe Mannix from I<Mannix> appeared on I<Here's Lucy> Q<Lucy and Mannix Are Held Hostage> and on I<Diagnosis Murder> Q<Hard-Boiled Murder>.
Bob Collins from I<The Bob Cummings Show> appeared on I<Here's Lucy> Q<Lucy's Punctured Romance> and on I<The George Burns and Gracie Allen Show> Q<A Marital Mix-Up>. I<The Bob Cummings Show> spun off I<The New Bob Cummings Show> and aired in syndication as I<Love That Bob>.
Cinnamon Carter from I<Mission: Impossible> appeared on I<Diagnosis Murder> Q<Discards>. I<Mission: Impossible> spun off I<Mission: Impossible> (1988).
Ben Matlock from I<Matlock> appeared on the two-part I<Diagnosis Murder> Q<Murder Two>. I<Promised Land> Q<Total Security> concludes on I<Diagnosis Murder> Q<Promises to Keep>.
I<Diagnosis Murder> is a spin off of I<Jake and the Fatman>. I<Promised Land> is a spin off of I<Touched By an Angel>.
A<Etruscan horse Morley|href="Big_fake_companies/Morley.pl#Etruscan_horse"> cigarettes, originating on I<A<Psycho|href="../Movies_by_series.pl?series=Psycho">>, appeared on I<Naked City> Q<Tombstone for a Derelict>, I<Mission: Impossible> Q<Operation 'Heart'>, I<Mannix> Q<All Around the Money Tree>, I<Seinfeld> Q<The Invitations>, and I<Friends> Q<The One Where Rachel Smokes>. They are not the same as A<red box Morley brand|href="#Red_box_Morley">. SMALL<(A<Mad About Friends, Cheers!|href="#Mad_About_Friends_Cheers">)>
I<Diagnosis Murder> used stock footage of A<Oceanic Airlines|href="Big_fake_companies/Oceanic_Airlines#Stock_footage"> from the film I<Executive Decision> not the logo from I<Lost>. Crossovers with I<A<JAG|href="Westphall_non-crossovers.pl#JAG_and_NCIS">> and I<War at Home> have been severed because they used the same stock footage.
2 Mad About Friends, Cheers!
from NBC and ABC
Cosmo Kramer from I<Seinfeld> appeared on I<Mad About You> Q<The Apartment>.
On I<Mad About You> Q<Pandora's Box>, Jamie Buchman causes a blackout which was shared on I<Madman of the People> Q<Birthday in the Big House> and I<Friends> Q<The One with the Blackout>.
Jamie Buchman, Fran Devanow, and Urusla Buffay from I<Mad About You> appeared on I<Friends> Q<The One with Two Parts: Part 1>. I<Mad About You> and I<Friends> characters Ursula and Phoebe Buffay are twin sisters.
Phoebe Buffay from I<Friends> appeared on I<Hope and Gloria> Q<A New York Story> when Hope and Gloria stopped by the Central Perk coffee shop.
Ross Geller from I<Friends> appeared on I<The Single Guy> Q<Neighbors>. On the same night, Chandler Bing from I<Friends> and Jonathan Eliot from I<The Single Guy> appeared on I<Caroline in the City> Q<Caroline and the Folks>.
I<Friends> spun off I<Joey>.
Daphne Moon and Niles Crane from I<Frasier> appeared on I<Caroline in the City> Q<Caroline and the Bad Back>. Daphne reads I<Caroline in the City> comic strip.
I<Cheers> spun off I<The Tortellis> and I<Frasier>.
Norm Peterson and Cliff Clavin from I<Cheers> appeared on I<Wings> Q<The Story of Joe>. Frasier and Lilith Sternin-Crane, also from I<Cheers>, appeared on I<Wings> Q<Planes, Trains and Visiting Cranes>.
John Hemingway from I<The John Larroquette Show> Q<More Changes> called Dr. Frasier Crane's radio show on I<Frasier>. I<The John Larroquette Show>'s A<Yoydyne|href="Big_fake_companies"> connection with I<Star Trek> and I<Angel> has been severed, though both appear later with other crossovers. SMALL<(A<Weyland-Yutani|href="#Weyland-Yutani">)>
Carla Tortelli, Norm Peterson, and Cliff Clavin from I<Cheers> appeared on I<A<St. Elsewhere|href="../Movies_by_series.pl?series=St.+Elsewhere">> Q<Cheers>. SMALL<(A<St. Elsewhere: Tommy's head|href="#St._Elsewhere:_Tommys_head">)>
Melville's restaurant above Cheers was mentioned on I<Boston Legal> Q<Desperately Seeking Shirley>, a spin off of I<The Practice>. SMALL<(A<The Practice|href="#The_Practice">)>
2 The Practice
from ABC, NBC, and FOX
Judge Isabel Hernandez from I<Miss Match> appeared on I<Boston Legal> Q<Chitty Chitty Bang Bang> and Q<Head Cases>.
Doctor Ben Gideon from I<Gideon's Crossing> appeared on I<The Practice> Q<Gideon's Crossover>.
Ellenor Frutt from I<The Practice> appeared on I<Gideon's Crossing> Q<Flashpoint>.
Kevin Riley from I<Boston Public> appeared on I<The Practice> Q<The Day After>. Ellenor Frutt and Jimmy Berluti from I<The Practice> appeared on I<Boston Public> Q<Chapter Thirteen>.
Several characters of I<The Practice> appeared on I<Ally McBeal> Q<The Inmates>, which ended on I<The Practice> Q<Axe Murderer>. Bobby Donnell from I<The Practice> also appeared on I<Ally McBeal> Q<These Are the Days>. I<Ally McBeal> was renamed I<Ally>.
2 St. Elsewhere: Tommy's head
from NBC, CBS, HBO, and UPN
Elliot Carlin from I<The Bob Newhart Show> appeared on I<A<St. Elsewhere|href="../Movies_by_series.pl?series=St.+Elsewhere">> Q<Close Encounters>. SMALL<(A<The Bob Newhart Show|href="The_Bob_Newhart_Show">)>
Warren Coolidge from I<The White Shadow> appeared on over twenty episodes of I<St. Elsewhere>. He also appeared on I<Method & Red> Q<Da Shootout>.
Dr. Mark Craig from I<St. Elsewehere> received the Cushing Left Anterior Descending Artery Award as did Dr. Kathryn Austin on I<A<Chicago Hope|href="../Movies_by_series.pl?series=Chicago+Hope">>. SMALL<(A<Chicago Hope|href="Chicago_Hope">)>
Dr. B. J. Hunnicut from I<A<M*A*S*H|href="../Movies_by_series.pl?series=MASH#MASH_1972">> was mentioned by Dr. Mark Craig on I<St. Elsewhere> Q<Santa Claus Is Dead>. I<M*A*S*H> has three spin-offs I<A<AfterMASH|href="../Movies_by_series.pl?series=MASH#AfterMASH">>, I<A<W*A*L*T*E*R|href="../Movies_by_series.pl?series=MASH#WALTER">>, and I<The Fighting Nightingales>. I<Trapper John, M.D.> is a spin off of I<MASH>, the film, not the television series.
Dr. Elliot Axelrod from I<St. Elsewhere> is a cousin of Kenny Axelrod from I<Tattingers>. I<Tattingers> was renamed to I<Nick & Hillary>.
Dr. Roxanne Turner from I<St. Elsewhere> appeared on I<A<Homicide: Life on the Street|href="../Movies_by_series.pl?series=Homicide">> "Mercy." SMALL<(A<Homicide and John Munch|href="Crossover_cosmologies.pl#Homicide_and_John_Munch">.)>
I<St. Elsewhere> has two connections to I<Oz>, the fictional Weigert Medical Corporation and the character R.N. Carol Grace. I<Oz> is connected to I<Homicide: Life On The Street> and I<The Beat> through the fictional children's television program, I<Miss Sally's Schoolyard>.
In the finale of I<St. Elsewhere>, it was revealed the entire series happened in the head of Tommy Westphall, an autistic child. You can choose to ignore the final scene of I<St. Elsewhere> or not.
2 The Bob Newhart Show
from CBS and NBC
Jerry Robinson from I<The Bob Newhart Show> appeared on I<Bob> Q<Better To Have Loved And Flossed>.
Carol Bondurant from I<The Bob Newhart Show> appeared on I<Murphy Brown> Q<Anything But Cured>. SMALL<(A<Murphy Brown|href="#Murphy_Brown">)>
Elliot Carlin from I<The Bob Newhart Show> appeared on I<Newhart> Q<I Married Dick> where he met Dick Louden.
Larry, Darryl, and Darryl from I<Newhart> appeared on I<Coach> Q<Leaving Orlando> parts two and three. SMALL<(A<Coach|href="#Coach">)>
The last scene of I<Newhart> revealed Dr. Robert Hartley from I<The Bob Newhart Show> dreamt I<Newhart>. During a discussion about the dream with Howard Borden on I<The Bob Newhart Show 19th Anniversary>, Howard mentioned he dreamt he was Roger Healey from I<I Dream Of Jeannie>.
I<The Bob Newhart Show> came into the above cosmologies through I<St. Elsewhere>, which is supposedly all in the head of Tommy Westphall. So the following could be considered a dream within a fantasy.
3 Murphy Brown
from CBS
Al Floss from I<The Famous Teddy Z> appeared on I<Murphy Brown> Q<And the Whiner Is>.
Murphy Brown from I<Muphy Brown> appeared on I<Ink> Q<Murphy's Law>. The cast of I<Murphy Brown> were seen on television in I<Love & War>. Jack Stein from I<Love & War> appeared on three episodes of I<Ink>. Meg Tynan from I<Love & War> appeared on I<Double Rush> Q<Comings and Goings>.
Liz Taylor's lost black pearls led to a crossover between I<The Nanny> Q<Where's the Pearls?>, I<Can't Hurry Love> Q<The Elizabeth Taylor Episode>, I<Murphy Brown> Q<Trick or Retreat>, and I<High Society> Q<The Family Jewels>.
Jim Dial of I<Murphy Brown> appeared on television in I<The Nanny> Q<The Tart with Heart>. Sylvia Fine from I<The Nanny> appeared on I<The Simple Life> Q<The Other Mother>.
Ray Barone of I<Everybody Loves Raymond> appeared on I<The Nanny> Q<The Reunion Show>. I<Everybody Loves Raymond> and I<The King Of Queens> had several crossovers.
Doug Heffernan from I<The King Of Queens> and Hilton Lucas from I<Cosby> appeared on I<Becker> Q<Drive, They Said>. Doug Heffernan also appeared on I<Cosby> Q<Judgment Day>.
Isaac Washington from I<The Love Boat> appeared on I<King of Queens> Q<Taste Buds>. SMALL<(A<The Love Boat|href="#The_Love_Boat">)>
3 Coach
from ABC and ITV
I<Grace Under Fire> Q<Vegas>, I<Coach> Q<Viva Las Ratings>, I<The Drew Carey Show> Q<Drew Gets Married>, and I<Ellen> Q<Secrets & Ellen> had characters in Las Vegas on the same night with the following crossover characters.
* Luther Horatio Van Dam from I<Coach> and Drew Carey from I<The Drew Carey Show> appeared on I<Grace Under Fire> Q<Vegas>.
* Drew Carey and Mimi from I<The Drew Carey Show> and Paige Clark and Spence Kovak from I<Ellen> appeared on I<Coach> Q<Viva Las Ratings>.
* Grace Kelly from I<Grace Under Fire>, Luther Horatio Van Dam from I<Coach>, Paige Clark and Spence Kovak from I<Ellen> appeared on I<The Drew Carey Show> Q<Drew Gets Married>.
* Grace Kelly from I<Grace Under Fire> and Drew Carey from I<The Drew Carey Show> appeared on I<Ellen> Q<Secrets & Ellen>.
I<Ellen> was originally I<These Friends Of Mine>.
Mr. Roper from I<Three's Company> appeared on I<Ellen> Q<Roommates>. I<Three's Company> spun off I<The Ropers> and I<Three's A Crowd>. I<Three's Company> is a non-contiguous spin-off of I<Man About the House> which has two spin-offs, I<George and Mildred> and I<Robin's Nest>.
3 The Drew Carey Show
from ABC, NBC, CBS, TNT, and UPN
Detective James Martinez from I<NYPD Blue> appeared on I<The Drew Carey Show> Q<New York and Queens>. Buck Naked from I<Hill Street Blues>, which had one spin-off I<Beverly Hills Buntz>, appeared on several episodes of I<NYPD Blue>. Lt. Howard Hunter from I<Hill Street Blues> appeared on I<Cop Rock> Q<Cop-a-Felliac>; Victor Sifuentes and Abby Perkins from I<A<L.A. Law|href="../Movies_by_series.pl?series=L.A.+Law">> appeared on I<Cop Rock> Q<Potts Don't Fail Me Now>. Eli Levinson and Denise Ianello from I<Civil Wars> were also on I<L.A. Law>. John Irvin from I<NYPD Blue> appeared on I<Public Morals>.
I<The Drew Carey Show> Q<Up on the Roof> has Drew Carey watching I<Tool Time> from I<Home Improvement>.
I<Home Improvement> spun off I<Buddies>. Brad Taylor from I<Home Improvement> appeared on I<Thunder Alley> Q<First Date>. Several characters from I<Home Improvement> appeared on I<Soul Man>: Tim Taylor on Q<Communion Wine and Convicts>, Al Borland on Q<Cinderella and the Funeral>, and Brad Taylor on Q<Public Embarrassment and Todd's First Sermon>. Revered Mike Weber from I<Soul Man> appeared on I<Home Improvement> Q<Losing My Religion>.
Mimi Bobeck Carey from I<The Drew Carey Show> appeared on I<Two Guys, a Girl and a Pizza Place>, retitled to I<Two Guys and a Girl>, Q<Two Guys, a Girl and a Psycho Halloween>; I<The Norm Show>, retitled to I<Norm>, Q<Norm vs. Schoolin'>; and I<The Hughleys> Q<Young Guns> SMALL<(A<Sabrina and Steve|href="#Sabrina_and_Steve">)>.
Drew Carey appeared on I<The Geena Davis Show> Q<Momma Bear>.
3 Sabrina and Steve
from ABC, UPN/CW, BET, NBC and CBS
Darryl Hughley from I<The Hughleys> appeared on I<The Parkers> Q<Who's Your Mama?>. I<The Parkers> is a spin-off of I<Moesha>. Maya Wilkes from I<Girlfriends> appeared on I<Moesha> Q<That's My Mama>. I<Girlfriends> spun off I<The Game>. Hakeem Campbell and Niecy Jackson from I<Moesha> appeared on I<Clueless> Q<Prom Misses, Prom Misses>.
Sabrina Spellman from I<Sabrina, the Teenage Witch> appeared on I<Clueless> Q<Mr. Wright>, I<Boy Meets World> Q<The Witches of Pennbrook> and Q<No Guts, No Cory>, I<Teen Angel> Q<One Dog Night>, and I<You Wish> Q<Genie Without a Cause>.
Dana Foster from I<Step by Step> met Cory on I<Boy Meets World> Q<The Happiest Show On Earth>. I<Boy Meets World> spun off I<Girl Meets World>. SMALL<(A<Disney Channel Live-Action Universe|href="#Disney_Channel_Live-Action_Universe">)>
Steve Urkel from I<Family Matters>, a spin-off of I<Perfect Strangers>, appeared on I<Step by Step> Q<The Dance> and Q<A Star Is Born>; I<Full House> Q<Ol' Brown Eyes> and Q<Stephanie Gets Framed>; and I<Meego> Q<Love and Money> and Q<The Truth About Cars and Dogs>.
I<Meego> Q<Mommy 'n' Meego> crossed with I<Gilligan's Island> which had three spin off films.
Michelle Tanner of I<Full House> appeared on I<Hangin' With Mr. Cooper> Q<Hangin' with Michelle>. I<Perfect Strangers> mentioned Cunningham Hardware in Milwalkee, WI from I<Happy Days>.
I<Happy Days> spun offs I<Laverne & Shirley>, I<Blansky's Beauties>, I<Mork & Mindy>, I<Out of the Blue>, and I<Joanie Loves Chachi>. I<Happy Days> spun-off from an episode of the anthology series I<Love, American Style>. I<Love, American Style> had one spin-off I<The New Love, American Style>.
2 Disney Channel Live-Action Universe
This universe is not Q<officially> part of Westphall yet.
I<Good Morning, Miss Bliss> was sold to NBC and retitled to I<Saved by the Bell>. I<Saved by the Bell> spun-off I<Saved by the Bell: The New Class> and I<Saved by the Bell: The College Years>. Years later, I<That's So Raven> was set in the same high school.
Zack and Cody Martin and Marion Moseby from I<The Suite Life of Zack & Cody> appeared on I<That's So Raven> Q<Checkin' Out>. Raven Baxter from I<That's So Raven> and Hannah Montana from I<Hannah Montana> appeared on I<The Suite Life of Zack and Cody> Q<That's So Suite Life of Hannah Montana>.
President Richard Martinez from I<Cory in the House> appeared on I<Hannah Montana> Q<Take This Job and Love It>.
Zack and Cody Martin, London Tipton, Bailey Pickett, and Marion Moseby from I<The Suite Life on Deck> appeared on I<Wizards of Waverly Place> Q<Cast-Away (to Another Show)> and I<Hannah Montana> Q<Super(stitious) Girl>. Hannah Montana and Lola Luftnagle from I<Hannah Montana> appeared on I<The Suite Life on Deck> Q<Double-Crossed>.
Zack and Cody Martin and Marion Moseby from I<The Suite Life on Deck> appeared on I<I'm in the Band> Q<Weasels on Deck>.
Austin Moon, Ally Dawson, Trish de la Rosa, and Dez Wade from I<Austin & Ally> appeared on I<Jessie> Q<Nanny in Miami>.
Jessie Prescott and the Rosses from I<Jessie> appeared on I<Austin & Ally> Q<Big Dreams & Big Apples>. Jessie also appeared on I<Good Luck Charlie> Q<Good Luck Jessie: NYC Christmas>.
Joey and Parker Rooney from I<Liv and Maddie> appeared on I<Jessie> Q<Jessie's Aloha Holidays with Parker and Joey>.
Marion Moseby from I<The Suite Life on Deck> appeared on I<Jessie> Q<Karate Kid-tastrophe>.
I<That's So Raven> spun off I<Cory in the House>. I<The Suite Life of Zack & Cody> spun off I<The Suite Life on Deck> and I<The Suite Life Movie>. I<Hannah Montana> spun off I<Hannah Montana: The Movie>. I<Wizards of Waverly Place> spun off I<Wizards of Waverly Place: The Movie> and I<The Wizards Return: Alex vs. Alex>.
For Disney Channel's Monstober 2015, seven series participated in the event.
* Logan Watson and Delia Delfano from I<I Didn't Do It> appeared on I<Jessie> Q<The Ghostest with the Mostest>.
* Austin Moon and Ally Dawson from I<Austin & Ally> appeared on I<Girl Meets World> Q<Girl Meets World: Of Terror 2>.
* Trish de la Rosa and Dez Wade from I<Austin & Ally> appeared on I<I Didn't Do It> Q<The Bite Club>.
* Emma and Zuri Ross from I<Jessie> appeared on I<K.C. Undercover> Q<All Howls Eve>.
* Riley Matthews and Lucas Friar from I<Girl Meets World> appeared on I<Best Friends Whenever> Q<Cyd and Shelby's Haunted Escape>.
* Ernie and Judy Cooper from I<K.C. Undercover> appeared on I<Austin & Ally>.
* Cyd Ripley and Shelby Marcus from I<Best Friends Whenever> appeared on I<Liv and Maddie> Q<Haunt-A-Rooney>.
2 Charlie's Angels Love Boats
This section and The Love Boat are not Q<officially> part of the Westphall universe yet.
I<Charlie's Angels> spun off two films and a non-contiguous television series also named I<Charlie's Angels>. Dan Tanna from I<Vega$> appeared on I<Charlie's Angels> Q<Angels in Vegas>. The entire cast from I<The Love Boat> appeared on I<Charlie's Angels> Q<Love Boat Angels>.
3 The Love Boat
I<The Love Boat> spun off a reunion film called I<The Love Boat: A Valentine Voyage> and I<The Love Boat: The Next Wave>.
On 22 November 1980 I<Love Boat> Q<Secretary to the Stars> story continued on I<Fantasy Island> Q<The Love Doctor>. I<Fantasy Island> spun off I<Fantasy Island> (1998).
Betty and Margaret Anderson from I<Father Knows Best>; June, Wally, and Beaver Cleaver from I<Leave It to Beaver> SMALL<(A<Leave It to Beaver to cross over|href="#Leave_It_to_Beaver_to_cross_over">)>; and Mike and Carol Brady from I<The Brady Bunch> SMALL<(A<Hooterville|href="#Hooterville">)> all appeared on the final episode of I<The Love Boat> Q<Who Killed Maxwell Thorn?>.
Julie McCoy, Doctor Adam Bricker (Doc), Isaac Washington, and Vicki Stubing from I<The Love Boat> appeared on I<Martin> Q<Goin' Overboard>.
3 Leave It to Beaver to cross over
from CBS, ABC, Disney Channel, FOX, NBC, and The WB
I<Leave It to Beaver> spun off I<Still the Beaver> which was renamed I<The New Leave It to Beaver>. SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)> Eddie Haskell from I<Leave it to Beaver> appeared on I<Parker Lewis Can't Lose> Q<Father Knows Less>. Andrew Keaton of I<Family Ties> appeared on I<Parker Lewis Can't Lose> Q<Civil Wars>. Bud Bundy of I<Married with Children> appeared on I<Parker Lewis Can't Lose> Q<Musso & Frank>.
I<Family Ties> spun off I<The Art of Being Nick>. Steven and Andrew Keaton of I<Family Ties> appeared on I<Day by Day> Q<Trading Places>. Alex P. Keaton of I<Family Ties> was mentioned on I<Spin City>. I<Spin City> Q<Internal Affairs> ended with a segue into I<Sports Night>. Paul Lassiter from I<Spin City> appeared on I<Something So Right> Q<Something About the 'Men' in Menstruation>.
I<Married with Children> spun off I<Top of the Heap> which was renamed I<Vinnie & Bobby>. Marcy Rhoades D'Arcy from I<Married with Children> appeared on I<Nikki> Q<Technical Knockup>.
3 Hooterville
from CBS and ABC
I<The Beverly Hillbillies>, I<Petticoat Junction>, and I<Green Acres> shared a large number of characters crossing over, most notably the character Sam Drucker who was a regular on I<Petticoat Junction> and I<Green Acres>. Granny Daisy Moses from I<The Beverly Hillbillies> appeared on I<Mister Ed> Q<Love and the Single Horse>. SMALL<(A<I'm not home!|href="Westphall_non-crossovers.pl#Im_not_home">)> Colonel Hogan of I<Hogan's Heroes> was mentioned in I<Green Acres> Q<Wings Over Hooterville>. SMALL<(A<Holy defenestration, Batman!|href="Westphall_non-crossovers.pl#Holy_defenestration_Batman">)>
I<The Beverly Hillbillies> spun off I<The Return of the Beverly Hillbillies>. I<Green Acres> spun off I<Return to Green Acres>.
Hank Thackery, a minor character from I<Petticoat Junction>, may be the same Thackery on I<The Brady Bunch> Q<The Possible Dream>. I<The Brady Bunch> spun off I<The Brady Bunch Hour>, I<The Brady Girls Get Married>, I<The Brady Brides>, I<A Very Brady Christmas>, and I<The Bradys>.
2 Chicago Hope
from CBS and NBC
Doctor Phillip Waters from I<A<Chicago Hope|href="../Movies_by_series.pl?series=Chicago+Hope">> appeared on I<Picket Fences> Q<Rebels with Causes>. Douglas Wambaugh from I<Picket Fences> appeared on I<Chicago Hope> Q<Small Sacrifices>.
I<Picket Fences> Q<Away In A Manger> referenced Delta Glen and events of I<A<The X-Files|href="../Movies_by_series.pl?series=The+X-Files#The_X-files_1993">> Q<Red Museum>, which took place in Delta Glen. SMALL<(A<The X-Files|href="The_X-Files">)>
Doctor Jeffrey Geiger from I<Chicago Hope> accepted a heart from a victim on I<Homicide: Life on the Street> Q<A Doll's Eyes>. SMALL<(A<Homicide and John Munch|href="Homicide_and_John_Munch">)>
Doctors Phillip Waters, Keith Wilkes, and Diane Grad from I<Chicago Hope> appeared on I<Early Edition> Q<Mum's the Word>. Sammo Law from I<Martial Law> appeared on I<Early Edition> Q<Play It Again, Sammo>. I<Martial Law> Q<Honor Among Strangers> continues in I<Walker, Texas Ranger> Q<The Day of Cleansing>. I<Walker, Texas Ranger> spun off I<Sons of Thunder>.
Kelly Connell played Carter Pike on I<Picket Fences> and C. Peck on I<A<Harry's Law|href="../Movies_by_series.pl?series=Harrys+Law">> Q<Onward and Upward>. Because Pike &ne; Peck, there was B<no> crossover.
2 Homicide and John Munch
from NBC, FOX, CBS, TF1 (France), NTV (Russia), ITV (United Kingdom), UPN, HBO, USA Network, and Netflix
While the character Detective John Munch was on I<A<Homicide: Life on the Street|href="../Movies_by_series.pl?series=Homicide">> there were three crossovers with I<A<Law & Order|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order">>. I<Law & Order> Q<Charm City> continued in I<Homicide: Life on the Street> Q<For God and Country>. I<Law & Order> was followed by I<Homicide: Life on the Street> in the episodes Q<Baby, It's You> and Q<Sideshow> on both series. Detective John Munch transferred to I<A<Law & Order: Special Victims Unit|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order:_Special_Victims_Unit">>.
I<A<Law & Order|href="../Movies_by_series.pl?series=Law+%26+Order">> and its three spin-offs based in New York city use the fictional newspaper The New York Ledger from I<A<Deadline|href="../Movies_by_series.pl?series=Deadline">>. I<Exiled> is the only film to spin off from I<Law & Order>. Four spin offs are foreign adaptations, one in Paris, France; two in Moscow, Russia; and one in London, the United Kingdom. I<Law & Order: Los Angeles> lasted only one season.
Doctor Elizabeth Olivet from I<Law & Order> appeared on I<A<New York Undercover|href="../Movies_by_series.pl?series=New+York+Undercover">> Q<Smack Is Back>, and Doctor Emil Skoda from I<Law & Order> appeared on I<New York Undercover> Q<Mob Street>.
White Detective John Munch was on I<Homicide: Life on the Street> he appeared on I<A<The X-Files|href="../Movies_by_series.pl?series=The+X-Files#The_X-files_1993">> Q<Unusual Suspects>. SMALL<(A<The X-Files|href="#The_X-Files">)> After he moved to I<Law & Order: Special Victims Unit>, he appeared on I<The Beat> Q<They Say It's Your Birthday>, I<Arrested Development> Q<Exit Strategy>, and I<The Wire> Q<Took>. In I<Luther>'s fifth episode of the first season, John Luther mentions John Munch of I<Law & Order: Special Victims Unit>.
Deputy Marshall Mary Shannon from I<A<In Plain Sight|href="../Movies_by_series.pl?series=In+Plain+Sight">> appeared on I<A<Law & Order: Criminal Intent|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order:_Criminal_Intent">> Q<Contract>.
Nicole Wallace, a recurring character on I<Law & Order: Criminal Intent>, appeared on I<Jo> Q<Catacombs> under an assumed name. She is identified by her fingerprints.
There have been three crossovers between I<A<Law & Order: Special Victims Unit|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order:_Special_Victims_Unit">> and the I<A<Chicago|href="../Movies_by_series.pl?series=Chicago">> franchise. SMALL<(A<Special Victims Unit in Chicago|href="#Special_Victims_Unit_in_Chicago">)>
3 The X-Files Xs
from FOX, CBS, and ABC
In I<Strange Luck> Q<Struck by Lightning>, the character of Chance Harper's brother mentions Fox Mulder of I<A<The X-Files|href="../Movies_by_series.pl?series=The+X-Files#The_X-files_1993">>.
The graves of Nicholas and Diane Salinger from I<Party of Five> are seen on I<The X-Files> Q<Milagro>. I<Party of Five> spun off I<Time of Your Life>.
Frank and Jordan Black from I<A<Millennium|href="../Movies_by_series.pl?series=Millennium">> appeared on I<The X-Files> Q<Millennium>.
I<The X-Files> spun off I<The Lone Gunmen> along with two films and a revival miniseries.
The X Division from I<The X-Files> was mentioned on I<A<Fringe|href="../Movies_by_series.pl?series=Fringe">> Q<A New Day in the Old Town>. SMALL<(A<good reason|href="http://toobworld.blogspot.com/2009/09/taylor-made-link-for-fringe-x-files.html">)> The airline on I<Fringe> Q<The Dreamscape> is called A<Oceanic Air|href="Big_fake_companies/Oceanic_Airlines.pl#Oceanic_Air">, the same airline flown by Richard and Alexis Castle on I<Castle> Q<In Plane Sight>. On I<Fringe> Q<Firefly>, Doctor Walter Bishop says he is friends with Doctor Lawrence Jacoby from I<Twin Peaks>, Bishop is wearing the same 3D glasses which Jacoby wears. SMALL<(A<good reason|href="http://toobworld.blogspot.com/2011/01/linkin-case-fringe-twin-peaks.html">)>
I<The X-Files> used the A<Morley|href="#Red_box_Morley"> cigarettes which first appeared in I<Beveryly Hills 90210> and look similar to Marlboro. 
3 Special Victims Unit in Chicago
from NBC
Erin Lindsay from I<A<Chicago P.D.|href="../Movies_by_series.pl?series=Chicago#Chicago_P.D.">> appeared on I<Law & Order: Special Victims Unit> Q<Comic Perversion>. On the same night, Odafin 'Fin' Tutuola and Amanda Rollins from I<Law & Order: Special Victims Unit> appeared on I<Chicago P.D.> Q<Conventions>.
The following year starting with I<A<Chicago Fire|href="../Movies_by_series.pl?series=Chicago#Chicago_Fire">> Q<Nobody Touches Anything>, continued on I<Law & Order: Special Victims Unit> Q<Chicago Crossover>, and ended on I<Chicago P.D.> Q<They'll Have To Go Through Me>.
Another three way crossover started with I<Chicago Fire> Q<We Called Her Jellybean>, continued on I<Chicago P.D.> Q<The Number of Rats>, and ended on I<Law & Order: Special Victims Unit> Q<Daydream Believer>.
I<Chicago Fire> is spinning off I<A<Chicago Med|href="../Movies_by_series.pl?series=Chicago#Chicago_Med">> where there may be a four way crossover with I<Law & Order: Special Victims Unit> and the entire I<Chicago> franchise.
2 Red box Morley
from various networks
A<Red box Morley|href="Big_fake_companies/Morley.pl#Red_box_Morley"> cigarettes from I<Beverly Hills, 90210> Q<The Back Story> can be seen in the following series. Only the first appearance is listed.
*| two
* I<Beverly Hills, 90210> Q<The Back Story>. (FOX) SMALL<(A<Beverly Hills|href=#Beverly Hills>)>
* I<A<The X-Files|href="../Movies_by_series.pl?series=The+X-Files#The_X-Files_1993">> (FOX) SMALL<(A<The X-Files Xs|href="#The_X-Files_Xs">)>
* I<A<Space: Above and Beyond|href="../Movies_by_series.pl?series=Space:+Above+and+Beyond">> Q<Ray Butts> (FOX)
* I<A<Buffy the Vampire Slayer|href="../Movies_by_series.pl?series=Buffy+the+Vampire+Slayer#Buffy_the_Vampire_Slayer_1997">> Q<School Hard> (The WB and UPN) SMALL<(A<Weyland-Yutani|href="#Weyland-Yutani">)>
* I<A<Nash Bridges|href="../Movies_by_series.pl?series=Nash+Bridges">> Q<Power Play> (16 April 1999) (CBS)
* I<That '70s Show> Q<Eric Gets Suspended>. I<That '70s Show> spun off I<That '80s Show>. (FOX)
* I<Becker> Q<Santa On Ice> (CBS) SMALL<(A<Murphy Brown|href="#Murphy_Brown">)>
* I<Malcolm in the Middle> Q<Stock Car Races> (FOX)
* I<A<Special Unit 2|href="../Movies_by_series.pl?series=Special+Unit+2">> Q<The Grain> (UPN)
* I<A<ER|href="../Movies_by_series.pl?series=ER">> "Beyond Repair". (NBC) SMALL<(A<ETM|href="#ETM">)>
* I<A<Jake 2.0|href="../Movies_by_series.pl?series=Jake+2.0">> Q<Arms and the Girl> (UPN)
* I<Cold Case> Q<The Plan> (CBS) SMALL<(A<CSI|href="#CSI">)>
* I<Everybody Hates Chris> Q<Everybody Hates Playboy> (UPN/The CW)
* I<Huff> Q<Radio Silence> (Showtime)
* I<CSI: Crime Scene Investigation> Warrick Brown smokes Morleys. (CBS) SMALL<(A<CSI|href="#CSI">)>
* I<A<Criminal Minds|href="../Movies_by_series.pl?series=Criminal+Minds">> Q<North Mammon>. (CBS) SMALL<(A<Criminal Minds|href="#Criminal_Minds">)>
* I<A<Prison Break|href="../Movies_by_series.pl?series=Prison+Break#Prison_Break">> Q<Bolshoi Booze>. (FOX) SMALL<(A<Prison Break|href="#Prison_Break">)>
* I<Breaking Bad> pilot. (AMC) SMALL<(A<Breaking Dead|href="#Breaking_Dead">)>
* I<A<Medium|href="../Movies_by_series.pl?series=Medium">> Q<To Have and to Hold> (NBC and CBS) SMALL<(A<The Montecito|href="#The_Montecito_Resort_and_Casino">)>
* I<A<New Amsterdam|href="../Movies_by_series.pl?series=New+Amsterdam">> Q<Love Hurts> (FOX)
* I<A<Reaper|href="../Movies_by_series.pl?series=Reaper">> Q<The Devil and Sam Oliver> (The CW)
* I<Saving Grace> Q<It's a Fierce, White-Hot, Mighty Love> (TNT)
* I<Sordid Lives: The Series> Q<Pills, Poison and Penises>, which is a prequel series to I<Sordid Lives>. (Logo)
* I<A<Burn Notice|href="../Movies_by_series.pl?series=Burn+Notice#Burn_Notice">> Q<Scatter Point>. I<Burn Notice> spun off I<Burn Notice: The Fall of Sam Axe>. (USA Network)
* I<A<Pushing Daisies|href="../Movies_by_series.pl?series=Pushing+Daisies">> Q<Bad Habits> (ABC) SMALL<(A<Fullerverse|href="#Fullerverse">)>
* I<A<Heroes|href="../Movies_by_series.pl?series=Heroes#Heroes">> Q<One of Us, One of Them> (NBC) SMALL<(A<The Montecito|href="#The_Montecito_Resort_and_Casino">)>
* I<Californication> Q<The Raw & the Cooked> (Showtime)
* I<United States of Tara> pilot (Showtime)
* I<24> Q<Day 8: 9:00 p.m.  10:00 p.m.>. (FOX) SMALL<(A<24|href="#twenty-four">)>
* I<American Horror Story: Murder House> Q<Birth> (FX)
* I<A<Lost|href="../Movies_by_series.pl?series=Lost">> Q<LA X> (ABC) SMALL<(A<Lost in Alias|href="#Lost_in_Alias">)>
* I<Justified> Q<Riverbrook>. I<Justified> crossed with I<Karen Sisco>. (FX and ABC)
* I<The Middle> Q<The Map> (ABC)
* I<Shameless> Q<I'll Light a Candle for You Every Day> (Showtime)
* I<A<Warehouse 13|href="../Movies_by_series.pl?series=Warehouse+13">> Q<The Ones You Love> (SyFy) SMALL<(A<Monday night on Syfy|href="#Monday_night_on_Syfy">)>
* I<Kingdom> Q<Please Refrain from Crying> (Audience Network)
* I<A<The Walking Dead|href="../Movies_by_series.pl?series=The+Walking+Dead">> Q<Save the Last One> (AMC) SMALL<(A<Breaking Dead|href="#Breaking_Dead">)>
3 Beverly Hills
from FOX and The CW
I<Beverly Hills 90120> spun off I<Melrose Place> and I<90210>. I<Melrose Place> spun off I<Models, Inc.> and I<Melrose Place> (2009). 
3 Weyland-Yutani
from The WB; UPN; FOX; NBC; BBC One, Two, and Three; CBBC; ITV; and syndicated
A<Weyland-Yutani|href="Big_fake_companies#Weyland=Yutani"> is the greedy corporation from the I<A<Alien|href="../Movies_by_series.pl?series=Alien">> series which appeared as a client of the evil law firm Wolfram & Hart on I<A<Angel|href="../Movies_by_series.pl?series=Buffy+the+Vampire+Slayer#Angel">> Q<Harm's Way>. Weyland-Yutani's logo and an Imperial shuttle from I<A<Star Wars|href="../Movies_by_series.pl?series=Star+Wars">> appeared on I<A<Firefly|href="../Movies_by_series.pl?series=Firefly">> Q<Serenity>. A Holnist patch from I<The Postman> can be seen on the shoulder of a dock worker on the I<Firefly> film I<Serenity>.
A M41A Pulse Rifle and USCM Smart Gun from I<Aliens> appeared on I<Soldier>. The soldier's service record shows he fought in the battles of Tannhauser Gate and Shoulder of Orion from I<Blade Runner>, also the spinners from I<Blade Runner> appeared on I<Soldier>.
I<A<Alien vs. Predator|href="../Movies_by_series.pl?series=Alien+vs.+Predator">> series serves as a prequel to the I<Alien> series and a sequel to the I<A<Predator|href="../Movies_by_series.pl?series=Predator">> series. (The film I<Predators> is not part of the I<Alien vs. Predator> series.)
Buffy Summers worked at the Doublemeat Palace owned by Guy Halveston, whose murder was investigated by I<A<Andy Barker, P.I.|href="../Movies_by_series.pl?series=Andy+Barker,+P.I.">> in Q<Fairway, My Lovely>. The Doublemeat Palace was previously mentioned in I<Dexter> Q<Truth Be Told>.
The TARDIS from I<A<Doctor Who|href="../Movies_by_series.pl?series=Doctor+Who#Doctor_Who_1963">> appeared on I<Red Dwarf> Q<Marooned> in the hanger of the ship, I<Chelmsford 123> Q<Arrivederci Roma>, I<Sherlock> Q<The Hounds of Baskerville>, and I<A<The Librarians|href="../Movies_by_series.pl?series=The+Librarian#The_Librarians">> Q<And the Final Curtain> where Doc Brown's DeLorean also appeared. A Narcissus escape shuttle built by Weyland-Yutani from I<A<Alien|href="../Movies_by_series.pl?series=Alien#Alien">>, a Klingon Bird of Prey from I<A<Star Trek|href="../Movies_by_series.pl?series=Star+Trek#Star_Trek_1966">>, and the Eagle from I<A<Space: 1999|href="../Movies_by_series.pl?series=Space:+1999">> appeared on I<Red Dwarf> Q<Psirens> in a shipyard of derelict ships. The Millennium Falcon from I<A<Star Wars|href="../Movies_by_series.pl?series=Star+Wars">> appeared on I<A<Star Trek: First Contact|href="Movies_by_series.pl?series=Star+Trek#Star_Trek:_First_Contact">>. A Firefly class ship appeared on the I<A<Battlestar Galactica|href="../Movies_by_series.pl?series=Battlestar+Galactica+(2003)#Battlestar_Galactica_2003">> miniseries. A Constitution class ship from I<Star Trek> appeared on I<A<Battlestar Galactica|href="../Movies_by_series.pl?series=Battlestar+Galactica+(2003)#Battlestar_Galactica_2003">> Q<Daybreak>. 
Arthur Dent from I<The Hitchhiker's Guide to the Galaxy> was mentioned in I<A<Doctor Who|href="../Movies_by_series.pl?series=Doctor+Who#Doctor_Who_2005">> Q<The Christmas Invasion>. I<A<Doctor Who|href="../Movies_by_series.pl?series=Doctor+Who">> has five spin-offs.
The alien species from I<E.T. The Extra-Terrestrial> appeared on I<A<Star Wars: The Phantom Menace|href="../Movies_by_series.pl?series=Star+Wars#Star_Wars:_Episode_I_-_The_Phantom_Menace">>.
Dr. Jackson Roykirk, introduced on I<Star Trek> Q<The Changeling>, appeared on I<A<Team Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider#Team_Knight_Rider">> Q<Apocalypse Maybe>. I<Team Knight Rider> spun off from I<A<Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider#Knight_Rider_1982">>. SMALL<(A<The Montecito|href="#The_Montecito_Resort_and_Casino">)>
The shuttle craft A<Indiana Jones|href="../Movies_by_series.pl?series=The+Adventures+of+Indiana+Jones"> appeared on I<Star Trek: The Next Generation> Q<Evolution>.
R2-D2 from I<Star Wars> appeared on I<Star Trek> (2009) and I<Star Trek Into Darkness>.
The sarlacc from I<Star Wars: Return of the Jedi> was mentioned in I<Once Upon a Time in Wonderland> Q<Forget Me Not>. SMALL<(A<Lost in Alias|href="#Lost_in_Alias">)>
3 Lost in Alias
from ABC and NBC
I<A<Lost|href="../Movies_by_series.pl?series=Lost">> had two minor crossovers with I<A<Alias|href="../Movies_by_series.pl?series=Alias">>. The first was the fictional band called Driveshaft who were introduced on I<Lost> and got a minor mention on I<Alias> Q<Authorized Personnel Only> part 2. On I<Alias> Q<A Clean Conscience>, the flight which got lost in I<Lost> was mentioned.
Oceanic Airlines appeared on I<A<LAX|href="../Movies_by_series.pl?series=LAX">> Q<Senator's Daughter>, I<A<FlashForward|href="../Movies_by_series.pl?series=FlashForward">> Q<No More Good Days>, and I<A<Once Upon a Time|href="../Movies_by_series.pl?series=Once+Upon+a+Time">> Q<The Stranger>. I<Once Upon a Time> spun off I<Once Upon a Time in Wonderland>. Oceanic Airlines flight 815 from I<Lost> was mentioned on I<A<Chuck|href="../Movies_by_series.pl?series=Chuck">> Q<Chuck Versus the Helicopter>, however the details around its destruction were inaccurate. SMALL<(A<good reason|href="http://www.televisioncrossoveruniverse.com/2011/01/what-chuck-how-this-actioncomedy-fits.html">)>
I<Lost> Q<Raised by Another> was the first appearance of A<Gannon Car Rentals|href="Big_fake_companies#Gannon_Car_Rentals">. It has since appeared on I<Nip/Tuck> Q<Conor McMamara, 2026>, I<A<Heroes|href="../Movies_by_series.pl?series=Heroes#Heroes">> Q<The Fix>, and I<Glee> Q<The New Rachel>.
Credit Dauphine, a fictional bank, from I<Alias> appeared on I<Eli Stone> "The Path".
A<Slusho!|href="Big_fake_companies#Slusho"> from I<Alias> Q<So It Begins> appeared on I<Heroes> Q<Cautionary Tales> and Q<Truth or Consequences> SMALL<(A<The Montecito|href="#The_Montecito_Resort_and_Casino">)>, I<Cloverfield>, I<A<Fringe|href="../Movies_by_series.pl?series=Fringe">> Q<The Road Not Taken> and Q<A Better Human Being>, I<A<Star Trek|href="../Movies_by_series.pl?series=Star+Trek#Star_Trek_2009">> (2009) SMALL<(A<Weyland-Yutani|href="#Weyland-Yutani">)>, and I<Super 8>.
L.A.P.D. Police Sergeant Al Powell makes his first appearance in I<A<Die Hard|href="../Movies_by_series.pl?series=Die+Hard#Die_Hard">> and then again in I<Die Hard 2>. He reappears almost two decades later on I<Chuck> Q<Chuck Versus Santa Claus>. I<Die Hard> had three more sequels.
You can read more about A<Oceanic Airlines|href="Big_fake_companies/Oceanic_Airlines.pl"> and find out why some do not cross over with I<Lost>.
3 ETM
from NBC
I<A<ER|href="../Movies_by_series.pl?series=ER">> Q<Brothers and Sisters> and I<A<Third Watch|href="../Movies_by_series.pl?series=Third+Watch">> Q<Unleashed> crossed when Doctor Susan Lewis on I<ER> got a call from her sister which prompts her to go to New York where she meets Detective Faith Yokas of I<Third Watch>. Doctor Susan Lewis of I<ER> and  of I<Third Watch> are in both episodes.
I<A<Third Watch|href="../Movies_by_series.pl?series=Third+Watch">> Q<In the Family Way> and I<A<Medical Investigation|href"../Movies_by_series.pl?series=Medical+Investigation">> Q<Half Life> cross when an outbreak of Marburg brings the NIH team to New York. Doctors Stephen Connor and Natalie Durant from I<Medical Investigation> appeared on I<Third Watch> and Detective Faith Yokas, Carlos Nieto, and Holly Levine from I<Third Watch> appeared on I<Medical Investigation>.
Detective Faith Yokas is the only character to have been on all three series.
3 CSI
from CBS and FOX
I<CSI: Crime Scene Investigation> has three spin-offs I<CSI: Miami>, I<CSI: NY>, and I<CSI: Cyber>. The I<CSI: Crime Scene Investigation> episode Q<Who and What> concluded in the I<Without a Trace> episode Q<Where and Why>. Detective Scotty Valens from I<Cold Case> appeared on I<CSI:NY> Q<Cold Reveal>.
I<CSI: Crime Scene Investigation> Q<The Lost Girls> and I<A<Bones|href="../Movies_by_series.pl?series=Bones+&+The+Finder#Bones">> Q<The Woman in the Sand> both mention the fictional Tangiers hotel. I<Bones> spun off I<A<The Finder|href="../Movies_by_series.pl?series=Bones+&+The+Finder#The_Finder">>.
I<Bones> Q<The Resurrection in the Remains> will crossover with I<Sleepy Hollow> Q<Dead Men Tell No Tales>.
There was B<no> crossover when Jon Cryer, Charlie Sheen, and Angus Jones from I<Two and a Half Men> appeared as themselves on I<CSI: Crime Scene Investigation> Q<Two and a Half Deaths>. SMALL<(A<people not considered|href="index.pl#People_not_considered">, A<Two and a Half|href="Westphall_non-crossovers.pl#Two_and_a_Half">)>
3 Criminal Minds
from CBS
I<Criminal Minds> spun off I<Criminal Minds: Suspect Behavior> and I<Criminal Minds: Beyond Borders>.
3 Prison Break
from FOX and A&E
I<Prison Break> spun off I<Prison Break: Proof of Innocence> and I<Breakout Kings>.
3 Breaking Dead
from AMC
The blue meth from I<Breaking Bad> appeared on I<A<The Walking Dead|href="../Movies_by_series.pl?series=The+Walking+Dead">>. I<Breaking Bad> spun off I<Better Call Saul>. I<The Walking Dead> spun off I<Fear the Walking Dead>, however it is not contiguous with I<The Walking Dead>.
3 Fullerverse
from ABC, Showtime, FOX, and NBC
Happy Time Temp Agency from I<A<Dead Like Me|href="../Movies_by_series.pl?series=Dead+Like+Me">> was mentioned on I<A<Pushing Daisies|href="../Movies_by_series.pl?series=Pushing+Daisies">> Q<Bzzzzzzzzz!>. I<Dead Like Me> spun off I<Dead Like Me: Life After Death>.
Marianne Marie Beetle from I<A<Wonderfalls|href="../Movies_by_series.pl?series=Wonderfalls">> Q<Muffin Buffalo> appeared on I<Pushing Daisies> Q<Comfort Food>.
Gretchen Speck-Horowitz from I<Wonderfalls> appeared on I<A<Hannibal|href="../Movies_by_series.pl?series=Hannibal+(2013)">> Q<Amuse-bouche> under her maiden name Gretchen Speck.
3 24
from FOX, Showtime, and FX
I<24> spun off I<24: Live Another Day> and I<24: Legacy>. I<24> uses a fake news company known as CNB. CNB has appeared on I<Homeland> "The Star" and in I<Tyrant> second season. Howard Gordon worked on I<24> and helmed the latter two series.
3 Monday night on Syfy
from SyFy
I<A<EurSUP<e>ka|href="../Movies_by_series.pl?series=EUReKA">>, I<A<Warehouse 13|href="../Movies_by_series.pl?series=Warehouse+13">>, and I<A<Alphas|href="../Movies_by_series.pl?series=Alphas">> aired on SyFy on Monday nights together.
I<EurSUP<e>ka> and I<Warehouse 13> had three crosses. Douglas Fargo from I<EurSUP<e>ka> appeared on I<Warehouse 13> Q<13.1>. Claudia Donovan from I<Warehouse 13> appeared on I<EurSUP<e>ka> Q<Crossing Over>. Douglas Fargo also appeared on I<Warehouse 13> Q<Don't Hate the Player>.
Dr. Vanessa Calder, who recurred on I<Warehouse 13>, appeared on I<Alphas> Q<Never Let Me Go>.
2 The Montecito Resort and Casino
from NBC, ABC, and BBC Two
If you watched I<A<Crossing Jordan|href="../Movies_by_series.pl?series=Crossing+Jordan">> you probably already know that it crossed over with I<A<Las Vegas|href="../Movies_by_series.pl?series=Las+Vegas">>. I<Crossing Jordan> Q<What Happens in Vegas Dies in Boston> continued in I<Las Vegas> Q<Two of a Kind>. I<Crossing Jordan> Q<Luck Be a Lady> continued in I<Las Vegas> Q<Double Down, Triple Threat>. There were episodes of each series which had appearances by characters from the other which did not share a story line with the other that week. Jordan Cavanaugh and Woody Hoyt of I<Crossing Jordan> appeared on I<Las Vegas> Q<History of Violins>. Danny McCoy of I<Las Vegas> appeared on I<Crossing Jordan> Q<Crazy Little Thing Called Love>.
When a network has a series which is set in a casino, every time another series needed one, you can guess where they went, in this case the A<Montecito Resort and Casino|href="Big_fake_companies#The_Montecito_Resort_and_Casino"> in I<Las Vegas>.
The I<Passions> 20 and 23 May 2005 episodes were set in the Montecito with Mary Connell from I<Las Vegas> appearing. Before characters from I<Passions> gambled at the Montecito, Dr. Bombay from I<A<Bewitched|href="../Movies_by_series.pl?series=Bewitched">> appeared on I<Passions> on 17 September 1999. I<Bewitched> spun off I<Tabitha>.
On I<A<Medium|href="../Movies_by_series.pl?series=Medium">> Q<Method to His Madness>, Allison Dubois was dreaming about a person who was gambling at the Montecito.
On I<Las Vegas> Q<The Story Of Owe>, the fictional company Dunder-Mifflin from I<The Office> (U.S.) is mentioned. After the the people from Dunder-Mifflin went to the Montecito off screen, David Brent from I<The Office> (U.K.) appeared on I<The Office> (U.S.) Q<The Seminar>. The Sergio Georgini fashon line from I<The Office> Q<Party> (U.K.) appeared in I<It's Always Sunny in Philadelphia> Q<A Very Sunny Christmas>.
On I<A<Heroes|href="../Movies_by_series.pl?series=Heroes">> Q<Collision>, the characters Hiro Nakamura and Ando Masahashi gamble at the Montecito. I<Heroes> spun off I<Heroes Reborn>.
On I<A<Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider#Knight_Rider_2008_film">>, the 2008 film, the characters Mike Traceur and Sarah Graiman met in the Montecito. Before Mike and Sarah met at the Montecito, the original I<A<Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider#Knight_Rider_1982">> series two part episode Q<Mouth of the Snake> introduced the character David Dalton who would go onto his own series I<A<Code of Vengeance|href="../Movies_by_series.pl?series=Knight+Rider#Code_of_Vengeance">>.
Are witches heroes? Are heroes witches? Is the fictional Allison Dubois a witch, hero, or both?
