#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

my $doc_magic;

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
2 Castles
* B<Humfrey's Castle> was once the sight of Jonathan's Zombie Castle during his first life. Humfrey found the site and built his castle here.
* B<Castle Roogna> is named after it's builder, King Roogna. It fell into disuse for a long while, a sometime home of Rose of Roogna and the Muses. It is the seat of power of human Xanth.
* B<Castle Zombie> is the second Castle Zombie and the current location where the zombies are gathered, except those guarding Castle Roogna. It is currently occupied by Justin and Breanna.
* B<Nameless Castle> is where Roxanne incubated Simurgh's egg.
* B<Castle Maidragon> was created by Melody, Harmony, and Rhythm and occupied by Becka and her family. It was once the prison of Random Factor.
* Caprice Castle
* B<Castle Rockhound> is Castle Roogna in Xanth Reality 6 in I<Stork Naked>.
* B<Nametag Castle> is the castle of the nametaggers on Cone in I<Air Apparent>.
* B<Castle Rock Candy> is the base of operations of B<Ragna Roc> in I<Two to the Fifth>.
* B<Castle Windswept> is the former residence of Aeolus, the Storm King, and is now inhabited by Princess Eve and Demon Pluto in I<Knot Gneiss>.
2 Communities
* Black Village
* Gap Village
* Isthmus Village
* North Village
* South Village
* Western Stockade
* Scoop in I<Knot Gneiss>
2 Coasts
* Gold Coast
* Silver Coast
* Copper Coast
2 Islands
* Centaur Isle
* Isle of Fellowship
* Isle of Illusion
* Isles of Joey
* Isle of Miss
* Isle of View
3 Fading Out Islands
* Isle of Adamant
* Isle of Bats
* Isle of Blobs
* Isle of Bovines
* Isle of Conclusion
* Isle of Flies
* Isle of Man
* Isle of Missed
* Isles of WO
** Isle of Woe
** Isle of Wolves
** Isle of Wombats
** Isle of Women
** Isle of Wonder
** Isle of Wood
** Isle of Wool
** Isle of Words
** Isle of Work
** Isle of Worse
** Isle of Worth
* Key Board Island
* Unicorn Island
2 Lakes
* Lake Kiss-Mee
* Lake Ogre-Chobee
* Lake Wails
2 Mountains
* Mount Parnassus is the home of the Muses.
* Mount Pinatuba
* Mount Rushmost
2 Rivers
* Fish River
* Kiss-Me River
* Sane Jaunts River
* Swan Knee River
* With a Cookie River
2 Ida's Moons
B<Ida's Moons> were first introduced in I<Yon Ill Wind>. Ptero through Torus were explored in I<Faun and Games>. Cone through Motes were introduced in I<Zombie Lover>. Trapezoid through Fractal were introduced in I<Up in a Heavel>. There is a version of Ida on each moon with the next moon in the sequence. It was discovered the moons are not an endless line, but a loop, ending with a Xanth moon.
3 Those in known order
# B<Ptero> is a tiny moon the size of a ping pong ball which orbits Princess Ida's head. All the characters who ever existed, will exist, or might exist in Xanth live here. It was named by Karen Baldwin.
# B<Pyramid> is a four sided pyramid where each triangular face is a different color blue, red, green, and gray. Generosity is power here.
# B<Torus> is shaped like a doughnut. One who does a service for another comes to like that person or even love them. If you arrange to exchange favors, they cancel out.
# B<Cone> is a world of crossbreeds. People live on both the inside and outside of the cone. The inside is filled with water and people can breathe in it. All breeding must be done at the rim. Ida lives at the inside point of the cone and is also a crossbreed with the body of a human and the head of a horse.
# B<Dumbbell> is where magic is related to physical strength.
# B<Pincushion> is where all inhabitants live on the pins. Travel here is faster using a flew, which is a bug which makes you sneeze and fly for two minutes.
# B<Spiral> looks like a galaxy.
# B<Tangle> looks like knots of spaghetti.
# B<Motes> is a swarm of small fragments, each big enough to hold a small village. It has a Mote Monster who particularly has a taste for new visitors.
# B<Trapeziod>
# B<Shoe> has every old woman and many children, so no one knew what to do.
# B<Implosion>
# B<Puzzle>
# B<Octopus>
# B<Tesseract> is a 4-dimensional hyper cube. 81 cubes, all the same size, all in one box, which are unlocked by square dancing.
# B<Fractal> is one or two myriads of threads leading to other worlds.
3 Those in unknown order
* B<Zombie> is the new home of the Zombies, who are dreaming. The Zombie Master (Jonathan) and Millie have a castle there similar to Zombie Castle since they retired. This moon was introduced in I<Up in a Heavel>, seen again in I<Cube Route> and I<Current Events>, and mentioned in I<Air Apparent>.
* B<Dragon> is shaped like a dragon and home to 3,125 different types of dragons. The dragons like contests to determine whether they will make deals, especially pun contests. Ida, of course, is also a dragon. It was introduced in I<Currant Events> and mentioned in I<Pet Peeve> and I<Air Apparent>.
* B<Plane> is wide but shallow, like a pane of glass. Beneath each person shows their polar opposite. It was introduced in I<Currant Events> and mentioned in I<Air Apparent>.
* B<Robot> is a world completely inhabited by robots. It was introduced in I<Pet Peeve>.
* B<Always-Always> is a big amusement park and introduced in I<Stork Naked>.
* The following moons were introduced in I<Air Apparent> in order of introduction:
** B<Green Goo> was mentioned in I<Air Apparent> but not visited, so its placement is unclear.
** B<Nickelpede> is shaped like and inhabited by nickelpedes.
** B<Spider> is shaped like and inhabited by spiders.
** B<Ant> is shaped like and inhabited by ants.
** B<Bird> is shaped like and mostly inhabited by birds.
** B<Centaur> is shaped like and mostly inhabited by centaurs.
** B<Cloud> is shaped like and mostly inhabited by clouds.
** B<Factory> is run by The Factory where Random Factor originated.
** B<Heaven> and B<Hell> are companion worlds.
*** B<Heaven> is as Heaven is described to be.
*** B<Hell> is as Hell is described to be.
** B<Tree> is Inhabited by all kinds of trees.
** B<Gourd> is a dream world.
** B<Obelisk> is a world where the inhabitants main function is creating monuments.
** B<Earth> is ruled by the Demoness Gaia and directly after Obelisk.
** B<Moondania> is the real name of Mundania and directly after Earth.
** B<Xanth> was created by Ilene from illusion for the Ida on Moondania.
* B<Comic> is a world of Comic Strips with blue fields, yellow trees, and red streams. It was introduced in I<Knot Gneiss>.
* B<Reverse> or B<Reverse World> is made entirely of reverse wood or its equivalent. It is shaped like a giant reverse-wood tree. Nothing is what it seems. All creatures look, sound, & feel like their opposite. It has five areas where things are changed: Bark = Appearance; Branch = Direction; Leaves = Sound; Root = Gender; Wood = Situation. It was introduced in I<Knot Gneiss>.
* B<Demo Derby> is a world devoted to demolition derbies. It was introduced in I<Esrever Doom>.
* B<Antidote> has seas filled with anti-pun antidote and introduced with a mention in I<Board Stiff>.
2 Other places
* Mundania is the ordinary world which can access Xanth only through interfaces.
* The Gap Chasm separates Xanth almost in the middle.
* The Gourd is the realm of the Night Stallion and Night Mares.
* The five forbidden regions are in central Xanth.
** Region of Air
** Region of Earth
** Region of Fire
** Region of Water
** The Void
* Counter Xanth
* Alternate realities of Xanth
2 From other series
* Proton is the non-magical world from I<The Apprentice Adept> series.
* Phaze is the magical world from I<The Apprentice Adept> series.
* Two Moons is the world from the I<ElfQuest> series by Richard and Wendy Pini.
