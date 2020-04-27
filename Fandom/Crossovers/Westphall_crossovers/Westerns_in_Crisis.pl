#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../../files/lib';
use Base::Page qw(page story);
use Util::Crossover::LineMagic qw(crossover_magic);

my $magic = crossover_magic( big => ['Westerns in Crisis'], dots => '../../..' );
page( 'code' => sub { story(*DATA, { 'doc magic' => $magic, 'line magic' => $magic }) });

__DATA__
& Westerns in Crisis
2 Disconnecting from Westphall
Several television series in this continuity have been disconnected from Westphall.
3 Holy defenestration, Batman!
from ABC, NBC, and CBS
On I<^Batman (1966)^> (1966) many actors have stuck their heads out of a window while Batman and Robin were climbing a wall. In rare cases, a character would stick his head out of a window. These are not crossovers by my definition, though others include them.
When Bill Dana stuck his head out of a window, he appeared as A<himself|href="index.pl#People_not_considered"> not Jose Jimenez from I<The Bill Dana Show>. A<&#9664;|href="Arriving_to_Westphall.pl#Lucy_Makes_Room_for_Daddy" title="Lucy Makes Room for Daddy">
I<^The Addams Family (1964)^> (1964) was canceled several months prior to Lurch sticking his head out of a window on I<Batman>.
I<Batman> was set in the 60s, so when Colonel Klink from the World War II era's I<Hogan's Heroes> stuck his head out of a window, he was very out of date. A<&#9664;|href="Arriving_to_Westphall.pl#Hooterville" title="Hooterville">
A crossover did not happen when I<^The Green Hornet (1966)^> (1966) and Kato stuck their heads out of a window in season two of I<Batman>. Near the end of season two, there was a crossover when I<The Green Hornet> and Kato appeared on the I<Batman> episodes Q<A Piece of the Action> and Q<Batman's Satisfaction>. I<The Green Hornet> is a nephew of I<The Lone Ranger> in their respective radio shows. The radio shows were by the same company and then made into television series by the same people, so their crossover works.
This continuity is severed from ^TH-DCU^.
3 Two different Dominic Alonzos
It was thought that Dominic Alonzo from I<^Arrow^> Q<The Undertaking> was mentioned on I<^Hawaii Five-0^> Q<Ho'oilina>. However, the Dominic Alonzo from I<Hawaii Five-0> died eight years before the episode Q<Ho'oilina>. With a Dominic Alonzo appearing a year and a half earlier on I<Arrow>, the two men with the same name are not the same man.
2 The Westerns
I<Alias Jesse James> and I<The Gambler Returns: The Luck of the Draw> assembled large groups of western television characters.
I<Alias Jesse James> had appearances by...
* Tonto, played by Jay Silverheels, from I<The Lone Ranger> A<&#9660;|href="Holy_defenestration_Batman" title="Holy defenestration, Batman!">
* Will Kane, played by Gary Cooper, from I<High Noon>
* Annie Oakley, played by Gail Davis, from I<Annie Oakley>
* Wyatt Earp, played by Hugh O'Brian, from I<The Life and Legend of Wyatt Earp>
* Matt Dillon, played by James Arness, from I<Gunsmoke>
* Seth Adams, played by Ward Bond, from I<Wagon Train>
* Bret Maverick, played by James Garner, from I<Maverick>
I<The Gambler Returns: The Luck of the Draw> had appearances by...
* Wyatt Earp, played by Hugh O'Brian, from I<The Life and Legend of Wyatt Earp>
* Cheyenne Bodie, played by Clint Walker, from I<Cheyenne>
* Bart Maverick, played by Jack Kelly, from I<Maverick>
* Lucas and Mark McCain, played by Chuck Connors and Johnny Crawford, from I<The Rifleman>
* Bat Masterson, played by Gene Barry, from I<Bat Masterson>
* Dave Blassingame, played by Brian Keith, from I<The Westerner>
* Kwai Chang Caine, played by David Carradine, from I<Kung Fu>
* Paladin from I<Have Gun - Will Travel> is mentioned
I<Cheyenne> spun off I<Bronco>. I<Gunsmoke> spun off I<Dirty Sally>. I<Maverick> spun off I<Young Maverick> and I<Brett Maverick>. I<The Rifleman> spun off I<Law Of The Plainsman>. I<Kung Fu> spun off I<Kung Fu: The Legend Continues>.
I<The Gambler Returns: The Luck of the Draw> is the fourth film in the series which began with I<Kenny Rogers as The Gambler>. I<Kenny Rogers as The Gambler: The Adventure Continues> and I<Kenny Rogers as The Gambler, Part III: The Legend Continues> preceded I<The Gambler Returns> and I<Gambler V: Playing for Keeps> succeeded it.
This continuity is ^TH-22^ with a few additions.
2 Arrowverse
I<Arrow> spun off I<^The_Flash (2014)^> and I<^Legends of Tomorrow^>. John Constantine from <^Constantine (2014)^> appeared on I<Arrow> Q<Haunted>.
When the titular character from the 2016 I<The Flash> traveled to Earth-2 in Q<Welcome to Earth-2>, the Flash from the 1990 I<^The Flash (1990)^> is seen along with Supergirl. The Trickster and Tina McGee from the 1990 I<The Flash> also appear on the 2016 I<The Flash>. I<The Flash> appeared on I<^Supergirl (2015)^> Q<World's Finest>.
Since the birth of the greater Arrowverse, there have been many events to tie the series together.
A live-action Vixen appeared on I<Arrow> Q<Taken>.
Jefferson Pierce, Black Lightning, appeared on I<The Flash> and I<Legends of Tomorrow>.
* "Flash vs. Arrow" was an event between I<Arrow> and I<The Flash>.
* "Heroes Join Forces" was an event between I<The Flash> and I<Arrow> that lead to I<Legends of Tomorrow>.
* "World's Finest" was an event were Barry Allen from I<The Flash> appeared on I<Supergirl>.
* "Invasion!" was an event between I<The Flash>, I<Arrow>, and I<Legends of Tomorrow> with a quick intoduction on I<Supergirl>.
* "Duet" was an event between I<Supergirl> and I<The Flash>.
* "Crisis of Earth-X" was an event between I<Supergirl>, I<Arrow>, I<The Flash>, and I<Legends of Tomorrow>.
* "Elseworlds" was an event between I<The Flash>, I<Arrow>, and I<Supergirl>.
* "Crisis on Infinite Earths" was an event between I<Supergirl>, I<Batwoman>, I<The Flash>, I<Arrow>, and I<Legends of Tomorrow>. It also brought many other DC properties into the shared multiverse: I<^Batman (1966)^> (1966), I<^Batman (1989)^> (1989), I<^Superman Returns^>, I<^Smallville^>, I<^Birds of Prey^> (2002), I<^Titans^>, the ^DC Extended Universe^, I<^Lucifer^>, I<^Swamp Thing^>, I<^Doom Patrol^>, I<^Stargirl^>, and I<Green Lantern>.
2 Key
& key
* Made for television films will have the color of the network.
* Series with two or more colors were on multiple networks. The main color is the series last network.
