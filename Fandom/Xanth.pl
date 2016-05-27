#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use File::Slurp qw(read_file); # read_file

use lib '../files/lib';
use Base::Page qw(page story);
use Base::Data qw(data_directory get_directory data_file);
use HTML::Elements qw(pre);
use Util::Convert qw(textify);
use Util::FamilyTree qw(make_tree);

my $directory = 'Fandom/Xanth_families';
my @files = get_directory(data_directory($directory));

my $doc_magic;
for my $file (@files) {
  $doc_magic->{textify($file)} = sub {
    my $read = read_file(data_file($directory, $file));
    my $tree = make_tree($read);
    pre(5, sub { print $tree }, {'style' => 'overflow-x:auto;'})
  }
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a collection of my notes about the I<Xanth> series I have gathered for reasons. If some of this looks familiar, I started a lot of Xanth related articles on Wikipedia.
2 People
3 Kings of Xanth
Ivy is the current King of Xanth. There are no ruling queens; so no matter gender, the ruler of Xanth is King. The power of Sorceresses is equal to the power of Magicians, she when a woman becomes King, she is referred to as Magician.
# B<A<Merlin|href="#The_family_of_Merlin">>, magician of knowledge
# B<A<Roogna|href="#The_family_of_Merlin">>, magician of adaptation
# B<Rana>, mother of Rune, magician of creation, and the first female King
# B<Reitas>, magician of problem solving
# B<Rune>, magician of evocation and son of Rana
# B<A<Jonathan|href="#The_family_of_Merlin">> is the magician of zombies. He will return to the throne pro tem in I<Centaur Aisle> and I<Night Mare>.
# B<Vortex>, magician of demon summoning
# B<Neytron>, magician who brings paintings to life
# B<Nero>, magician who brings golems to life
# B<A<Gromden|href="#Humfrey_and_Rose_of_Roogna">>, magician of divining the history of things he touches
# B<A<Yin-Yang|href="#Humfrey_and_Rose_of_Roogna">>, magician who can create invokable spells
# B<Muerte A. Fid>, magician of alchemy and uncle of Quan
# B<Quan>, magician of herbalism and nephew of Muerte A. Fid
# B<Elona>, magician of longevity and the second female King
# B<Warren>, magician who could create ghosts and also was a ghost
# B<A<Ebnez|href="The_family_of_Ebnez">>, magician who could adapt magical inanimate objects
# B<A<Humfrey|href="#The_family_of_Humfrey">> is magician of information. He will return to the throne pro tem in I<Night Mare>.
# B<Aeolus>, magician of storms
# B<A<Trent|href="The_family_of_Ebnez">> is the magician of transformation. During the Next Wave in I<Night Mare>, several magicians acted as King pro tem.
## B<Dor> served as King pro tem previously in I<Centaur Aisle> and becomes King at the end of I<Night Mare>.
## B<Jonathan> was the sixth King of Xanth and served as King pro tem previously in I<Centaur Aisle>.
## B<Humfrey> served as King previously until B<Aeolus> replaced him.
## B<Bink> is a magician who can not be harmed by magic.
## B<Arnold>, a centaur, is the first non-human Magician to rule Xanth in any capacity.
## B<Iris> is the sorceress of Illusion.
## B<Irene> was classified a neo-Sorceress until I<Night Mare> when she was elevated to full Sorceress so she could take the throne.
## B<Chameleon> is not a sorceress, however, she was the most intelligent person available to be king.
## B<Imbri> is a night mare who became king as she was the only one who could break the chain.
# B<A<Dor|href="The_family_of_Ebnez">> is the magician who can talk to inanimate objects; he called upon B<Murphy> to act as King pro tem in I<Isle of View>.
# B<Ivy> is the magician of enhancement, daughter of B<Dor>.
2 Families
These are the known family tress of most of some of the major characters of Xanth, though not all of them.
* All people with question marks by their names are from an alternate reality.
* SPAN<&#9829;|style="font-size: larger;"> denotes marriage.
* &#9825; denotes affair or accidental love spring union.
3 The family of Merlin
B<Merlin> was the magician of knowledge and the first King of Xanth.
B<Tapis>, his wife, was the magician of tapestry.
B<Jonathan>, his son, was the magician of zombies and the sixth King of Xanth. He would become King pro tem in I<Night Mare>.
B<Roogna>, Taplin's husband and Merlin's son-in-law, was the magician of adaptation and the second King of Xanth.
& Merlin
3 The family of Ebnez
B<Ebnez> was the sixteenth King of Xanth.
& Ebnez
The twins Ordinate and Abscissa, who can travel by geometry, were supposed to be Ivy's and Grey's children. They were dropped off at an orphanage when Ivy and Grey took too long to marry.
3 The family of Humfrey
B<Humfrey> is the magician of information and was the seventeenth King of Xanth. He has five and a half wives and family connections from all of them.
& Humfrey
4 Humfrey and Dana Demoness
& Humfrey 1
4 Humfrey and Maiden (Matron) Tawain
& Humfrey 2
4 Humfrey and Rose of Roogna
& Humfrey 3
4 Humfrey and Sofia Socksorter
Sofia was given the last name Socksorter by Humfrey. She is the mother of Crombie.
& Humfrey 4
B<Jewel> is a nymph. Her daughter B<Tandy>, by B<Crombie>, is half-nymph.
B<Crunch> is an ogre. His son B<Smash>, by an unnamed Curse Fiend, is half-ogre.
B<Blythe> and B<Brawye> are brassies as is their daughter B<Bria>.
4 Humfrey and Gorgon
& Humfrey 5
5 Naga
B<Nabob> is king of the Naga and father of B<Naldo> and B<Nada>. B<Nara> is Nabob's sister, B<Nathan's> wife, and B<Nefra's> mother.
5 Merpeople
B<Morris> is a merman who married B<Siren>. Together they had B<Cyrus>.
B<Melantha> was married to B<Mewrin>, who died. Together they had B<Marcie>. Melantha then married Naldo.
5 Demons
B<Grossclout> is the father of Prince B<Vore>. Vore married Nada, and they had B<Demonica>.
4 Humfrey and Mare Ann
As of I<Pet Peeve> Humfrey and Mare Ann have not had children. Nothing is known of Mare Ann's family.
3 The Baldwin Family
Jim and Mary Baldwin are mundanes who enter Xanth in I<Yon Ill Wind> with their children. Sean is Jim's son by a previous marriage. David is Mary's son by a previous marriage. Karen is the daughter to both Jim and Mary. They are traveling with their pets Woofer, Sean's dog; Midrange, David's cat, and Tweeter, Karen's bird.
& Baldwin
3 The centaur family
& centaur
3 The goblin family
& goblin
4 Harpies
B<Hardy> is a male harpy. B<Gloha> and B<Harglo> are winged goblins.
4 Giants
B<Graebo> was an invisible giant who was transformed by Magician Trent into a winged goblin. Graebo has two cousins, Greatbow and Girard.
3 The zombie family
& zombie
3 Other families
* Nimby (the personification of the demon Xanth) and Chlorine had Nimbus.
* Justin, who was turned into a tree by Trent, became human again and married Breanna. They had Amber Dawn.
* The clouds Cumulo Fracto Nimbus and Happy Bottom (Hurricane Gladys) married and had Fray Cloud and Wynde Tchill.
* The dragons Stanley Steamer Stacy (Stella) married and had Steven.
* The fairies Joan (John) and John (Joan) married.
* The gargoyles Gary Gar and Gayle Goyle married.
* The harpies Harold and Heavenly Helen married.
* The imp Ortent is the father of Quieta who is the mother of Trentia.
* The mundanes Doug and Kim entered Xanth through the game interface in I<Demons Don't Dream>. They later married and had Knut.
* The ogres Okra and Smithereen married and had Og and Not-Og.
* The pookas Pook and Peek married and had Puck.
* The sylphs Sylvester and Sylvia married and had Sylvinia.
* Known twins in Twin City
** Mariana and Anairam (stone related talents)
** Amanda and Adnama (hair color related talents)
** Leai and Adiana (death related talents)
** Deja and Vu (future seeing talents), fraternal twins (male and female)
* Sherry, Terry, and Merry (size altering talents)are the only known triplets of Tri City
* The Cyclops (children of the Sky): Argus, Brontus, and Steropes
* The Furies (children of the Earth): Alecto, Megaera, and Tisiphone
2 Places
3 Castles
* Castle Maidragon
* Castle Roogna
* Castle Zombie
* Humfrey's Castle
* Nameless Castle
3 Communities
* Black Village
* Gap Village
* Isthmus Village
* North Village
* South Village
* Western Stockade
3 Islands
* Centaur Isle
* Isle of Illusion
* Isles of Joey
* Isle of View
3 Lakes
* Lake Kiss-Mee
* Lake Ogre-Chobee
* Lake Wails
3 Rivers
* Fish River
* Kiss-Me River
* Sane Jaunts River
* Swan Knee River
* With a Cookie River
3 Other places
* The Gap Chasm
* The five forbidden regions
** Region of Air
** Region of Earth
** Region of Fire
** Region of Water
** The Void
* The Gourd is the realm of the Night Stallion and Night Mares.
* Mount Parnassus is the home of the Muses.
* Ida's Moons
* Counter Xanth
