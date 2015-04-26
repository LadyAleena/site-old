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
  'authors' => sub { list(3, 'u', get_people('Authors.txt'), { 'class' => 'three' }) },
};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic, 'line magic' => $line_magic }) });

__DATA__
This is my fiction collection of SPAN<hardcovers|^hardcovers^>, SPAN<trade paperbacks|^trades^>, and SPAN<mass market paperbacks|^massmarkets^>.
2 General fiction
* I<Big Trouble|^hardcover^> by Dave Barry
* I<The House of Ulloa|^hardcover^> by Emilia Pardo Bazan (Trans. by Roser Caminals-Heath)
* I<The Da Vinci Code|^trade^> by Dan Brown
* I<Through the Looking Glass|^trade^> and I<Alice's Adventures in Wonderland|^trade^> by Lewis Carroll
* I<Sophie's World|^massmarket^> by Jostein Gaarder
* I<The Walking Man|^trade^> by William Heath
* I<A Seperate Peace|^massmarket^> by John Knowles
* I<The Key to the Kingdom|^hardcover^> by Tony Meeuwissen
* I<Paradise Lost and Paradise Regained|^massmarket^> by John Milton
* I<Literature|^hardcover^> by James H. Pickering and Jeffery D. Hoeper
2 Alternate Reality
3 Harry Turtledove +
* I<The Two Georges|^hardcover^> with Richard Dreyfuss
* I<Worldwar: In the Balance|^massmarket^>
2 Erotica
* I<The Best American Erotica|^massmarket^> by Susan Bright ed.
* I<The Bloody Chamber and Other Adult Tales|^trade^> by Angela Carter
* I<Fanny Hill|^massmarket^> by John Cleland
* I<Ladies Own Erotica|^massmarket^> by the Kensington Ladies Erotica Society
* I<Up Over Her Thighs|^massmarket^> by Monty Larchman
* I<Little Birds|^massmarket^> by Anais Nin
* I<Erotica|^trade^> by Margaret Reynolds, ed.
* I<Slow Hand: Women Writing Erotica|^massmarket^> by Michele Slune, ed.
* I<Confession d'Amour|^massmarket^> by Anne-Marie Villfranche
3 Charlotte Hill & William Wallace
# I<Erotica|^trade^>
# I<Erotica II|^trade^>
# I<Erotica III|^trade^>
3 Anonymous or Unknown
* I<The Cunning Liguist|^massmarket^>
* I<Erotic Reader II|^massmarket^>
* I<Joyful Desires|^trade^>
2 Fantasy
* I<The King of Ys: Dahut|^massmarket^> by Paul and Karen Anderson
* I<Celestial Chess|^massmarket^> by Thomas Bontly
* I<Glenraven|^hardcover^> by Marion Zimmer Bradley and Holly Lisle
* I<Shadow War|^massmarket^> by Deborah Chester
* I<The Fourth Guardian|^trade^> by Ronald Anthony Cross SMALL<(book 1 of The Elemental Guardians)>
* I<The Chasm of Doom|^massmarket^> by Joe Dever and Gary Chalk SMALL<(book 4 of the Lone Wolf series)>
* I<Lord Foul's Bane|^massmarket^> by Stephen R. Donaldson SMALL<(book 1 of the Chronicles of Thomas Covenant the Unbeliever>
* I<Dragoncharm|^massmarket^> by Graham Edwards
* I<Rumors of Spring|^massmarket^> by Richard Grant
* I<Anvil in the Sun|^massmarket^> by Anne Lesley Groell
* I<Ladies of Madrigyn|^massmarket^> by Barbara Hambly
* I<A Wizard of Earthsea|^massmarket^> by Ursula K. Le Guin SMALL<(book 1 of Earthsea)>
* I<The Book of Atrus|^hardcover^> by Rand & Robyn Miller and David Wingrove SMALL<(book 1 of Myst)>
* I<D'Shai|^massmarket^> by Joel Rosenberg
* I<Beauty|^massmarket^> by Sherri S. Tepper
* I<The Snow Queen|^massmarket^> by Joan D. Vinge
3 Piers Anthony +
* I<If I Pay Thee Not In Gold|^hardcover^> with Mercedes Lackey
* I<The Guttbucket Quest|^hardcover^> with Ron Leming
* I<Dragon's Gold|^massmarket^> with Robert E. Margroff
* I<Piers Anthony's Visual Guide to Xanth|^trade^> with Jody Lynn Nye
* I<The Secret of Spring|^hardcover^> with Jo Anne Taeusch
4 The Apprentice Adept
# I<Split Infinity|^massmarket^>
# I<Blue Adept|^massmarket^>
# I<Juxtaposition|^massmarket^>
# I<Out of Phaze|^massmarket^>
# I<Robot Adept|^massmarket^>
# I<Unicorn Point|^massmarket^>
# I<Phaze Doubt|^massmarket^>
4 Bio of a Space Tyrant
#2 I<Mercenary|^massmarket^>
# I<Politican|^massmarket^>
# I<Executive|^massmarket^>
# I<Statesman|^massmarket^>
4 Incarnations on Immortality
# I<On a Pale Horse|^massmarket^>
# I<Bearing an Hourglass|^massmarket^>
# I<With a Tangled Skein|^massmarket^>
# I<Weilding a Red Sword|^massmarket^>
# I<Being a Green Mother|^massmarket^>
# I<For Love of Evil|^massmarket^>
# I<And Eternity|^massmarket^>
4 Mode
# I<Vitrual Mode|^massmarket^>
# I<Fractal Mode|^hardcover^>
# I<Chaos Mode|^hardcover^>
# I<DoOon Mode|^hardcover^>
4 Xanth
#| two
# I<A Spell for Chameleon|^massmarket^>
# I<The Magic of Xanth|^massmarket^>
# I<Castle Roogna|^massmarket^>
# I<Centaur Aisle|^massmarket^>
# I<Ogre, Ogre|^massmarket^>
# I<Night Mare|^massmarket^>
# I<Dragon on a Pedestal|^massmarket^>
# I<Crewel Lye: A Caustic Yarn|^massmarket^>
# I<Golem in the Gears|^massmarket^>
# I<Vale of the Vole|^massmarket^>
# I<Heaven Cent|^massmarket^>
# I<Man from Mundania|^massmarket^>
# I<Isle of View|^massmarket^>
# I<Question Quest|^massmarket^>
# I<The Color of Her Panties|^massmarket^>
# I<Demons Don't Dream|^hardcover^>
# I<Harpy Time|^hardcover^>
# I<Geis of the Gargoyle|^hardcover^>
# I<Roc and a Hard Place|^hardcover^>
# I<Yon Ill Wind|^hardcover^>
# I<Faun & Games|^hardcover^>
# I<Zombie Lover|^hardcover^> autographed
# I<Xone of Contention|^hardcover^>
# I<The Dastard|^hardcover^>
# I<Swell Foop|^hardcover^>
# I<Up In A Heaval|^hardcover^>
# I<Cube Route|^hardcover^>
# I<Current Events|^hardcover^>
# I<Pet Peeve|^hardcover^>
3 Robert Asprin +
4 Myth
#2 I<Myth Conceptions|^massmarket^>
# I<Myth Directions|^massmarket^>
# I<Hit of Myth|^massmarket^>
#6 I<Little Myth Marker|^massmarket^>
#8 I<M.Y.T.H. Inc. in Action|^massmarket^>
#10 I<Sweet Myth-tery of Life|^massmarket^>
4 Phule's Company
#2 I<Phule's Paradise|^massmarket^>
3 Terry Brooks +
4 The Magic Kingdon of Landover
# I<Magic Kingdom for Sale Sold|^massmarket^>
# I<The Black Unicorn|^massmarket^>
# I<Wizard at Large|^massmarket^>
4 Shannara
# I<The Sword of Shannara|^massmarket^>
# I<The Elfstones of Shannara|^massmarket^>
# I<The Scions of Shannara|^hardcover^>
# I<The Druid of Shannara|^hardcover^>
# I<The Elf Queen of Shannara|^hardcover^>
3 Lois McMaster Bujold +
* I<Barrayar|^massmarket^>
* I<The Spirit Ring|^massmarket^>
3 Don Callander +
* I<Dragon Companion|^massmarket^>
4 Mancer
# I<Pyromancer|^massmarket^>
# I<Aquamancer|^massmarket^>
# I<Geomancer|^massmarket^>
# I<Aeromancer|^massmarket^>
3 Samuel R. Delany +
4 Neveryona
# I<Neveryona|^trade^>
# I<Flight From Neveryona|^trade^>
# I<Tales of Neveryona|^trade^>
# I<Return to Neveryona|^trade^>
3 David and Leigh Eddings +
4 Belgarion saga
5 The Belgariad
# I<Pawn of Prophesy|^massmarket^>
# I<Queen of Sorcery|^massmarket^>
# I<Magician's Gambit|^massmarket^>
# I<Castle of Wizardry|^massmarket^>
# I<Enchanter's End Game|^massmarket^>
5 The Mallorean
# I<Guardians of the West|^hardcover^>
# I<King of the Murgos|^hardcover^>
# I<Demon Lord of Karanda|^hardcover^>
# I<Sorceress of Darshiva|^hardcover^>
# I<The Seeress of Kell|^hardcover^>
5 Prequels & other
* I<Belgarath the Sorcerer|^hardcover^>
* I<Polgara the Sorceress|^hardcover^>
* I<The Rivan Codex|^hardcover^>
4 Sparhawk saga
5 The Elenium
# I<The Diamond Throne|^hardcover^>
# I<The Ruby Knight|^hardcover^>
# I<The Sapphire Rose|^hardcover^>
5 The Tamuli
# I<Domes of Fire|^hardcover^>
# I<The Shining Ones|^hardcover^>
# I<The Hidden City|^hardcover^>
4 The Dreamers
# I<The Elder Gods|^hardcover^>
3 Raymond E. Feist +
4 The Riftwar Cycle
5 The Riftwar Saga
# I<Magician: Apprentice|^massmarket^>
# I<Magician: Master|^massmarket^>
# I<Silverthorn|^hardcover^>
# I<A Darkness at Sethanon|^massmarket^>
5 The Empire Trilogy
with Janny Wurts
# I<Daughter of the Empire|^massmarket^>
# I<Servant of the Empire|^hardcover^>
# I<Mistress of the Empire|^massmarket^>
5 The Riftwar Legacy
# I<Krondor: The Betrayal|^hardcover^>
# I<Krondor: The Assasins|^hardcover^>
# I<Krondor: Tear of the Gods|^hardcover^>
5 Krondor's Sons
# I<Prince of the Blood|^hardcover^>
# I<The King's Buccaneer|^hardcover^>
5 The SerpentWar Saga
# I<Shadow of a Dark Queen|^hardcover^>
# I<Rise of a Merchant Prince|^hardcover^>
# I<Rage of a Demon King|^hardcover^>
# I<Shards of a Broken Crown|^hardcover^>
5 Conclave of Shadows
# I<Talon of the Silver Hawk|^hardcover^>
# I<King of Foxes|^hardcover^>
# I<Exile's Return|^hardcover^>
5 The Darkwar Saga
# I<Flight of the Night Hawks|^hardcover^>
3 C. S. Friedman +
4 Coldfire Trilogy
# I<Black Sun Rising|^massmarket^>
# I<When True Night Falls|^massmarket^>
# I<Crown of Swords|^massmarket^>
3 Parke Godwin +
4 King Arthur
# I<Firelord|^massmarket^>
# I<Beloved Exile|^massmarket^>
4 Snake Oil
# I<Waiting for the Galactic Bus|^hardcover^>
# I<The Snake Oil Wars|^hardcover^>
3 Mike Jefferies +
4 Loremasters or Elundium
# I<The Road to Underfall|^massmarket^>
# I<Palace of Kings|^massmarket^>
# I<Shadowflight|^massmarket^>
3 Robert Jordan +
4 Wheel of Time
# I<The Eye of the World|^hardcover^>
# I<The Great Hunt|^hardcover^>
# I<The Dragon Reborn|^hardcover^>
# I<The Shadow Rising|^hardcover^>
# I<The Fires of Heaven|^hardcover^>
# I<Lord of Chaos|^hardcover^>
# I<A Crown of Swords|^hardcover^>
# I<Path of Daggers|^hardcover^>
# I<Winter's Heart|^hardcover^>
3 Richard A. Knaak +
4 Dragonrealm
# I<Firedrake|^massmarket^>
# I<Ice Dragon|^massmarket^>
3 Katherine Kurtz +
4 Legends of Camber of Culdi
# I<Camber of Culdi|^massmarket^>
4 Histories of King Kelson
#3 I<The Quest for Saint Camber|^massmarket^>
3 C. S. Lewis +
4 Chronicles of Narnia
# I<The Lion, the Witch, and the Wardrobe|^massmarket^>
# I<Prince Caspian|^massmarket^>
# I<The Voyage of the Dawn Treader|^massmarket^>
# I<The Silver Chair|^massmarket^>
# I<The Horse and His Boy|^massmarket^>
# I<The Magician's Nephew|^massmarket^>
# I<The Last Battle|^massmarket^>
4 Space Trilogy
# I<Out of the Silent Planet|^massmarket^>
# I<Perelandria|^massmarket^>
# I<That Hideous Strength|^massmarket^>
3 Julian May +
# I<Black Trillium|^massmarket^> with Marion Zimmer Bradley and Andre Norton
# I<Blood Trillium|^hardcover^>
3 Patricia A. McKillip +
* I<The Forgotten Beasts of Eld|^massmarket^>
* I<The Hero and the Crown|^massmarket^>
3 Michael Moorcock +
4 Elric Saga
# I<Elric or Melibone|^massmarket^>
# I<The Sailor on the Seas of Fate|^massmarket^>
# I<The Weird of the White Wolf|^massmarket^>
# I<The Vanishing Tower|^massmarket^>
# I<The Bane of the Black Sword|^massmarket^>
# I<Storm Bringer|^massmarket^>
3 Wendy and Richard Pini +
4 The Complete ElfQuest
# I<Fire and Flight|^trade^> autographed
# I<The Forbidden Grove|^trade^> autographed
# I<Captives of Blue Moutain|^trade^> autographed
# I<Quest's End|^trade^> autographed
# I<Siege of Blue Mountain|^trade^> autographed
# I<The Secret of Two-Edge|^trade^> autographed
# I<The Cry from Beyond|^trade^> autographed
# I<Kings of the Broken Wheel|^trade^> autographed
4 Blood of Ten Chiefs
Richard Pini, Ed.
# I<Blood of Ten Chiefs|^trade^>
# I<Blood of Ten Chiefs: Wolfsong|^trade^>
# I<Blood of Ten Chiefs: Winds of Change|^trade^>
# I<Blood of Ten Chiefs: Against the Wind|^trade^>
# I<Blood of Ten Chiefs: Dark Hours|^trade^>
4 graphic novels
* I<Elfquest-The Hidden Years|^hardcover^>
* I<Elfquest: 9: Rogue's Challenge|^hardcover^>
* I<Elfquest-New Blood|^hardcover^>
* I<The Searcher and the Sword|^trade^>
3 Terry Pratchett +
4 Discworld
# I<The Colour of Magic|^hardcover^>
* I<Good Omens|^massmarket^> with Neil Gaiman
3 Melanie Rawn +
# I<Dragon Prince|^massmarket^>
# I<The Star Scroll|^massmarket^>
# I<Sunrunners Fire|^massmarket^>
3 Michael Scott Rohan +
4 The Winter of the World
# I<The Anvil in the Ice|^massmarket^>
# I<The Forge in the Forest|^massmarket^>
# I<The Hammer in the Sun|^massmarket^>
3 Fred Saberhagen +
4 Books of Swords
# I<The First Book of Swords|^massmarket^>
# I<The Second Book of Swords|^massmarket^>
# I<The Third Book of Swords|^massmarket^>
3 Elizabeth Ann Scarborough +
4 The Godmother
# I<The Godmother|^hardcover^>
# I<The Gomother's Apprentice|^massmarket^>
3 Mary Stewart +
4 The Magnificent Arthurian Legend
# I<The Crystal Cave|^massmarket^>
# I<The Last Enchantment|^massmarket^>
# I<The Hollow Hills|^massmarket^>
# I<The Wicked Day|^massmarket^>
3 Margaret Weis and Tracy Hickman
4 The Darksword Trilogy
# I<Forging the Darksword|^massmarket^>
# I<Doom of the Darksword|^massmarket^>
# I<Triumph of the Darksword|^massmarket^>
* I<Darksword: Darksword Adventures|^massmarket^>
4 Death Gate Cycle
# I<Dragon Wing|^hardcover^>
# I<Elven Star|^hardcover^>
# I<Fire Sea|^hardcover^>
# I<Serpent Mage|^hardcover^>
# I<The Hand of Chaos|^hardcover^>
# I<Into the Labyrinth|^hardcover^>
# I<The Seventh Gate|^hardcover^>
4 Rose of the Prophet
# I<The Will of the Wanderer|^massmarket^>
3 Tad Williams +
4 Memory, Sorrow, and Thorn
# I<The Dragonbone Chair|^massmarket^>
# I<Stone of Farewell|^hardcover^>
# I<To Green Angel Tower|^hardcover^>
3 Various (fantasy)
* I<Magic of Christmas|^massmarket^>
* I<First Contact|^massmarket^>
* I<Quest to Riverworld|^massmarket^> by Phillip Jose Farmer, Ed.
* I<Chicks in Chainmail|^massmarket^> by Esther Friesner, Ed.
2 Horror
* I<The Earth Strikes Back|^massmarket^> by Richard T. Chizmar, Ed.
* I<Tombs|^massmarket^> by Peter Crowther & Edward E. Kramer, Ed.
* I<Hotter Blood: More Tales of Erotic Horror|^massmarket^> by Jeff Gelb & Michael Garrett, Ed.
* I<Children of the Vampire: The Diaries of Family Dracul|^massmarket^> by Jeanne Kalogriodis
* I<Virgins and Martyrs|^massmarket^> by Simon Maginn
* I<Borderland|^massmarket^> by Thomas F. Monteleone, Ed.
3 Stephen King +
* I<It|^massmarket^>
4 The Green Mile
* I<The Two Dead Girls|^massmarket^>
# I<The Mouse on the Mile|^massmarket^>
# I<Coffey's Hands|^massmarket^>
# I<The Bad Death of Eduard Delacroix|^massmarket^>
# I<Night Journey|^massmarket^>
# I<Coffey on the Mile|^massmarket^>
3 Anne Rice +
4 Sleeping Beauty
as A. N. Roquelaure
# I<The Claiming of Sleeping Beauty|^trade^>
# I<Beauty's Punishment|^trade^>
# I<Beauty's Relaease|^trade^>
4 The Vampire Chronicles
# I<Interview With the Vampire|^massmarket^>
# I<The Vampire Lestat|^massmarket^>
# I<The Queen of the Damned|^massmarket^>
# I<The Tale of the Body Thief|^massmarket^>
2 Mystery
3 Laurie R. King +
4 Mary Russell
# I<The Beekeeper's Apprentice|^massmarket^>
# I<A Mounstrous Regiment of Women|^massmarket^>
# I<A Letter of Mary|^hardcover^>
# I<The Moor|^hardcover^>
2 Science fiction
* I<Encounter at Tiber|^massmarket^> by Buzz Aldrin & John Barnes
* I<Allies and Aliens|^massmarket^> by Roger MacBride Allen
* I<The Martian Chronicles|^massmarket^> by Raymond Bradbury
* I<The Golden One|^massmarket^> by Deborah Checeter SMALL<(book 1 of the Alien Chronicles)>
* I<Twistor|^hardcover^> by John Cramer
* I<The Lost World|^hardcover^> by Michael Crichton
* I<The Rock|^massmarket^> by Robert Doherty
* I<Firestar|^massmarket^> by Michael Flynn
* I<Indistinguishable from Magic|^massmarket^> by Robert L. Foward
* I<The Bones of Time|^massmarket^> by Kathleen Ann Goonan
* I<The Immortality Option|^massmarket^> by James P. Hogan
* I<Zeus and Co.|^massmarket^> by David Lee Jones
* I<A Canticle of Lebowitz|^massmarket^> by Walter M. Miller Jr.
* I<Protektor|^massmarket^> by Protektor
* I<Terrarium|^trade^> by Scott Russell Sanders
* I<Majipoor Chronicles|^trade^> by Robert Silverberg
* I<The Probability Broach|^massmarket^> by L. Neil Smith
* I<Heavy Weather|^massmarket^> by Bruce Sterling
* I<Nature's End|^massmarket^> by Whitley Streiber & James Kunetka
* I<Houston, Houston, Do You Read?/Souls|^massmarket^> by James Tiptree, Jr. & Joanna Russ
* I<The Invisable Man|^massmarket^> and I<The Time Machine|^massmarket^> by H. G. Wells
* I<The Doomsday Machine|^massmarket^> by Connie Willis
3 Douglas Adams +
4 Dirk Gently
# I<Dirk Gently's Holistic Detective Agency|^massmarket^>
# I<The Long, Dark Teatime of the Soul|^massmarket^>
4 The Hitchhiker's Guide to the Galaxy
# I<The Hitchhiker's Guide to the Galaxy|^massmarket^>
# I<The Resteraunt at the End of the Galaxy|^massmarket^>
# I<Life, the Unuverse, and Everything|^massmarket^>
# I<So Long, and Thanks for all the Fish|^massmarket^>
# I<Mostly Harmless|^trade^>
3 Isaac Asimov +
* I<The Ugly Little Boy|^massmarket^> with Robert Silverberg
4 Foundation
#4 I<Prelude to Foundation|^massmarket^>
3 Orson Scott Card +
* I<Free Lancers|^massmarket^> with David Drake & Lois McMaster Bujold
4 Ender Cycle
# I<Ender's Game|^trade^>
# I<Speaker for the Dead|^massmarket^>
# I<Xenocide|^massmarket^>
4 Homecoming
# I<The Memory of Earth|^hardcover^> autographed
# I<The Call of Earth|^hardcover^> autographed
# I<The Ships of Earth|^hardcover^> autographed
# I<Earthfall|^hardcover^> autographed
# I<Earthborn|^hardcover^> autographed
3 Jack L. Chalker +
4 Saga at the Well World
#3 I<Quest for the Well of Souls|^massmarket^>
# I<The Return of Nathan Brazil|^massmarket^>
# I<Twilight at the Well of Souls|^massmarket^>
4 The Watchers at the Well
# I<Echos of the Well of Souls|^massmarket^>
3  Arhtur C. Clarke +
* I<Cradle|^massmarket^> with Gentry Lee
* I<The Light of Other Days|^hardcover^> with Stephen Baxter
* I<Richter 10|^hardcover^> with Mike McQuay
4 Odyssey
# I<2001|^massmarket^>
# I<2010|^massmarket^>
# I<2061|^massmarket^>
# I<3001: The Final Odyssey|^hardcover^>
4 Rama
with Gentry Lee
# I<Rendezous with Rama|^hardcover^> Clarke alone
# I<Rama II|^hardcover^>
# I<The Garden of Rama|^massmarket^>
# I<Rama Revealed|^hardcover^>
* I<Bright Messengers|^hardcover^> Lee alone
3 Allen Dean Foster +
4 Flinx
# I<The Tar-Aiym Krang|^massmarket^>
# I<Orphan Star|^massmarket^>
# I<The End of the Matter|^massmarket^>
# I<For Love of Mother Not|^massmarket^>
# I<Bloodhype|^massmarket^>
# I<Nor Crystal Tears|^massmarket^>
3 Frank Herbert +
* I<The Eyes of Heisenberg|^massmarket^>
4 Dune
# I<Dune|^massmarket^>
# I<Dune Messiah|^massmarket^>
# I<Children of Dune|^massmarket^>
# I<God Emperor of Dune|^massmarket^>
# I<Heretics of Dune|^massmarket^>
# I<Chapterhouse: Dune|^massmarket^>
5 Houses of Dune
by Brian Herbert & Kevin J. Anderson
# I<House Atredies|^hardcover^>
# I<House Harkonnen|^hardcover^>
# I<House Corrino|^hardcover^>
5 Other (Dune)
* I<The Dune Encyclopedia|^trade^> with Dr. Willis E. McNelly
3 L. Ron Hubbard +
* I<Battlefield Earth|^massmarket^>
* I<Writers on the Future|^massmarket^> Ed.
3 Anne McCaffrey +
4 The Brain and Brawn series
# I<The Ship Who Sang|^massmarket^>
# I<Partnership|^massmarket^> with Margaret Ball
# I<The Ship Who Searched|^massmarket^> with Mercedes Lackey
# I<The City Who Fought|^hardcover^> with S. M. Stirling
# I<The Ship Who Won|^hardcover^> with Jody Lynn Nye
# I<The Ship Errant|^hardcover^> by Jody Lynn Nye
4 Doona
# I<Decision at Doona|^massmarket^>
# I<Crisis at Doona|^massmarket^>
# I<Treaty at Doona|^massmarket^>
4 Dragonriders of Pern
# I<Dragonflight|^massmarket^>
# I<Dragonquest|^massmarket^>
# I<The White Dragon|^massmarket^>
# I<Renegades of Pern|^hardcover^>
# I<All of Weyrs of Pern|^hardcover^>
# I<Dolphins of Pern|^hardcover^>
# I<The Skies of Pern|^hardcover^>
# I<The Masterharper of Pern|^hardcover^>
5 Harper Hall Trilogy
# I<Dragonsong|^massmarket^>
# I<Dragonsinger|^massmarket^>
# I<Dragondrums|^massmarket^>
5 Other (Dragonriders of Pern)
* I<Dragonsdawn|^hardcover^>
* I<The Chronicles of Pern: First Fall|^hardcover^>
* I<Dragonseye|^hardcover^>
* I<Moreta, DragonLady of Pern|^massmarket^>
* I<Nerilka's Story|^massmarket^>
* I<Dragon's Kin|^hardcover^> with Todd McCaffery
5 Non-fiction
* I<Dragonlovers Guide of Pern|^hardcover^> with Jody Lynn Nye
* I<The People of Pern|^hardcover^> with Robin Wood
4 Freedom
# I<Freedom's Landing|^hardcover^>
# I<Freedom's Choice|^hardcover^>
# I<Freedom's Challenge|^hardcover^>
# I<Freedom's Ransom|^hardcover^>
4 Pegasus and the Tower
# I<To Ride Pegasus|^massmarket^>
# I<Pegasus in Flight|^hardcover^>
# I<Pegasus in Space|^hardcover^>
# I<The Rowan|^hardcover^>
# I<Damia|^hardcover^>
# I<Damia' s Children|^hardcover^>
# I<Lyon's Pride|^hardcover^>
# I<The Tower and the Hive|^hardcover^>
4 The Powers that Be
# I<Powers That Be|^hardcover^>
# I<Power Lines|^hardcover^>
3 Alex McDonough +
4 Scorpio
#2 I<Scorpio Rising|^massmarket^>
# I<Scorpio Descending|^massmarket^>
3 Margaret Weis +
4 Star of the Guardians
# I<The Lost King|^massmarket^>
# I<King's Test|^massmarket^>
# I<King's Sacrafice|^massmarket^>
# I<The Ghost Legion|^massmarket^>
3 Various (science fiction)
* I<The Year's Best Science Fiction, Nineteenth Annual Collection|^trade^> by Gardner Dozois, Ed.
* I<Full Spectrum 4|^massmarket^> by Lou Aronica, Amy Stout, & Betsy  Mitchell, Ed.
* I<Science Fictionisms|^trade^> by William Rotsler, Ed.
2 Young Adult
3 Paul Zindel +
* I<Pardon Me, You Are Stepping On My Eyeball|^massmarket^>
4 Pigman
# I<The Pigman|^massmarket^>
# I<The Pigman Legacy|^massmarket^>
2 Authors I like
& authors
