#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Util::StoryMagic::Collection qw(collection_magic);

my $magic = collection_magic;
page( 'code' => sub { story(*DATA, { 'line magic' => $magic }) });

__DATA__
This is my B<role playing novel collection> of SPAN<hardcovers|^hardcovers^>, SPAN<trade paperbacks|^trades^>, and SPAN<mass market paperbacks|^massmarkets^>.
2 TSR
* I<The Earth Remembers|^massmarket^> by Susan Torian Olan
* I<F.R.E.E. Lancers|^massmarket^> by Mel Odom
* I<The Hidden War|^massmarket^> by Michael Armstrong
* I<The Jewels of Elvish|^massmarket^> by Nancy Varian Berberick
* I<Nightwatch|^massmarket^> by Robin Wayne Bailey
* I<The Nine Gates|^massmarket^> by Phillip Brugalette
* I<Red Sands|^massmarket^> by Paul B. Thompson & Tonya R. Carter
* I<Starsong|^massmarket^> by Dan Parkinson
* I<Token of Dragonsblood|^massmarket^> by Damaris Cole
* I<Web of Futures|^massmarket^> by Jefferson P. Swycaffer
3 Birthright
* I<The Iron Throne|^massmarket^> by Simon Hawke
3 Buck Rogers
4 The Inner Planets Trilogy
* I<First Power Play|^massmarket^> by John Miller
3 Dark Sun
4 Chronicles of Athas
* I<The Brazen Gambit|^massmarket^> by Lynn Abbey
4 Prism Pentad
by Troy Denning
* I<The Verdant Passage|^massmarket^>
* I<The Crimson Legion|^massmarket^>
* I<The Amber Enchantress|^massmarket^>
* I<The Obsidian Oracle|^massmarket^>
* I<The Cerulean Storm|^massmarket^>
4 Tribe of One
by Simon Hawke
* I<The Outcast|^massmarket^>
* I<The Seeker|^massmarket^>
* I<The Nomad|^massmarket^>
3 Dragonlance
* I<The Dragons of Krynn|^massmarket^> by Margaret Weis & Tracy Hickman, Ed.
* I<The Second Generation|^massmarket^> by Margaret Weis & Tracy Hickman
4 Chronicles
by Margaret Weis & Tracy Hickman
* I<Dragons of Autumn Twilight|^massmarket^>
* I<Dragons of Winter Night|^massmarket^>
* I<Dragons of Spring Dawning|^massmarket^>
* I<Dragons of Summer Flame|^hardcover^>
4 Defenders of Magic Trilogy
by Mary Kirchoff
* I<Night of the Eye|^massmarket^>
* I<The Medusa Plague|^massmarket^>
* I<The Seventh Sentinel|^massmarket^>
4 The Dwarven Nations Trilogy
* I<The Covenant of the Forge|^massmarket^> by Dan Parkinson
4 The Elven Nations Trilogy
* I<Firstborn|^massmarket^> by Paul B. Thompson &  Tonya R. Carter
* I<The Kinslayer Wars|^massmarket^> by Douglas Niles
* I<The Qualinesti|^massmarket^> by Paul B. Thompson &  Tonya R. Carter
4 Heroes
* I<The Legend of Huma|^massmarket^> by Richard A. Knaak
* I<Weasel's Luck|^massmarket^> by Michael Williams
* I<Stormblade|^massmarket^> by Nancy Varian Berberick
4 Heroes II
* I<Kaz the Minotaur|^massmarket^> by Richard A. Knaak
* I<The Gates of Thorbardin|^massmarket^> by Dan Parkinson
* I<Galen Beknighted|^massmarket^> by Michael Williams
4 Legends
by Margaret Weis & Tracy Hickman
* I<Time of the Twins|^massmarket^>
* I<War of the Twins|^massmarket^>
* I<Test of the Twins|^massmarket^>
4 The Meetings Sextet
* I<Kindred Spirits|^massmarket^> by Mark Anthony & Ellen Porath
* I<Wanderlust|^massmarket^> by Mary Kirchoff & Steve Winter
* I<Dark Heart|^massmarket^> by Tina Daniell
* I<The Oath and the Measure|^massmarket^> by Michael Williams
* I<Steel and Stone|^massmarket^> by Ellen Porath
* I<The Companions|^massmarket^> by Tina Daniell
4 Preludes
* I<Darkness & Light|^massmarket^> by Paul B. Thompson &  Tonya R. Carter
* I<Kendermore|^massmarket^> by Mary Kirchoff
* I<Brothers Majere|^massmarket^> by Kevin Stein
4 Preludes II
* I<Riverwind the Plainsman|^massmarket^> by Paul B. Thompson &  Tonya R. Carter
* I<Flint the King|^massmarket^> by Mary Kirchoff & Douglas Niles
* I<Tanis the Shadow Years|^massmarket^> by Barbara & Scott Siegel
4 Tales
by Margaret Weis & Tracy Hickman etc.
* I<The Magic of Krynn|^massmarket^>
* I<Kender, Gully Dwarves, and Gnomes|^massmarket^>
* I<Love and War|^massmarket^>
4 Tales II
by Margaret Weis & Tracy Hickman etc.
* I<The Reign of Istar|^massmarket^>
* I<The Cataclysm|^massmarket^>
* I<The War of the Lance|^massmarket^>
3 Fantasitic Adventures
* I<Tale of the Comet|^massmarket^> by Roland Green
3 Forgotten Realms
* I<Azure Bonds|^massmarket^> by Kate Novak & Jeff Grubb
* I<Elminster:The Making of a Mage|^massmarket^> by Ed Greenwood
* I<Pool of Darkness|^massmarket^> by James W. Ward & Anne K. Brown
* I<Pool of Twilight|^massmarket^> by James W. Ward & Anne K. Brown
* I<Realms of Infamy|^massmarket^> by James Lowder, Ed.
* I<Realms of the Arcane|^massmarket^> by Brian M. Thomsen, Ed.
* I<Realms of Valor|^massmarket^> by James Lowder, Ed.
* I<Spellfire|^massmarket^> by Ed Greenwood
4 The Legend of Drizzt
by R. A. Salvatore
5 The Dark Elf Trilogy
* I<Homeland|^massmarket^>
* I<Exile|^massmarket^>
* I<Sojourn|^massmarket^>
5 The Icewind Dale Trilogy
* I<The Crystal Shard|^massmarket^>
* I<Streams of Silver|^massmarket^>
* I<The Halflings Gem|^massmarket^>
5 Legacy of the Drow
* I<Starless Night|^hardcover^>
* I<Seige of Darkness|^hardcover^>
4 The Avatar Trilogy
by Richard Awlinson
* I<Shadowdale|^massmarket^>
* I<Tantras|^massmarket^>
* I<Waterdeep|^massmarket^>
4 The Cleric Quintet
by R. A. Salvatore
* I<Canticle|^massmarket^>
* I<In Sylvan Shadows|^massmarket^>
* I<Night Masks|^massmarket^>
* I<The Fallen Fortress|^massmarket^>
* I<The Chaos Curse|^massmarket^>
4 The Druidhome Trilogy
by Douglas Niles
* I<Prophet of Moonshae|^massmarket^>
* I<The Coral Kingdom|^massmarket^>
* I<The Druid Queen|^massmarket^>
4 The Empires Trilogy
* I<Horselords|^massmarket^> by David Cook
* I<Dragonwall|^massmarket^> by Troy Denning
* I<Crusade|^massmarket^> by James Lowder
4 The Harpers
#9 I<Crown of Fire|^massmarket^> by Ed Greenwood
# I<Masquerades|^massmarket^> by Kate Novak & Jeff Grubb
# I<Curse of the Shadowmage|^massmarket^> by Mark Anthony
#13 I<Silver Shadows|^massmarket^> by Elaine Cunningham
4 The Lost Gods
* I<Tymora's Luck|^massmarket^> by Kate Novak & Jeff Grubb
4 The Maztica Trilogy
by Douglas Niles
* I<Ironhelm|^massmarket^>
* I<Viperhand|^massmarket^>
* I<Feathered Dragon|^massmarket^>
4 The Moonshae Trilogy
by Douglas Niles
* I<Darkwalker on Moonshae|^massmarket^>
* I<Black Wizards|^massmarket^>
* I<Darkwell|^massmarket^>
4 The Nobles
* I<King Pinch|^massmarket^> by David Cook
3 Planescape
4 The Bloodwars Trilogy
by J. Robert King
# I<Blood Hostages|^massmarket^>
# I<Abyssal Warriors|^massmarket^>
# I<Planar Powers|^massmarket^>
3 Ravenloft
# I<Vampire of the Mists|^massmarket^> by Christine Golden
# I<Knight of the Black Rose|^massmarket^> by James Lowder
# I<Dance of the Dead|^massmarket^> by Christine Golden
# I<Heart of Midnight|^massmarket^> by J. Robert King
# I<Tapestry of Dark Souls|^massmarket^> by Elaine Bergstrom
# I<Carnival of Fear|^massmarket^> by J. Robert King
# I<The Enemy Within|^massmarket^> by Christine Golden
# I<Mordenheim|^massmarket^> by Chet Williams
4 Independent
* I<I, Strahd:The Memoirs of a Vampire|^hardcover^> by P. N. Elrod
* I<Tales of Ravenloft|^massmarket^>
3 Spelljammer
4 The Cloakmaster Cycle
# I<Beyond the Moons|^massmarket^> by David Cook
# I<Into the Void|^massmarket^> by Nigel Findley
# I<The Maelstorm's Eye|^massmarket^> by Roger E. Moore
# I<The Radiant Dragon|^massmarket^> by Elaine Cunningham
# I<The Broken Sphere|^massmarket^> by Nigel Findley
# I<The Ultimate Helm|^massmarket^> by Russ T. Howard
2 White Wolf
3 Changeling
4 Immortal Eyes Trilogy
by Jackie Cassada
* I<The Toybox|^massmarket^>
* I<Shadows on the Hill|^massmarket^>
* I<Court of Kings|^massmarket^>
3 Mage
* I<Truth Until Paradox|^massmarket^> by Staley Krause & Stewart Wieck
* I<Such Pain|^massmarket^> by Don Bassingthwaite
3 Mage:The Assention
* I<Tower of Babel|^massmarket^> by John H. Steele
4 The Horizon War
# I<The Road to Hell|^massmarket^> by Robert Weinberg
3 Rage
* I<Breathe Deeply|^massmarket^> by Don Bassingthwaite
3 Vampire
* I<Dark Prince|^massmarket^> by Keith Herber
* I<Blood on the Sun|^massmarket^> by Brian Herbert & Marie Landis
* I<Blood Relations|^massmarket^> by Doug Murray
4 The Masquerade
5 Masquerade of the Red Death
by Robert Weinberg
# I<Bloodwar|^massmarket^>
# I<Unholy Allies|^massmarket^>
# I<The Unbeholden|^massmarket^>
4 The Eternal Struggle
* I<On a Darkling Plain|^massmarket^> by Richard Lee Byers
4 The Dark Ages
5 The Grails Covenant
#2 I<To Speak in Lifeless Tongues|^massmarket^> by David Niall Wilson
3 Werewolf
* I<Watcher|^massmarket^> by Charles Grant
* I<Wyrm Wolf|^massmarket^> by Edo van Belkom
3 Wraith: The Oblivion
4 Dark Kingdoms
# I<The Ebon Mask|^massmarket^> by Richard Lee Byers
3 Miscellaneous
* I<Dark Destiny|^massmarket^> by Edward E. Kramer, Ed.
* I<City of Darkness: Unseen|^massmarket^> by Erin Kelly & Stewart Wieck
* I<Prince of the City|^massmarket^> by Keith Herber
* I<Pomegranates Full and Fine|^massmarket^> by Don Bassingthwaite
* I<Strange City|^massmarket^> by Staley Krause & Stewart Wieck  Ed.
2 FASA
3 Earthdawn
by Christopher Kubasik
# I<The Longing Ring|^massmarket^>
# I<Mother Speaks|^massmarket^>
# I<Poisoned Memories|^massmarket^>
