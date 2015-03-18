#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::HTML qw(html story);
use Base::LineMagic qw($line_magic);

html( code => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
This is my film and television tie-in collection.
For books: SPAN<hardcovers|^hardcovers^>, SPAN<trade paperbacks|^trades^>, and SPAN<mass market paperbacks|^massmarkets^>.
For music: SPAN<CDs|^cds^>, SPAN<cassettes|^cassettes^>, SPAN<45s|^ffs^>, and SPAN<LPs|^lps^>.
2 Novels (general)
* I<Burn Notice: The Giveaway|^massmarket^> by Tod Goldberg
* I<Cagney & Lacey|^massmarket^> by Serita Deborah Stevens
* I<The Last Starfigher|^massmarket^> by Allan Dean Foster
* I<The Princess Bride|^massmarket^> by William Goldman
* I<Quantum Leap|^massmarket^> (Book 1) by Ashley McConnell
* I<TekWar|^massmarket^> (Book 1) by William Shatner
2 Soundtracks (general)
* I<Batman|^cd^> (1989)
* I<The Big Chill|^cd^> (1983)
* I<The Breakfast Club|^cassette^> (1985)
* I<Fith Element|^cd^> (1997)
* I<Footloose|^cd^> (1984)
* I<Heavy Metal|^lp^> (1995)
* I<Labyrinth|^cd^> (1986) by David Bowie and Trevor Jones
* I<The Lost Boys|^cd^> (1987) <!-- cassette -->
* I<Miss Congeniality 2 Armed and Fabulous|^cd^> (2005)
* I<Pretty in Pink|^cassette^> (1986)
* I<Pretty Woman|^cd^> (1990)
* I<Rocky IV|^lp^> (1992)
* I<Sahara|^cd^> (2005)
* I<Sound of Music|^cd^> (1965)
* I<St. Elmo's Fire|^cassette^> (1985)
* I<Stargate|^cd^> (1994) by David Arnold
* I<Top Gun|^lp^> (1986)
* I<Twister|^cd^> (1996)
* I<Two of a Kind|^cassette^> (1983)
* I<The Witches of Eastwick|^cd^> (1987)
* I<Xanadu|^lp^> (1980) by Olivia Newton-John and ELO
* I<(I've Had) The Time of My Life/Love Is Strange|^ff^> (1987)
2 Babylon 5
# I<Voices|^massmarket^> by John Vornholt
#5 I<The Touch of Your Shadow, the Whisper of Your Name|^massmarket^> by Neal Barrett Jr.
#6 I<Betrayals|^massmarket^> by S. M. Stirling
2 Doctor Who
* I<The Doctor Who File|^trade^> by Peter Haining
* I<The Time Traveler's Guide|^trade^>
2 Earth 2
# I<Earth 2|^massmarket^> by Melissa Crandell
# I<Puzzle|^massmarket^> by Sean Dalton
2 Ghostbusters soundtracks
* I<Ghostbusters|^cassette^> (1984) by various artists
* I<Ghostbusters II|^cassette^> (1989) by Danny Elfman and others
2 Independence Day
* I<Independence Day|^massmarket^> (1996 novel) by Dean Devlin, Roland Emmerich, and Stephen Molstad
* I<Independence Day|^cd^> (1996 soundtrack) by David Arnold
2 Jurassic Park
* I<The Lost World|^hardcovers^> by Michael Crichten
3 Soundtracks (Jurassic Park)
by John Williams
* I<Jurassic Park|^cd^> (1993)
* I<Jurassic Park:The Lost World|^cd^> (1997)
2 Romy and Michele's High School Reunion soundtracks
by various artists
* I<Romy and Michele's High School Reunion|^cd^> (1997)
* I<More Romy and Michele's High School Reunion|^cd^> (1997)
2 seaQuest DSV
3 Novels (seaQuest)
# I<seaQuest DSV|^massmarket^> by Diane Duane & Peter Morwood
# I<Fire Below|^massmarket^> by Matthew J. Costello
# I<The Ancient|^massmarket^> by David Bischoff
3 Soundtrack (seaQuest)
* I<seaQuest DSV|^cd^> (1995) by John Debney
2 Star Trek
3 Star Trek: The Original Series
#79 I<First Strike|^massmarket^> (Invasion 1) by Diane Carey
3 Star Trek:The Next Generation
4 Novelizations
* I<Star Trek: The Next Generation: All Good Things...|^hardcover^> by Michael Jan Friedman
* I<Star Trek: Generations|^hardcover^> by J. M. Dillard
4 Series (Star Trek:The Next Generation)
#41 I<The Soldier's of Fear|^massmarket^> (Invasion 2) by Dean Wesley Smith & Kristine Kathryn Rusch
#47 I<Q-Space|^massmarket^> (The Continuum) by Greg Cox
4 Starfleet Academy Young Adult
# I<Worf's First Adventure|^trade^> by Peter David
# I<Line of Fire|^trade^> by Peter David
# I<Survival|^trade^> by Peter David
# I<Capture the Flag|^trade^> by John Vornholt
# I<Atlantis Station|^trade^> by V. E. Mitchel
# I<Mystery of the Missing Crew|^trade^> by Michael Jan Friedman
# I<Secret of the Lizard People|^trade^> by Michael Jan Friedman
4 Non-series (Star Trek:The Next Generation)
* Journal (w/Bookmark)
* I<Is Data Human?|^trade^> by Richard Hanley
* I<Make it So|^hardcover^> by Wess Roberts & Bill Ross
* I<Star Trek: The Next Generation Technical Manual|^trade^> by Rick Sternbach & Michael Okuda
* I<Nitpicker's Guide for Next Generation Trekkers Volume II|^trade^>
3 Star Trek: Deep Space Nine
4 Series (Star Trek: Deep Space Nine)
#16 I<Time's Enemy|^massmarket^> (Invasion 3) by L. A. Graf
4 Young Adult
# I<The Star Ghost|^trade^> by Brad Strickland
# I<Stoaways by|^trade^> Brad Strickland
#11 I<Honor Bound|^trade^> (Day of Honor) by Diana G. Gallagher
4 Non-series (Star Trek: Deep Space Nine)
* Journal (w/Bookmark)
3 Star Trek: Voyager
#9 I<The Final Fury|^massmarket^> (Invasion 4) by Dafydd Ab Hugh
* I<Pathways|^hardcover^> by Jeri Taylor
3 Star Trek: Day of Honor
# I<Ancient Blood|^massmarket^> (The Next Generation) by Diane Carey
# I<Armegeddon Sky|^massmarket^> (Deep Space Nine) by L. A. Graf
# I<Her Kilngon Soul|^massmarket^> (Voyager) by Michael Jan Friendman
# I<Treaty's Law|^massmarket^> (Original Series) by Dean Wesley Smith & Kristine Kathryn Rusch
3 Star Trek: New Frontier
by Peter David
# I<Book 1|^massmarket^>
# I<Book 2|^massmarket^>
# I<Book 3|^massmarket^>
# I<Book 4|^massmarket^>
3 Non-fiction (Star Trek)
* I<Federation Travel Guide|^trade^> by Michal Jan Friedman
* I<The Klingon Dictionary|^massmarket^> by Marc Okrand
* I<The Official Star Trek Trivia Book|^massmarket^> by Rafe Needleman
* I<Star Trek Chronology|^trade^> by Michael & Denise Okuda
* I<Star Trek Maps|^trade^>
* I<Star Trek:The Motion Picture: Peel-Off Graphics Book|^trade^> by Lee Cole
* I<Starfleet Academy|^massmarket^> by Diane Carey
3 Soundtracks (Star Trek)
* I<Star Trek: The Motion Picture|^cassette^> (1979) by Jerry Goldsmith
* I<Star Trek II: The Wrath of Kahn|^cassette^> (1982) by James Horner
* I<Star Trek III: The Search for Spock|^cassette^> (1984) by James Horner
* I<Star Trek IV: The Voyage Home|^cd^> (1986) by Leonard Rosenman
* I<Star Trek V: The Final Frontier|^cassette^> (1989) by Jerry Goldsmith
* I<Star Trek VI: The Undiscovered Country|^cassette^> (1991) by Cliff Edelman
* I<Star Trek: Generations|^cd^> (1993) by Dennis McCarthy <!-- cassette -->
* I<Star Trek: First Contact|^cd^> (1996) by Jerry Goldsmith
* I<Star Trek: Insurrection|^cd^> (1998) by Jerry Goldsmith
2 Star Wars
3 Novels (Star Wars)
* I<Splinter in the Mind's Eye|^massmarket^> by Allan Dean Foster
* I<The Truce at Bakura|^hardcover^> by Kathy Tyers
* I<The Courtship of Princess Leia|^hardcover^> by Dave Wolverton
* I<Tales from the Empire|^massmarket^> by Peter Schweighofer, Ed.
4 The Han Solo Adventures
#3 I<Hans Solo and the Lost Legacy|^massmarket^> by Brian Daley
4 Episodes
#4 I<Star Wars|^massmarket^> by George Lucas
# I<The Empire Strikes Back|^massmarket^> by Donald F. Glut
# I<Return of the Jedi|^massmarket^> by James Kahn
4 Thrawn Trilogy
by Timothy Zahn
# I<Heir to the Empire|^hardcover^>
# I<Dark Force Rising|^hardcover^>
# I<The Last Command|^hardcover^>
4 The Black Fleet Crisis
by Michael P. Kube-McDowell
# I<Before the Storm|^massmarket^>
4 The Corellian Trilogy
by Roger Macbride Allen
# I<Ambush at Corellia|^massmarket^>
# I<Assult at Selonia|^massmarket^>
# I<Showdown at Centerpoint|^massmarket^>
4 The Jedi Academy
by Kevin J. Anderson
# I<Jedi Search|^massmarket^>
#3 I<Champions of the Force|^massmarket^>
3 Non-fiction (Star Wars)
* I<Guide to the Star Wars Universe|^trade^> by Bill Slavicsek
3 Soundtracks (Star Wars)
by John Williams
* I<Star Wars|^cd^> (1977) <!-- cassette -->
* I<Star Wars:Empire Strikes Back|^cassette^> (1980)
* I<Star Wars:Return of the Jedi|^cassette^> (1983)
2 The X-Files
3 Novels (The X-Files)
# I<Goblins|^massmarket^> by Charles Grant
#17 I<Ground Zero|^massmarket^> by Kevin J. Anderson
3 Soundtrack (The X-Files)
* I<Truth and the Light-Music from The X-Files|^cd^> (1996) by Mark Snow
2 Xena: Warrior Princess
* I<Xena: Warrior Princess|^cd^> (1996 soundtrack) by Joseph DeLuca
* I<Xena X-Posed|^trade^> by Nadine Crenshaw
</ul>
