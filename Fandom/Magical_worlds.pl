#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
There are many B<magical worlds> in fiction, and here are just a few of them.
SMALL<The links in the article are to A<Wikipedia|href="https://en.wikipedia.org">.>
2 The Labyrinth
The B<Labyrinth> was created by Dennis Lee and Jim Henson for the A<film of the same name|href="https://en.wikipedia.org/wiki/Labyrinth_(1986_film)">. Jareth, the goblin king and ruler of the Labyrinth, challenged Sarah Williams to solve it to win back Toby, her baby brother, after she invoked Jareth to take Toby away from her. It was destroyed when Sarah won the challenge and Toby back after rejecting Jareth's romantic advances.
2 Narnia
A<B<Narnia>|href="https://en.wikipedia.org/wiki/Narnia_(world)"> was created by C.S. Lewis in I<The Chronicles of Narnia> series of novels. It is a land of talking animals and sentient trees. Aslan leads the creatures there and brings people from our world into Narnia.
Severla people were pulled into Narnia by Aslan. The Pevensie children; Peter, Susan, Edmund, and Lucy; were the first to be brought to Narnia in I<The Lion, the Witch, and the Wardrobe>. Eustace Scrubb, their cousin, was brought in during I<The Voyage of the Dawn Treader>. Jill Pole, a friend of Eustace, was brought in during I<The Silver Chair>. Digory Kirke and Polly Plummer were brought in during I<The Magician's Nephew>, a prequel to the rest of the series. Frank and Helen were also brought into Narnia in I<The Magician's Nephew>, and they became the first King and Queen there.
2 Neverland
A<B<Neverland>|href="https://en.wikipedia.org/wiki/Neverland"> was created by J. M. Barrie. It is a magical land where Peter Pan, Tinker Bell, and the Lost Boys live. Peter brings Wendy, John, and Michale Darling into Neverland after Wendy reattaches his shadow.
2 The Land of Oz
A<B<The Land of Oz>|href="https://en.wikipedia.org/wiki/Land_of_Oz"> is a fictional country created by L. Frank Baum. It is a magical land where Dorothy Gale went and met the Scarecrow, Tin Man, and Cowardly Lion and fought the Wicked Witch of the West.
2 The Wizarding World
The B<Wizarding World> is a magical land created by J.K. Rowling that exists side-by-side with the real world but is kept from mundane (muggle) view by magic.
2 Wonderland
A<B<Wonderland>|href="https://en.wikipedia.org/wiki/Wonderland_(fictional_country)"> is a fictional country created by Lewis Carroll. Alice followed the White Rabbit through a rabbit hole and into Wonderland where she had many adventures.
