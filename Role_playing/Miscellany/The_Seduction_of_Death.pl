#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);

html( code => sub { story(*DATA) });

__DATA__
If a PC goes below 0 Hit Points, a Wisdom check must be made with a penalty of double the amount under 0 Hit Points (if Jonrar is down to -2 Hit Points, he must make a Wisdom check with a -4 penalty). If the PC fails his saving throw, he is being seduced by death.  The PC will start to see the ultimate of his class, alignment, race, etc. A new Wisdom check will be needed each round the he is below 0 Hit Points.
If the PC is brought back from death, he must make another Wisdom check at the severest penalty he suffered while on Death's door. If  he fails the Wisdom check, he will loose 1 Hit Point for every 2 points above the modified Wisdom was rolled for the fail.
I<Jonrar had -5 Hit Points when he was finally revived, he was close to being irrevocably slain. He was successfully seduced by death before he was revived. His Wisdom is 15, and he had to roll a 5 or less not to be seduced by Death. He rolled an 11. He was seduced but was not able to succumb to Death because of the Priestess nearby. He looses 3 Hit Points permanently, so that he is closer to death.>
This is not to say that the PC will be suicidal, but maybe a bit wistful. He will have seen things that were beyond his imaginings.
Example of what can be seen while on the brink of death.
I<Jonrar is a fighter and a good one. The last hit left him with -2 Hit Points. During the first round after he was hit, he was given understanding of all the weapons he had been proficient in life. He knew all the tricks in wielding his long sword. During the second round, he understood and was able to wield all swords. The round after that, when he was at the severest, he understood the uses of all weapons he had ever picked up. He also had them at his disposal.>
I<Then in an instant that was all ripped away from him, he was alive. All of that knowledge gone.  He could still feel the celestial weapons in his hands. He tried to remember all that he had learned, but nothing remained, just a faint echo that was fading fast. The world of the living called, and he would have to wait until it was his time to have that understanding again.>
