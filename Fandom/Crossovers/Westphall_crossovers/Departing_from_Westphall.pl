#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../../files/lib';
use Base::Page qw(page story);
use Util::Crossover::LineMagic qw(crossover_magic);

my $magic = crossover_magic( big => ['Departing from Westphall'], dots => '../../..' );
page( 'code' => sub { story(*DATA, { 'doc magic' => $magic, 'line magic' => $magic }) });

__DATA__
^St. Elsewhere^, the home of Tommy Westphall, crossed into five series: I<Tattingers>, I<Chicago Hope>, I<^Homicide: Life on the Street^>, I<Oz>, and I<Method &amp; Red>. I<Chicago Hope>, I<Homicide: Life on the Street>, and I<Oz> are connected in many ways before and after they crossed with I<St. Elsewhere>.
& Departing from Westphall
>0 STRONG<Notes:>
*| note two
* A &#9660; goes to another section on this page.
* A &#9650; goes to the top page and a specific rule.
* A &#9664; goes to another crossover page.
* A &#9654; goes to a page off of this site.
2 <i>Tattingers</i>
Dr. Elliot Axelrod from I<^St. Elsewhere^> is a cousin of Kenny Axelrod from I<Tattingers>. I<Tattingers> was renamed to I<Nick & Hillary>.
I<Tattingers> did not have any other connections except a name change to I<Nick &amp; Hillary>.
2 <i>Method &amp; Red</i>
Warren Coolidge from I<The White Shadow> appeared in over twenty episodes of I<St. Elsewhere>.A<&#9664;|href="Arriving_to_Westphall#The_White_Shadow" title="The White Shadow"> After joining I<St. Elsewhere>, he appeared in I<Method & Red> Q<Da Shootout>.
2 <i>Chicago Hope</i>
from CBS
Dr. Mark Craig from I<St. Elsewehere> received the Cushing Left Anterior Descending Artery Award on Q<Samuels and the Kid> as did Dr. Kathryn Austin from I<^Chicago Hope^> on Q<Women on the Verge>.
Doctor Phillip Waters from I<Chicago Hope> appeared in I<Picket Fences> Q<Rebels with Causes>.
Doctor Jeffrey Geiger from I<Chicago Hope> accepted a heart from a victim on I<^Homicide: Life on the Street^> Q<A Doll's Eyes>.A<&#9660;|href="Homicide_and_John_Munch" title="Homicide and John Munch">
Doctors Phillip Waters, Keith Wilkes, and Diane Grad from I<Chicago Hope> appeared in I<Early Edition> Q<Mum's the Word>.
3 <i>Picket Fences</i>
Douglas Wambaugh from I<Picket Fences> appeared in I<Chicago Hope> Q<Small Sacrifices>.
I<Picket Fences> Q<Away In A Manger> referenced Delta Glen and events of I<^The X-Files (1993)^> Q<Red Museum> that took place in Delta Glen.A<&#9660;|href="#The_X-Files_Xs" title="The X-Files Xs">
Kelly Connell played Carter Pike on I<Picket Fences> and C. Peck on I<^Harry's Law^> Q<Onward and Upward>. Because Pike &ne; Peck, there was B<no> crossover.
3 <i>Early Edition</i>
I<Early Edition> Q<Play It Again, Sammo> had an appearance of Sammo Law from I<Martial Law>. I<Martial Law> Q<Honor Among Strangers> continues in I<Walker, Texas Ranger> Q<The Day of Cleansing>. I<Walker, Texas Ranger> spun off I<Sons of Thunder>.
2 <i>Homicide: Life on the Street</i>
from NBC, FOX, CBS, TF1 (France), NTV (Russia), ITV (United Kingdom), UPN, HBO, USA Network, and Netflix
Dr. Roxanne Turner from I<^St. Elsewhere^> appeared in I<^Homicide: Life on the Street^> Q<Mercy>.
I<Homicide: Life on the Street> had three crossovers with I<^Law & Order-single^>. I<Law & Order> Q<Charm City> continued in I<Homicide: Life on the Street> Q<For God and Country>. I<Law & Order> was followed by I<Homicide: Life on the Street> in the episodes Q<Baby, It's You> and Q<Sideshow> on both series. Detective John Munch was on I<Homicide: Life on the Street> during those crossovers.
Detective Munch was on I<Homicide: Life on the Street> when he appeared in I<^The X-Files (1993)^> Q<Unusual Suspects>.A<&#9660;|href="#The_X-Files_Xs" title="The X-Files Xs">
Detective John Munch transferred to I<^Law & Order: Special Victims Unit^>.
3 <i>Law &amp; Order</i>
from NBC
Other I<^Law & Order^> crossovers happened around I<Law & Order&#700;s> crossovers with I<^Homicide: Life on the Street^>.
I<Law & Order> and its three spin-offs based in New York city use the fictional newspaper The New York Ledger from I<^Deadline^>. I<^Exiled^> is the only film to spin off from I<Law & Order>. Four spin offs are foreign adaptations with one in Paris, France; two in Moscow, Russia; and one in London, the United Kingdom. It also spun off I<^Law & Order: Los Angeles^>.
Doctor Elizabeth Olivet from I<Law & Order> appeared in I<^New York Undercover^> Q<Smack Is Back>, and Doctor Emil Skoda from I<Law & Order> appeared in I<New York Undercover> Q<Mob Street>.
After Detective John Munch moved to I<^Law & Order: Special Victims Unit^>, he appeared in I<The Beat> Q<They Say It's Your Birthday>, I<Arrested Development> Q<Exit Strategy>A<&#9660;|href="#Wilde_Community_Arrested" title="Wilde Community Arrested">, and I<The Wire> Q<Took>. In I<Luther&#700;s> fifth episode of the first season, John Luther mentions John Munch of I<Law & Order: Special Victims Unit> by name and location.
Deputy Marshall Mary Shannon from I<^In Plain Sight^> appeared in I<^Law & Order: Criminal Intent^> Q<Contract>.
Nicole Wallace, a recurring character on I<Law & Order: Criminal Intent>, appeared in I<Jo> Q<Catacombs> under an assumed name. She is identified by her fingerprints.
There have been three crossovers between I<Law & Order: Special Victims Unit> and the I<^Chicago^> franchise.A<&#9660;|href="#Special_Victims_Unit_in_Chicago" title="Special Victims Unit in Chicago">
3 The X-Files Xs
from FOX, CBS, and ABC
The graves of Nicholas and Diane Salinger from I<Party of Five> are seen on I<^The X-Files (1993)^> Q<Milagro>. I<Party of Five> spun off I<Time of Your Life>.
Frank and Jordan Black from I<^Millennium^> appeared in I<The X-Files> Q<Millennium>.
In I<Strange Luck> Q<Struck by Lightning>, the character of Chance Harper's brother mentions Fox Mulder of I<The X-Files>.
I<The X-Files> spun off I<^The Lone Gunmen^> along with two films and a revival miniseries.
The X Division from I<The X-Files> was mentioned in I<^Fringe^> Q<A New Day in the Old Town>.A<&#9654;|href="http://toobworld.blogspot.com/2009/09/taylor-made-link-for-fringe-x-files.html" title="good reason on toobworld">
I<The X-Files> used the red box A<Morley|href="#Red_box_Morley"> cigarettes often during its run; they became a character of sorts in the series. Morley first appeared in I<Beveryly Hills 90210> and look similar to Marlboro.
4 Fringe
from FOX and ABC
The airline in I<^Fringe^> Q<The Dreamscape> is called A<Oceanic Air|href="Big_fake_companies/Oceanic_Airlines.pl#Oceanic_Air">, the same airline flown by Richard and Alexis Castle in I<^Castle^> Q<In Plane Sight>.
In I<Fringe> Q<Firefly>, Doctor Walter Bishop says he is friends with Doctor Lawrence Jacoby from I<Twin Peaks>. Bishop is wearing the same 3D glasses that Jacoby wears.A<&#9654;|href="http://toobworld.blogspot.com/2011/01/linkin-case-fringe-twin-peaks.html" title="a good reason on toobworld">
I<Twin Peaks> spun off I<Twin Peaks: Fire Walk with Me> and a 2017 revival with the same name. Dr. Jacoby from I<Twin Peaks> appeared on I<General Hostpital>. Red box Morley cigarettes appeared in Q<Part 5> of the revival.
I<General Hostpital> is part of the ABC Soap Opera Universe that includes ten series. I am not going to try to unravel all of the crossovers between them.
* I<General Hospital> spun off I<The Young Marrieds>, I<Port Charles>, and I<General Hospital: Night Shift>.
* I<One Life to Live>
* I<All My Children>
* I<Loving> spun off I<The City>.
* I<Ryan's Hope>
* I<What If...>
3 Wilde Community Arrested
from FOX and NBC
The Bluth Company from I<Arrested Development> appeared in I<Running Wilde> Q<The Pre-Nup>. The Wilde Oil company from I<Running Wilde> appeared in I<Community> Q<The Psychology of Letting Go>.
3 Special Victims Unit in Chicago
from NBC and CBS
The I<^Chicago^> franchise started with I<^Chicago Fire^>, which spun off I<^Chicago P.D.^> and I<^Chicago Med^>. I<Chicago P.D.> spun off I<^Chicago Justice^>.
Erin Lindsay from I<Chicago P.D.> appeared in I<^Law & Order: Special Victims Unit^> Q<Comic Perversion>. On the same night, Odafin 'Fin' Tutuola and Amanda Rollins from I<Law & Order: Special Victims Unit> appeared in I<Chicago P.D.> Q<Conventions>.
The following year I<Chicago Fire> Q<Nobody Touches Anything> continued on I<Law & Order: Special Victims Unit> Q<Chicago Crossover> and ended on I<Chicago P.D.> Q<They'll Have To Go Through Me>.
Another three way crossover started with I<Chicago Fire> Q<We Called Her Jellybean>, continued on I<Chicago P.D.> Q<The Number of Rats>, and ended on I<Law & Order: Special Victims Unit> Q<Daydream Believer>.
I<Law & Order: Special Victims Unit> Q<Nationwide Manhunt> ended on I<Chicago P.D> Q<The Song of Gregory William Yates>.
Detective Hailey Upton from I<Chicago P.D.> appeared in I<^FBI-single^> Q<Emotional Rescue>. I<FBI> spun off I<^FBI: Most Wanted^>.
2 <i>Oz</i>
I<St. Elsewhere> has two connections to I<Oz>, the fictional Weigert Medical Corporation and the character R.N. Carol Grace.
I<Oz> is connected to I<^Homicide: The Movie^> and I<The Beat> through the fictional children's television program, I<Miss Sally's Schoolyard>.
2 Red box Morley
from various networks
A<Red box Morley|href="../Big_fake_companies/Morley.pl#Red_box_Morley"> cigarettes&#700; first known appearance is in I<Beverly Hills, 90210> Q<The Back Story>. They can be seen in the following series. Only the first appearance is listed.
*| two
* I<Beverly Hills, 90210> Q<The Back Story>. (FOX) A<&#9660;|href="#Beverly Hills" title="Beverly Hills">
* I<^The X-Files (1993)^> (FOX) A<&#9660;|href="#The_X-Files_Xs" title="The X-Files Xs">
* I<^Space: Above and Beyond^> Q<Ray Butts> (FOX)
* I<^Buffy the Vampire Slayer (1997)^> Q<School Hard> (The WB and UPN) A<&#9660;|href="#Weyland-Yutani" title="Weyland-Yutani">
* I<^Nash Bridges^> Q<Power Play> (CBS)
* I<That '70s Show> Q<Eric Gets Suspended>. (FOX)
** I<That '70s Show> spun off I<That '80s Show>.
* I<Becker> Q<Santa On Ice> (CBS) A<&#9664;|href="#Murphy_Brown" title="Murphy Brown">
* I<Malcolm in the Middle> Q<Stock Car Races> (FOX)
* I<^Special Unit 2^> Q<The Grain> (UPN)
* I<Touched by an Angel> Q<Song for My Father> (CBS) A<&#9664;|href="#Lucys_Diagnosis" title="Lucy&#700;s Diagnosis">
* I<^ER^> "Beyond Repair". (NBC) A<&#9660;|href="#ETM" title="ETM">
* I<^Jake 2.0^> Q<Arms and the Girl> (UPN)
* I<Cold Case> Q<The Plan> (CBS) A<&#9660;|href="#CSI" title="CSI">
* I<Everybody Hates Chris> Q<Everybody Hates Playboy> (UPN/The CW)
* I<Huff> Q<Radio Silence> (Showtime)
* I<CSI: Crime Scene Investigation> Warrick Brown smokes Morleys. (CBS) A<&#9660;|href="#CSI" title="CSI">
* I<^Criminal Minds-single^> Q<North Mammon>. (CBS) A<&#9660;|href="#Criminal_Minds" title="Criminal Minds">
* I<^Prison Break-single^> Q<Bolshoi Booze>. (FOX) A<&#9660;|href="#Prison_Break" title="Prison Break">
* I<Breaking Bad> pilot. (AMC) A<&#9660;|href="#Breaking_Dead" title="Breaking Dead">
* I<^Medium^> Q<To Have and to Hold> (NBC and CBS) A<&#9660;|href="#The_Montecito_Resort_and_Casino" title="The Montecito Resort and Casino">
* I<^New Amsterdam^> Q<Love Hurts> (FOX)
* I<^Reaper^> Q<The Devil and Sam Oliver> (The CW)
* I<Saving Grace> Q<It's a Fierce, White-Hot, Mighty Love> (TNT)
* I<Sordid Lives: The Series> Q<Pills, Poison and Penises> (Logo)
** It is a prequel series to I<Sordid Lives>.
* I<^Burn Notice^> Q<Scatter Point> (USA Network)
** I<Burn Notice> spun off I<Burn Notice: The Fall of Sam Axe>.
* I<^Pushing Daisies^> Q<Bad Habits> (ABC) A<&#9660;|href="#Fullerverse" title="The Fullerverse">
* I<^Heroes-single^> Q<One of Us, One of Them> (NBC) A<&#9660;|href="#The_Montecito_Resort_and_Casino" title="The Montecito Resort and Casino">
* I<Californication> Q<The Raw & the Cooked> (Showtime)
* I<United States of Tara> pilot (Showtime)
* I<24> Q<Day 8: 9:00 p.m. — 10:00 p.m.>. (FOX) A<&#9660;|href="#twenty-four" title="24">
* I<American Horror Story: Murder House> Q<Birth> (FX)
* I<^Lost^> Q<LA X> (ABC) A<&#9660;|href="#Lost_in_Alias" title="Lost in Alias">
* I<Justified> Q<Riverbrook> (FX)
** I<Justified> crossed with I<Karen Sisco>. (ABC)
* I<^NCIS-single^> Q<Freedom> A<&#9660;|href="#JAG_and_NCIS" title="JAG and NCIS">
* I<The Middle> Q<The Map> (ABC)
* I<Shameless> Q<I'll Light a Candle for You Every Day> (Showtime)
* I<^Warehouse 13^> Q<The Ones You Love> (SyFy) A<&#9660;|href="#Monday_night_on_Syfy" title="Monday night on Syfy">
* I<The World's End>
* I<Kingdom> Q<Please Refrain from Crying> (Audience Network)
* I<^The Walking Dead^> Q<Save the Last One> (AMC) A<&#9660;|href="#Breaking_Dead" title="Breaking Dead">
* I<Twin Peaks> (2017) Q<Part 5> (Showtime) A<&#9660;|href="#Fringe" title="Fringe">
* I<Wisdom of the Crowd> Q<Root Directory> (CBS)
3 Beverly Hills
from FOX and The CW
I<Beverly Hills 90120> spun off I<Melrose Place> and I<90210>. I<Melrose Place> spun off I<Models, Inc.> and I<Melrose Place> (2009).
3 ETM
from NBC
I<^ER^> Q<Brothers and Sisters> and I<^Third Watch^> Q<Unleashed> crossed when Doctor Susan Lewis on I<ER> got a call from her sister which prompts her to go to New York where she meets Detective Faith Yokas of I<Third Watch>. Doctor Susan Lewis of I<ER> and Detective Faith Yokas of I<Third Watch> are in both episodes.
I<Third Watch>> Q<In the Family Way> and I<^Medical Investigation^> Q<Half Life> cross when an outbreak of Marburg brings the NIH team to New York. Doctors Stephen Connor and Natalie Durant from I<Medical Investigation> appeared in I<Third Watch> and Detective Faith Yokas, Carlos Nieto, and Holly Levine from I<Third Watch> appeared in I<Medical Investigation>.
Detective Faith Yokas is the only character to have been on all three series.
3 CSI
from CBS and FOX
I<CSI: Crime Scene Investigation> has three spin-offs I<CSI: Miami>, I<CSI: NY>, and I<CSI: Cyber>. The I<CSI: Crime Scene Investigation> episode Q<Who and What> concluded in the I<Without a Trace> episode Q<Where and Why>. Detective Scotty Valens from I<Cold Case> appeared in I<CSI:NY> Q<Cold Reveal>.
I<CSI: Crime Scene Investigation> Q<The Lost Girls> and I<^Bones^> Q<The Woman in the Sand> both mention the fictional Tangiers hotel. I<Bones> spun off I<^The Finder^>.
I<Bones> Q<The Resurrection in the Remains> crossed over with I<Sleepy Hollow> Q<Dead Men Tell No Tales>.
There was B<no> crossover when Jon Cryer, Charlie Sheen, and Angus Jones from I<Two and a Half Men> appeared as themselves on I<CSI: Crime Scene Investigation> Q<Two and a Half Deaths>.A<&#9650;|href="index.pl#People_not_considered" title="people not considered"> A<&#9664;|href="Exiting_Westphall.pl#Two_and_a_Half" title="Two and a Half">
3 Criminal Minds
from CBS
I<^Criminal Minds-single^> spun off I<^Criminal Minds: Suspect Behavior^> and I<^Criminal Minds: Beyond Borders^>.
3 Prison Break
from FOX and A&E
I<^Prison Break-single^> spun off I<^Prison Break: Proof of Innocence^> and I<^Breakout Kings^>.
3 Breaking Dead
from AMC
The blue meth from I<Breaking Bad> appeared in I<^The Walking Dead^> Q<Bloodletting>. I<Breaking Bad> spun off I<Better Call Saul>. I<The Walking Dead> spun off I<Fear the Walking Dead>, however it is not contiguous with I<The Walking Dead>.
3 Fullerverse
from ABC, Showtime, FOX, and NBC
Happy Time Temp Agency from I<^Dead Like Me^> was mentioned on I<^Pushing Daisies^> Q<Bzzzzzzzzz!>. I<Dead Like Me> spun off I<Dead Like Me: Life After Death>.
Marianne Marie Beetle from I<^Wonderfalls^> Q<Muffin Buffalo> appeared in I<Pushing Daisies> Q<Comfort Food> and I<Mockingbird Lane>.
Gretchen Speck-Horowitz from I<Wonderfalls> appeared in I<^Hannibal (2013)^> Q<Amuse-bouche> under her maiden name Gretchen Speck.
3 24
from FOX, Showtime, and FX
I<24> spun off I<24: Live Another Day> and I<24: Legacy>. I<24> uses a fake news company known as CNB. CNB has appeared in I<Homeland> "The Star" and in I<Tyrant> second season. Howard Gordon worked on I<24> and helmed the latter two series.
3 Lost in Alias
from ABC and NBC
I<^Lost^> introduced the fictional A<Oceanic Airlines|href="Big_fake_companies/Oceanic_Airlines.pl">. The airline and its logo appeared in I<^LAX^> Q<Senator's Daughter>, I<^FlashForward^> Q<No More Good Days>, and I<^Once Upon a Time^> Q<The Stranger>. Oceanic Airlines flight 815 from I<Lost> was mentioned in I<^Chuck^> Q<Chuck Versus the Helicopter>, however the details around its destruction were inaccurate.A<&#9654;|href="http://www.televisioncrossoveruniverse.com/2011/01/what-chuck-how-this-actioncomedy-fits.html" title="a good reason on the Television Crossover Universe">
I<Once Upon a Time> spun off I<^Once Upon a Time in Wonderland^>.A<&#9660;|href="#Star_Wars_and_Trek" title="Star Wars and Trek">
L.A.P.D. Police Sergeant Al Powell first appeared in I<^Die Hard^> and then again in I<Die Hard 2>. He reappeared almost two decades later in I<Chuck> Q<Chuck Versus Santa Claus>. I<Die Hard> had three more sequels.
I<Lost> Q<Raised by Another> was the first appearance of A<Gannon Car Rentals|href="Big_fake_companies#Gannon_Car_Rentals">. It appeared in I<Nip/Tuck> Q<Conor McMamara, 2026>, I<^Heroes-single^> Q<The Fix>A<&#9660;|href="#The_Montecito_Resort_and_Casino" title="The Montecito Resort and Casino">, and I<Glee> Q<The New Rachel>.
I<Lost> had two minor crossovers with I<^Alias^>. The fictional band Driveshaft from I<Lost> got a minor mention in I<Alias> Q<Authorized Personnel Only> part 2. The flight that got lost in I<Lost> was mentioned in I<Alias> Q<A Clean Conscience>.
I<Alias> introduced the fictional Credit Dauphine bank, and it appeared in I<Eli Stone> Q<The Path>.
A<Slusho!|href="Big_fake_companies#Slusho"> was introduced in I<Alias> Q<So It Begins>. It appeared in I<Heroes> Q<Cautionary Tales> and Q<Truth or Consequences>, I<Cloverfield>, I<^Fringe^> Q<The Road Not Taken> and Q<A Better Human Being>A<&#9660;|href="#Fringe" title="Fringe">, I<^Star Trek (2009)^> (2009)A<&#9660;|href="#Star_Wars_and_Trek" title="Star Wars and Trek">, and I<Super 8>.
You can read more about A<Oceanic Airlines|href="Big_fake_companies/Oceanic_Airlines.pl"> and find out why some do not cross over with I<Lost>.
3 JAG and NCIS
from CBS, NBC, and ABC
I<^JAG^> was on NBC for one season before moving to CBS. It had been severed from Westphall because it used stock footage of A<Oceanic Airlines|href="../Big_fake_companies/Oceanic_Airlines#Stock_footage"> from the film I<Executive Decision> not the logo from I<Lost>. However, it later reentered Westphall through its spinoff I<^NCIS-single^>.
Secretary of the Navy Edward Sheffield from I<JAG> first appeared in ^First Monday6 in three episodes when he was a senator.
I<JAG> Q<Ice Queen> and Q<Meltdown> were the backdoor pilot for I<NCIS>.
I<NCIS> two-part Q<Legend> was the backdoor pilot to I<^NCIS: Los Angeles^>. I<NCIS> two-part Q<Crescent City> was the backdoor pilot to I<^NCIS: New Orleans^>.
Kensi Blye from I<NCIS: Los Angeles> appeared in I<^Hawaii 5-0^> Q<Ka Hakaka Maika'i>. G. Callen and Sam Hannah from I<NCIS: Los Angeles> appeared in I<Hawaii 5-0> Q<Pa Make Loa> which concluded on I<NCIS: Los Angeles> Q<Touch of Death> with Daniel Williams and Chin Ho Kelly from I<Hawaii 5-0> appearing.
Hetty Lange from I<NCIS: Los Angeles> appeared in I<^Scorpion^> Q<True Colors>.
Chin Ho Kelly, Kono Kalakaua, and Kamekona from I<Hawaii 5-0> appeared in I<^MacGyver (2016)^> "Flashlight". I<MacGyver> is a reboot of the ABC series of the same name.
I<Hawaii 5-0> got a mention in I<^Magnum P.I. (2018)^> (2018) Q<I Saw the Sun Rise>, then Kamekona from I<Hawaii 5-0> appeared in Q<From the Head Down>. Later there was a two-part crossover with I<Hawaii 5-0> Q<Ihea 'oe i ka wa a ka ua e loku ana?> continuing on I<Magnum P.I.> Q<Desperate Measures>.
4 Original series crossovers
from CBS
I<Hawaii 5-0> (2010) is a remake of I<^Hawaii Five-O^>. I<MacGyver> (2016) is a remake of I<MacGyver>. I<Magnum P.I.> (2018) is a remake of I<^Magnum P.I.^>.
Steve McGarrett of I<Hawaii 5-O> was mentioned by Thomas Magnum in I<Magnum P.I.> Q<Skin Deep>.
I<Magnum P.I.> Q<Ki'is Don't Lie> ends on I<^Simon & Simon^> Q<Emeralds Are Not a Girl's Best Friend>.
I<Magnum P.I.> Q<Novel Connection> ends on I<^Murder, She Wrote^> Q<Magnum on Ice>.
A.J. Simon from I<Simon & Simon> appeared in I<^Whiz Kids^> Q<Deadly Access>, then Richie and Irene Adler of I<Whiz Kids> appeared in I<Simon & Simon> Q<Fly the Alibi Skies>.
I<Murder, She Wrote> spun off I<^The Law & Harry McGraw^> and four television films.
This continuity is ^TH-16^ but has not been verified as part of Westphall.A<&#9664;|href="Exiting_Westphall.pl#Hudson_University" title="Hudson University">
4 Hawaii Five-Oh-No!
from CBS
I<Hawaii 5-0> used footage from I<Hawaii Five-O> Q<Wooden Model of a Rat> in its episode Q<Kalele> when Ed Asner reprised his character August March. The back story of the newer August March is different from the story in the original.
Another crossover was attempted between I<Hawaii 5-0> and A<I<Arrow>|href="Westerns_in_Crisis">. In I<Arrow> Q<The Undertaking>, there was a character named Dominic Alonzo. In I<Hawaii 5-0> Q<Ho'oilina> there was a character with the same name. However, since the Dominic in I<Hawaii 5-0> dying eight years prior to the episode and the Dominic in I<Arrow> being a year and a half earlier; they are not the same character.
3 Monday night on Syfy
from SyFy
I<^EUReKA^>, I<^Warehouse 13^>, and I<^Alphas^> aired on SyFy on Monday nights together.
I<EURSUP<e>KA> and I<Warehouse 13> had three crossovers. Douglas Fargo from I<EURSUP<e>KA> appeared in I<Warehouse 13> Q<13.1>. Claudia Donovan from I<Warehouse 13> appeared in I<EURSUP<e>KA> Q<Crossing Over>. Douglas Fargo also appeared in I<Warehouse 13> Q<Don't Hate the Player>.
Dr. Vanessa Calder, who recurred on I<Warehouse 13>, appeared in I<Alphas> Q<Never Let Me Go>.
2 Weyland-Yutani
from The WB; FOX; NBC; and Showtime
A<Weyland-Yutani|href="Big_fake_companies#Weyland=Yutani"> is the greedy corporation from the I<^Alien^> series. It is mentioned as a client of the evil law firm Wolfram & Hart on I<^Angel^> Q<Harm's Way>. I<Angel> spun off from I<^Buffy the Vampire Slayer (1997)^>.
A M41A Pulse Rifle and USCM Smart Gun from I<Aliens> appeared in I<Soldier>. The soldier's service record shows he fought in the battles of Tannhauser Gate and Shoulder of Orion from I<Blade Runner>, also the spinners from I<Blade Runner> appeared in I<Soldier>. I<Blade Runner> is followed by I<Blade Runner 2049>.
A Narcissus escape shuttle built by Weyland-Yutani from I<Alien>, a Klingon Bird of Prey from I<^Star Trek^>, and the Eagle from I<^Space: 1999^> appeared in I<Red Dwarf> Q<Psirens> in a shipyard of derelict ships.A<&#9660;|href="#Doctor_Who" title="Doctor Who"> Weyland-Yutani's logo and an Imperial shuttle from I<^Star Wars^> appeared in I<^Firefly-single^> Q<Serenity>. A Holnist patch from I<The Postman> can be seen on the shoulder of a dock worker on the I<Firefly> film I<^Serenity^>.
A Firefly class ship appeared in the I<^Battlestar Galactica (2003)^> (2003) miniseries. A Constitution class ship from I<Star Trek> appeared in I<^Battlestar Galactica (2004)^> (2004) Q<Daybreak>.
Buffy Summers from I<Buffy the Vampire Slayer> worked at the Doublemeat Palace owned by Guy Halveston, whose murder was investigated by I<^Andy Barker, P.I.^> in Q<Fairway, My Lovely>. The Doublemeat Palace was previously mentioned in I<Dexter> Q<Truth Be Told>.
The I<^Alien vs. Predator^> series serves as a prequel to the I<Alien> series and a sequel to the I<^Predator^> series. (The film I<Predators> is not part of the I<Alien vs. Predator> series.)
3 Star Wars and Trek
from NBC, UPN, ABC, and syndication
Before an Imperial shuttle from I<^Star Wars^> was seen in I<^Firefly^> Q<Serenity>, R2-D2 and C3PO were shown on a column in Egypt in I<^Raiders of the Lost Ark^>. Then the Millennium Falcon appeared in I<Spaceballs> and later in I<^Star Trek: First Contact^>. R2-D2 went on to appear briefly in I<^Star Trek (2009)^> (2009)A<&#9660;|href="#Lost_in_Alias" title="Lost in Alias">, I<^Star Trek Into Darkness^>, and I<^Transformers: Revenge of the Fallen^>.
The shuttle craft A<Indiana Jones|href="../../../Movies/Movies_by_series.pl?series=The+Adventures+of+Indiana+Jones"> appeared in I<^Star Trek: The Next Generation^> Q<Evolution>. The I<San Francisco Register> from I<Journeyman> was the place of employment for Dan Vasser, and it appeared in I<Star Trek: The Next Generation> Q<Time's Arrow>.
Dr. Jackson Roykirk, introduced on I<Star Trek> Q<The Changeling>, appeared in I<^Team Knight Rider^> Q<Apocalypse Maybe>. I<Team Knight Rider> spun off from I<^Knight Rider (1982)^>.A<&#9660;|href="#The_Montecito_Resort_and_Casino" title="The Montecito Resort and Casino">
The alien species from I<E.T. The Extra-Terrestrial> appeared in I<Star Wars: The Phantom Menace>.
The sarlacc from I<Star Wars: Return of the Jedi> was mentioned in I<^Once Upon a Time in Wonderland^> Q<Forget Me Not>.A<&#9660;|href="#Lost_in_Alias" title="Lost in Alias">
3 Doctor Who
from the BBC, CBBC, ITV, Disney, Nickelodeon, and TNT
Before various space ships appeared in I<Red Dwarf>, the TARDIS from I<^Doctor Who (1963)^> appeared in I<Red Dwarf> Q<Marooned> in the hanger of the ship. The TARDIS went on to appear in I<Chelmsford 123> Q<Arrivederci Roma>, I<Sherlock> Q<The Hounds of Baskerville>, and I<^The Librarians^> Q<And the Final Curtain>. Doc Brown's DeLorean from I<^Back to the Future^> also appeared in Q<And the Final Curtain>.
Gallifrey from I<Doctor Who> was mentioned by location and name on I<Rangers Lost Galaxy> Q<Green Courage>. Prior to that, the Teenage Mutant Ninja Turtles from I<Ninja Turtles: The Next Mutation> appeared in I<Power Rangers in Space> Q<Shell Shocked>.
Arthur Dent from I<The Hitchhiker's Guide to the Galaxy> was mentioned in I<^Doctor Who (2005)^> Q<The Christmas Invasion>. I<Doctor Who> has five spin-offs.
SMALL<STRONG<Note:> The I<Power Rangers> and I<Teenage Mutant Ninja Turtles> are so convoluted, I'm not going to try to detangle them.>
2 The Montecito Resort and Casino
from NBC, ABC, and BBC Two
The A<Montecito Resort and Casino|href="Big_fake_companies#The_Montecito_Resort_and_Casino"> was introduced in I<^Las Vegas^>. When a network has a series that is set in a casino, every time another series needed one, you can guess where they went, in this case the Montecito.
I<^Crossing Jordan^> crossed over with I<Las Vegas> on several occassions. I<Crossing Jordan> Q<What Happens in Vegas Dies in Boston> continued in I<Las Vegas> Q<Two of a Kind>. I<Crossing Jordan> Q<Luck Be a Lady> continued in I<Las Vegas> Q<Double Down, Triple Threat>. There were episodes of each series which had appearances by characters from the other that did not share a story line with the other that week. Jordan Cavanaugh and Woody Hoyt of I<Crossing Jordan> appeared in I<Las Vegas> Q<History of Violins>. Danny McCoy of I<Las Vegas> appeared in I<Crossing Jordan> Q<Crazy Little Thing Called Love>.
On I<Las Vegas> Q<The Story Of Owe>, the fictional company Dunder-Mifflin from I<The Office> (U.S.) is mentioned. After the the people from Dunder-Mifflin went to the Montecito off screen, David Brent from I<The Office> (U.K.) appeared in I<The Office> (U.S.) Q<The Seminar>. The Sergio Georgini fashon line from I<The Office> Q<Party> (U.K.) appeared in I<It's Always Sunny in Philadelphia> Q<A Very Sunny Christmas>.
The I<Passions> 20 and 23 May 2005 episodes were set in the Montecito with Mary Connell from I<Las Vegas> appearing. Before characters from I<Passions> gambled at the Montecito, Dr. Bombay from I<^Bewitched^> appeared in I<Passions> on 17 September 1999. I<Bewitched> spun off I<Tabitha> and a non-contiguous film of the same name.
On I<^Medium^> Q<Method to His Madness>, Allison Dubois was dreaming about a person who was gambling at the Montecito.
On I<^Heroes^> Q<Collision>, the characters Hiro Nakamura and Ando Masahashi gamble at the Montecito. I<Heroes> spun off I<Heroes Reborn>.A<&#9660;|href="#Lost_in_Alias" title="Lost in Alias">
On I<^Knight Rider (2008 film)^>, the 2008 film, the characters Mike Traceur and Sarah Graiman met in the Montecito. Before Mike and Sarah met at the Montecito, the original I<^Knight Rider (1982)^> series two part episode Q<Mouth of the Snake> introduced the character David Dalton who would go onto his own series I<^Code of Vengeance^>.A<&#9660;|href="#Star_Wars_and_Trek" title="Star Wars and Trek">
A crossover was attempted between I<Las Vegas> and I<Monk>, however, the casino in Q<Mr. Monk Goes to Vegas> was called the Monticello not Montecito.
Are witches heroes? Are heroes witches? Is the fictional Allison Dubois a witch, hero, or both?
2 Key
& key
* Made for television films will have the color of the network.
* Series with two or more colors were on multiple networks. The main color is the series last network.
