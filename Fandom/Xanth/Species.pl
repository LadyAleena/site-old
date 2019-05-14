#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Xanth::LineMagic qw(Xanth_line_magic);

page( 'heading' => 'Species in Xanth', 'code' => sub { story(*DATA, { 'line magic' => Xanth_line_magic('page') }) });

__DATA__
These are the species in and related to B<Xanth> that have been introduced. Not all species are listed.
2 Humans
* A B<Magician|id="Magician"> is a person whose talent is considered the most powerful in Xanth at the time. A female Magician is a Sorceress.
* A B<curse fiend|id="curse_fiend"> is a human who has the shared talent of cursing. Some of them prefer to be called curse friends. They put on great plays. They were first introduced in I<The Source of Magic>.
* A B<maenad|id="maenad"> is an immortal wild woman of Mt. Parnassus. They were introduced in I<Man from Mundania>.
* A B<Muse|id="Muse"> is one of nine immortal women who live on Mount Parnassus who write magical texts. If they leave Mount Parnassus, they lose their immortality until they return. They were introduced in I<Dragon on a Pedestal>.
2 Humanoids
The B<humanoids|id="humanoid"> of Xanth are the remains of what is left of the original human settlements. The first humans in Xanth were so warped by its magic that they changed or were changed through carelessness.
* An B<elf|id="elf"> is a humanoid who is quarter as tall as a human. They are tethered to their trees; the closer they are to their tree, the stronger they become. A B<half-elf>, or anyone of elven descent, can change size at will.
* A B<goblin|id="goblin"> is a humanoid who is half as tall as a human. The men are very ugly and mean; the women are pretty and sweet. Due to a curse, the women chose to mate with the most hideous men in looks and in attitude. The curse has since been lifted, however it will be a long time before the species recovers.
* A B<giant|id="giant"> is invisible and extremely large human. They can not be seen because they are so large that they can not be comprehended. They were introduced in I<A Spell for Chameleon>.
* A B<nymph|id="nymph"> is a female humanoid who is extremly pretty and does not age. Some nymphs form symbiotic relationships with trees, protecting them. These nymphs are sometimes called SPAN<dryads|id="dryad">. When they do, they begin to care. Some nature nymphs are called SPAN<vila|id="vila">. Those who live in the Faun and Nymph Retreat have no memories of the previous days.
* An B<ogre|id="ogre"> is a large, brutish, and seemingly stupid humanoid who is twice the height of humans. They are proud of their outrageous strength, grotesque uglyness, and horrendous stupidity. They speak in simple rhyme, almost all of the time. 
2 Animals
There are many magical animals in Xanth such as magical cats, tigers, and other felines; dogs and wolves; horses and donkeys; cows, oxen, and other bovines; gnus, goats, sheep, and yaks; fish such as bass, piranhas, and sturgeons; snakes and other serpents; along with various bats, bears, gators, mice, pigs, spiders, and voles. 
The animals may be smaller or much larger than is in Mundania. Some may have more legs or tails. There may be crossbreed animals, such as a donkey with wings. There are several animal and human crossbreeds that have become fixtures in Xanth such as centaurs, fauns, merfolk, and harpies.
3 Birds
There are many species of birds in Xanth such as hummingbirds, parakeets, rocs, and storks.
* A B<roc|id="roc"> is an enormous bird.
* A B<stork|id="stork"> delivers children to their parents.
3 Insects
The are many species of insects in Xanth such as ants, bees, butterflies, and flies.
* There are many types of B<flies> such as the Fly Balls, Fruit Flies, Inland Flies, Mom Flies, Pop Flies, and Time Flies. These are on the A<Isle of Flies|href="Places.pl#Isle_of_Flies"> and were introduced in I<Board Stiff>.
* A B<letter bug|id="letter bug"> is found in a comic strip on A<Ptero|href="Places.pl#Ptero">. The A's feel they are a superior species to all other letter bugs like the Bs, Cs, Ds, Gs, etc. They were introduced in I<Currant Events>.
3 Voles
There are several sub-species of voles in Xanth. The largest are the SPAN<diggles|id="diggle">. The smallest visible voles are the SPAN<wiggles|id="wiggle">. There are also a medium sized vole called SPAN<squiggles|id="squiggle">. The smallest voles are the SPAN<giggles|id="giggle"> that are invisible.
2 Demons
B<Demons|id="demon">, with a lowercased "d", are mischeivios souless creatures who can change their shape, size, and mass to whatever they want. It is unknown how long they live.
B<Half demons|id="half_demon"> can change their shape, size, and mass to whatever they wants; but it is very slow. They have souls and can die like mortals.
The B<Demons|id="major_demon"> are higher order demons who are forces who see normal people as akin to ants. The compete with each other for status. They can anything they want, so all magic is available to them. The lesser of these Demons are called B<dwarf demons|id="dwarf_demon">. They were introduced in I<The Source of Magic> and the dwarf demons were intoduced in I<Well-Tempered Clavicle>.
2 Dragons
A B<dragon|id="dragon"> is a huge reptilian creature with wings. At one time there were only three types of dragons: fire-breathers, smokers, and steamers. These dragons were soulless. These were introduced in I<A Spell for Chameleon>.
In I<Currant Events>, it is found that the soulless dragons are dying off. 3,125 new species were brought from A<Dragon World|href="Places.pl#Dragon"> to repopulate to Xanth.
These new dragons come with one of five traits from five categories.
* Environment: land, water, air, tunneling, and jumping
* Weapon: fire, smoke, steam, suction, and prehensile tongue
* Size: giant, large, medium, small, and tiny
* Nature: friendly, trainable, indifferent, vicious, and committed
* Mental nature: telepathic, precognitive, memory, rational, and invisible
A B<firedrake|id="firedrake"> is a relatively small, ornate, fire-breathing dragon. They were introduced in I<Heaven Cent>.
2 Dream horses
The B<night mares|id="night_mare"> are black as night female horses who deliver bad dreams to worthy sleepers. They are lead by the B<Night Stallion|id="night_stallion">. There is only one Night Stallion at a time usually, as the Night Stallion kills competitors. He will even kill day stallions.
The B<day mares|id="day_mare"> are brightly colored female horses who deliver good dreams and day dreams to worthy sleepers. They are lead by the B<Day Stallion|id="day_stallion">.
2 From the Gourd
There are many species and creatures that come from the A<Gourd|href="Places.pl#Gourd">
* A B<brassy|id="brassy">, B<brassie|id="brassie"> if female, is a metal humanoid resident of the A<City of Brass|href="Places.pl#City_of_Brass">. They were first introduced in I<Ogre, Ogre>.
* B<Skeletons|id="skeleton"> are animated skeletons who can change the configuration of their bones as use demands. They are not undead as they did not come previously living creaturs. They were introduced in I<Vale of the Vole>.
2 Crossbreeds
A B<crossbreed|id="crossbreed"> is a creature born of parents of different species.
3 Centaurs
The B<centaurs|id="centaur"> are the result of three humans from the First Wave drinking from a love spring with their horses. They have human torsos and heads and horse bodies. They have since become an established species in Xanth, and some have talents. The Centaur Isle centaurs find talents in centaurs abhorrent and banish those from the Isle who have them.
Creatures are still centaurs if they breed with other pure equine species such as donkeys or zebras. Like with talents, some centaurs are prejudiced against those crossbreeds. They are even more prejudiced when it comes to the alicentaurs.
They were first introduced in I<A Spell for Chameleon>.
The B<alicentaurs|id="alicentaur"> are winged centaurs. They lighten their bodies, and their ridesrs, with their tails since their wings are not strong enough to lift them. Currently there is only a small family of alicentaurs, but some humans and centaurs are choosing to be transformed to help establish the species. Those who are transformed may lose their talents. They were first introduced in I<Vale of the Vole> and named in I<Roc and a Hard Place>.
A B<hipporoc|id="hipporoc"> is a roc and centaur crossbreed with monstrous wings, a type of alicentaur. They were introduced in I<Esrever Doom>.
3 Merfolk
The B<merfolk|id="merfolk"> are creatures with the heads and torsos of humans and the tails of fish. They include SPAN<mermaids|id="mermaid">, SPAN<merwomen|id="merwoman">, and SPAN<mermen|id="merman">. Mermen swim in either fresh or sea water. Mermaids are fresh water creatures, and merwomen are sea water creatures. Some of the merfolk can change their tails to legs and walk on land.
3 Weres
There are many B<weres> in Xanth that are the result of crossbreeding. There are SPAN<werecats|id="werecat">, SPAN<werecentaurs|id="werecentaur">, a SPAN<weredolphin|id="weredolphin">, SPAN<weredragons|id="weredragon">, a SPAN<werehorse|id="werehorse">, SPAN<werewolves|id="werewolf">, and a SPAN<wericorn|id="wereicon">.
3 Other established species
These species have been in Xanth long enough to become established.
* B<Fauns|id="faun"> are human and goat crossbreeds and are almost always male. Some fauns form symbiotic relationships with trees, protecting them. When they do, they begin to care. They mate mostly with nymphs. There is currently only one female faun.
* B<Harpies|id="harpy"> are disgusting human and vulture or buzard crossbreeds and are almost always female. Eggs laid without a male hatch another female. Only eggs fertilized by males can produce males.
* B<Naga|id="naga"> are human and snake crossbreeds. Some can assume fully human or serpent forms as well as naga.
3 Other crossbreeds
* An B<alicenagon|id="alicenagon"> is a crossbreed of an alicentaur and dragon with the head and tail of a dragon, the body of a horse, human arms, and large wings. They were first introduced in I<Esrever Doom>.
* A B<cenmaid|id="cenmaid"> or B<mertaur|id="mertaur"> is a mermaid and centaur crossbreed with human head and arms, horse forelegs and torso, and fish tail. They were first introduced in I<Yon Ill Wind>.
* A B<cenmare|id="cenmare"> is a night mare and centaur crossbreed who can bring dreams. They were first introduced in I<Yon Ill Wind>.
* A B<centaurpede|id="centaurpede"> is a centaur and centipede crossbreed with the torso and head of a human and the body of a horse but with 100 legs. They were first introduced in I<Question Quest>.
* A B<cowfolk|id="cowfolk"> is a person with a human body and cow or bull head, including the SPAN<minotaurs|id="minotaurs">. They were first introduced in I<Crewel Lye: A Caustic Yarn>.
* A B<flion|id="flion"> is a winged lion who can shape shift. They were introduced in I<Jumper Cable>.
* A B<gole|id="gole"> is a humanoid with a head, hoofs, and tail of a horse and wings and can regenerate. When killed their bodies become poisonous. They were introduced in I<Cube Route>.
* A B<harga|id="harga"> is a harpy and naga crossbreed with a human head, vulture wings, and serpent body. They were introduced in I<Yon Ill Wind>.
* A B<mernaga|id="mernaga"> is a merfolk and naga crossbreed.
* A B<sidehill hoofer|id="sidehill_hoofer"> looks like deer and a bull with rabbit ears and telescoping legs. They can not walk on level ground since one side's legs will have to be longer than the other. They were introduced in I<Centaur Isle>.
Some of the craziest crossbreeds come from A<Cone|href="Places.pl#Cone"> where everyone and everything is a crossbreed.
2 Machines and Robots
* A B<machine|id="machine"> in Xanth looks like a Mundanian computer.
* A B<robot|id="robot"> in Xanth comes from A<Robot World|href="Places.pl#Robot">. They infected Xanth in I<Pet Peeve>.
* A B<cyborg|id="cyborg"> is a robot and living creature crossbreed. They were introduced in I<Faun and Games>.
* An B<operating system|id="operating_system"> has all the protocols needed to run software on computers. They were introduced in I<Board Stiff>.
* A B<program|id="program"> is a sentient piece of software.
2 Other creatures and monsters
* An B<alien|id="alien"> is a creature that is not from Xanth or A<Mundania|href="Places.pl#Mundania">. They were introduced in I<Question Quest> when Humfrey mentioned Stile, a man from A<Proton|href="Places.pl#Proton"> where aliens exist. Two were seen in I<Knot Gneiss>. Another appeared in I<Fire Portraits> when Squid was rescued from the A<future|href="Timeline.pl#The_Future">.
* A B<cloud|id="cloud"> is an intelligent cloud formed in various ways. They were first introduced in I<Dragon on a Pedestal>.
* A B<monster under the bed|id="monster_under_the_bed"> is a creature composed mostly of five big hairy arms and hands that grab any ankle that comes near. They were introduced in I<Golem in the Gears>.
* A B<callcantzari|id="callcantzari"> is a creature that is somewhat goblin-like grotesque furry creatures with putrid breath that are afraid of fire and like human flesh. They were introduced in I<Crewel Lye: A Caustic Yarn>.
* A B<fury|id="fury"> is a dog-faced old woman who serves retribution on guilty offspring. There are three of them and they were introduced in I<Dragon on a Pedestal>.
* A B<goober|id="goober"> is a colorful insect that looks like a jelly bean. They lack any motivation to organize but want organization badly.
* A B<ling|id="ling"> is a creature that looks like a two legged squirrel that make the impossible possible on Pyramid. Were they on Earth, they might be called Earth-lings. They were introduced in I<Faun and Games>.
2 Undead
Xanth has a few undead species: SPAN<ghosts|id="ghost">, SPAN<vampires|id="vampire">, and SPAN<zombies|id=zombie">.
2 Changebreeds
B<Changebreed|id="changebreed"> are creatures born one species but transformed into another. For example, humans and centaurs are approached to be transformed into alicentaurs to help establish the species. Justin was transformed from a human into a tree and back again. Graeboe was transformed from an invisable giant into a winged goblin to be with Gloha. Nator was transformed from a human into a goober because the goobers needed direction. 
