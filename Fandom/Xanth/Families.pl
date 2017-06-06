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

my $directory = 'Fandom/Xanth/Family_trees';
my @files = file_list(file_directory($directory));

my $doc_magic;
for my $file (@files) {
  if (-f data_file($directory, $file)) {
    $doc_magic->{textify($file)} = sub {
      my $read = io(data_file($directory, $file))->slurp;
      my $tree = make_tree($read);
      pre(5, sub { print $tree }, {'style' => 'overflow-x:auto;'})
    }
  }
}

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
These are the known families of the characters of Xanth though not all of them. Trees are drawn if there are five or more people across two or more generations unless it is complicated. All people and relationships in parentheses are from one of Ida's moons or an alternate reality.
* SPAN<&#9829;|style="font-family: monospace; font-size: large;"> denotes marriage.
* SPAN<&#9825;|style="font-family: monospace; font-size: large;"> denotes affair or accidental love spring union.
2 The family of Kings and Magicians
& Kings
While B<Trent> was exiled in Mundania, he married and had a son. Their deaths were the catalyst of his return to Xanth.
3 Magicians (Kings)
* B<Abscissa> travels by geometry moving along the X coordinate. When working with her brother Ordinate, she can travel anywhere instantly.
* B<Anima> animates the inanimate.
* B<Auspice> changes her nature involuntarily to match her surroundings in mood, attitude, appearance and ability.
* B<Bink> can not be harmed by magic and fourth king pro tem during I<Night Mare>. All of his descendants will be magicians.
* B<Crescendo> makes music with anything he touches. He is on Ptero.
* B<Data>
* B<Dawn> knows everything about the animate.
* B<Dol> makes inanimate things come alive. He is on Ptero.
* B<Dolin> does the right thing. He is on Ptero.
* B<Dolph> can shape change.
* B<Donald> is on Ptero.
* B<Dor> talks to inanimate objects, and twentieth king of Xanth.
* B<Ebnez> was the sixteenth King of Xanth.
* B<Eve> knows everything about the inanimate.
* B<Gerrod> communicates with water. He is on Pyramid's Blue Face.
* B<Grant> reads minds. He is on Ptero.
* B<Green> manipulates time to move father. She is on Ptero.
* B<Grey> nullifies magic.
* B<Harmony> sings or plays something real.
* B<Ida> is the sorceress of the idea, when someone who does not know her talent presents her with an idea, it will come true.
* B<Idaho>'s talent was never given. She would be a descendant of Bink, so it would be sorceress level. She is on Ptero.
* B<Idyll> suppresses all thought. She is on Ptero.
* B<Ilene II> controls storms. She is on Pyramid's Blue Face.
* B<Io>'s talent was never given. She is in one of the Realities and would be a descendant of Bink, so it would be sorceress level.
* B<Ione> makes a lie the truth if the liar does not know her.
* B<Irene> is the sorceress of plants and seventh king pro tem during I<Night Mare>.
* B<Iris> is the sorceress of illusion and was the sixth king pro tem during I<Night Mare>.
* B<Isabella Emily Carolyn> borrows talents for an hour. She is on Ptero.
* B<Ivy> is the sorceress of enhancement and the twenty-first king of Xanth.
* B<Jonathan> is the magician of zombies and the sixth King of Xanth. He was part of the chain of Kings in I<Night Mare>.
* B<Kadence> aligns people and objects to a cadence, organizing them.
* B<Melanoma> grows or reverses tumors on anything. She is on Ptero.
* B<Melody> sings or plays something real.
* B<Merlin> was the magician of knowledge and the first King of Xanth.
* B<Murphy> is the magician whose curse will make things go wrong. He served as king pro tem in I<Isle of View>.
* B<Ordinate> travels by geometry moving along the Y coordinate. When working with his sister Abscissa, he can travel anywhere instantly.
* B<Piton>
* B<Plato> animates the dead.
* B<Revy> reverses magic. He is on Ptero.
* B<Rhythm> sings or plays something real.
* B<Roogna> was the magician of adaptation and the second King of Xanth.
* B<Sherlock> is the magician of reversal.
* B<Tapis> was the magician of tapestry.
* B<Trent> is the magician of transformation and nineteenth king of Xanth. During his reign he was incapacitated which lead to there being nine kings pro-tem during I<Night Mare>.
* B<Vadne> is the sorceress of topography, changing the shape of things but not their nature.
3 Possible family (Kings)
B<Trenris> is the possible son of B<Iris> and B<Trent> and reverses the effects of other people's talents. (I<Faun and Games>)
The twins B<Abscissa> and B<Ordinate>, who can travel by geometry, were supposed to be Ivy's and Grey's children. They were dropped off at an orphanage when Ivy and Grey took too long to marry. (I<Roc and a Hard Place>)
There are several possible children of B<Ivy> and B<Grey> on B<Ida's> moons. B<Revy> reverses magic, B<Ilene II> controls storms, B<Gerrod> communicates with water, B<Grant> reads minds, B<Isabella Emily Carolyn> borrows talents for an hour, B<Dol> makes inanimate things come to life, and B<Green> manipulates time to travel farther. (All of them were introduced in I<Faun and Games> except Green who was introduced in I<The Dastard>.)
B<Idaho> is a possible daughter of B<Ida> and B<Ho>, though B<The Dastard> kept her from being born. (I<The Dastard>) B<Idyll> is another possible daughter of Ida who suppresses all thought, though her possible father is unknown. (I<Faun and Games>)
B<Crescendo> is a possible son of B<Electra> and B<Dolph> making music from anything. (I<Faun and Games>)
B<Lacky> is a possible daugther of B<Lacuna> and B<Vernon> whose writings come true. (I<The Dastard>)
All of these people live on Ptero except Abscissa and Ordinate who are live in main Xanth and Ilene II and Gerrod who live on the Blue Face of Pyramid.
2 The family of Humfrey
B<Humfrey> is the magician of information and was the seventeenth King of Xanth. He has five and a half wives and family connections from all of them.
& Humfrey
3 Humfrey and Dara
B<Dara> is the first wife of Humfrey and a demoness. Humfrey got her name wrong and calls her Dana. After B<Dafrey> was born, she left Humfrey. A while later, Dara assumed the likeness of Taiwan and conceived B<Matt a Dor> to get rid of the remaining bits of soul attached to her.
& Humfrey 1
3 Humfrey and Taiwan
B<Maiden Taiwan> is the second wife of B<Humfrey>. When she married him, she lost the title Maiden and became Matron Taiwan. B<Maiden China> is Taiwan's actual sister, while B<Maiden Japan> and B<Maiden Mexico> are spiritual sisters.
She and the other Maidens were saved by B<Nan O' Tek> and brought to Xanth from Mundania. They formed Mai-Den Corporation Industrial Park in the Gap chartered by King B<Ebnez>.
Taiwan left Humfrey when he abdicated the throne.
& Humfrey 2
3 Humfrey and Rose
B<Rose of Roogna> is the third wife of Humfrey.
& Humfrey 3
4 Magicians (Humfrey and Rose)
* B<Gromden> divines the history of anything he touches.
* B<Surprise> has every talent but can use each only once.
* B<Yin-Yang> creates invokable spells. He has a split personality with Yin as the light side and Yang as the dark side.
4 Demons
B<Metria> is the demoness mother of the half-demons B<Thenody>, B<Ted>, and B<Chaos> whose fathers are human.
4 Possible family (Humfrey 3)
B<Glitter>, whose talent is the sparkle, is a possible daughter of Grundy Golem and Rapunzel. (I<Faun and Games>)
There are several alternate reality versions of Surprise and a few with Che in I<Stork Naked>.
* Surprise-One is the one who went on the adventure with Che-One.
* Surprise-Two and Umlaut-Two have a son.
* Surprise-Three is married to Che-Three and they have a foal. Umlaut-Three and Cynthia-Three are married.
* Surprise-Four is married to Picka Bone.
* Surprise-Five is married to Brusque.
* Surprise-Six is married to Jot.
* Surprise-Seven and Umlaut-Seven are soulless. Surprise-Seven is also possessed by Morgan Le Fey. They married the much younger Epoxy and Benzine respectively. Surprise and Umlaut then had an affair to get Prize so Morgan Le Fey could have a younger body.
3 Humfrey and Sofia
B<Sofia> is the fourth wife of Humfrey and was given the last name Socksorter by him.
& Humfrey 4
B<Crombie> was transformed into a griffin for a mission; and while transformed, he was given love potion by B<Grinelle>. Their daughter B<Griselda> was born a griffin with human intelligence.
B<Jewel> is a nymph. Her daughter B<Tandy> by B<Crombie> is half-nymph.
B<Crunch> is an ogre. His son B<Smash> by Sleeping Beauty, an unnamed Curse Fiend, is half-ogre.
B<Blythe> and B<Brawye> are brassies as is their daughter B<Bria>.
B<Eskil> is half-human and quarter nymph and ogre.
The children of B<Bria> and B<Eskil> are half-brassie, quarter-human, and eighth nymph and ogre.
B<Draco> is a dragon. His daughter B<Becka>, by an unnamed woman, is a half-dragon.
B<Ben> is three-eighths human, quarter dragon and brassie, and sixteenth nymph and ogre.
4 Possible family (Humfrey 4)
B<Briskil> and B<Astrid> are a possible children of B<Bria> and B<Eskil>. B<Briskil> is married to B<Nina Naga>, and they had B<Nora>. (I<Faun and Games>)
3 Humfrey and Gorgon
B<Gorgon> is the fifth wife of Humfrey.
& Humfrey 5
4 Naga
B<Nabob> is king of the Naga and father of B<Naldo> and B<Nada>. B<Nara> is Nabob's sister and married to B<Nathan>, a human, and B<Nefra's> mother.
4 Merpeople
B<Morris> is a merman who married B<Siren>. Together they had B<Cyrus>.
B<Melantha> was married to B<Mewrin>, who died. Together they had B<Marcie>. Melantha then married Naldo.
4 Demons
B<Grossclout> is the father of Prince B<Vore>. Vore married Nada, and they had B<Demonica>.
4 Possible family (Humfrey 5)
These are possible family members introduced in I<Faun and Games> who are mostly on Ptero.
B<Wigo>, whose talent is draining magic, is a possible daughter of Hugo and Wira.
B<Nigel>, whose talent is rejuvenating others, and the twins B<Mourning> and B<Knight>, both without talents, are possible sons of Naldo and Melantha.
B<Demos> is a possible son of Nada and Vore.
B<Cerci>, whose talent is to change people into pigs, is a possible daughter of Cyrus and Marcie on the Gray Face of Pyramid.
3 Humfrey and MareAnn
Humfrey and B<MareAnn> have an unnamed child on the Gray Face of Pyramid in I<Board Stiff>. MareAnn is related to B<HellAnn>, B<SpartAnn>, and B<TrojAnn>; but their relations to her are unknown.
2 The family of Chester
& Chester
B<Marei>, B<Mesta>, and B<Dell> were delivered human though they are griffin, seacow, and centaur in origin.
3 Winged centaurs
B<Chem> mated with B<Xap>, a hippogryph; and they had B<Chex>, a winged centaur.
Chex eventually found B<Cheiron>; and they had B<Che> and the twins, B<Chelsy> and B<Cherish>.
B<Cynthia> was a human who was transformed into a winged centaur by B<Trent>. She went into the B<Brain Coral> pool because there were no other winged centaurs at the time. When she returned to Xanth, she met and married Che.
3 Possible family (centaurs)
Cynthia and Che may have B<Cheline>, to be born in 1107; B<Chen>, to be born in 1108; B<Cherin>, to be born in 1109; and B<Chel>, to be born in 1110. They are waiting on Ptero to be summoned.
2 The family of Gorbage
& Gorbage
3 Harpies
B<Hardy> is a male harpy. B<Gloha> and B<Harglo> are winged goblins. Grand Harridan, Grobigtail, and Hoary Harributtes are said to be aunts to Gloha; however the relationship may be more distant.
3 Giants
B<Graebo> was an invisible giant who was transformed by B<Trent> into a winged goblin. Graebo has two cousins, Greatbow and Girard. Girard married B<Gina> in the Dream Realm.
3 Possible family (goblins)
These are possible family members introduced in I<Faun and Games>.
B<Kerby> is a possible brother of Graebo on the red face of Pyramid.
B<Ghina> and B<Geddy> are large invisible winged goblins on the red face of Pyramid which orbits Ida on Ptero.
B<Gim> and B<Gine> are possible sons of Girard and Gina on Ptero.
2 Major and Dwarf Demon families
* E&ltA/R&gtTH and Gaia are together.
* Fornax and Nemesis married and adopted Santos, a human.
3 Nimby and Chlorine
B<Nimby>, which stands for "not in my back yard", is the major demon X(A/N)TH in his dragon-ass form. He met and fell in love with Chlorine during I<Yon Ill Wind>.
The clouds Cumulo Fracto Nimbus and Happy Bottom (Hurricane Gladys) married and had Fray and Wynde Tchill.
Nimbus is interested in Fray.
& Nimby
3 Eris and Jumper
B<Eris> is the mother of B<Dysnomia> and both are Dwarf Demons. Both Jumpers are jumping spiders. B<Jumper I> traveled back in time with B<A<Dor|href="#The_family_of_Kings_and_Magicians">>. B<Jumper II> is a many generation descendant of Jumper I who was transformed into a human.
& Eris
2 Cat families
* Erin Kitty Litter, a werecat, and Midrange, from Mundania, are mates.
* Claire Voyant SMALL<(UIAH)>, from the Isle of Cats, and Sammy, who came to Xanth with A<Jenny|href="#The_family_of_Jenny">, are mates and had Kitten Kaboodle.
2 Centaur families
* Carleton is the brother of Chena who was banished from Centaur Isle for having a talent. Chena becomes a winged centaur.
* The winged centaurs on Ptero Cathryn and Contrary finally became mates.
* Cedric and Celeste are mates. Cedric the 10th is their descendant.
* Ilura and Hurry are mates and had Imina and Imino Hurry on Ptero.
2 Dragon families
* Drew and Drusie from Dragon are mates.
* Stanley Steamer and Stella (Stacy) are mates and had Steven.
* Vertex SMALL<(PP)> and Vortex from Dragon are mates.
2 Ogre families
* The Agora and Medi are sister and brother.
* The Ole and Orgy married on Ptero.
* Tasmania Devil and Conan the Librarian are married.
3 The family of Okra
& Okra
2 Human families
* Justin, who was turned into a tree by Trent, became human again and married Breanna. They had Amber Dawn.
* Noi and Mikhail married and adopted Malinee.
* Astrid, a basilisk/cockatrice turned human by Trent, and Art married and adopted Firenze.
* Azalea and Lotus are twin sisters. Lotus is dating Wade. Wade has a brother Ray who he wants to introduce to Azalea.
* Haggi is the mother of Modem.
* Kalt and Frosteind are fraternal twin brother and sister. Frosteind is dating Zach.
* Kandy and Ease married and adopted Squid, an alien.
* Lacey is married to a man who is a descendant of King Warren.
* Sand Witch SMALL(I<Five Portraits>) adopted Sand D.
* Svelte and Scab have Hugh Mongus.
* Tiara's sisters are Apopto Sis, Ba Sis, Cri Sis, Ellip Sis, Gene Sis, Neme Sis, and Sta Sis. Tiara married Mitch, and they adopted Win.
* If Vendetta and Crony ever get around to it, they will have Scintalla.
3 Sofia's play
Miss Take, playing Raven, and Miss Inform, playing Robin, were actresses in A<Sofia's|href="Humfrey_and_Sofia"> play who married Justin Case and Justin Time to save the play on Ptero. The characters Ruben and Rowena the parents of Raven and Robin.
& Miss-Justin
& Play
3 Sette family
& Sette
3 Couples
These people are together whether it be married, dating, or went off together somewhere.
* Allergy and Robert Ulysses Dunn
* Auntie Nym and Uncle Nym
* Bec on Call and Hydrogen
* Olive Hue and Dick Phillip.
* Phanta and Shepherd.
* Sally and Donald were married until he became a shade.
* The Sea Girl, who became the Sea Hag, and Green Horn were married.
* Thesis and Zavan
4 Dating
* Besanii and Bill Fold
* Celest and Aaron SMALL<(Stork Naked)> get together in Promenade Glade.
* Chandra and Dudley Dragonman
* Debra and Random Factor
* Doll and Red Pepper
* Elem N. Tery and Bill
* Eunice and Fat
* Flora and Wayne
* Harberian the Barbarian and Eric
* Jade and Eck Sray; Jade was with Mac/Mike/Mal until the Dastard undid their relationship.
* Keaira and Adam
* Nikki and Dave SMALL<(Stock Naked)> get together in Promenade Glade.
* Petting Sue and Gourd'n G'rd'n'r
* Psyche and Timothy
* Punny and Unpun
* Pyra and Finn
* Rose Quartz and Smoky Quartz
* Sand Witch SMALL(I<Two to the Fifth>) and Tuff Stuff started dating while in Cyrus's troupe.
* Sara Nade and Brant SMALL<(I<Well Tempered Clavicle>)
* Skyla and Arlis
* Tess Tosterone and S Trojan
* Xina and Guise started dating while in Cyrus's troupe.
3 Siblings
* Afro Disiac and Salt Peter are sister and brother.
* Anne and Leigh are sisters.
* Black, Brown, Red, Yellow, and Blue are sisters who are fragments of Merge.
* Clarificant and Opaque are sister and brother.
* Digit Alice and Feelup are sister and brother.
* Furn, Airic, Peat, Wyck, and Quantum are siblings who live in the Forbidden Regions.
* Megan SMALL<(Two to the Fifth)> and Melvin are brother and sister.
* Sharina and Suretha are sisters created by Olive Hue.
* Sherry, Terry, and Merry are triplets in Tri City who shrinks, enlarges, and restores things respectively.
* Shy Violet and Skyler are brother and sister.
* The Tractor brothers are Con Tractor, Pro Tractor, Subcon Tractor, and Dis Tractor.
4 Twins
* Amanda and Adnama (hair color related talents) are twin sisters who live in Twin City.
* Auth and Ticity are fraternal twin brother and sister who can verify anything.
* Barbar and Barbara are fraternal twin brother and sister who can make people's hair shorter or longer respectively.
* De Crease and In Crease are twin brothers who lose or grain weight, size, and whatever else they can think of respectively.
* Deja and Vu are fraternal twin brother and sister who can see the future and past respectively. They live in Twin City.
* Derren and Darron are twin brothers.
* Fiero and Fiera are fraternal twin brother and sister who can control fire.
* Geo and Graphy are twin brothers.
* In Crease and De Crease are twin brothers.
* Inebriated and Intoxicated are twin sisters.
* Leai and Adiana are twin sisters who have problems related to death. The live in Twin City.
* Mariana and Anairam are twin sisters who shape and animate rocks respectively. They live in Twin City.
* Mol and Ly are twin sisters.
* Morton (More) and Lester (Less) twin brothers whose combined talent can turn them into crossbreeds.
* Obivious and Obvious-Lee are twin brothers.
* Pastor and Futura are fraternal twin brother and sister who reinvent the past and future respectively.
2 Mundane families
* King Arthur and Morgan Le Fey had Mordred.
* Doug and Kim entered Xanth through the game interface in I<Demons Don't Dream>. They later married and had Knut.
* Edsel and Bentley are brothers, and Edsel is married to Pia Putz.
* Jacob, Lauryl, and their sons Noah and Thom got lost in Xanth in I<Air Apparent>.
* Jerry Tamagni and his son Terry were met at an enchanted pool in I<Cube Route>.
3 The family of Arjayess
& Arjayess
3 The Baldwin Family
Jim and Mary Baldwin entered Xanth in I<Yon Ill Wind> with their children. Sean is Jim's son by a previous marriage. David is Mary's son by a previous marriage. Karen is the daughter to both Jim and Mary. They are traveling with their pets Woofer, Sean's dog; Midrange, David's cat, and Tweeter, Karen's bird.
& Baldwin
3 The family of Silhouette
& Silhouette
2 Other families
* The dogs Woofer and Rachel had Rowena, Wolfe, and another unnamed pup.
* The dust devils Dusty and Dusti are brother and sister.
* The goblins Glinda and Glower have Glenna.
* The imp Ortent, Mayor of Imp Perial, is the father of Quieta who is the mother of Trentia.
* The jinn Joerge and Jeorgia are brother and sister, Jerry is Jeorge's junior.
* The pookas Pook and Peek married and had Puck.
* The storks Stymy and Stymie are together.
* The sylphs Sylvester and Sylvia married and had Sylvinia.
* Ann Chovie, a merwomanm, and Demon Strate married and had a son. They formed the community on the Isle of Fellowship.
* Cesar and Charity, centaurs, are brother and sister. Cesar is married to Glitter SMALL<(TD)>, a goblin. Charity is married to Naro, a naga. They live on the Isle of Fellowship.
* Mare Imbrium mated with the Day Stallion and had Palus Putredinis, Putre for short. Imbri then got together with Forrest, a faun.
* Meriel, a mermaid, and Fairmost, a fairy, had Meryl, a mermaid. Meryl and Merwyn, a merman, married.
* Maeve, a maenad, was lured to a love spring by Harbinger, a human, and summoned for Mae. Warren, a human warrior, married Maeve.
* Wenda, a woodwife, married Prince Charming. They adopted Alex SMALL(I<Knott Gneiss>) and many more children.
* A female zombie and male demon had D. Kay.
* The Cyclops (children of the Sky): Argus, Brontus, and Steropes
* The Furies (children of the Earth): Alecto, Megaera, and Tisiphone
3 The family of Adora Bull
Pundora was dating Attila the Pun until his death when Dawn revealed he was a pun. She became the lover of Piper, the music monster, initially to keep him from taking Attila then to get revenge on Dawn. She went off with Gattila the Gun.
Piper was dating Granola, an invisible giant, until he became a suitor for Harmony. He met and fell in love with Anna Molly. Anna Molly is Justin Kase transformed into a woman.
Adora Bull went off with Battila the Bun.
Adora Bull has many half siblings by the Minotaur. The siblings with the second name Bull have bull heads and human bodies. The siblings with the first name Bull have human heads and bull bodies.
The siblings of Attila, Battila, and Gattila are all human.
& Adora
3 The family of Com Pewter
& computers
3 The family of Jenny
Wolverton is the King of the Werewolves on the Isle of Wolves and sire of Jeremy. Jeremy married Jenny, an elf from the world of Two Moons from I<ElfQuest>. Jenny and Jeremy had Jerry and Jone, both welfs. Jone died in an accident.
& Jenny
3 The family of Xavier
Xanthippe and her son Xavier are human. Xavier fell in love with Zora, a zombie, and later married her.
Xander and Zelda are possible human children of Xavier and Zora on Ptero. (I<The Dastard>)
& Xavier
3 Same species couples
* The dragonflies Queen Andromeda and King Perseus are married.
* The fairies Joan (John) and John (Joan) married.
* The gars Ci-gar and Ci-garette are dating.
* The gargoyles Gary Gar and Gayle Goyle married.
* The harpies Harold and Heavenly Helen SMALL<(CaR)> married.
* The illusions of the Air King and Air Queen are married.
* The sea serpents Soufflé and Sesame married.
3 Interspecies couples
* The demons Beauregard SMALL<(Air Apparent)> and Lusion used to date until he stuck a toe into a love spring with Angela SMALL<(AA)>, and angel.
* Acro, a nymph, and Jim, a human, start dating while in Cyrus's troupe.
* Crabapple, a crossbreed with crab pincers as lower arms, and Curtis SMALL<(Demons Don't Dream)>, a curse fiend, start dating while in Cyrus's troupe.
* Jana, a human, and Braille, a centaur, are in a relationship forbidden normally.
* Fauna, a female faun, and Nyet, a male nymph are in a relationship.
* Karia, a centaur, and Drek, a dragon from Phaze, had Hadi Alicenagon
* Lady Bug, an insect, and Gnonenity, a gnome, started dating while in Cyrus's troupe.
* Merla, a merwoman, and Charnel, a centaur, are married and live on the Isle of Fellowship.
* Fauna, a female faun, and Nyet, a male nymph
* Nancy, a naga, and Gizmo, a goblin, are married and live on the Isle of Fellowship.
* Rob and the Iron Maiden SMALL(I<Well-Tempered Clavicle>)
* SOGA, a woman with many arms, and Aaron SMALL<(Well-Tempered Clavicle)/4>, a human, are dating.
* Sela Sea Nymph and Eli, an ogre, are dating.
* Tipsy, a troll, and Phil Istine, a human, married.
* Wilda Wiggle and Volney Vole married.
2 The Apprentice Adept
I<The Apprentice Adept> series is now tangentially connected to the I<Xanth> series from B<Stile> being mentioned in I<Question Quest> and several characters from Phaze appearing in I<Cube Route>.
& Adept
B<Stile> and the B<Blue Adept> are mirrors of each other between Proton and Phaze.
B<Sheen> is a robot from Proton.
B<Neysa>, B<Chip>, and B<Fleta> are unicorns from Phaze.
B<Mach> and his descendants are cyborgs.
B<Agape> is an amorphous alien from Proton.
2 The Incarnations of Immortality
I<The Incarnations of Immortality> series is tangentially connected to I<Xanth> from B<Zane> being mentioned in I<Questions Quest>.
& Incarnations
