#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Xanth::LineMagic qw(Xanth_line_magic);

page( 'code' => sub { story(*DATA, { 'line magic' => Xanth_line_magic('page') }) });

__DATA__
These are the Kings and other rulers of B<Xanth>.
2 Kings of Human Xanth
Ivy is the current King of Xanth. There are no ruling queens; so no matter gender, the ruler of Xanth is King. The power of Sorceresses is equal to the power of Magicians; so when a woman becomes King, she is referred to as Magician. King Jonathan had the longest reign of 100 years, since he was a zombie. King Humfrey had the shortest reign of 19 years.
# B<^Merlin^> ruled from ^204^ to ^226^.
# B<^Roogna^> ruled from ^228^ to ^286^.
# B<^Rana^> was the first female King. She ruled from 286 to ^325^.
# B<^Reitas^> ruled from 325 to ^350^.
# B<^Rune^> ruled from 350 to ^378^.
# B<^Jonathan^> first ruled as King from 378 to ^478^. He returned to the throne pro tem in ^Centaur Aisle^ and ^Night Mare^.
# B<^Vortex (RAAHP)^> ruled from 478 to ^548^.
# B<^Neytron^> ruled from 548 to ^575^.
# B<^Nero^> ruled from 575 to ^623^.
# B<^Gromden^> ruled from 623 to ^677^.
# B<^Yin-Yang^> ruled as Yang from 677 to ^719^. He was assassinated by Muerte A. Fid, his successor.
# B<^Muerte A. Fid^> ruled from 719 to ^753^.
# B<^Quan^> ruled from 753 to ^797^.
# B<^Elona^> was the second female King. She ruled from 797 to ^866^.
# B<^Warren^>, after being  assassinated nearly 150 years prior by Muerte A. Fid, ruled from 866 to ^909^ when he was exorcised.
# B<^Ebnez^> ruled from 909 to ^952^.
# B<^Humfrey^> first ruled as King was from 952 to ^971^ when he resigned in favor of Aeolus. He returned to the throne pro tem in I<Night Mare>.
# B<^Aeolus^> ruled from 971 to ^1042^.
# B<^Trent^> ruled from 1042 to ^1067^ when he resigned in favor of Dor. During the Next Wave in ^Night Mare^, several magicians acted as King pro tem.
##2 B<^Dor^> served as King pro tem previously in ^Centaur Aisle^ and becomes King at the end of I<Night Mare>.
## B<Jonathan> was the sixth King of Xanth and served as King pro tem previously in I<Centaur Aisle>.
## B<Humfrey> was the seventeenth King.
## B<^Bink^>
## B<^Arnolde^>, a centaur, is the first non-human Magician to rule Xanth in any capacity.
## B<^Iris^>
## B<^Irene (CaR)^> was classified a neo-Sorceress until I<Night Mare> when she was elevated to full Sorceress so she could take the throne.
## B<^Chameleon^> is not a sorceress, however, she was the most intelligent person available to be king.
## B<^Mare Imbrium^> is a night mare who became king as she was the only one who could break the chain.
# B<^Dor^> ruled from ^1067^ to ^1107^ when he resigned in favor of Ivy. He called upon ^Murphy^ to act as King pro tem in ^Isle of View^.
# B<^Ivy^> became King in 1107 and is the current King of Xanth.
2 Other Kings and leaders
* B<^Bird of a Feather^> is the King of the birds.
* B<^Ferdinand^> is the King of the cowfolk.
* B<^Perseus^> and B<^Andromeda (TTTF)^> are the King and Queen of Dragonflies.
* B<^Harold^> and B<^Helen (CaR)^> were King and Queen of the harpies.
* B<^Nabob^> is the King of the A<Mount Etamin|href="Places.pl#Mount_Etamin"> naga.
* B<^Xeth^> is the King of the zombies.
* B<^Chevalier^> is the leader of Centaur Isle.
* B<^Ortant^> is the Mayor of Imp Perial.
* B<^Giles^> is the Mayor of the PLO Village.
* B<^Nator^> is a human who became a goober to lead the aimless goobers.
3 Mundania
* B<^Arthur Pendragon^> was King of the Britons.
* B<^Astarte^> was Queen of Byblos.
* B<^Henry the 8th^> was King of England.
* B<^Mark^> was King of Corn-Wall.
* B<^Omen^> was King of Onesti.
* B<^King of Lionness^> of Lyonesse.
3 Dream Realm
* The B<^Night Stallion^> is the leader of the Night mares and the nightmare realm in the Gourd.
* The B<^Day Stallion^> is the leader of the Day mares.
3 Dragons
* B<^Dragon King (CaR)^> is King of the dragons in ^Castle Roogna^.
* B<^Dragon Lady (OO)^> is Queen of the dragons in ^Ogre, Ogre^.
* B<^Dragon King (FP)^> is the King of the dragons in A<Storage|href="Places.pl#Playground_Storage"> in ^Five Portraits^.
* B<Prince ^Komodo Li Zard^> is from Isles of Indon Esia in ^Heaven Cent^.
* B<Duke ^Dragontail^> is from Dimwit in I<Heaven Cent>.
* B<^Firestorm^> is a leader of the flying dragons.
3 Elves
* B<^Sword^> is King of the Warrior Elves.
* B<^Crown-Of-Thorns^> is King of the Flower Elves.
* B<^Gimlet^> is Prince of the Tool Elves.
3 Gnomes
* B<^Gnever^> is Chief of the Gnarly Gnomes.
* Gnobody Gnomes
** B<^Gnonenity^> is the Chief.
** B<^Gnasty Gnomad^> is the patriarch.
3 Goblins
* Chasm Clan
** B<^Gorbage^> is Chief.
** B<^Craven^> is a sub-chief.
* Chiefs of Goblin Mountain
** B<^Gouty^>
** B<^Gwendolyn^>
* Chiefs of the Goblinate of the Golden Horde
** B<^Grotesk^>
** B<^Gaptooth^>
** B<^Gauche^>, styled as King
* Chiefs of the Good Riddance Goblins
** B<^Goodrid^>
** B<^Glower^>
* B<^Golden^> is Queen of the Goblin Annex goblins in A<Storage|href="Places.pl#Playground_Storage"> in ^Five Portraits^.
3 Werewolves
* B<^Wolverton^> is the King of the werewolves on the Isle of Wolves.
* B<^Wolfram (FP)^> and B<^Wulfha^> are the leaders of the werewolves in Wolf Country in A<Storage|href="Places.pl#Playground_Storage"> in ^Five Portraits^.
3 During Ragna Roc's reign
* B<^Andromeda (TTTF)^>, Queen of the Dragonflies, became the Elder in Adver City.
* B<^Layea^> became the Elder in Pompos City.
* B<^Lullaby^> became the Elder in Elasti City.
* B<^Orienta^> became the Elder in Necess City.
