#!/usr/bin/perl
# This is the Xanth index.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

my $doc_magic;

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a collection of my notes about the I<Xanth> series I have gathered. There are many major A<families|href="Families.pl"> and A<places|href="Places.pl">. If some of this looks familiar, I started a lot of Xanth related articles on Wikipedia. This page is very incomplete as I am nine novels behind in the series and have not been able to kept up with it.
2 Kings of Human Xanth
Ivy is the current King of Xanth. There are no ruling queens; so no matter gender, the ruler of Xanth is King. The power of Sorceresses is equal to the power of Magicians; so when a woman becomes King, she is referred to as Magician.
# B<A<Merlin|href="Families.pl#The_family_of_Kings_and_Magicians">>, magician of knowledge
# B<A<Roogna|href="Families.pl#The_family_of_Kings_and_Magicians">>, magician of adaptation
# B<Rana>, mother of Rune, magician of creation, and the first female King
# B<Reitas>, magician of problem solving
# B<Rune>, magician of evocation and son of Rana
# B<A<Jonathan|href="Families.pl#The_family_of_Kings_and_Magicians">> is the magician of zombies. He will return to the throne pro tem in I<Centaur Aisle> and I<Night Mare>.
# B<Vortex>, magician of demon summoning
# B<Neytron>, magician who brings paintings to life
# B<Nero>, magician who brings golems to life
# B<A<Gromden|href="Families.pl#Humfrey_and_Rose_of_Roogna">>, magician of divining the history of things he touches
# B<A<Yin-Yang|href="Families.pl#Humfrey_and_Rose_of_Roogna">>, magician who can create invokable spells
# B<Muerte A. Fid>, magician of alchemy and uncle of Quan
# B<Quan>, magician of herbalism and nephew of Muerte A. Fid
# B<Elona>, magician of longevity and the second female King
# B<Warren>, magician who could create ghosts and also was a ghost
# B<A<Ebnez|href="Families.pl#The_family_of_Kings_and_Magicians">>, magician who could adapt magical inanimate objects
# B<A<Humfrey|href="Families.pl#The_family_of_Humfrey">> is magician of information. He will return to the throne pro tem in I<Night Mare>.
# B<Aeolus>, magician of storms
# B<A<Trent|href="Families.pl#The_family_of_Kings_and_Magicians">> is the magician of transformation. During the Next Wave in I<Night Mare>, several magicians acted as King pro tem.
## B<A<Dor|href="Families.pl#The_family_of_Kings_and_Magicians">> served as King pro tem previously in I<Centaur Aisle> and becomes King at the end of I<Night Mare>.
## B<A<Jonathan|href="Families.pl#The_family_of_Kings_and_Magicians">> was the sixth King of Xanth and served as King pro tem previously in I<Centaur Aisle>.
## B<Humfrey> served as King previously until B<Aeolus> replaced him.
## B<A<Bink|href="Families.pl#The_family_of_Kings_and_Magicians">> is a magician who can not be harmed by magic.
## B<Arnold>, a centaur, is the first non-human Magician to rule Xanth in any capacity.
## B<A<Iris|href="Families.pl#The_family_of_Kings_and_Magicians">> is the sorceress of Illusion.
## B<A<Irene|href="Families.pl#The_family_of_Kings_and_Magicians">> was classified a neo-Sorceress until I<Night Mare> when she was elevated to full Sorceress so she could take the throne.
## B<A<Chameleon|href="Families.pl#The_family_of_Kings_and_Magicians">> is not a sorceress, however, she was the most intelligent person available to be king.
## B<Imbri> is a night mare who became king as she was the only one who could break the chain.
# B<A<Dor|href="Families.pl#The_family_of_Kings_and_Magicians">> is the magician who can talk to inanimate objects; he called upon B<Murphy> to act as King pro tem in I<Isle of View>.
# B<A<Ivy|href="Families.pl#The_family_of_Kings_and_Magicians">> is the magician of enhancement, daughter of B<Dor>.
2 Other Kings and leaders
* B<Perseus> and B<Andromeda> are the King and Queen of Dragonflies.
* B<Bird of a Feather> is the King of the birds.
* B<Chevalier> is the leader of Centaur Isle.
* B<Dragon Lady> is Queen of the dragons.
* B<Ferdinand> is the King of the cowfolk.
* B<Heavenly Helen> is Queen of the harpies.
* B<Mark> is the King of Corn-Wall.
* B<Nabob> is the King of the naga.
* B<Ortant> is the Mayor of Imp Perial.
* B<Wolverton> is the King of the werewolves.
* B<Xeth> is the King of the zombies.
3 Dream Realm
* The B<Night Stallion> is the leader of the Night mares and the nightmare realm in the Gourd.
* The B<Day Stallion> is the leader of the Day mares.
3 Elves
* B<Sword> is King of the Warrior Elves.
* B<Crown-Of-Thorns> is King of the Flower Elves.
* B<Gimlet> is Prince of the Tool Elf tribe.
3 Gnomes
* B<Gnasty Gnomad> is the patriarch of the Gnobody Gnomes.
* B<Gnever> is Chief of the Gnarly Gnomes.
3 Goblins
* Chiefs of Goblin Mountain
** B<Gouty>
** B<Gwendolyn>
* Chiefs of the Goblinate of the Golden Horde
** B<Grotesk>
** B<Gaptooth>
** B<Gauche>, styled as King
* Chiefs of the Good Riddance Goblins
** B<Goodrich>
** B<Glower>
* B<Golden> is Queen of the Storage goblins.
* B<Gorbage> is Chief of the North Slope Gap Goblins.
3 During Ragna Roc's reign
* B<Andromeda>, Queen of the Dragonflies, became the Elder in Adver City.
* B<Orienta> became the Elder in Necess City.
2 Acknowledgment
I want to thank Douglas Harter for all of his work putting together the list of characters on A<HiPiers|href="http://www.HiPiers.com">. I could not have completed the family trees without him.
