#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(anchor img);

my @images = ('All in the Families', 'Hawaii Five', 'Hooterville', 'I Love Lucy', 'Leave It to Beaver', 'The Man from UNCLE', 'legend');
my $doc_magic;
for (@images) {
  (my $image = $_) =~ s/ /_/g;
  my $link = "../../files/images/Movies/Crossovers/$image.png";
  $doc_magic->{$_} = sub { print anchor( img({ 'src' => $link, 'alt' => $_ }), { 'href' => $link, 'target' => 'new', 'class' => 'inline' }) };
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
All of these crossovers (and non-crossovers) are part of the Tommy Westphall Universe. So far I connected Thomas Holbrook's groups 2, 4, 10, 18, 27, 29, 30, 32, 33, 38, and 39.
Click the images for a better view and see the A<legend|href="../files/images/Movies/Crossovers/legend.png">.
2 Lucy Makes Room for Daddy
& I Love Lucy
from CBS, ABC, NBC, and Showtime
After I<I Love Lucy> was renamed to I<The Lucy-Desi Comedy Hour>, Susie McNamera from I<Private Secretary> appeared on the first episode Q<Lucy Takes a Cruise to Havana>.
Danny Williams from I<The Danny Thomas Show> and the rest of the Williams family appeared on I<The Lucy-Desi Comedy Hour> Q<Lucy Makes Room for Danny>. Lucy and Ricky Ricardo appeared on I<The Danny Thomas Show> Q<Lucy Upsets the Williams Household>.
I<Make Room for Daddy> was renamed to I<The Danny Thomas Show>, and it spun off I<Make Room For Granddaddy>.
Lucy Carter from I<Here's Lucy> appeared on I<Make Room for Granddaddy> "Lucy and the Lecher". SMALL<(A<Lucy's Diagnosis|href="#Lucys_Diagnosis">)>
Danny Williams from I<Make Room for Daddy> appeared on I<The Joey Bishop Show> Q<This Is Your Life>.
José Jiménez appeared on eight episodes of I<Make Room for Daddy> before spinning off to his own series I<The Bill Dana Show>. SMALL<(A<Holy defenestration, Batman!|href="#Holy_defenestration_Batman">)>
Andy Taylor appeared on I<Make Room for Daddy> Q<Danny Meets Andy Griffith> which lead to the creation of I<The Andy Griffith Show>. I<The Andy Griffith Show> had three spin-offs: I<Gomer Pyle, U.S.M.C.> SMALL<(A<I'm not home!|href="#Im_not_home">)>, I<Mayberry R.F.D.>, and I<The New Andy Griffith Show>.
Barney Fife from I<The Andy Griffith Show> appeared on on I<The Joey Bishop Show> Q<Joey's Hideaway Cabin>. Howard Sprague from I<The Andy Griffith Show> appeared on I<It's Garry Shandling's Show> Q<The Day Howard Moved In>.
Maurice Sorrell from I<The Dick Van Dyke Show> appeared on I<The Danny Thomas Show> Q<The Woman Behind the Jokes>. Alan Brady from I<The Dick Van Dyke Show> appeared on I<Mad About You> Q<The Alan Brady Show>. SMALL<(A<Mad About Friends, Cheers!|href="#Mad_About_Friends_Cheers">)> Sally Rogers and Maurice Sorrell from I<The Dick Van Dyke Show> appeared on I<Herman's Head>. SMALL<(A<I'm not home!|href="#Im_not_home">)>
2 Lucy's Diagnosis
from NBC, CBS, and ABC
Ralph Kramden from I<The Honeymooners> appeared on I<Here's Lucy> Q<Lucy Visits Jack Benny>. SMALL<(A<I'm not home!|href="#Im_not_home">)>  I<The Honeymooners> spun off I<The Jackie Gleason Show>.
Mary Jane Lewis from I<The Lucy Show> appeared on I<Here's Lucy> "A Date for Lucy" and recurs thereafter.
Joe Mannix from I<Mannix> appeared on I<Here's Lucy> Q<Lucy and Mannix Are Held Hostage> and on I<Diagnosis Murder> Q<Hard-Boiled Murder>.
Bob Collins from I<The Bob Cummings Show> appeared on I<Here's Lucy> Q<Lucy's Punctured Romance> and on I<The George Burns and Gracie Allen Show> Q<A Marital Mix-Up>.
Cinnamon Carter from I<Mission: Impossible> appeared on I<Diagnosis Murder> Q<Discards>. I<Mission: Impossible> spun off I<Mission: Impossible> (1988).
Ben Matlock from I<Matlock> appeared on the two-part I<Diagnosis Murder> Q<Murder Two>. I<Promised Land> Q<Total Security> concludes on I<Diagnosis Murder> Q<Promises to Keep>.
I<Diagnosis Murder> is a spin off of I<Jake and the Fatman>. I<Promised Land> is a spin off of I<Touched By an Angel>.
A<Morley cigarettes|href="#Morley_cigarettes"> appeared on I<Mission: Impossible> after I<The Twilight Zone> Q<Nightmare at 20,000 Feet>, however, they are not the same as I<A<The X-Files|href="#The_X-Files">> A<Morley brand|href="#Morley_cigarettes">.
2 Mad About Friends, Cheers!
from NBC and ABC
Cosmo Kramer from I<Seinfeld> appeared on I<Mad About You> Q<The Apartment>.
In I<Mad About You> Q<Pandora's Box>, Jamie Buchman causes a blackout which was shared on I<Madman of the People> Q<Birthday in the Big House> and I<Friends> Q<The One with the Blackout>.
I<Mad About You> and I<Friends> characters Ursula Buffay and Phoebe Buffay are twin sisters.
I<Friends> Q<The One Where Rachel Smokes> and I<Seinfeld> Q<The Invitations> show the same brand of Morley cigarettes, however, they are not the same as I<A<The X-Files|href="#The_X-Files">> A<Morley brand|href="#Morley_cigarettes">.
I<Hope and Gloria> stopped by the Central Perk coffee shop of I<Friends>.
Ross Geller from I<Friends> appeared on I<The Single Guy> Q<Neighbors>.
Chandler Bing from I<Friends> and Jonathan Eliot from I<The Single Guy> appeared on I<Caroline in the City> Q<Caroline and the Folks>.
I<Friends> spun off I<Joey>.
The comic strip from I<Caroline in the City> appeared on I<Frasier>.
I<Cheers> spun off I<The Tortellis> and I<Frasier>.
Norm Peterson and Cliff Clavin from I<Cheers> appeared on I<Wings> Q<The Story of Joe>. Frasier and Lilith Sternin-Crane, also from I<Cheers>, appeared on I<Wings> Q<Planes, Trains and Visiting Cranes>.
John Hemingway from I<The John Larroquette Show> Q<More Changes> called Dr. Frasier Crane's radio show on I<Frasier>.
Carla Tortelli, Norm Peterson, and Cliff Clavin from I<Cheers> appeared on I<A<St. Elsewhere|href="../Movies_by_series.pl?series=St.+Elsewhere">> Q<Cheers>. SMALL<(A<St. Elsewhere: Tommy's head|href="#St._Elsewhere:_Tommys_head">)>
Melville's restaurant above Cheers was mentioned on I<Boston Legal>, a spin off of I<The Practice>. SMALL<(A<The Practice|href="#The_Practice">)>
2 St. Elsewhere: Tommy's head
from NBC, CBS, HBO, and UPN
Elliot Carlin from I<The Bob Newhart Show> appeared on I<A<St. Elsewhere|href="../Movies_by_series.pl?series=St.+Elsewhere">> Q<Close Encounters>. SMALL<(A<The Bob Newhart Show|href="The_Bob_Newhart_Show">)>
Warren Coolidge from I<The White Shadow> appeared on over twenty episodes of I<St. Elsewhere>.
Doctor Mark Craig from I<St. Elsewehere> received the Cushing Left Anterior Descending Artery Award as did Doctor Kathryn Austin on I<Chicago Hope>. SMALL<(A<Chicago Hope|href="Chicago_Hope">)>
Doctor Mark Craig made a minor mention of the I<A<M*A*S*H|href="../Movies_by_series.pl?series=MASH#MASH_1972">> character Dr. B. J. Hunnicut. I<M*A*S*H> has three spin-offs I<A<AfterMASH|href="../Movies_by_series.pl?series=MASH#AfterMASH">>, I<A<W*A*L*T*E*R|href="../Movies_by_series.pl?series=MASH#WALTER">>, and I<The Fighting Nightingales>. I<Trapper John, M.D.> is a spin off of I<MASH>, the film, not the television series.
Doctor Elliot Axelrod from I<St. Elsewhere> is a cousin of Kenny Axelrod from I<Tattingers>. I<Tattingers> was renamed to I<Nick & Hillary>.
Doctor Roxanne Turner from I<St. Elsewhere> appeared on I<A<Homicide: Life on the Street|href="../Movies_by_series.pl?series=Homicide">> "Mercy." SMALL<(A<Homicide and John Munch|href="Crossover_cosmologies.pl#Homicide_and_John_Munch">.)>
I<St. Elsewhere> has two connections to I<Oz>, the fictional Weigert Medical Corporation and the character R.N. Carol Grace. I<Oz> also has connections to I<Homicide: Life On The Street> and I<The Beat> through the fictional children's television program, I<Miss Sally's Schoolyard>.
In the finale of I<St. Elsewhere>, it was revealed the entire series happened in the head of Tommy Westphall, an autistic child. You can choose to ignore the final scene of I<St. Elsewhere> or not.
2 The Bob Newhart Show
from CBS and NBC
Howard Borden from I<The Bob Newhart Show> mentioned Roger Healey from I<I Dream Of Jeannie>.
Jerry Robinson from I<The Bob Newhart Show> appeared on I<Bob> Q<Better To Have Loved And Flossed>.
Carol Bondurant from I<The Bob Newhart Show> appeared on I<Murphy Brown> Q<Anything But Cured>. SMALL<(A<Murphy Brown|href="#Murphy_Brown">)>
Elliot Carlin from I<The Bob Newhart Show> appeared on I<Newhart> Q<I Married Dick> where he met Dick Louden.
Larry, Darryl, and Darryl from I<Newhart> appeared on I<Coach> Q<Leaving Orlando> parts two and three. SMALL<(A<Coach|href="#Coach">)>
The last scene of I<Newhart> revealed Dr. Robert Hartley from I<The Bob Newhart Show> dreamt the I<Newhart> . I<The Bob Newhart Show> came into the above cosmologies through I<St. Elsewhere>, which is supposedly all in the head of Tommy Westphall. So the following could be considered a dream within a fantasy.
3 Murphy Brown
from CBS
Al Floss from I<The Famous Teddy Z> appeared on I<Murphy Brown> Q<And the Whiner Is>.
Murphy Brown from I<Muphy Brown> appeared on I<Ink> Q<Murphy's Law>. The cast of I<Murphy Brown> were seen on television in I<Love & War>. Jack Stein from I<Love & War> appeared on three episodes of I<Ink>. Meg Tynan from I<Love & War> appeared on I<Double Rush> Q<Comings and Goings>.
Liz Taylor's lost black pearls led to a crossover between I<The Nanny> Q<Where's the Pearls?>, I<Can't Hurry Love> Q<The Elizabeth Taylor Episode>, I<Murphy Brown> Q<Trick or Retreat>, and I<High Society> Q<The Family Jewels>.
Jim Dial of I<Murphy Brown> appeared on television in I<The Nanny> Q<The Tart with Heart>. Sylvia Fine from I<The Nanny> appeared on I<The Simple Life> Q<The Other Mother>.
Ray Barone of I<Everybody Loves Raymond> appeared on I<The Nanny> Q<The Reunion Show>. I<Everybody Loves Raymond> and I<The King Of Queens> had several crossovers.
Doug Heffernan from I<The King Of Queens> and Hilton Lucas from I<Cosby> appeared on I<Becker> Q<Drive, They Said>. Doug Heffernan also appeared on I<Cosby> Q<Judgment Day>. Hilton Lucas also appeared on I<Everybody Loves Raymond> Q<Be Nice>.
Isaac Washington from I<The Love Boat> appeared on I<King of Queens> Q<The Black List>. SMALL<(A<The Love Boat|href="#The_Love_Boat">)>
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
Dana Foster from I<Step by Step> met Cory on I<Boy Meets World> Q<The Happiest Show On Earth>. I<Boy Meets World> spun off I<Girl Meets World>.
Steve Urkel from I<Family Matters>, a spin-off of I<Perfect Strangers>, appeared on I<Step by Step> Q<The Dance> and Q<A Star Is Born>; I<Full House> Q<Ol' Brown Eyes> and Q<Stephanie Gets Framed>; and I<Meego> Q<Love and Money> and Q<The Truth About Cars and Dogs>.
I<Meego> Q<Mommy 'n' Meego> crossed with I<Gilligan's Island> which had three spin off films.
Michelle Tanner of I<Full House> appeared on I<Hangin' With Mr. Cooper> Q<Hangin' with Michelle>. I<Perfect Strangers> mentioned Cunningham Hardware in Milwalkee, WI from I<Happy Days>.
I<Happy Days> spun offs I<Laverne & Shirley>, I<Blansky's Beauties>, I<Mork & Mindy>, I<Out of the Blue>, and I<Joanie Loves Chachi>. I<Happy Days> spun-off from an episode of the anthology series I<Love, American Style>. I<Love, American Style> had one spin-off I<The New Love, American Style>.
2 Charlie's Angels Love Boats
I<Charlie's Angels> spun off two films and a non-contiguous television series also named I<Charlie's Angels>. Dan Tanna from I<Vega$> appeared on I<Charlie's Angels> Q<Angels in Vegas>. The entire cast from I<The Love Boat> appeared on I<Charlie's Angels> Q<Love Boat Angels>.
3 The Love Boat
I<The Love Boat> spun off a reunion film called I<The Love Boat: A Valentine Voyage> and I<The Love Boat: The Next Wave>.
On 22 November 1980 I<Love Boat> Q<Secretary to the Stars> story continued on I<Fantasy Island> Q<The Love Doctor>. I<Fantasy Island> spun off I<Fantasy Island> (1998).
Betty and Margaret Anderson from I<Father Knows Best>; June, Wally, and Beaver Cleaver from I<Leave It to Beaver> SMALL<(A<Leave It to Beaver to cross over|href="#Leave_It_to_Beaver_to_cross_over">)>; and Mike and Carol Brady from I<The Brady Bunch> SMALL<(A<Hooterville|href="#Hooterville">)> all appeared on the final episode of I<The Love Boat> Q<Who Killed Maxwell Thorn?>.
Julie McCoy, Doctor Adam Bricker (Doc), Isaac Washington, and Vicki Stubing from I<The Love Boat> appeared on I<Martin> Q<Goin' Overboard>.
3 Leave It to Beaver to cross over
from CBS, ABC, Disney Channel, FOX, NBC, and The WB
I<Leave It to Beaver> spun off I<Still the Beaver> which was renamed I<The New Leave It to Beaver>. SMALL<(A<I'm not home!|href="#Im_not_home">)> Eddie Haskell from I<Leave it to Beaver> appeared on I<Parker Lewis Can’t Lose> Q<Father Knows Less>. Andrew Keaton of I<Family Ties> appeared on I<Parker Lewis Can’t Lose> Q<Civil Wars>. Bud Bundy of I<Married with Children> appeared on I<Parker Lewis Can’t Lose> Q<Musso & Frank>.
I<Family Ties> spun off I<The Art of Being Nick>. Steven and Andrew Keaton of I<Family Ties> appeared on I<Day by Day> Q<Trading Places>. Alex P. Keaton of I<Family Ties> was mentioned on I<Spin City>. I<Spin City> Q<Internal Affairs> ended with a segue into I<Sports Night>. Paul Lassiter from I<Spin City> appeared on I<Something So Right> Q<Something About the 'Men' in Menstruation>.
I<Married with Children> spun off I<Top of the Heap> which was renamed I<Vinnie & Bobby>. Marcy Rhoades D’Arcy from I<Married with Children> appeared on I<Nikki> Q<Technical Knockup>.
3 Hooterville
from CBS and ABC
I<The Beverly Hillbillies>, I<Petticoat Junction>, and I<Green Acres> shared a large number of characters crossing over, most notably the character Sam Drucker who was a regular on I<Petticoat Junction> and I<Green Acres>. Granny Daisy Moses from I<The Beverly Hillbillies> appeared on I<Mister Ed> Q<Love and the Single Horse>. SMALL<(A<I'm not home!|href="#Im_not_home">)> Colonel Hogan of I<Hogan's Heroes> was mentioned in I<Green Acres> Q<Wings Over Hooterville>. SMALL<(A<Holy defenestration, Batman!|href="#Holy_defenestration_Batman">)>
I<The Beverly Hillbillies> spun off I<The Return of the Beverly Hillbillies>. I<Green Acres> spun off I<Return to Green Acres>.
Hank Thackery, a minor character from I<Petticoat Junction>, may be the same Thackery on I<The Brady Bunch> Q<The Possible Dream>. I<The Brady Bunch> spun off I<The Brady Bunch Hour>, I<The Brady Girls Get Married>, I<The Brady Brides>, I<A Very Brady Christmas>, and I<The Bradys>.
2 Chicago Hope
from CBS and NBC
Doctor Phillip Waters from I<Chicago Hope> appeared on I<Picket Fences> Q<Rebels with Causes>. Douglas Wambaugh from I<Picket Fences> appeared on I<Chicago Hope> Q<Small Sacrifices>.
I<Picket Fences> Q<Away In A Manger> referenced Delta Glen and events of I<A<The X-Files|href="../Movies_by_series.pl?series=The+X-Files#The_X-files_1993">> Q<Red Museum>, which took place in Delta Glen. SMALL<(A<The X-Files|href="The_X-Files">)>
Doctor Jeffrey Geiger from I<Chicago Hope> accepted a heart from a victim on I<Homicide: Life on the Street> Q<A Doll's Eyes>. SMALL<(A<Homicide and John Munch|href="Homicide_and_John_Munch">)>
Doctors Phillip Waters, Keith Wilkes, and Diane Grad from I<Chicago Hope> appeared on I<Early Edition> Q<Mum's the Word>. Sammo Law from I<Martial Law> appeared on I<Early Edition> Q<Play It Again, Sammo>. I<Martial Law> Q<Honor Among Strangers> continues in I<Walker, Texas Ranger> Q<The Day of Cleansing>. I<Walker, Texas Ranger> spun off I<Sons of Thunder>.
2 Homicide and John Munch
from NBC, FOX, CBS, TF1 (France), NTV (Russia), ITV (United Kingdom), UPN, HBO, USA Network, and Netflix
While the character Detective John Munch was on I<A<Homicide: Life on the Street|href="../Movies_by_series.pl?series=Homicide">> there were three crossovers with I<A<Law & Order|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order">>. I<Law & Order> Q<Charm City> continued in I<Homicide: Life on the Street> Q<For God and Country>. I<Law & Order> was followed by I<Homicide: Life on the Street> in the episodes Q<Baby, It's You> and Q<Sideshow> on both series. Detective John Munch transferred to I<A<Law & Order: Special Victims Unit|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order:_Special_Victims_Unit">>.
I<A<Law & Order|href="../Movies_by_series.pl?series=Law+%26+Order">> and its three spin-offs based in New York city use the fictional newspaper The New York Ledger from I<A<Deadline|href="../Movies_by_series.pl?series=Deadline">>. I<Exiled> is the only film to spin off from I<Law & Order>. Four spin offs are foreign adaptations, one in Paris, France; two in Moscow, Russia; and one in London, the United Kingdom. I<Law & Order: Los Angeles> lasted only one season.
Doctor Elizabeth Olivet from I<Law & Order> appeared on I<A<New York Undercover|href="../Movies_by_series.pl?series=New+York+Undercover">> Q<Smack Is Back>, and Doctor Emil Skoda from I<Law & Order> appeared on I<New York Undercover> Q<Mob Street>.
White Detective John Munch was on I<Homicide: Life on the Street> he appeared on I<A<The X-Files|href="../Movies_by_series.pl?series=The+X-Files#The_X-files_1993">> Q<Unusual Suspects>. SMALL<(A<The X-Files|href="#The_X-Files">)> After he moved to I<Law & Order: Special Victims Unit>, he appeared on I<The Beat> Q<They Say It's Your Birthday>, I<Arrested Development> Q<Exit Strategy>, and I<The Wire> Q<Took>. In I<Luther>'s fifth episode of the first season, John Luther mentions John Munch of I<Law & Order: Special Victims Unit>.
Deputy Marshall Mary Shannon from I<A<In Plain Sight|href="../Movies_by_series.pl?series=In+Plain+Sight">> appeared on I<A<Law & Order: Criminal Intent|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order:_Criminal_Intent">> Q<Contract>.
Nicole Wallace, a recurring character on I<Law & Order: Criminal Intent>, appeared on I<Jo> Q<Catacombs> under an assumed name. She is identified by her fingerprints.
There have been three crossovers between I<A<Law & Order: Special Victims Unit|href="../Movies_by_series.pl?series=Law+%26+Order#Law_and_Order:_Special_Victims_Unit">> and the I<A<Chicago|href="../Movies_by_series.pl?series=Chicago">> franchise. SMALL<(A<Special Victims Unit in Chicago|href="#Special_Victims_Unit_in_Chicago">)>
3 The X-Files
from FOX and CBS
In I<Strange Luck> Q<Struck by Lightning>, the character of Chance Harper's brother mentions Fox Mulder of I<A<The X-Files|href="../Movies_by_series.pl?series=The+X-Files#The_X-files_1993">>.
The graves of Nicholas and Diane Salinger from I<Party of Five> are seen on I<The X-Files> Q<Milagro>. I<Party of Five> spun off I<Time of Your Life>.
Frank and Jordan Black from I<A<Millennium|href="../Movies_by_series.pl?series=Millennium">> appeared on I<The X-Files> Q<Millennium>.
I<The X-Files> spun off I<The Lone Gunmen> along with two films and a revival miniseries.
I<The X-Files> introduced a Morley brand of cigarettes which look similar to the Marlboro brand of cigarettes. SMALL<(A<Morley cigarettes|href="#Morley_cigarettes">)>
3 Special Victims Unit in Chicago
from NBC
Erin Lindsay from I<A<Chicago P.D.|href="../Movies_by_series.pl?series=Chicago#Chicago_P.D.">> appeared on I<Law & Order: Special Victims Unit> Q<Comic Perversion>. On the same night, Odafin 'Fin' Tutuola and Amanda Rollins from I<Law & Order: Special Victims Unit> appeared on I<Chicago P.D.> Q<Conventions>.
The following year starting with I<A<Chicago Fire|href="../Movies_by_series.pl?series=Chicago#Chicago_Fire">> Q<Nobody Touches Anything>, continued on I<Law & Order: Special Victims Unit> Q<Chicago Crossover>, and ended on I<Chicago P.D.> Q<They'll Have To Go Through Me>.
Another three way crossover started with I<Chicago Fire> Q<We Called Her Jellybean>, continued on I<Chicago P.D.> Q<The Number of Rats>, and ended on I<Law & Order: Special Victims Unit> Q<Daydream Believer>.
I<Chicago Fire> is spinning off I<Chicago Med> where there may be a four way crossover with I<Law & Order: Special Victims Unit> and the entire I<Chicago> franchise.
2 Morley cigarettes
from FOX
Morley cigarette packaging like the packaging from I<The X-Files> can be seen in the following series.
* I<A<Buffy the Vampire Slayer|href="../Movies_by_series.pl?series=Buffy+the+Vampire+Slayer#Buffy_the_Vampire_Slayer_1997">>, Spike smokes them. (The WB and UPN) SMALL<(A<Weyland-Yutani|href="#Weyland-Yutani">)>
* I<That '70s Show> Q<Eric Gets Suspended>. I<That '70s Show> spun off I<That '80s Show>. (FOX)
* I<Malcolm in the Middle> Q<Stock Car Races> (FOX)
* I<A<Special Unit 2|href="../Movies_by_series.pl?series=Special+Unit+2">> Q<The Grain> (UPN)
* I<A<ER|href="../Movies_by_series.pl?series=ER">> "Beyond Repair". (NBC) SMALL<(A<ETM|href="#ETM">)>
* I<Jake 2.0> Q<Arms and the Girl> (UPN)
* I<Huff> Q<Radio Silence> (Showtime)
* Warrick Brown from I<CSI: Crime Scene Investigation> smokes Morley cigarettes. (CBS) SMALL<(A<CSI|href="#CSI">)>
* I<A<Criminal Minds|href="../Movies_by_series.pl?series=Criminal+Minds">> Q<North Mammon>. I<Criminal Minds> spun off I<Criminal Minds: Suspect Behavior> and I<Criminal Minds: Beyond Borders>. (CBS)
* I<Prison Break> Q<Bolshoi Booze> . I<Prison Break> spun off I<Prison Break: Proof of Innocence> and I<Breakout Kings>. (FOX and A&E)
* I<Breaking Bad> pilot. (AMC) SMALL<(A<Breaking Dead|href="#Breaking_Dead">)>
* I<A<Burn Notice|href="../Movies_by_series.pl?series=Burn+Notice#Burn_Notice">> Q<Scatter Point> and other episodes. I<Burn Notice> spun off I<Burn Notice: The Fall of Sam Axe>. (USA Network)
* I<Californication> "The Raw & the Cooked" (Showtime)
* I<LOST> "LA X" (ABC) SMALL<(A<Lost in Alias|href="#Lost_in_Alias">)>
* I<Justified> Q<Riverbrook>. I<Justified> crossed with I<Karen Sisco>. (FX and ABC)
* I<A<Warehouse 13|href="../Movies_by_series.pl?series=Warehouse+13">> "The Ones You Love". (SyFy) SMALL<(A<Monday night on Syfy|href="#Monday_night_on_Syfy">)>
* I<A<The Walking Dead|href="../Movies_by_series.pl?series=The+Walking+Dead">> Q<Consumed>. (AMC) SMALL<(A<Breaking Dead|href="#Breaking_Dead">)>
3 Weyland-Yutani
from The WB; UPN; FOX; NBC; BBC One, Two, and Three; CBBC; and ITV
Weyland-Yutani is the evil corporation in the I<A<Alien|href="../Movies_by_series.pl?series=Alien">> series. After Joss Whedon wrote I<Alien: Resurection>, he included Weyland-Yutani as a client of the evil law firm Wolfram & Hart on I<Angel> which is part of the I<A<Buffy the Vampire Slayer|href="../Movies_by_series.pl?series=Buffy+the+Vampire+Slayer">> series. Weyland-Yutani's logo can also be seen on I<A<Firefly|href="../Movies_by_series.pl?series=Firefly">> Q<Serenity>.
A M41A Pulse Rifle and USCM Smart Gun from I<Aliens> appeared in I<Soldier>. The soldier's service record shows he fought in the battles of Tannhauser Gate and Shoulder of Orion from I<Blade Runner>, also the spinners from I<Blade Runner> appeared in I<Soldier>.
Buffy Summers worked at the Doublemeat Palace owned by Guy Halveston, whose murder was investigated by I<A<Andy Barker, P.I.|href="../Movies_by_series.pl?series=Andy+Barker,+P.I.">> in Q<Fairway, My Lovely>. The Doublemeat Palace was previously mentioned in I<Dexter> Q<Truth Be Told>.
I<Alien> is part of the I<A<Alien|href="../Movies_by_series.pl?series=Alien">> series with the I<A<Alien vs. Predator|href="../Movies_by_series.pl?series=Alien+vs.+Predator">> series as prequels which are also sequels to the I<A<Predator|href="../Movies_by_series.pl?series=Predator">> series. (The film I<Predators> is not part of the I<Alien vs. Predator> series.)
A Firefly class ship is seen in the I<A<Battlestar Galactica|href="../Movies_by_series.pl?series=Battlestar+Galactica+(2003)#Battlestar_Galactica_2003">> miniseries, and a Constitution class ship from I<Star Trek> SMALL<(A<Star Rider|href="#Star_Rider">)> is seen in I<A<Battlestar Galactica|href="../Movies_by_series.pl?series=Battlestar+Galactica+(2003)#Battlestar_Galactica_2003">> Q<Daybreak>; both are part of the 2003 I<A<Battlestar Galactica|href="../Movies_by_series.pl?series=Battlestar+Galactica+(2003)">> series.
A Klingon Bird of Prey from I<Star Trek> SMALL<(A<Star Rider|href="#Star_Rider">)>; a Narcissus escape shuttle built by A<Weyland-Yutani|href="#Weyland-Yutani"> from I<A<Alien|href="../Movies_by_series.pl?series=Alien#Alien">>; and the Eagle from I<A<Space: 1999|href="../Movies_by_series.pl?series=Space:+1999">> are in a shipyard of derelict ships seen on I<Red Dwarf> Q<Psirens>.
In I<Red Dwarf> Q<Marooned> the TARDIS from I<A<Doctor Who|href="../Movies_by_series.pl?series=Doctor+Who#Doctor_Who_1963">> can be seen in the hanger of the ship. The TARDIS also appears in an episode of I<Chelmsford 123>. Arthur Dent from I<The Hitchhiker's Guide to the Galaxy> was mentioned in I<A<Doctor Who|href="../Movies_by_series.pl?series=Doctor+Who#Doctor_Who_2005">> Q<The Christmas Invasion>. I<A<Doctor Who|href="../Movies_by_series.pl?series=Doctor+Who">> has four spin-offs.
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
3 Breaking Dead
from AMC
The blue meth from I<Breaking Bad> appears on I<The Walking Dead>. I<Breaking Bad> spun off I<Better Call Saul>. I<The Walking Dead> spun off I<Fear the Walking Dead>, however it is not contiguous with I<The Walking Dead>.
3 Lost in Alias
from ABC
I<LOST> had two minor crossovers with I<Alias>. The first was the fictional band called Driveshaft who were introduced on I<LOST>, but had a minor mention on I<Alias> Q<Authorized Personnel Only> part 2. In I<Alias> Q<A Clean Conscience>, the flight which got lost in I<LOST> was mentioned.
The fictional bank named Credit Dauphine from I<Alias> appeared on I<Eli Stone> "The Path".
Oceanic Airlines flight 815 from I<LOST> was mentioned on I<Chuck> Q<Chuck Versus the Helicopter>, however the details around its destruction were inaccurate.
L.A.P.D. Sgt. Al Powell from I<A<Die Hard|href="../Movies_by_series.pl?series=Die+Hard#Die_Hard">> appeared on I<A<Chuck|href="../Movies_by_series.pl?series=Chuck">> Q<Chuck Versus Santa Claus>. I<Die Hard> had four sequels.
Oceanic Airlines also appeared on I<FlashForward> Q<No More Good Days> and I<Once Upon a Time> Q<The Stranger>. I<Once Upon a Time> spun off I<Once Upon a Time in Wonderland>.
3 Monday night on Syfy
from SyFy
I<A<EurSUP<e>ka|href="../Movies_by_series.pl?series=EUReKA">>, I<A<Warehouse 13|href="../Movies_by_series.pl?series=Warehouse+13">>, and I<A<Alphas|href="../Movies_by_series.pl?series=Alphas">> aired on SyFy on Monday nights together.
I<EurSUP<e>ka> and I<Warehouse 13> had three crosses. Douglas Fargo from I<EurSUP<e>ka> appeared on I<Warehouse 13> Q<13.1>. Claudia Donovan from I<Warehouse 13> appeared on I<EurSUP<e>ka> Q<Crossing Over>. Douglas Fargo also appeared on I<Warehouse 13> Q<Don’t Hate the Player>.
Dr. Vanessa Calder, who recurred on I<Warehouse 13>, appeared on I<Alphas> Q<Never Let Me Go>.
2 Star Rider
from NBC, UPN, and syndicated
I<A<Star Trek|href="../Movies_by_series.pl?series=Star+Trek#Star_Trek_1966">> Q<The Changeling> introduced the character Dr. Jackson Roykirk. Dr. Roykirk appeared on I<A<Team Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider#Team_Knight_Rider">> Q<Apocalypse Maybe>. I<Team Knight Rider> is a spin-off of I<A<Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider#Knight_Rider_1982">>. This joins the I<A<Star Trek|href="../Movies_by_series.pl?series=Star+Trek">> series and the I<A<Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider">> series.
The I<Knight Rider> two part episode Q<Mouth of the Snake> introduced the character David Dalton who would go onto his own series I<A<Code of Vengeance|href="../Movies_by_series.pl?series=Knight+Rider#Code_of_Vengeance">>. In the television film I<Knight Rider>, the characters Mike Traceur and Sarah Graiman met in the A<Montecito Resort and Casino|href="#The_Montecito_Resort_and_Casino">, the fictional casino in the series I<Las Vegas>.
2 The Montecito Resort and Casino
from NBC
If you watched I<A<Crossing Jordan|href="../Movies_by_series.pl?series=Crossing+Jordan">> you probably already know that it crossed over with I<A<Las Vegas|href="../Movies_by_series.pl?series=Las+Vegas">>. I<Crossing Jordan> Q<What Happens in Vegas Dies in Boston> continued in I<Las Vegas> Q<Two of a Kind>. I<Crossing Jordan> Q<Luck Be a Lady> continued in I<Las Vegas> Q<Double Down, Triple Threat>. There were episodes of each series which had appearances by characters from the other which did not share a story line with the other that week. Jordan Cavanaugh and Woody Hoyt of I<Crossing Jordan> appeared on I<Las Vegas> Q<History of Violins>. Danny McCoy of I<Las Vegas> appeared on I<Crossing Jordan> Q<Crazy Little Thing Called Love>.
3 More at the Montecito
from NBC
When a network has a series which is set in a casino, every time another series needed one, you can guess where they went. Do you know who else stopped by the Montecito Resort and Casino in I<Las Vegas>?
* The 20 and 23 May 2005 episodes of I<Passions> were set in the Montecito with Mary Connell making an appearance.
* In I<A<Medium|href="../Movies_by_series.pl?series=Medium">> Q<Method to His Madness>, Allison Dubois was dreaming about a person who was gambling at the Montecito.
* In I<Las Vegas> Q<The Story Of Owe> there is a mention of the fictional company Dunder-Mifflin from I<The Office> (U.S.).
* In I<A<Heroes|href="../Movies_by_series.pl?series=Heroes">> Q<Collision>, the characters Hiro Nakamura and Ando Masahashi gamble at the Montecito.
* In the television film I<A<Knight Rider|href="../Movies_by_series.pl?series=Knight+Rider">>, the characters Mike Traceur and Sarah Graiman met in the Montecito. SMALL<(A<Star Rider|href="#Star_Rider">)>
3 Before and after the Montecito
from NBC, ABC, and BBC Two
You may think that is enough, but it is not quite over. I<Passions> and I<The Office> bring more into this cosmology. Let’s visit them.
* Before the cast of I<Passions> gambled at the Montecito, Dr. Bombay from I<A<Bewitched|href="../Movies_by_series.pl?series=Bewitched">> showed up on I<Passions> on 17 September 1999.
* I<Bewitched> spun off I<Tabitha>.
* After the the people from Dunder-Mifflin went to the Montecito off screen, David Brent from I<The Office> (U.K.) appeared on I<The Office> (U.S.) Q<The Seminar>.
Ponder this: Are witches heroes? Are heroes witches? Is the fictional Allison Dubois a witch, hero, or both?
2 Chuck Dies Hard
Police Sergeant Al Powell makes his first appearance in I<Die Hard> and then again in I<Die Hard 2>. He reappears almost two decades later on I<Chuck> Q<Chuck Versus Santa Claus>.
2 The Practice
from ABC, NBC, and FOX
Judge Isabel Hernandez from I<Miss Match> appeared on I<Boston Legal> Q<Chitty Chitty Bang Bang> and Q<Head Cases>.
Doctor Ben Gideon from I<Gideon's Crossing> appeared on I<The Practice> Q<Gideon's Crossover>.
Ellenor Frutt from I<The Practice> appeared on I<Gideon's Crossing> Q<Flashpoint>.
Kevin Riley from I<Boston Public> appeared on I<The Practice> Q<The Day After>. Ellenor Frutt and Jimmy Berluti from I<The Practice> appeared on I<Boston Public> Q<Chapter Thirteen>.
Several characters of I<The Practice> appeared on I<Ally McBeal> Q<The Inmates>, which ended on I<The Practice> Q<Axe Murderer>. Bobby Donnell from I<The Practice> also appeared on I<Ally McBeal> Q<These Are the Days>. I<Ally McBeal> was renamed I<Ally>.
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
Florida Evans of I<Maude> spun off to her own series, I<Good Times>. The series I<Hanging In> is considered a spin-off of I<Maude>, however its stories are not connected to this cosmology.
Florence Johnston of I<The Jefferson's> briefly had her own series, I<Checking In>. George Jefferson appeared on the pilot of I<E/R>. The Jeffersons appeared on the finale of I<The Fresh Prince of Bel-Air> along with Philip Drummond and Arnold Jackson-Drummond of I<Diff'rent Strokes>.
Hilary Banks of I<The Fresh Prince of Bel-Air> appeared on I<Out All Night> Q<The Great Pretender> and I<Blossom> Q<Wake Up Little Suzy>. Carlton and Ashley Banks, also from I<The Fresh Prince of Bel-Air>, appeared on I<In the House> Q<Dog Catchers>.
Mrs. Garrett of I<Diff'rent Strokes> spun off to I<The Facts of Life>. I<Diff'rent Strokes> and I<Hello, Larry> shared three crossover episodes Q<The Trip>, Q<Feudin' and Fussin'>, and Q<Thanksgiving Crossover> on both series. SMALL<(A<I'm not home!|href="#Im_not_home">)> Arnold Jackson-Drummond made an appearance on I<Silver Spoons> Q<The Great Computer Caper>.
If Greg Morris appeared on I<The Jeffersons> three-part Q<Mission Incredible> as his character Barney Collier from I<Mission: Impossible>, this cosmology would cross with Q<A<Lucy's Diagnosis|href="#Lucys_Diagnosis">>.
& All in the Families
2 Hawaii Five-Oh-No!
from CBS
I<A<Hawaii 5-0|href="../Movies_by_series.pl?series=Hawaii+Five-0">> is a remake of I<A<Hawaii 5-O|href="../Movies_by_series.pl?series=Hawaii+Five-O">> and used footage from the original's episode "Wooden Model of a Rat" in the episode "Kalele". While Ed Asner reprised his character August March from the original in the remake, the back story is very different between the series.
& Hawaii Five
3 Magnum P.I.
from CBS
In I<Magnum P.I.> "Skin Deep", Thomas Magnum mentioned Steve McGarrett of I<A<Hawaii 5-O|href="../Movies_by_series.pl?series=Hawaii+Five-O">>. I<Magnum P.I.> "Ki'is Don't Lie" ends on I<Simon and Simon> "Emeralds Are Not a Girl's Best Friend". I<Magnum P.I.> "Novel Connection" ends on I<Murder, She Wrote> "Magnum on Ice".
I<Murder, She Wrote> spun off I<The Law & Harry McGraw>.
A.J. Simon of I<Simon and Simon> appeared on I<Whiz Kids> "Deadly Access", then Richie and Irene Adler of I<Whiz Kids> appeared on I<Simon and Simon> "Fly the Alibi Skies".
3 JAG and NCIS
from CBS and NBC
I<A<JAG|href="../Movies_by_series.pl?series=JAG">> started off on NBC before going to CBS.
Edward Sheffield from I<JAG> first appeared on I<A<First Monday|href="../Movies_by_series.pl?series=First+Monday">> in three episodes.
I<JAG> Q<Ice Queen> and Q<Meltdown> were the backdoor pilot for I<A<NCIS|href="../Movies_by_series.pl?series=NCIS#NCIS">>.
I<NCIS> two-part Q<Legend> was the backdoor pilot to I<A<NCIS: Los Angeles|href="../Movies_by_series.pl?series=NCIS#NCIS:_Los_Angeles">>. I<NCIS> two-part Q<Crescent City> was the backdoor pilot to I<A<NCIS: New Orleans|href="../Movies_by_series.pl?series=NCIS#NCIS:_New_Orleans">>.
Kensi Blye from I<NCIS: Los Angeles> appeared on I<Hawaii 5-0> "Ka Hakaka Maika'i". G. Callen and Sam Hannah from I<NCIS: Los Angeles> appeared on I<A<Hawaii 5-0|href="../Movies_by_series.pl?series=Hawaii+Five-0#season_02">> Q<Pa Make Loa> which concluded on I<NCIS: Los Angeles> Q<Touch of Death> with Daniel Williams and Chin Ho Kelly from I<Hawaii 5-0> appearing.
Hetty Lange from I<NCIS: Los Angeles> appeared on I<A<Scorpion|href="../Movies_by_series.pl?series=Scorpion#season_01">> Q<True Colors>.
2 No News for the Detectives
A A<crossover|href="http://tommywestphall.livejournal.com/25863.html"> between I<Columbo>, I<A<Wonder Woman|href="../Movies_by_series.pl?series=Wonder+Woman+(1975)">>, I<A<Matt Houston|href="../Movies_by_series.pl?series=Matt+Houston">>, I<A<Remington Steele|href="../Movies_by_series.pl?series=Remington+Steele">>, I<A<Moonlighting|href="../Movies_by_series.pl?series=Moonlighting">>, I<City of Angels>, I<Burke's Law> (1994), and I<24> for allegedly using the I<Los Angeles Tribune>, the fictional newspaper from I<Lou Grant>, was attempted. With the amount of networks involved and no discernible connections, I do not see this as a crossover.
3 Mary Tyler Moore
from CBS
I<The Mary Tyler Moore Show> spun off four series: I<Rhoda>, I<Phyllis>, I<Lou Grant>, and I<Mary and Rhoda>. SMALL<(A<I'm not home!|href="Im_not_home">)>
3 Columbo
from NBC and ABC
I<Columbo> spun off I<Mrs. Columbo>. I<Mrs. Columbo> went through three name changes: I<Kate Columbo>, I<Kate the Detective>, and I<Kate Loves a Mystery>.
3 Burke's Law
from ABC and CBS
I<Burke's Law> (1963) spun off I<Amos Burke, Secret Agent> which spun off I<Burke's Law> (1994). The titular character of I<Honey West> appeared on I<Burke's Law> (1963) Q<Who Killed the Jackpot?> and I<Burke's Law> (1994) Q<Who Killed Nick Hazard?>.
3 Moonlighting
from ABC
Max from I<A<Hart to Hart|href="../Movies_by_series.pl?series=Hart+to+Hart">> appeared on I<A<Moonlighting|href="../Movies_by_series.pl?series=Moonlighting">> Q<It's a Wonderful Job>. In the next I<Moonlighting> episode, Q<The Straight Poop>, Pierce Brosnan from I<Remington Steele> makes an appearance as himself, which negates a crossover here.
2 Non-crosses
Some crossover enthusiasts have created crossovers where it does not make much sense. Here are a couple I consider non-crosses, however there may still be crossovers in these non-crosses.
3 I'm not home!
Many series have been linked because of the series I<Hi Honey, I'm Home!>. I<Hi Honey, I'm Home!> takes the characters out of their original continuities and places them into another. Since they are outside their original continuity, they are not the same characters. So the following do I<not> cross with each other or anything above.
* I<A<Adventures of Superman|href="../Movies_by_series.pl?series=Adventures+of+Superman">>
* I<The Honeymooners>, I<The Dick Van Dyke Show>, I<The Lucy Show>, I<Gomer Pyle, U.S.M.C.>, and everything else crossed with I<A<I Love Lucy|href="#I_LoveLucy">>.
* I<Leave it to Beaver> and all of its A<spin-offs and crossovers|href="#Leave_It_to_Beaver_to_cross_over">.
* I<The Donna Reed Show> or I<Dennis The Menace> though they did cross.
* I<The Many Loves of Dobie Gillis>
* I<Mister Ed>, I<The Brady Bunch>, and the people of A<Hooterville|href="#Hooterville">.
* I<Hazel>
* I<The Munsters> and its spin-offs
* I<My Mother the Car>
* I<Get Smart> and its A<spin-offs and crossovers|href="#The_Man_from_U.N.C.L.E._Gets_Smart">.
* I<A<The Mary Tyler Moore Show|href="#Mary_Tyler_Moore">>
* I<Hello, Larry> SMALL<(A<All in the Families|href="#All_in_the_Families">)>
* I<The Cosby Show> and its spin-off I<A Different World>
3 Holy defenestration, Batman!
from ABC, NBC, and CBS
On I<A<Batman|href="../Movies_by_series.pl?series=Batman+(1966)">> many actors have stuck their heads out of a window while Batman and Robin were climbing a wall. In rare cases, a character would stick his head out of a window. These are not crossovers by my definition, though others include them.
When Bill Dana stuck his head out of a window, he was playing himself not his character, Jose Jimenez from I<The Bill Dana Show>. SMALL<(A<Make Room for Daddy|href="#Make_Room_for_Daddy">)>
I<A<The Addams Family|href="../Movies_by_series.pl?series=The+Addams+Family+(1964)">> was canceled several months prior to Lurch sticking his head out of a window on I<Batman>.
I<Batman> was set in the 60s, so when I<Hogan's Heroes> Colonel Klink stuck his head out of a window, he was very out of date. I<Hogan's Heroes> was set during World War II. SMALL<(A<Hooterville|href="Hooterville">)>
A crossover did not happen when I<A<The Green Hornet|href="../Movies_by_series.pl?series=The+Green+Hornet+(1966)">> and Kato stuck their heads out of a window in season two of I<Batman>. Near the end of season two, there was a crossover when I<The Green Hornet> and Kato appeared on the I<Batman> episodes Q<A Piece of the Action> and Q<Batman's Satisfaction>. I<The Green Hornet> is a descendant of I<The Lone Ranger>. They started as radio shows by the same company and then made into television series by the same people, so their crossover works.
3 Untying Lariat Rent-A-Car
The Lariat Rent-A-Car company has been seen on A<I<The X-Files>|href="../Movies_by_series.pl?series=The+X-Files#The_X-Files#The_X-Files_1993">, I<Veronica Mars>, I<Supernatural>, and I<Breaking Bad> SMALL<(A<Breaking Dead|href="#Breaking_Dead">)>. Lariat Rent-A-Car is a fake company which can be used when a real car rental company can not be used. The use of this fake company does not constitute a crossover. However, if there is another way to cross the series, it is entirely possible the Lariat Rent-A-Car companies are the same company.
3 The name is not the same
* Barbara Rhoades played Maggie Gallagher on I<Hanging In>, and Maggie Chandler on I<Soap>. (Gallagher &ne; Chandler) I<Soap> spun off I<Benson>. SMALL<(A<All in the Families|href="#All_in_the_Families">)>
* Kelly Connell played Carter Pike on I<Picket Fences>, and C. Peck on I<A<Harry's Law|href="../Movies_by_series.pl?series=Harrys+Law">> Q<Onward and Upward>. (Pike &ne; Peck) SMALL<(A<Chicago Hope|href="Chicago_Hope">)>
* The airline from I<LOST> is called Oceanic Airlines. SMALL<(A<Lost in Alias|href="#Lost_in_Alias">)>
** The airline on I<Fringe> Q<The Dreamscape> is called Oceanic Air. (Airlines &ne; Air)
** The airline on I<Castle> Q<In Plane Sight> is called Oceanic Air. (Airlines &ne; Air)
3 They're playing themselves
* George Reeves from I<The Adventures of Superman> appeared on I<I Love Lucy> Q<Lucy and Superman> as himself. He stayed in character for the children. SMALL<(A<I Love Lucy|href="#I_Love_Lucy"> and A<I'm not home!|href="#Im_not_home">)>
* Jon Cryer, Charlie Sheen, and Angus Jones from I<Two and a Half Men> appeared on I<CSI: Crime Scene Investigation> Q<Two and a Half Deaths> as themselves. SMALL<(A<CSI|href="#CSI">)>
