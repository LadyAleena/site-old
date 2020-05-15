#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Util::LineMagic::Movie qw(movie_magic);

page( 'code' => sub { story(*DATA, { 'line magic' => movie_magic( dots => '..' ) }) });

__DATA__
This is a small list of real, mythological, and fictional B<artifacts> and where they are stored that have appeared in several films and television series.
2 Artifacts
*| spaced
* The B<Ark of the Covenant> has appeared in I<^Raiders of the Lost Ark^> and  I<^The Librarian: Quest for the Spear^>.
* The B<Book> or B<Key of Soloman> has appeared in I<^The Librarian: Return to King Solomon's Mines^> and  I<^Season of the Witch^>.
* A B<Crystal Skull> has appeared in I<^Stargate SG-1^> Q<Crystal Skull>, I<The Librarian: Return to King Solomon's Mines>, and I<^Indiana Jones and the Kingdom of the Crystal Skull^>.
* B<Doc Brown's Delorean> from I<^Back to the Future^> also appeared in I<^The Librarians^> Q<...And the Final Curtain>.
* B<Excalibur> has appeared in I<^Excalibur^>, I<^The Last Legion^>, and I<^The Librarian^> franchise.
* B<H.G. Wells' Time Machine> has appeared in I<^Warehouse 13^> and I<The Librarians>.
* The B<Holy Grail> has appeared in I<^Indiana Jones and the Last Crusade^> and  I<The Librarian: Quest for the Spear>.
* The B<I<Necronomicon>>, sometimes known as the I<Necronomicon Ex-Mortis>, was created by H.P. Lovecraft and appears in several films and television series, most notably I<^The Evil Dead^>.
* B<Pandora's Box> has appeared in I<Warehouse 13> and I<The Librarian: Quest for the Spear>. According to myth, Pandora was given a jar.
* The B<Spear of Destiny> has appeared in I<The Librarian: Quest for the Spear>, I<^Hellboy^>, and I<^Constantine^>.
* The B<TARDIS> from I<^Doctor Who^> has also appeared in I<^The Sarah Jane Adventures^>, I<^Sherlock^>, and  I<The Librarians> Q<...And the Final Curtain>.
2 Places where artifacts are stored
There are several B<warehouses of artifacts> in fiction. They house some of the most dangerous items, both mundane and magical. Real places like Areas 51 and various DARPA labs have been shown to house artifacts.
3 Vendredi's Antiques
B<Vendredi's Antiques> from I<^Friday the 13th (1987)^: the Series> was the shop of Lewis Vendredi who sold evil and dangerous artifacts to his customers. When he died, Micki Foster, his neice, and her cousin, Ryan Dallion, renamed the ship to Curious Goods and stated trying to collect those artifacts back and store them in a vault in the basement.
3 The Library
B<The Library> from I<^The Librarian^> series was first in the New York Public Library in New York City, New York. It had been disconnected from the world in the pilot of I<The Librarians>. At the end of the first season, it was reconnected to the world in Portland, Oregon.
3 The Warehouse
In I<^Warehouse 13^> the B<Warehouse> was located in South Dakota in the United States of America. There had been twelve Warehouses before Warehouse 13.
# Warehouse 1 was in the Kingdom of Macedonia in Greece.
# Warehouse 2 was in Egypt during the Ptolemaic Dynasty.
# Warehouse 3 was in Italy while it was part the Western Roman Empire.
# Warehouse 4 was in the Hunnic Empire.
# Warehouse 5 was in Byzantium.
# Warehouse 6 was in Cambodia during the Khmer Empire.
# Warehouse 7 was in Mongolia during the Mongolian Empire.
# Warehouse 8 was in Germany while it was part of the Holy Roman Empire.
# Warehouse 9 was in Turkey during the Ottoman Empire.
# Warehouse 10 was in India during the Mughul Empire.
# Warehouse 11 was in Moscow, Russia.
# Warehouse 12 was in London, Great Britain.
#14 Warehouse 14 was in Beijing, China briefly, however Warehouse 13 was restored.
There are also dangerous technologies and artifacts stored in Eureka, Oregon.
You can read more about the Warehouses A<elsewhere|href="https://warehouse13.fandom.com/wiki/Warehouse">.
3 Bureau for Paranormal Research and Defense
The B<Bureau for Paranormal Research and Defense> from I<^Hellboy^> is in New York City, New York. It is also where Hellboy lives.
