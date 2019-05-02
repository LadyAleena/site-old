#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Util::Xanth::LineMagic qw(Xanth_line_magic);

page( 'heading' => 'Locations in Xanth', 'code' => sub { story(*DATA, { 'line magic' => Xanth_line_magic('page') }) });

__DATA__
These are the locations in and related to B<Xanth|id="Xanth"> that have been introduced. Not all locations are listed, but new locations will be added over time as they are found.
2 Northern Xanth
This area of Xanth is north of the Gap Chasm.
* The B<Black Village> was settled by the Black Wave in ^Currant Events^. It is east of Isthmus Village on the Isthmus.
* The B<Isthmus Village> is the western-most village on the Isthmus.
* The B<Library Forrest|id="Library_Forrest"> is near A<Mount Etamin|href="#Mount_Etamin"> and is filled with library puns. It was visited in ^Xone of Contention^.
* The B<North Village|id="North_Village"> is near the west coast of Xanth between the With a Cookie and the Fish Rivers. It was first seen in ^A Spell for Chameleon^.
* B<Ogre-fen-Ogre Fen|id="Ogre-fen-Ogre_Fen"> is one of the northern-most areas in Xanth, above the A<Forbidden Regions|href="#Forbidden_Regions">. It is inhabited by ogres who migrated from A<Lake Ogre|href="#Lake_Ogre-Chobee">.
3 Rivers (north)
* B<Fish River>
* The B<Sane Jaunts River> is north of the Gap Chasm and west of Ogre-Fen-Ogre Fen and the Regions of Birds, Griffons, Goblins, and Elves. The outlet is on the north-east coast of Xanth.
* B<Swan Knee River|id="Swan_Knee_River">
* B<With a Cookie River>
3 Regions
There are six regions dedicated to some species of monsters in Xanth. These are listed from north to south from A<Ogre-Fen-Ogre Fen|href="Ogre-Fen-Ogre_Fen">. To the west are the Forbidden Regions. The Sane Jaunts River is to the east of the Regions of Birds, Griffons, Goblins, and Elves. The Regions of Flies and Dragons wrap around the Region of Air. They are all north of the A<Gap Chasm|href="Gap_Chasm">.
* The B<Region of Birds|id="Region_of_Birds">, also called Birdland, borders the Void to the west.
* The B<Region of Griffons|id="Region_of_Griffons"> borders the Region of Water to the west.
* The B<Region of Goblins|id="Region_of_Goblins"> borders the Region of Fire to the west.
** B<Goblin Mountain|id="Goblin_Mountain"> is where the Goblin Mountain tribe of goblins live.
* The B<Region of Elves|id="Region_of_Elves"> borders the Region of Earth to the west. The Flower Elf tribe is in this region.
* The B<Region of Dragons|id="Region_of_Dragons"> borders the Region of Air to the north-west and the Region of Flies to the west. The A<Gap Village|href="Gap_Village"> is to the south-west.
** B<Mount Etamin|id="Mount_Etamin"> is home to Draco and naga ruled by Nabob.
* The B<Region of Flies|id="Region_of_Flies"> borders the Region of Air to the north-east and the Region of Dragons to the east. The A<Gap Village|href="Gap_Village"> is to the south-east.
3 The Forbidden Regions
The five B<Forbidden Regions|id="Forbidden_Regions"> are in center of nothern Xanth, south of A<Ogre-Fen-Ogre Fen|href="Ogre-Fen-Ogre_Fen">. They were created in the battle between ^Hydrogen^ and ^Loudspeaker^ in ^408^. They were introduced in ^Ogre, Ogre^.
These are listed from north to south.
* B<The Void|id="Void"> borders the Region of Birds to the east. It is a place that no one escapes from unless one has strong magic to counter the effects of the region. There is a large hole in the center that sucks everything into it.
* The B<Region of Water|id="Region_of_Water">, also called the Water Wing, borders the Region of Griffons to the east. It has a Lethe Spring in it. You can stay at the Sleep Inn.
* The B<Region of Fire|id="Region_of_Fire"> borders the Region of Goblins to the east.
* The B<Region of Earth|id="Region_of_Earth"> borders the Region of Elves to the east.
* The B<Region of Air|id="Region_of_Air"> borders Region of Flies to the south-west and the Region of Dragons to the south-east.
2 The Gap Chasm
The B<Gap Chasm|id="Gap_Chasm"> separates Xanth almost in the middle. It is about one mile deep and between three to ten miles across. It was called Orc Chasm at one time, however no one wanted to admit they were in Orc Chasm. In ^236^, Magician ^Dor^ detonated a forget spell on the Gap. It stayed in place until ^1043^, when it broke up during the Time of No Magic. Is it guarded by the ^Gap Dragon^. It was first traveled in ^A Spell for Chameleon^.
* The B<Gap Village|id="Gap_Village"> is on the northern side of the Gap Chasm and first seen in ^A Spell for Chameleon^.
* The B<Mai-Den Industrial Park|id="Mai-Den_Industrial_Park"> was built by the Maidens A<Taiwan|href="Characters.pl?character=Maiden+Tawain">, A<China|href="Characters.pl?character=Maiden+China">, A<Japan|href="Characters.pl?character=Maiden+Japan">, and A<Mexico|href="Characters.pl?character=Maiden+Mexico"> by order of King ^Ebnez^.
* B<Menace Mesa|id="Menace_Mesa"> is an anomalous mountain in the Gap Chasm and is home to the Noway Naga. It was visited in ^Luck of the Draw^.
3 Islands (Gap)
* The B<Isle of Illusion> is off the east coast of Xanth, near the eastern-most outlet of the Gap Chasm. It was first visted in ^A Spell for Chameleon^.
* The B<Isle of View> is off the west coast of Xanth, near the western-most outlet of the Gap Chasm. It was first visted in ^Heaven Cent^.
2 Southern Xanth
This area of Xanth is south of the Gap Chasm.
* The B<Faun and Nymph Retreat|id="Faun_and_Nymph_Retreat"> is south of A<Mount Parnassus|href="Mount_Parnassus"> and north of the Ever Glades. It is a home of fauns and nymphs who celebrate every day but forget about what happened yesterday.
* The B<Magic Dust Village|id="Magic_Dust_Village"> is near the Source of Magic. The residents are responsible for distributing the dust from the Source across Xanth. It was first seen in ^The Source of Magic^.
* B<Scoop|id="Scoop"> is surrounded by toilet trees, the result of a tangle tree and call-of-nature bush at a love spring. A few villagers want to escape. It was first seen in ^Knot Gneiss^.
* The B<South Village|id="South_Village"> is south of the A<Good Magician's Castle|href="Good_Magicians_Castle"> and west of A<Castle Zombie|href="Castle_Zombie">.
* B<Tri City|id="Tri_City"> is a city where triplets live, introduced in ^Yon Ill Wind^.
* B<Twin City|id="Twin_City"> is a city where twins live It is separated into two sections, one section for female twins and one section for male twins. It has a small area in between for fraternal male and female twins. It was introduced in ^Yon Ill Wind^.
* The B<Western Stockade|id="Western Stockade">
3 Castles (south)
* B<Castle Roogna|id="Castle_Roogna"> is named after it's builder, King ^Roogna^. It fell into disuse for a long while after King ^Yang^ abandoned it. It was a sometime home of ^Rose^ of Roogna and the Muses. King ^Trent^ restored it and ruled from here, and it is the seat of power of human Xanth once again.
* B<Castle Rockbound|id="Castle_Rockhound"> is A<Castle Roogna|href="#Castle_Roogna"> in A<Xanth Reality 6|href="#Xanth_reality"> in ^Stork Naked^.
* B<Castle Zombie|id="Castle_Zombie"> is the second Castle Zombie and the current location where the zombies are gathered, except those guarding Castle Roogna and those who went to A<Zombie|href="#Zombie">. It is currently occupied by ^Justin^ and ^Breanna^.
* B<Castle Windswept|id="Castle_Windswept"> is the former residence of Aeolus, the Storm King, and is now inhabited by Princess ^Eve^ and Dwarf Demon ^Pluto^ in ^Knot Gneiss^. It has a portal to A<Hades|href="#Hades"> in it.
* B<Gateway Castle|id="Gateway_Castle"> is at the bottom of A<Lake Ogre-Chobee|href="#Lake_Orge-Chobee"> and is accessable through the Vortex. It is home to the Curse Fiends.
* B<Good Magician's Castle|id="Good_Magicians_Castle"> was once the site of ^Jonathan^'s first A<Castle Zombie|href="#Castle_Zombie">. ^Humfrey^ found the site and built his castle here.
3 Mountains (south)
* B<Iron Mountain|id="Iron_Mountain"> is a mountain made entirely of iron. It has iron steps and guard rail going up the side. It is north of Lake Wails, west of the Kiss-Me River, and east of Mountain Lake. It is near the Singing Tower. The Robot Wave tried to use it to build up its presense in Xanth. It was introduced in ^Pet Peeve^.
* B<Mount Parnassus|id="Mount_Parnassus"> has two peaks. It is south of Mount Rushmost and Lake Ogre-Chobee and north of the Faun and Nymph Retreat. It has two peaks. One is the home of the ^Simurgh^, who perches in the Tree of Seeds; and the other is the home of the Muses.
** The B<Garden of Events> is on the peak of the mountain that is the home of the Muses. It is maintained by ^Emell^.
* B<Mount Rushmost|id="Mount_Rushmost"> is in the south of Xanth, north of Mount Parnassus.
3 Islands (south)
* B<Centaur Isle|id="Centaur_Isle"> is off the southern coast of Xanth. It is home of the centaurs, who are extremely conservitive.
* B<Isles of Joey> are off the east coast of Xanth.
3 Lakes and Rivers (south)
* B<Lake Kiss-Mee|id="Lake_Kiss-Mee"> is south of the Gap Chasm. The A<Kiss-Me River|href="#Kiss-Me_River"> runs from the Kiss-Me to Lake Orge-Chobee.
* The B<Kiss-Me River|id="Kiss-Me_River"> runs from A<Lake Kiss-Me|href="#Lake_Kiss-Mee"> to A<Lake Ogre-Chobee|href="#Lake_Ogre-Chobee">. The A<Magic Dust Village|href="#Magic_Dust_Village"> is on it west bank near Lake Orge-Chobee.
* B<Lake Ogre-Chobee|id="Lake_Ogre-Chobee"> is where the curse fiends live in an underwater castle that can only be accessed through the vortex. It was once SPAN<Lake Orge|id="Lake_Ogre"> until the curse fiends drove them out. It is inhabited by chobees who are, most likely, the decsendants of the Talent Research Group who were transformed into chobees by ^Loudspeaker^. There is a small community that lives on the shore. The Kiss-Me River runs from Lake Kiss-Me to Ogre-Chobee. The A<Magic Dust Village|href="#Magic_Dust_Village"> is to the north-west.
* B<Lake Wails> is near the east coast of Xanth, south of the Gap Chasm, south-east from Lake Kiss-Me, and north-east of Lake Ogre-Chobee. It is inside an old, dormant volcano.
* B<Mountain Lake> is west of A<Iron Mountain|href="#Iron_Mountain">.
3 Coasts
B<Gold Coast|id="Gold_Coast">, B<Silver Coast|id="Silver_Coast">, and B<Copper Coast|id="Copper_Coast"> are on the south-east coast of Xanth.
3 Other locations (south)
* The B<Region of Madness|id="Region_of_Madness"> is north of the A<Magic Dust Village|href="#Magic_Dust_Village">. Everything is exagerated within this region, and nothing makes sense.
** B<Unwelcome|id="Unwelcome"> is a village where no one is is welcome to visit.
2 Other communities
These communities are currently in an unknown location in Xanth.
* B<Burnsville|id="Burnsville"> was mentioned in ^Esrever Doom^.
* B<Camp Pain|id="Camp_Pain"> was mentioned in ^Pet Peeve^.
* B<Imp Perial|id="Imp_Perial"> is a community of imps.
* The B<PLO Village|id="PLO_Village"> was visited in ^Board Stiff^. PLO stands for Pun Liberation Organization, the villagers are against all puns.
* B<Pieria Village|id="Pieria_Village"> was mentioned in ^Pet Peeve^.
* B<Punic Curse|id="Punic_Curse"> was visited in ^Board Stiff^. It was destroyed by the pun virus.
* B<Tent City> is a city of just tents, no one lives there. The abilities of anyone are enhanced while in Tent City.
* The B<Terns> are East Tern and West Tern, and they are connected by the Tern Pike in ^Isis Orb^.
* B<Adver City|id="Adver_City">, B<Elasti City|id="Elasti_City">, B<Necess City|id="Necess City">, and B<Pompos City|id="Pompos_City"> were first seen or mentioned in ^Two to the Fifth^.
3 Castles (other)
* B<Castle Maidragon|id="Castle_Maidragon"> was created by ^Melody^, ^Harmony^, and ^Rhythm^ and occupied by ^Becka^ and her family. It was once the prison of ^Random Factor^.
* B<Castle Rock Candy|id="Castle_Rock_Candy"> is the base of operations of ^Ragna^ Roc in ^Two to the Fifth^. Most of the rock candy melted during the battle between Ragna and ^Melody^, ^Harmony^, and ^Rhythm^. Ragna is now imprisoned there.
* B<Caprice Castle|id="Caprice_Castle"> is a capricious building in ^Two to the Fifth^ It moves to areas where the anti-pun virus is threatening. The people who inhabit it destroy the virus and repopulate the puns. ^Picka Bone^ is the current master of the castle in the main Xanth reality. ^Drew (GWITS)^ is the master in A<Xanth Reality 3|href="Xanth_reality">. It was built by Dwarf Demon ^Pundit^.
* B<Nameless Castle> is where ^Roxanne^ incubated ^Simurgh^'s egg. It is now the home of ^Xanth^ and ^Chlorine^.
3 Islands (other)
* B<Isle of Miss|id="Isle_of_Miss"> was visited in ^Board Stiff^.
* Key Board Island
* Unicorn Island
3 Other locations (other)
* The B<Cloud|id="Cloud"> is where old programs go. It was visited in ^Board Stiff^.
* B<Mount Pinatuba|id="Mount_Pinatuba"> is an angry volcano.
* The B<Punderground|id="Punderground"> was visited in ^Stork Naked^. Children are lured there so their souls can be leached away. It is run by the ^Hobgoblin of Little Minds^.
* The B<Stork Works|id="Stork_Workds"> is the origin of Xanthian babies. All buildings have soft edges so as not to hurt the babies. The Stork Works is connected to all A<Xanth Realities|href="Xanth_reality">, so it is located in all realities. It was visited in ^Stork Naked^.
2 Fading Out Islands
The B<Fading Out Islands> are off the west coast of Xanth. There is an island for everything, and here are some that have been visited or mentioned.
* B<Isle of Adamant|id="Isle_of_Adamant"> was mentioned in ^Knot Gneiss^.
* B<Isle of Bats|id="Isle_of_Bats">
* B<Isle of Birds|id="Isle_of_Birds">
* B<Isle of Blobs|id="Isle_of_Blobs">
* B<Isles of Bo|id="Isles_of_Bo">, mentioned in ^Zombie Lover^, include the B<Isle of Bovines|id="Isle_of_Bovines">.
* B<Isle of Cats|id="Isle_of_Cats">
* B<Isle of Cats &amp; Dogs|id="Isle_of_Cats_and_Dogs">
* B<Isles of Co|id="Isles_of_Co">, mentioned in I<Zombie Lover>, include the B<Isle of Conclusion|id="Isle_of_Conclusion">.
* B<Isles of Do|id="Isles_of_Do"> were mentioned in I<Zombie Lover>.
* B<Isles of Eo|id="Isles_of_Eo"> were mentioned in I<Zombie Lover>.
* The B<Isle of Fellowship|id="Isle_of_Fellowship"> is an island where the partners of all of the couples are of different species. The ^Dastard^ undid the community and the families there.
* The B<Isle of Flies|id="Isle_of_Flies"> is the home of many types of flies. It was seen in ^Board Stiff^.
* B<Isles of Fo|id="Isles_of_Fo"> were mentioned in I<Zombie Lover>.
* B<Isles of Go|id="Isles_of_Go"> were mentioned in I<Zombie Lover>.
* B<Isle of Man|id="Isle_of_Man">
* B<Isle of Missed|id="Isle_of_Missed">
* B<Isles of Wa|id="Isles_of_Wa"> were mentioned in I<Zombie Lover>.
* B<Isles of We|id="Isles_of_We"> were mentioned in I<Zombie Lover>.
* B<Isles of Wi|id="Isles_of_Wi"> were mentioned in I<Zombie Lover>.
* B<Isles of Wo|id="Isles_of_Wo">, mentioned in I<Zombie Lover>, include the B<Isle of Woe|id="Isle_of_Woe">, the B<Isle of Wombats|id="Isle_of_Wombats">, the B<Isle of Wonder|id="Isle_of_Wonder">, the B<Isle of Wood|id="Isle_of_Wood">, the B<Isle of Wool|id="Isle_of_Wool">, the B<Isle of Words|id="Isle_of_Words">, the B<Isle of Work|id="Isle_of_Work">, the B<Isle of Worse|id="Isle_of_Worse">, and B<Isle of Worth|id="Isle_of_Worth">.
** The B<Isle of Wolves|id="Isle_of_Wolves"> is populated by wolves of all sorts. The king of the Isle lives in Wolverton Mountain. It was visited in I<Zombie Lover>.
** The B<Isle of Women|id="Isle_of_Women"> is populated entirely by women who want to marry princes. It was visited in I<Zombie Lover>.
2 The Gourd
The B<Gourd|id="Gourd"> is the realm of the Night Stallion and night mares. All areas of the Gourd are subject to change or disappear. It is accessed from Xanth by looking into the peepholes of hypnogourds.
* The B<City of Brass|id="City_of_Brass"> is where the brassys live, first visited in ^Ogre, Ogre^.
* The B<Lost Path>
* The B<Gourd Terminal>
* The B<Realm of Lost Objects>
2 Counter-Xanth
B<Counter-Xanth> is an alternate Xanth of Counter-terrene matter and accessed through the Cube Route. It reverses names, talents, and more. Some reversals can be cumulative. There are no puns here and many specialized areas. It was introduced in ^Cube Route^. People began colonizing it in ^Currant Events^.
* The B<Gap Mountain> is located in the same place in Counter-Xanth as the A<Gap Chasm|href="#Gap_Chasm"> is in Xanth.
* B<Mount Pinafore|id="Mount_Pinafore"> is located in the same place in Counter-Xanth as A<Mount Pinatuba|href="#Mount_Pinatuba"> is in Xanth. It is a great depression in the ground. It is as deep as Pinatuba is tall.
2 Playground and Storage
The B<Playground|id="Playground"> was built by Dwarf Demon ^Gambol^. It is free for children to use. Its B<Storage|id="Playground_Storage"> is overrun with what Gambol calles vermin. It was introduced in ^Five Portraits^.
* B<Dragon Country> is ruled by the ^Dragon King (FP)^ from the B<Dragon King's Castle|id="Dragon_Kings_Castle">. The Castle is scheduled to reappear in Xanth in ^1124^.
* The B<Goblin Annex|id="Goblin_Annex"> is ruled by ^Golden^.
* B<Wolf Country|id="Wolf_Country"> is co-ruled by ^Wolfram (FP)^ and ^Wulfha^.
2 Ida's Moons
B<Ida's Moons> were first introduced in ^Yon Ill Wind^. There is a version of ^Ida^ on each moon with the next moon in the sequence. It was discovered the moons are not an endless line, but a loop of infinate worlds, ending with a Xanth moon.
3 The first moons
Ptero through Torus were explored in ^Faun and Games^. Cone through Motes were introduced in ^Zombie Lover^. Trapezoid through Fractal were introduced in ^Up in a Heaval^. 
# B<Ptero|id="Ptero"> is a tiny moon the size of a ping pong ball which orbits Princess Ida's head. All the characters who ever existed, will exist, or might exist in Xanth live here. Travelling east or From, to the green, makes one younger. Travelling west or To, to the yellow, makes one older. Travelling north, to the blue, it gets colder. Travelling south, to the red, it gets warmer. It was named by ^Karen Baldwin^.
#* B<Comic Strips|id="Comic_Strip"> are areas on Ptero that are filled with puns. To get from place to place on Ptero, one must sometimes cross them.
#* B<Prince Town|id="Prince_Town"> is a city filled with unemployed princes being educated. It was visited in ^Zombie Lover^.
#* B<Princess Town|id="Princess_Town"> is another city on Ptero, probably similar to Prince Town.
# B<Pyramid|id="Pyramid"> is a four sided pyramid where each triangular face is a different color blue, red, green, and gray. The side a person lands on orients them to the world. One would need to be reoriented when going over the edge between sides. Generosity is power here.
# B<Torus|id="Torus"> is shaped like a doughnut. One who does a service for another comes to like that person or even love them. If you arrange to exchange favors, they cancel out.
# B<Cone|id="Cone"> is a world of crossbreeds. People live on both the inside and outside of the cone. The inside is filled with water and people can breathe in it. All breeding must be done at the rim. Ida lives at the inside point of the cone and is also a crossbreed with the body of a human and the head of a horse.
#* B<Nametag Castle> is the castle of the nametaggers in ^Air Apparent^.
# B<Dumbbell|id="Dumbbell"> is where magic is related to physical strength.
# B<Pincushion|id="Pincushion"> is where all inhabitants live on the pins. Travel here is faster using a flew, which is a bug which makes you sneeze and fly for two minutes.
# B<Spiral|id="Spiral"> looks like a galaxy.
# B<Tangle|id="Tangle"> looks like knots of spaghetti.
# B<Motes|id="Motes"> is a swarm of small fragments, each big enough to hold a small village. It has a Mote Monster who particularly has a taste for new visitors.
# B<Trapeziod|id="Trapeziod">
# B<Shoe|id="Shoe"> has every old woman and many children, so no one knew what to do.
# B<Implosion|id="Implosion">
# B<Puzzle|id="Puzzle">
# B<Octopus|id="Octopus">
# B<Tesseract|id="Tesseract"> is a 4-dimensional hyper cube. 81 cubes, all the same size, all in one box, which are unlocked by square dancing.
# B<Fractal|id="Fractal"> is one or two myriads of threads leading to other worlds.
3 The last moons
These moons were introduced in ^Air Apparent^ and are listed in order of introduction.
#4 B<Obelisk> is a world where the main function of the inhabitants is creating monuments. It is the fourth to the last moon in the chain of moons.
#3 B<Earth> is ruled by the Demoness ^Gaia^ and directly after Obelisk. It is the third to the last moon in the chain of moons.
#2 B<Moondania|id="Moondania"> is the real name of A<Mundania|href="#Mundania"> and directly after Earth. It is the second to the last moon in the chain of moons.
#1 B<Xanth> was created by ^Ilene (AA)^ from illusion for the Ida on Moondania. It is the last moon in the chain of moons and is also Xanth proper.
3 The moons in between
* B<Zombie|id="Zombie"> is the new home of the zombies, who are dreaming. Jonathan, the Zombie Master, and Millie have a castle there similar to A<Castle Zombie|href="#Castle_Zombie"> after they retired. This moon was introduced in ^Up in a Heavel^, seen again in ^Cube Route^ and ^Current Events^, and mentioned in ^Air Apparent^.
* The following moons were visited in ^Currant Events^ and mentioned in ^Air Apparent^:
** B<Dragon|id="Dragon"> is shaped like a dragon and home to 3,125 different types of dragons. The dragons like contests to determine whether they will make deals, especially pun contests. Ida, of course, is also a dragon. It was mentioned in ^Pet Peeve^ also.
** B<Green Goo|id="Green_Goo"> is a planet sized blob. It is somewhere before Plane.
** B<Plane|id="Plane"> is endlessly wide but shallow, like a pane of glass. Beneath each person shows their polar opposite. It is somewhere after Green Goo. It is the home of Demon ^Lithosphere^.
* B<Robot> is a world completely inhabited by robots. It was introduced in ^Pet Peeve^ when the robots tried to invade Xanth.
* B<Always-Always> is a big amusement park and introduced in ^Stork Naked^.
* The following moons were introduced in ^Air Apparent^ and are listed in order of introduction:
** B<Nickelpede> is shaped like and inhabited by nickelpedes.
** B<Spider> is shaped like and inhabited by spiders.
** B<Ant> is shaped like and inhabited by ants.
** B<Bird> is shaped like and mostly inhabited by birds.
** B<Centaur> is shaped like and mostly inhabited by centaurs.
** B<Cloud> is shaped like and mostly inhabited by clouds.
** B<Factory|id="Factory"> is run by The Factory where ^Random Factor^ and ^Debra^ originated.
** B<Heaven|id="Heaven"> and B<Hell|id="Hell"> are companion worlds.
*** B<Heaven> is as Heaven is described to be.
*** B<Hell> is as Hell is described to be.
** B<Tree> is shaped like and inhabited by all kinds of trees.
** B<Gourd> is a dream world.
* The following moons were introduced in ^Knot Gneiss^.
** B<Comic|id="Comic"> is a world of Comic Strips with blue fields, yellow trees, and red streams.
** B<Reverse> or B<Reverse World> is made entirely of reverse wood or its equivalent. It is shaped like a giant reverse-wood tree. Nothing is what it seems. All creatures look, sound, & feel like their opposite. It has five areas where things are changed: the bark changes appearance; the branches change direction; the leaves change sound; the roots change Gender; and the wood changes situations.
* B<Demo Derby|id="Demo_Derby"> is a world devoted to demolition derbies. It was introduced in ^Esrever Doom^.
* B<Antidote> has seas filled with anti-pun antidote and mentioned in ^Board Stiff^.
2 Other worlds
* B<Mundania|id="Mundania"> is the ordinary world which can access Xanth only through interfaces, such as the OuterNet. It is also called A<Moondania|href="#Moondania">.
* B<Hades|id="Hades"> is the realm of Dwarf Demon ^Pluto^ that can be accessed from A<Castle Windswept|href="#Castle_Windswept">.
* The are several B<alternate realities|id="Xanth_reality"> of Xanth. Seven were visited in ^Stork Naked^, and two were visited in ^Ghost Writer in the Sky^.
2 From other series
* B<Proton|id="Proton"> is the non-magical world from I<The Apprentice Adept> series. It was connected to Xanth when Stile was mentioned by Humfrey in I<Question Quest>.
* B<Phaze|id="Phaze"> is the magical world from I<The Apprentice Adept> series. It was connected to Xanth when several characters visited it in I<Cube Route>.
* B<Rud|id="Rud"> is a kingdom in the I<Kelvin of Rud> series.
* B<Two Moons|id="Two_Moons"> is the world from the I<ElfQuest> series by Richard and Wendy Pini. It was connected to Xanth when Jenny came through a rift in I<Isle of View>.