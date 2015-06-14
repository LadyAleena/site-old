#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);
use HTML::Elements qw(list);
use People qw(get_people);

my $doc_magic = {
  'producers and directors' => sub { list(3, 'u', get_people('Producers_and_directors.txt'), { 'class' => 'three' }) },
  'film actors' => sub { list(3, 'u', get_people('Actors_in_films.txt'),      { 'class' => 'three' }) },
};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic, 'line magic' => $line_magic }) });

__DATA__
This is my movie collection of SPAN<blu-rays|^bd^>, SPAN<DVDs|^dvd^>, and SPAN<VHSs|^vhs^>.
2 Films
*| two
* I<50 First Dates|^dvd^> (2004)
* I<2012|^bd^> (2009)
* I<The Abyss|^dvd^> (1989)
* I<Accepted|^dvd^> (2006)
* I<The Adventure of Sherlock Holmes' Smarter Brother|^dvd^> (1975)
* I<The Adventures of Ford Fairlane|^dvd^> (1990)
* I<The Adventures of Pluto Nash|^dvd^> (2002)
* I<America's Sweethearts|^dvd^> (2001)
* I<The American President|^dvd^> (1995)
* I<Anastasia|^dvd^> (1997)
* I<Armageddon|^dvd^> (1998)
* I<As Good as It Gets|^dvd^> (1997)
* I<The Avengers|^dvd^> (1998)
* I<Baby Boom|^dvd^> (1987)
* I<The Beastmaster|^dvd^> (1982)
* I<The Big Chill|^dvd^> (1983)
* I<Big Fish|^dvd^> (2003)
* I<Big Trouble|^dvd^> (2002)
* I<Big Trouble in Little China|^dvd^> (1986)
* I<Bill Cosby: Himself|^vhs^> (1983)
* I<The Black Hole|^dvd^> (1979)
* I<Blast from the Past|^dvd^> (1999)
* I<Blazing Saddles|^dvd^> (1974)
* I<The Boy Who Could Fly|^dvd^> (1986)
* I<The Breakfast Club|^dvd^> (1985)
* I<The Breed|^dvd^> (2001)
* I<The Brothers Grimm|^dvd^> (2005)
* I<Bruce Almighty|^dvd^> (2003)
* I<Casper|^dvd^> (1995)
* I<Cinderella|^dvd^> (1950)
* I<Class Action|^dvd^> (1991)
* I<Clockstoppers|^dvd^> (2002)
* I<Clue|^dvd^> (1985)
* I<Connie and Carla|^dvd^> (2004)
* I<Constantine|^dvd^> (2005)
* I<Contact|^dvd^> (1997)
* I<The Core|^dvd^> (2003)
* I<Cross Creek|^dvd^> (1983)
* I<Dante's Peak|^dvd^> (1997)
* I<Dark City|^dvd^> (1998)
* I<The Dark Crystal|^dvd^> (1982)
* I<Dave|^dvd^> (1993)
* I<The Day After Tomorrow|^dvd^> (2004)
* I<Daylight|^dvd^> (1996)
* I<Dead Poets Society|^dvd^> (1989)
* I<Dear God|^dvd^> (1996)
* I<Death Becomes Her|^vhs^> (1992)
* I<Deep Impact|^dvd^> (1998)
* I<Dirty Dancing|^dvd^> (1987)
* I<A Dog's Breakfast|^dvd^> (2007)
* I<Dragonslayer|^dvd^> (1981)
* I<Drive Me Crazy|^dvd^> (1999)
* I<Dune|^bd^> (1984)
* I<E.T.: The Extra-Terrestrial|^dvd^> (1982)
* I<Earth Girls Are Easy|^dvd^> (1988)
* I<Eight Legged Freaks|^dvd^> (2002)
* I<Enemy Mine|^dvd^> (1985)
* I<Erin Brockovich|^dvd^> (2000)
* I<Eulogy|^dvd^> (2004)
* I<Evolution|^dvd^> (2001)
* I<The Fifth Element|^dvd^> (1997)
* I<Finding Forrester|^dvd^> (2000)
* I<First Daughter|^dvd^> (2004)
* I<The First Wives Club|^dvd^> (1996)
* I<Flash Gordon|^dvd^> (1980)
* I<Flashdance|^dvd^> (1983)
* I<Flatliners|^dvd^> (1990)
* I<Fly Away Home|^dvd^> (1996)
* I<Fools Rush In|^dvd^> (1997)
* I<Footloose|^dvd^> (1984)
* I<The Frighteners|^dvd^> (1996)
* I<Galaxina|^dvd^> (1980)
* I<Galaxy Quest|^dvd^> (1999)
* I<The Golden Child|^dvd^> (1986)
* I<Good Advice|^dvd^> (2001)
* I<The Goonies|^dvd^> (1985)
* I<Hanging Up|^dvd^> (2000)
* I<Heartbreak Ridge|^dvd^> (1986)
* I<Heavy Metal|^dvd^> (1981)
* I<High Spirits|^dvd^> (1988)
* I<Highlander|^dvd^> (1986)
* I<The Hitchhiker's Guide to the Galaxy|^dvd^> (2005)
* I<The Holiday|^dvd^> (2006)
* I<Hollywood Homicide|^dvd^> (2003)
* I<Home Fries|^dvd^> (1998)
* I<HouseSitter|^dvd^> (1992)
* I<The Hunt for Red October|^dvd^> (1990)
* I<I Love Trouble|^dvd^> (1994)
* I<The Ice Pirates|^dvd^> (1984)
* I<If Lucy Fell|^dvd^> (1996)
* I<Independence Day|^dvd^> (1996)
* I<Joe Versus the Volcano|^dvd^> (1990)
* I<Jumanji|^dvd^> (1995)
* I<Kull the Conqueror|^dvd^> (1997)
* I<Labyrinth|^dvd^> (1986)
* I<Ladyhawke|^dvd^> (1985)
* I<The Lake House|^dvd^> (2006)
* I<The Last Castle|^dvd^> (2001)
* I<The Last Starfighter|^dvd^> (1984)
* I<Laws of Attraction|^dvd^> (2004)
* I<The League of Extraordinary Gentlemen|^dvd^> (2003)
* I<Liar Liar|^dvd^> (1997)
* I<The Librarian: Quest for the Spear|^dvd^> (2004)
* I<The Lion King|^dvd^> (1994)
* I<The Long Kiss Goodnight|^dvd^> (1996)
* I<Love Actually|^dvd^> (2003)
* I<Made in America|^vhs^> (1993)
* I<The Majestic|^dvd^> (2001)
* I<Mamma Mia!|^dvd^> (2008)
* I<Mary Reilly|^dvd^> (1996)
* I<The MatchMaker|^dvd^> (1997)
* I<McHale's Navy|^dvd^> (1997)
* I<Medicine Man|^dvd^> (1992)
* I<Mr. &amp; Mrs. Smith|^dvd^> (2005)
* I<Mr. Holland's Opus|^dvd^> (1995)
* I<Mrs. Winterbourne|^vhs^> (1996)
* I<Music and Lyrics|^dvd^> (2007)
* I<My Big Fat Greek Wedding|^dvd^> (2002)
* I<My Cousin Vinny|^dvd^> (1992)
* I<My Stepmother Is an Alien|^dvd^> (1988)
* I<Mystery Men|^dvd^> (1999)
* I<The Name of the Rose|^dvd^> (1986)
* I<The NeverEnding Story|^dvd^> (1984)
* I<Night of the Comet|^dvd^> (1984)
* I<Night of the Twisters|^dvd^> (1996)
* I<Notting Hill|^dvd^> (1999)
* I<One Fine Day|^dvd^> (1996)
* I<Oscar|^dvd^> (1991)
* I<Outbreak|^dvd^> (1995)
* I<Overboard|^dvd^> (1987)
* I<Pacific Rim|^bd^> (2013)
* I<Pay It Forward|^dvd^> (2000)
* I<The Peacemaker|^dvd^> (1997)
* I<The Postman|^dvd^> (1997)
* I<Powder|^dvd^> (1995)
* I<Pretty Woman|^dvd^> (1990)
* I<Pretty in Pink|^dvd^> (1986)
* I<The Princess Bride|^dvd^> (1987)
* I<The Producers|^dvd^> (2005)
* I<Race to Witch Mountain|^bd^> (2009)
* I<Reign of Fire|^dvd^> (2002)
* I<Renaissance Man|^dvd^> (1994)
* I<The Replacements|^dvd^> (2000)
* I<Repo! The Genetic Opera|^dvd^> (2008)
* I<Return to Me|^dvd^> (2000)
* I<The Rocky Horror Picture Show|^dvd^> (1975)
* I<Romy and Michele's High School Reunion|^dvd^> (1997)
* I<Sahara|^dvd^> (2005)
* I<The Secret of NIMH|^bd^> (1982)
* I<Short Circuit|^dvd^> (1986)
* I<Sin City|^dvd^> (2005)
* I<Six Days Seven Nights|^dvd^> (1998)
* I<Sixteen Candles|^dvd^> (1984)
* I<Sky Captain and the World of Tomorrow|^dvd^> (2004)
* I<Sleeping Beauty|^dvd^> (1959)
* I<Sleepless in Seattle|^dvd^> (1993)
* I<Soldier|^dvd^> (1998)
* I<Someone Like You...|^dvd^> (2001)
* I<Something's Gotta Give|^dvd^> (2003)
* I<The Sorcerer's Apprentice|^bd^> (2010)
* I<The Sound of Music|^dvd^> (1965)
* I<Space Cowboys|^dvd^> (2000)
* I<SpaceCamp|^dvd^> (1986)
* I<Spaceballs|^dvd^> (1987)
* I<Spacehunter: Adventures in the Forbidden Zone|^dvd^> (1983)
* I<Species|^vhs^> (1995)
* I<Speechless|^dvd^> (1994)
* I<St. Elmo's Fire|^dvd^> (1985)
* I<Starman|^dvd^> (1984)
* I<Stripes|^dvd^> (1981)
* I<The Sum of All Fears|^dvd^> (2002)
* I<TRON|^dvd^> (1982)
* I<Take the Lead|^dvd^> (2006)
* I<Tango &amp; Cash|^dvd^> (1989)
* I<Tears of the Sun|^dvd^> (2003)
* I<Thir13en Ghosts|^dvd^> (2001)
* I<Time Bandits|^vhs^> (1981)
* I<Tin Cup|^dvd^> (1996)
* I<Titan A.E.|^dvd^> (2000)
* I<To Gillian on Her 37th Birthday|^vhs^> (1996)
* I<Top Secret!|^dvd^> (1984)
* I<Tornado!|^dg^> (1996)
* I<Transylvania 6-5000|^dvd^> (1985)
* I<True Lies|^dvd^> (1994)
* I<The Truth About Cats &amp; Dogs|^dvd^> (1996)
* I<Twister|^dvd^> (1996)
* I<Two Weeks Notice|^dvd^> (2002)
* I<Ultraviolet|^dvd^> (2006)
* I<Unbreakable|^dvd^> (2000)
* I<Van Helsing|^dvd^> (2004)
* I<Volcano|^dvd^> (1997)
* I<WarGames|^dvd^> (1983)
* I<Watchmen|^bd^> (2009)
* I<Waterworld|^dvd^> (1995)
* I<Weird Science|^dvd^> (1985)
* I<What Dreams May Come|^dvd^> (1998)
* I<What Planet Are You From?|^dvd^> (2000)
* I<What a Girl Wants|^dvd^> (2003)
* I<When Harry Met Sally...|^dvd^> (1989)
* I<Where the Heart Is|^dvd^> (2000)
* I<While You Were Sleeping|^dvd^> (1995)
* I<Willow|^dvd^> (1988)
* I<The Witches of Eastwick|^dvd^> (1987)
* I<Working Girl|^dvd^> (1988)
* I<Xanadu|^dvd^> (1980)
* I<You've Got Mail|^dvd^> (1998)
* I<Young Frankenstein|^dvd^> (1974)
* I<Zathura|^dvd^> (2005)
* I<Zeus and Roxanne|^dvd^> (1997)
* I<Zorro, the Gay Blade|^dvd^> (1981)
* I<Æon Flux|^dvd^> (2005)
3 Airplane
* I<Airplane!|^dvd^> (1980)
* I<Airplane II: The Sequel|^dvd^> (1982)
3 Alien
* I<Alien³|^vhs^> (1992)
* I<Alien vs. Predator|^dvd^> (2004)
3 Back to the Future
* I<Back to the Future|^dvd^> (1985)
* I<Back to the Future Part II|^dvd^> (1989)
* I<Back to the Future Part III|^dvd^> (1990)
(boxed set)
3 Batman
* I<Batman|^dvd^> (1989)
* I<Batman Returns|^dvd^> (1992)
* I<Batman Forever|^dvd^> (1995)
* I<Batman &amp; Robin|^dvd^> (1997)
(boxed set)
3 Bridget Jones
* I<Bridget Jones's Diary|^dvd^> (2001)
* I<Bridget Jones: The Edge of Reason|^dvd^> (2004)
3 Bring It On
* I<Bring It On|^dvd^> (2000)
* I<Bring It on Again|^dvd^> (2004)
(boxed set)
3 Dragonheart
* I<Dragonheart|^dvd^> (1996)
* I<Dragonheart: A New Beginning|^dvd^> (2000)
(boxed set)
3 Evil Dead
* I<Evil Dead|^bd^> (1981)
* I<Evil Dead II|^dvd^> (1987)
3 Fantastic Four
* I<Fantastic Four|^dvd^> (2005)
* I<Fantastic Four: Rise of the Silver Surfer|^dvd^> (2007)
3 Ghostbusters
See also the A<tie-ins|href="Tie-ins.pl#Ghostbusters"> I own.
* I<Ghostbusters|^dvd^> (1984)
* I<Ghostbusters II|^dvd^> (1989)
(boxed set)
3 Grease
* I<Grease|^dvd^> (1978)
* I<Grease 2|^dvd^> (1982)
3 Indiana Jones
* I<Raiders of the Lost Ark|^bd^> (1981)
* I<Indiana Jones and the Kingdom of the Crystal Skull|^bd^> (2008)
* I<Indiana Jones and the Last Crusade|^bd^> (1989)
* I<Indiana Jones and the Temple of Doom|^bd^> (1984)
(blu-ray boxed set)
3 Harry Potter +
* I<Harry Potter and the Sorcerer's Stone|^bd^> (2001)
* I<Harry Potter and the Chamber of Secrets|^bd^> (2002)
* I<Harry Potter and the Prisoner of Azkaban|^bd^> (2004)
* I<Harry Potter and the Goblet of Fire|^bd^> (2005)
* I<Harry Potter and the Order of the Phoenix|^bd^> (2007)
* I<Harry Potter and the Half-Blood Prince|^bd^> (2009)
* I<Harry Potter and the Deathly Hallows: Part 1|^bd^> (2010)
* I<Harry Potter and the Deathly Hallows: Part 2|^bd^> (2011)
(blu-ray boxed set)
3 Hellboy
* I<Hellboy|^dvd^> (2004)
* I<Hellboy II: The Golden Army|^bd^> (2008)
3 Hot Shots!
* I<Hot Shots!|^dvd^> (1991)
* I<Hot Shots! Part Deux|^dvd^> (1993)
3 Jurassic Park
See also the A<tie-ins|href="Tie-ins.pl#Jurassic_Park"> I own.
* I<Jurassic Park|^dvd^> (1993)
* I<The Lost World: Jurassic Park|^dvd^> (1997)
* I<Jurassic Park III|^dvd^> (2001)
(boxed set)
3 Kill Bill +
* I<Kill Bill: Vol. 1|^dvd^> (2003)
* I<Kill Bill: Vol. 2|^dvd^> (2004)
3 The Lawnmower Man
* I<The Lawnmower Man|^dvd^> (1992)
* I<Lawnmower Man 2: Beyond Cyberspace|^dvd^> (1996)
3 Marvel Cinematic Universe +
* I<Iron Man|^bd^> (2008)
* I<The Incredible Hulk|^bd^> (2008)
* I<Iron Man 2|^bd^> (2010)
* I<Thor|^bd^> (2011)
* I<The Avengers|^bd^> (2012)
* I<Iron Man 3|^bd^> (2013)
* I<Thor: The Dark World|^bd^> (2013)
* I<Captain America: The Winter Soldier|^bd^> (2014)
* I<The Guardians of the Galaxy|^bd^> (2014)
3 The Matrix
* I<The Matrix|^bd^> (1999)
* I<The Matrix Reloaded|^bd^> (2003)
* I<The Matrix Revolutions|^bd^> (2003)
(blu-ray boxed set)
3 Men in Black
* I<Men in Black|^dvd^> (1997)
* I<Men in Black II|^dvd^> (2002)
3 Michael Flatley +
* I<Lord of the Dance|^dvd^> (1997)
* I<Feet of Flames|^dvd^> (1998)
* I<Michael Flatley: Gold|^dvd^> (2000)
(boxed set)
3 The Mighty Ducks
* I<The Mighty Ducks|^vhs^> (1992)
* I<D2: The Mighty Ducks|^vhs^> (1994)
* I<D3: The Mighty Ducks|^vhs^> (1996)
3 Miss Congeniality
* I<Miss Congeniality|^dvd^> (2000)
* I<Miss Congeniality 2: Armed and Fabulous|^dvd^> (2005)
3 The Mummy
* I<The Mummy|^dvd^> (1999)
* I<The Mummy Returns|^dvd^> (2001)
* I<The Scorpion King|^dvd^> (2002)
(boxed set)
3 National Treasure
* I<National Treasure|^dvd^> (2004)
* I<National Treasure: Book of Secrets|^dvd^> (2007)
3 The Princess Diaries
* I<The Princess Diaries|^dvd^> (2001)
* I<The Princess Diaries 2: Royal Engagement|^dvd^> (2004)
3 Riddick
* I<Pitch Black|^dvd^> (2000)
* I<The Chronicles of Riddick|^dvd^> (2004)
3 Romancing the Stone
* I<Romancing the Stone|^dvd^> (1984)
* I<The Jewel of the Nile|^dvd^> (1985)
3 Sister Act
* I<Sister Act|^dvd^> (1992)
* I<Sister Act 2: Back in the Habit|^dvd^> (1993)
3 Star Trek
See also the A<tie-ins|href="Tie-ins.pl#Star_Trek"> I own.
* I<Star Trek: First Contact|^vhs^> (1996)
* I<Star Trek: Generations|^vhs^> (1994)
* I<Star Trek: Insurrection|^vhs^> (1998)
3 Star Wars
See also the A<tie-ins|href="Tie-ins.pl#Star_Wars"> I own.
* I<Star Wars|^dvd^> (1977)
* I<Star Wars: Episode V - The Empire Strikes Back|^dvd^> (1980)
* I<Star Wars: Episode VI - Return of the Jedi|^dvd^> (1983)
(boxed set)
3 Starship Troopers
* I<Starship Troopers|^dvd^> (1997)
* I<Starship Troopers 2: Hero of the Federation|^dvd^> (2004)
3 Superman
* I<Superman|^dvd^> (1978)
* I<Superman II|^dvd^> (1980)
* I<Superman III|^dvd^> (1983)
* I<Superman IV: The Quest for Peace|^dvd^> (1987)
(boxed set)
3 Terminator
* I<The Terminator|^vhs^> (1984)
* I<Terminator 2: Judgment Day|^vhs^> (1991)
3 Tremors
* I<Tremors|^dvd^> (1990)
* I<Tremors II: Aftershocks|^dvd^> (1996)
* I<Tremors 3: Back to Perfection|^dvd^> (2001)
* I<Tremors 4: The Legend Begins|^dvd^> (2004)
(boxed set)
3 The X-Men
* I<X-Men|^dvd^> (2000)
* I<X2|^dvd^> (2003)
* I<X-Men: The Last Stand|^dvd^> (2006)
(boxed set)
3 Zorro
* I<The Mask of Zorro|^dvd^> (1998)
* I<The Legend of Zorro|^dvd^> (2005)
2 Television series &amp; miniseries
* I<The 10th Kingdom|^dvd^> (2000)
* I<Blood Ties|^bd^> (2006) (SPAN<complete series boxed set|^bd^>)
* I<Bones|^dvd^> (2005) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>)
* I<Castle|^dvd^> (2009) (SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>, SPAN<5|^dvd^>, SPAN<6|^dvd^>)
* I<Chuck|^bd^> (2007) (SPAN<complete series boxed set|^bd^>)
* I<Crusade|^dvd^> (1999)
* I<The Dresden Files|^dvd^> (2007)
* I<Dinotopia|^dvd^> (2002)
* I<IT|^dvd^> (1990)
* I<Leverage|^dvd^> (2008) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>, SPAN<5|^dvd^>)
* I<The Magical Legend of the Leprechauns|^dvd^> (1999)
* I<Necessary Roughness|^dvd^> (2011)
* I<Numb3rs|^dvd^> (2005) (Season: SPAN<2|^dvd^>)
* I<Pride and Prejudice|^dvd^> (1995)
* I<Scarecrow and Mrs. King|^dvd^> (1983) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>)
* I<Star Blazers|^vhs^> (1979) (Seasons: SPAN<1|^vhs^>, SPAN<2|^vhs^>, SPAN<3|^vhs^>)
* I<Studio 60 on the Sunset Strip|^dvd^> (2006)
3 Buffy the Vampire Slayer
* I<Buffy the Vampire Slayer|^dvd^> (1997) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>, SPAN<5|^dvd^>, SPAN<6|^dvd^>, SPAN<7|^dvd^>)
* I<Angel|^dvd^> (1999) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>, SPAN<5|^dvd^>)
3 Burn Notice
* I<Burn Notice|^dvd^> (2007) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>)
* I<Burn Notice: The Fall of Sam Axe|^dvd^> (2011)
3 Doctor Who
See also the A<tie-ins|href="Tie-ins.pl#Doctor_Who"> I own.
* I<Doctor Who|^dvd^> (1996)
* I<Doctor Who|^dvd^> (2005) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>, SPAN<David Tennant Specials|^bd^>)
* I<Torchwood|^dvd^> (2006) (SPAN<Seasons 1-3 boxed set|^dvd^>)
* I<The Sarah Jane Adventures|^dvd^> (2007) (Season: SPAN<1|^dvd^>)
3 Firefly
* I<Firefly|^dvd^> (2002)
* I<Serenity|^dvd^> (2005)
3 Stargate
* I<Stargate|^dvd^> (1994)
* I<Stargate SG-1|^dvd^> (1997) (SPAN<10 season boxed set|^dvd^>)
* I<Stargate: Atlantis|^dvd^> (2004) (Seasons: SPAN<1|^dvd^>, SPAN<2|^dvd^>, SPAN<3|^dvd^>, SPAN<4|^dvd^>, SPAN<5|^dvd^>)
* I<Stargate: Continuum|^dvd^> (2008)
* I<Stargate: The Ark of Truth|^dvd^> (2008)
3 V
* I<V|^dvd^> (1983)
* I<V: The Final Battle|^dvd^> (1984)
* I<V|^dvd^> (1984)
2 People in movies I like
These are some of the people I follow when selecting films and television to watch. More actors can be found in A<movies by series|href="../Movies/Movies_by_series.pl">.
3 Producers and directors
& producers and directors
3 Actors in films
& film actors
