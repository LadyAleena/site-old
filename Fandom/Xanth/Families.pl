#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use IO::All;

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(pre);
use Util::Convert qw(textify);
use Util::Data qw(file_list file_directory data_file);
use Util::FamilyTree qw(make_tree);
use Util::Xanth::LineMagic qw(Xanth_line_magic);

my $directory = 'Fandom/Xanth/Family_trees';
my @files = file_list(file_directory($directory));

my $doc_magic;
for my $file (@files) {
  if (-f data_file($directory, $file)) {
    $doc_magic->{textify($file)} = sub {
      my $read = io(data_file($directory, $file))->slurp;
      my $tree = make_tree($read, { special => 'Incarnations' });
      pre(5, sub { print $tree }, {'style' => 'overflow-x:auto;'})
    }
  }
}

page( 'heading' => 'Families in Xanth', 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic, 'line magic' => Xanth_line_magic('page') }) });

__DATA__
These are the known families of the characters of Xanth though not all of them. Trees are drawn if there are five or more people across two or more generations.
* SPAN<&#9829;|style="font-family: monospace; font-size: large; color:red;"> denotes marriage.
* SPAN<&#9825;|style="font-family: monospace; font-size: large; color:red;"> denotes affair or accidental love spring union.
2 The family of Kings and Magicians
& Kings
hr
^Roland^ is a descendant of ^Ebnez^, however, which daughter left Mount Parnassus and had a child is not clear.
While ^Trent^ was exiled in Mundania, he married and had a son. Their deaths were the catalyst of his return to Xanth. He became king on the condition that he marry, so he married ^Iris^. They have ^Irene (CaR)^. Trent took youth elixer in ^Harpy Thyme^, and Iris took youth elixer in ^Geis of the Gargoyle^. After they were rejuvinated, they had ^Ilene (AA)^ and ^Irenti^ or ^Trentia^. ^Trenris^ is the possible son of Iris and Trent in ^Yon Ill Wind^.
^Bink^ and ^Chameleon^ had ^Dor^. They took youth elixer in ^Zombie Lover^. After they were rejuvinated, they had ^Auspice^ and ^Anima^.
^Io^, instead of ^Ivy^, is the daughter of ^Dor^ and ^Irene (CaR)^ in an alternate reality in ^Stork Naked^.
Ivy, ^Ida^, and ^Dolph^ all have complications in their families, so they are below.
3 Ivy and Grey
& Ivy
hr
The twins ^Abscissa^ and ^Ordinate^ were supposed to be ^Ivy^'s and ^Grey^'s children. They were dropped off at an orphanage when Ivy and Grey took too long to marry. They were introduced in ^Roc and a Hard Place^.
^Melanoma^, on Ptero, was mentioned in ^Cube Route^.
In ^Faun and Games^, several possible children of Ivy and Grey are introduced. ^Revy^, ^Grant^, and ^Isabella Emily Carylyn^ live on Ptero. ^Gerrod^ and ^Ilene (FAG)^ live on the Blue Face of Pyramind.
^Dol^ was introduced in ^Xone of Contention^.
^Green (TD)^ was introduced in ^The Dastard^.
^Kadence^ was delivered in ^Two to the Fifth^ when ^Rhythm^ was 12 years old, artificilly aged to 22. She was returned to the storks to be delivered at a more appropriate time.
In an alternate reality in ^Stork Naked^, Ivy is married to ^Naldo^.
3 Ida
& Ida
hr
In the main Xanth reality, ^Ida^ married ^Hilarion^, and they had ^Ione^.
^Idaho^ is a possible daughter of Ida with ^Ho^, however the ^Dastard^ kept her from being born. ^Idyll^ is another possible daughter of Ida, but her possible father is unknown. Both were introduced in ^The Dastard^.
3 Dolph and his daughters
& Dolph
hr
In the main Xanth reality, ^Dolph^ married ^Electra^. ^Crescendo^ is a possible son of theirs introduced in ^Faun and Games^.
A long time ago, ^Pluto^ was married to ^Persephone^. He was also an ex-lover of ^Sharon (JC)^. In a recent bet with ^Xanth^ in ^Jumper Cable^; he attempted to seduce the party, lead by ^Jumper (JC)^, away from their mission to fix the cable. He slept with ^Maeve^, ^Wenda^, ^Olive Hue^, ^Phanta^, ^Dawn^, and ^Eve^. Phanta also slept with Jumper.
Maeve, Wenda, Olive Hue, and Phanta all married by the end of the adventure. Maeve married ^Warren Warrior^, who adopted her daughter ^Mae (JC)^. Wenda married ^Charming^, and they adopted ^Alex (KG)^ later. Olive Hue married ^Dick Philip^. Phanta married ^Shepard^. Jumper married ^Eris^. Eve married Pluto, in spite of everything he did during the quest. All the cermonies were performed by ^Dawn^. SMALL<(See A<Eris and Jumper|href="#Eris_and_Jumper"> for more about them.)>
In an alternate reality in ^Stork Naked^, ^Picka Bone^ was married to ^Surprise^. SMALL<(See A<Surprise|href="#Surprise">)>
4 Eris and Jumper
^Eris^ is the mother of ^Dysnomia^ and both are Dwarf Demons. Both Jumpers are jumping spiders. ^Jumper (CaR)^ I traveled back in time with ^Dor^. ^Jumper (JC)^ II is a many generation descendant of Jumper I who was transformed into a human. Prior to marrying Jumper, Eris was the lover of ^Sharon (JC)^, the sister of ^Charon^. Charon married ^Haughty^. Sharon is also an ex-lover of ^Pluto^. During Jumper's adventures in ^Jumper Cable^, he slept with ^Angie Ina^ and Phanta.
& Eris
3 Merlin and Dolph's alternate families
& Merlin
hr
^Lacuna^ was retroactively married to ^Vernon^ and ^Ryver^, ^Jot^, and ^Tittle^ are their retroactive children in ^Question Quest^. ^Lacky^ is a possible daugther of ^Lacuna^ and ^Vernon^ introduced in ^The Dastard^.
In an alternate reality from ^Stork Naked^, Jot is married to ^Surprise^.
In another alternate reality from I<Stork Naked>, ^Dolph^ and ^Nada^ were married and had ^Donald (SN)^. However they undid their marriage and their son by taking a Guilt Trip.
In a separate alternate reality from ^Ghost Writer in the Sky^, Dolph married ^Taplin^, and they had ^Dolin^. Dolin became real in the main reality and married ^DeMonica^. ^Merara^, from the past and the same alternate reality, also became real in the main reality and married ^Emerald^.
In yet another reality from I<Ghost Writer>, Dolph and Nada were, again, married and had ^Drew (GWITS)^. He married ^Jody^, a descendant of ^Threnody^ and ^Jordan^. SMALL<(See A<below|href="#Humfrey_and_Rose"> for more.)>
2 The family of Humfrey
^Humfrey^ is the magician of information and was the seventeenth King of Xanth. He has five and a half wives and six children. He has a very large extended family.
& Humfrey
3 Humfrey and Dara
^Dara^ is the first wife of Humfrey and a demoness. Humfrey got her name wrong and calls her Dana. After ^Dafrey^ was born, she left Humfrey. A while later, Dara assumed the likeness of Taiwan and conceived ^Matt a Door^ to get rid of the remaining bits of soul attached to her.
& Humfrey 1
3 Humfrey and Taiwan
^Maiden Taiwan^ is the second wife of ^Humfrey^. When she married him, she lost the title Maiden and became Matron Taiwan. ^Maiden China^ is Taiwan's actual sister, while ^Maiden Japan^ and ^Maiden Mexico^ are spiritual sisters.
She and the other Maidens were saved by ^Nan O' Tek^ and brought to Xanth from Mundania. They formed Mai-Den Corporation Industrial Park in the Gap chartered by King ^Ebnez^.
Taiwan left Humfrey when he abdicated the throne.
& Humfrey 2
3 Humfrey and Rose
^Rose^ of Roogna is the third wife of Humfrey.
& Humfrey 3
hr
^Glitter (FAG)^, whose talent is the sparkle, is a possible daughter of ^Grundy^ and ^Rapunzel^ introduced in ^Faun and Games^. Grudy was built as a golem by ^Humfrey^ and given life by ^Xanth^.
^Pia Putz^ and ^Breanna^ conjectured two possible sons for ^Ted^ and ^DeMonica^, ^Tedmon^ and ^Monted^, in ^Xone of Contention^. SMALL<(See more about ^Dolph^ and ^Nada^ A<above|href="#Merlin_and_Dolphs_alternate_families"> and Nada and DeMonica A<below|href="Humfrey_and_Gorgon">)>
^Isis^ is currently trapped in a Comic Strip near the Forbidden Regions on Xanth. She can interact only through sharing the bodies of others. So, she is the lover of Ted through ^Amara^ and ^Goar^ through ^Nydia^. Her family from Ancient Egypt is below.
4 Surprise
There are several alternate reality versions of ^Surprise^, ^Umlaut^, ^Che^, and ^Cynthia^ in ^Stork Naked^.
# In the main reality; Surprise is married to Umlaut, and they have ^Prize^. Che is married to Cynthia with their own foals. SMALL<(See A<below|href="#The_family_of_Chester"> for more on Che and Cynthia)>
# In the first reality, Surprise and Umlaut have a son.
# In the second reality; Surprise is married to Che, and they have a foal. Umlaut and Cynthia are married. SMALL<(See A<below|href="#The_family_of_Chester"> for more on the alicentaurs)>
# In the third reality, Surprise is married to ^Picka Bone^. SMALL<(See A<above|href="#Dolph_and_his_daughters"> for more on Picka Bone)> <!-- It is assumed Umlaut-Four married Joy'nt Bone. -->
# In the fourth reality, Surprise is married to ^Brusque^. Earlier in ^Up in a Heaval^, Brusque was offered to Surprise as a substitute for Umlaut, and ^Becka^ was offered to Umlaut as a substitute for Surprise. SMALL<(See A<below|href="#Humfrey_and_Sofia"> for more on Brusque, Becka, Epoxy, and Benzine)> <!-- It is assumed Umlaut-Three married Becka. -->
# In the fifth reality, Surprise is married to ^Jot^. SMALL<(See A<above|href="#Merlin_and_Dolphs_alternate_families"> for more on Jot.)> <!-- It is assumed Umlaut-Four married Tittle. -->
# In the sixth reality, Surprise and Umlaut are soulless. Surprise is also possessed by ^Morgan Le Fey^. They married the much younger ^Epoxy^ and ^Benzine^ respectively. Surprise and Umlaut then had an affair to get Prize so Morgan Le Fey could have a younger body.
While in Mundania, Morgan Le Fey and King ^Arthur Pendragon^ had ^Mordred^. 
4 Isis
Isis and her family are gods from Ancient Egypt.
& Isis
3 Humfrey and Sofia
^Sofia^ is the fourth wife of Humfrey and was given the last name Socksorter by him.
& Humfrey 4
hr
^Crombie^ was transformed into a griffin for a mission; and while transformed, he was given love potion by ^Grinelle^. Their daughter ^Griselda^ was born a griffin with human intelligence.
^Jewel^ is a nymph. Her daughter ^Tandy^ by Crombie is half-nymph. ^Crunch^ is an ogre. His son ^Smash^ by ^Sleeping Beauty^, an unnamed Curse Fiend, is half-ogre.
^Eskil^ is half-human and quarter nymph and ogre. ^Blythe^ and ^Brawnye^ are brassies as is their daughter ^Bria^.
The children of ^Bria^ and ^Eskil^ are half-brassie, quarter-human, and eighth nymph and ogre.
^Draco^ is a firedrake. His daughter ^Becka^, by an unnamed woman, is a half-dragon.
^Ben^ is three-eighths human, quarter dragon and brassie, and sixteenth nymph and ogre.
In ^Faun and Games^, ^Briskil^ and ^Astrid (FAG)^ are a possible children of ^Bria^ and ^Eskil^. Briskil is married to ^Nina^ Naga, and they had ^Nora^.
In an alternate reality from ^Stork Naked^, ^Brusque^ is married to ^Surprise^. In another reality, ^Epoxy^ and ^Benzine^ are married to the soulless Surprise and ^Umlaut^ respectively. In that reality, Surprise and Umlaut have an affair. SMALL<(See A<Surprise|href="#Surprise"> for more)>
3 Humfrey and Gorgon
^Gorgon^ is the fifth wife of Humfrey.
& Humfrey 5
hr
Magician ^Hydrogen^ and ^Bec on Call^ are the ancestors of the merfolk in the Region of Water.
In ^Faun and Games^, ^Wigo^ is a possible daughter of ^Hugo^ and ^Wira^. All the possible children in this family appeared in I<Faun and Games>.
^Siren^ is a mermaid, so ^Cyrus (NM)^ is freshwater merfolk. ^Melantha^ is a merwoman, so ^Merci^ is saltwater merfolk. ^Cerci^ is  both fresh and salt water merfolk and a possible daughter of ^Cyrus (NM)^ and ^Merci^ on the Gray Face of Pyramid.
^Nabob^ is king of the Naga. ^Nara (LOTD)^ is Nabob's sister and married to ^Nathan^, a human. ^Grossclout^ is the king of the demons.
^Nigel^ and the twins ^Mourning^ and ^Knight (FAG)^ are possible sons of Naldo and Melantha. ^Demos^ is a possible son of ^Nada^ and ^Vore^.
3 Humfrey and MareAnn
Humfrey and ^MareAnn^ have an unnamed child on the Gray Face of Pyramid in ^Board Stiff^. MareAnn is related to ^HellAnn^, ^SpartAnn^, and ^TrojAnn^; but their relations to her are unknown.
2 Centaur families
* ^Carleton^ is the older brother of ^Chena^ who was banished from Centaur Isle for having a talent. Chena becomes an alicentaur.
* ^Cedric^ and ^Celeste^ are mates. ^Cedric the 10th^ is their descendant.
* ^Ilura^ and ^Hurry^ are mates and had ^Imina^ and ^Imino^ Hurry on Ptero.
* The alicentaurs ^Cathryn^ and ^Contrary^ finally became mates on Ptero in ^Faun and Games^.
* The alicentaurs ^Challenge^ and ^Chellony^ have three foals in ^Stork Naked^.
3 The family of Chester
& Chester
hr
^Chem^ mated with ^Xap^, a hippogryph; and they had ^Chex^, an alicentaur.
Chex eventually found ^Cheiron^; and they had ^Che^ and the twins, ^Chelsy^ and ^Cherish^.
^Cynthia^ was a human who was transformed into an alicentaur by ^Trent^. She went into the ^Brain Coral^ pool because there were no other alicentaurs at the time. When she returned to Xanth, she met and married Che.
^Merei^, ^Mesta^, and ^Dell^ were delivered human though they are griffin, seacow, and centaur in origin.
In the main reality and the first alternate reality in ^Stork Naked^, Che is married to Cynthia. In the second reality, Che is married to ^Surprise^ and they have a foal. Cynthia is married to ^Umlaut^. SMALL<(See A<Surprise|href="#Surprise"> above)>
2 Dragon families
* ^Drew (CuR)^ and ^Drusie^ from A<Dragon|href="Places.pl#Dragon"> are mates.
* ^Stanley Steamer^ and ^Stella Steamer^ are mates and had ^Steven Steamer^.
* ^Vertex^ and ^Vortex (PP)^ from Dragon are mates.
2 Goblin families
* A brother and sister are both named Ari.
* ^Glower^, Chief of the Good Riddance Goblins, and ^Glinda^ have ^Glenna (BS)^. Glinda and Glenna are descendents of a human Magician.
* ^Golden^, Queen of the A<Storage|href="Places.pl#Playground_Storage"> Goblins, is the mother of ^Goldie (FP)^.
3 The family of Gorbage
& Gorbage
hr
^Hardy^ is a male harpy. ^Gloha^ and ^Harglo^ are winged goblins. The harpies ^Grand Harridan^, ^Grobigatail^, and ^Hoary Harributtes^ are said to be aunts to ^Gloha^ and ^Harglo^; however the relationship may be more distant.
^Graeboe^ was an invisible giant who was transformed by ^Trent^ into a winged goblin. Graeboe has two cousins, ^Greatbow^ and ^Girard^. Girard married ^Gina^ in the Dream Realm.
In ^Faun and Games^, ^Kerby^ is the brother of ^Graeboe^ and ^Ghina^ and ^Geddy^ are large invisible winged goblin children of ^Gloha^ and Graeboe on the Red Face of Pyramid. ^Gim^ and ^Gine^ are possible sons of Girard and Gina on Ptero.
2 Ogre families
* ^Agora^ and ^Medi^ are sister and brother.
* ^Ole^ and ^Orgy^ married on Ptero.
* ^Tasmaniac^ and ^Tasmania Devil^ are cousins, and Tasmania is marreid to ^Conan the Librarian^.
3 The family of Okra
& Okra
2 Major and Dwarf Demon families
3 Nimby and Chlorine
^Nimby^, which stands for "not in my back yard", is the major demon X(A/N)TH in his dragon-ass form. He met and fell in love with ^Chlorine^ during ^Yon Ill Wind^.
The clouds Cumulo ^Fracto^ Nimbus and ^Happy Bottom^ (Hurricane Gladys) married and had ^Fray^ and ^Wynde Tchill^.
^Nimbus^ is interested in Fray.
& Nimby
3 Earth, Fornax, and the Baldwin Family
A<Jim|href="Characters.pl?character=Jim+Baldwin"> and ^Mary Baldwin^ entered Xanth in ^Yon Ill Wind^ with their children. A<Sean|href="Characters.pl?character=Sean+Baldwin"> is Jim's son by a previous marriage. A<David|href="Characters.pl?character=David+Baldwin"> is Mary's son by a previous marriage. A<Karen|href="Characters.pl?character=Karen+Baldwin"> is the daughter to both Jim and Mary. They traveled with their pets ^Woofer^, Sean's dog; ^Midrange^, David's cat, and ^Tweeter^, Karen's bird. In ^Swell Foop^, David became a willing host for Demon ^Earth^ and ^Jaylin^ became a unwilling host for ^Fornax^. David and Jaylin started dating so Earth could keep an eye on Fornax.
Earth went on to marry ^Gaia^ in ^Air Apparent^. Fornax went on to marry ^Nemesis^ and adopt ^Santo^ in ^Five Portraits^.
& Baldwin
The Baldwin family pets got old in Mundania, so they traveled back to Xanth to continue living. Woofer and ^Rachel (LOTD)^ had ^Rowena (ED)^, ^Wolfe^, and another unnamed pup. Midrange and ^Erin Kitty Litter^, a werecat, are mates but have not had any known kittens. So far, Tweeter has not found a mate.
2 Human families
* ^Allergy^ and ^Robert Ulysses Dunn^ have an unnamed child.
* ^Astrid (BS)^ and ^Art^ married and adopted ^Firenze^.
* ^Azalea^ and ^Lotus^ are twin sisters. Lotus is dating ^Wade^. Wade has a brother ^Ray (SN)^ who he wants to introduce to Azalea.
* The Burr family is ^Em Burr^, ^Encum Burr^, ^Har Burr^, ^Lim Burr^, ^Num Burr^, ^Slum Burr^, and ^Tim Burr^.
* ^Haggi^ is the mother of ^Modem^.
* ^Jacob^, ^Lauryl^, and their sons ^Noah^ and ^Thom^ got lost in Xanth in ^Air Apparent^.
* ^Jerry Tamagni^ and his son ^Terry Tamagni^ were met at an enchanted pool in ^Cube Route^.
* ^Justin (ASFC)^ married ^Breanna^, and they had ^Amber Dawn^.
* ^Kalt^ and ^Frosteind^ are fraternal twin brother and sister. Frosteind is dating ^Zach^.
* ^Kandy^ and ^Ease^ married and adopted ^Squid^.
* ^Lacey^ is married to a man who is a descendant of King ^Warren^.
* ^Noi^ and ^Mikhail^, both from Mundania, married and adopted ^Malinee^.
* ^Owen Cossaboon^ is the father of ^Sharon (XOC)^. Sharon is the mother of ^Don^/^Dot (XOC)^.
* ^Sally^ and ^Donald (ASFC)^ were married and had an unnamed son.
* ^Sand Witch (FP)^ adopted ^Sand D^.
* ^Svelte^ and ^Scab^ have ^Hugh Mongus^.
* If ^Vendetta^ and ^Crony^ ever get around to it, they will have ^Scintalla^.
* ^Vice^ and ^Versa^ are cousins who have twins for parents.
* ^Waller^ and ^Wallette^ are married and have a daughter ^Wallnut^.
3 The family of Arjayess
& Arjayess
^Arjayess^ wrote letters to Xanthians in ^Up in a Heaval^.
3 The family of Merge
& Merge
^Merge^ is the descendent of a Magician and Sorceress, both unnamed. Merge is the combined form of ^Black^, ^Blue^, ^Brown^, ^Red (BS)^, and ^Yellow^.
3 The Poole family
& Poole
3 The family of Silhouette
& Silhouette
^Cube^ used ^Silhouette^ to visit Mundania in ^Cube Route^.
3 The family of Tiara
& Tiara
3 The family of Xavier
& Xavier
^Xanthippe^ and her son ^Xavier^ are human. Xavier fell in love with ^Zora^, a human zombie, and later married her.
^Xander^ and ^Zelda^ are possible human children of Xavier and Zora on Ptero in ^The Dastard^.
3 The Sette family
& Sette
The Sette family was in ^Air Apparent^.
3 The Companions of Xanth
& Companions
In ^Demons Don't Dream^, ^Edsel^ bet ^Dug^ a date with Dug's then girlfriend ^Pia Putz^ that he would like the I<Companions of Xanth> video game. Dug gladly lost the bet because he met ^Kim (DDD)^.
3 Sofia's play
^Miss Take^, playing ^Raven^, and ^Miss Inform^, playing ^Robin^, were actresses in A<Sofia's|href="Character.pl?character=Sofia"> play who married ^Justin Case^ and ^Justin Time^ to save the play on Ptero. The characters ^Ruben^ and ^Rowena (FAG)^ are the parents of Raven and Robin.
4 The actors
& Miss-Justin
4 The characters
& Play
3 Couples
These people are together whether it be married, dating, or went off together somewhere.
* ^Auntie Nym^ and ^Uncle Nym^
* The ^Sea Girl^, who became the ^Sea Hag^, and ^Green Horn^ were married.
* ^Thesis^ and ^Zaven^
4 Dating
*| two
* ^Besanii^ and ^Bill Fold^
* ^Celest^ and ^Aaron (SN)^
* ^Chandra^ and ^Dudley Dragonman^
* ^Debra^ and ^Random Factor^
* ^Doll^ and ^Red Pepper^
* ^Elem N. Tery^ and ^Bill^
* ^Cylla Cybin^ and ^Eli (IO)^
* ^Eunice^ and ^Fate^
* ^Flora^ and ^Wayne^
* ^Harberian Barbarian^ and ^Eric^
* ^Jade^ and ^Eck Sray^; Jade was with ^Mac^/^Mike (TD)^/^Mal^ until the ^Dastard^ undid their relationship.
* ^Keaira^ and ^Adam^
* ^Nikki^ and ^Dave (SN)^
* ^Petting Sue^ and ^Gourd'n G'rd'n'r^
* ^Psyche^ and ^Timothy^
* ^Punny^ and ^Unpun^
* ^Pyra^ and ^Finn^
* ^Rose Quartz^ and ^Smoky Quartz^
* ^Sand Witch (TTTF)^ and ^Tuff Stuff^
* ^Sara Nade^ and ^Brant (WTC)^
* ^Skyla^ and ^Arlis^
* ^Tess Tosterone^ and ^S Trojan^
* ^Xina^ and ^Guise^
3 Siblings
* ^Afro Disiac^ and ^Salt Peter^ are sister and brother.
* ^Ande^, ^Bruce (JC)^, ^Clare^, ^Dele^, and ^Enze^
* ^Anne^ and ^Leigh^ are sisters.
* The Cate brothers are ^Impli Cate^, ^Intoxi Cate^, ^Recipro Cate^, and ^Vindi Cate^.
* ^Clairficant^ and ^Opaque^ are sister and brother.
* ^Digit Alice^ and ^Feelup^ are sister and brother.
* ^Furn^, ^Airic^, ^Peat^, ^Wyck^, and ^Quantum^ live in the Forbidden Regions.
* ^Megan (TTTF)^ and ^Melvin^ are brother and sister.
* ^Sherry (YIW)^, ^Terry^, and ^Merry^ are triplets in Tri City.
* ^Shy Violet^ and ^Skyler^ are brother and sister.
* The Tractor brothers are ^Con Tractor^, ^Pro Tractor^, ^Subcon Tractor^, and ^Dis Tractor^.
4 Twins
*| two
* ^Amanda (YIW)^ and ^Adnama^ are sisters.
* ^Auth^ and ^Ticity^ are fraternal twin brother and sister.
* ^Barbar^ and ^Barbara^ are fraternal twin brother and sister.
* ^De Crease^ and ^In Crease^ are brothers.
* ^Deja^ and ^Vu^ are fraternal twin brother and sister.
* ^Darren^ and ^Darron^ are brothers.
* ^Fiero^ and ^Fiera (GOTG)^ are fraternal twin brother and sister.
* ^Geo^ and ^Graphy^ are brothers.
* ^In Crease^ and ^De Crease^ are brothers.
* ^Inebriated^ and ^Intoxicated^ are sisters.
* ^Leai^ and ^Adiana^ are sisters.
* ^Mariana^ and ^Anairam^ are sisters.
* ^Mol (SF)^ and ^Ly^ are sisters.
* ^Morton^ (More) and ^Lester^ (Less) brothers.
* ^Obvious^ and ^Obvious-Lee^ are  brothers.
* ^Opti Mystic^ and ^Pesi Mystic^ are fraternal twin brother and sister.
* ^Pastor^ and ^Futura^ are fraternal twin brother and sister.
* ^Sharina^ and ^Suretha^ are sisters created by Olive Hue.
2 Other families
* ^Claire Voyant (UIAH)^, from the Isle of Cats, and ^Sammy^, who came to Xanth with ^Jenny^, are mates and had ^Kitten Kaboodle^.
* ^Karia^, a centaur, and ^Drek^, a dragon from Phaze, had ^Hadi^ Alicenagon.
* ^Mare Imbrium^ mated with the ^Day Stallion^ and had ^Palus Putredinis^, Putre for short. Imbri then got together with ^Forrest^, a faun.
* ^Meriel (KG)^, a mermaid, and ^Fairmost^, a fairy, had ^Meryl^, a butterfly winged mermaid. Meryl and ^Merwyn^, a winged merman, married.
* A female zombie and male demon had ^D. Kay^.
* The Cyclops (children of the Sky): ^Arges^, ^Brontes^, and ^Stereopes^
* The Furies (children of the Earth): ^Alecto^, ^Megaera^, and ^Tisiphone^
* The dust devils ^Dusty^ and ^Dusti^ are brother and sister
* The elementals ^Alanda^, ^Fira^, ^Mareen^, and ^Windona^ are sisters.
* The imp ^Ortant^, Mayor of Imp Perial, is the father of ^Quieta^ who is the mother of ^Trentia^.
* The jinn ^Jeorge^ and ^Jeorgia^ are brother and sister, ^Jerry^ is Jeorge's junior.
* The pookas ^Pook^ and ^Peek^ married and had ^Puck^.
* The rocs ^Ragna^ and ^Roc Ette^ are together, and she will make his life a living hell.
* The sea serpents ^Souffle^ and ^Sesame^ married and had ^Serendipity^.
* The sylphs ^Sylvester^ and ^Sylvia^ married and had ^Sylvanie^.
3 The family of Adora Bull
^Pundora^ was dating ^Attila the Pun^ until his death when ^Dawn^ revealed he was a pun. Pundora became the lover of ^Piper^, the music monster, initially to keep him from taking Attila then to get revenge on Dawn. She went off with ^Gattila the Gun^.
Piper was dating ^Granola^, an invisible giant, until he became a suitor for ^Harmony^. He met and fell in love with ^Anna Molly^. Anna Molly is ^Justin Kase^ transformed into a woman.
^Adora Bull^ went off with ^Battila the Bun^.
Adora Bull has many half siblings by the ^Minotaur^. The siblings with the second name Bull have bull heads and human bodies. The siblings with the first name Bull have human heads and bull bodies.
The siblings of Attila, Battila, and Gattila are all human.
& Adora
3 The Can family
The family of Cans were in the Region of Madness created by ^John (TTTF.12)^ in ^Two to the Fifth^.
& Can
3 The family of Com Pewter
& computers
3 The family of Jenny
^Wolverton^ is the King of the Werewolves on the Isle of Wolves and sire of ^Jeremy^. Jeremy married ^Jenny (IOV)^, an elf from the world of Two Moons from I<ElfQuest>. Jenny and Jeremy had ^Jerry^ and ^Jone^, both welfs. Jone died in an accident.
& Jenny
3 From the Isle of Fellowship
These relationships were undone by the ^Dastard^.
* ^Ann Chovie^, a merwoman, and ^Demon Strate^ married and had a son. They formed the community on the Isle of Fellowship.
* ^Cesar^ and ^Charity^, centaurs, are brother and sister. Cesar is married to ^Glitter (TD)^, a goblin. Charity is married to ^Naro^, a naga.
* ^Merla^, a merwoman, and ^Charnal^, a centaur, are married.
* ^Nancy^, a naga, and ^Gizmo^, a goblin, are married.
3 Same species couples
* The dragonflies Queen ^Andromeda (TTTF)^ and King ^Perseus^ are married.
* The fairies ^Joan^ (John) and ^John^ (Joan) married.
* The gars ^Ci-Gar^ and ^Ci-Garette^ are dating.
* The gargoyles ^Gary Gar^ and ^Gayle Goyle^ married.
* The harpies ^Harold^ and Heavenly ^Helen (CaR)^ married.
* The illusions of the ^Air King^ and ^Air Queen^ are married.
* The islands ^Antigua^ and ^Uncletigua^ are married.
* The storks ^Stymy^ and ^Stymie^ are together.
3 Interspecies couples
* The demons ^Beauregard (AA)^ and ^D. Lusion^ used to date until he stuck a toe into a love spring with ^Angela (AA)^, an angel.
* ^Acro^, a nymph, and ^Jim^, a human, start dating while in Cyrus's troupe.
* ^Crabapple^, a crossbreed with crab pincers as lower arms, and ^Curtis (DDD)^, a curse fiend, start dating while in Cyrus's troupe.
* ^Fauna^, a female faun, and ^Nyet^, a male nymph are in a relationship.
* ^Jana^, a human, and ^Braille^, a centaur, are in a relationship forbidden normally.
* ^Lady Bug^, an insect, and ^Gnonenity^, a gnome, started dating while in Cyrus's troupe.
* ^Rob^ and the ^Iron Maiden (WTC)^
* ^SOGA^, a woman with many arms, and ^Aaron (WTC.4)^, a human, are dating.
* ^Sela^, a nymph, and ^Eli (LOTD)^, an ogre, are dating.
* ^Tipsy^, a troll, and ^Phil Istine^, a human, married.
* ^Wilda^ Wiggle and ^Volney^ Vole married.
2 The Apprentice Adept
I<The Apprentice Adept> series is tangentially connected to the I<Xanth> series from ^Stile^ being mentioned in I<Question Quest> and several characters from Phaze appearing in I<Cube Route>.
& Adept
^Stile^ and the Blue Adept are mirrors of each other between Proton and Phaze.
Sheen is a robot from Proton.
Neysa, Chip, and Fleta are unicorns from Phaze.
Mach and his descendants are cyborgs.
Agape is an amorphous alien from Proton.
2 The Incarnations of Immortality
I<The Incarnations of Immortality> series is tangentially connected to I<Xanth> from ^Zane^ being mentioned in I<Questions Quest>.
& Incarnations
3 The Incarnations
* Zane - Death (Thanatos)
* Norton - Time (Chronos)
* Niobe - Fate (Clotho and Lachesis)
* Mym - War (Mars)
* Orb - Nature (Gaea)
* Perry - Evil (Satan)
* Orlene - Good (God)