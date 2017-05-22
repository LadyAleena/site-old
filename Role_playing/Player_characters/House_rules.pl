#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
My group had a lot of house rules I am trying to remember. Here are some of them so you understand some of the weirdness you may come across with my characters.
2 Ability score rolls
We would roll 4d6 and reroll 1s and keep the highest 3 dice 7 times and drop the lowest.
2 Classes
Humans can multiclass and there are no level restrictions for non-human characters.
2 Proficiencies
The number of languages is applied to both languages and non-weapon proficiencies. We add the initial proficiency slots each time a new level is gained.
2 Bonus Spells
We use bonus spells from wisdom and apply it to intelligence for wizards to gain additional spells. So a wizard with a 17 intelligence would get two additional first level spells, two additional second level spells, and one additional third level spell.
I have always thought the original bonus spells were a tad unbalanced. More fourth level spells were added as bonus spells than any other level even the ones below it. So, I rewrote the bonus spell list as shown below. Only four scores have changed.
|| bonus_spells centered
|! Bonus Spell changes
|* Wisdom|Bonus Spells|Changed?|Bonus spells expanded
|+ 13|1st|no|1 1st
|+ 14|1st|no|2 1st
|+ 15|2nd|no|2 1st, 1 2nd
|+ 16|2nd|no|2 1st, 2 2nd
|+ 17|3rd|no|2 1st, 2 2nd, 1 3rd
|+ 18|3rd|B<yes>|2 1st, 2 2nd, 2 3rd
|+ 19|1st, 4th|no|3 1st, 2 2nd, 2 3rd, 1 4th
|+ 20|2nd, 4th|no|3 1st, 3 2nd, 2 3rd, 2 4th
|+ 21|3rd, 5th|no|3 1st, 3 2nd, 3 3rd, 2 4th, 1 5th
|+ 22|4th, 5th|no|3 1st, 3 2nd, 3 3rd, 3 4th, 2 5th
|+ 23|6th|B<yes>|3 1st, 3 2nd, 3 3rd, 3 4th, 2 5th, 1 6th
|+ 24|5th, 6th|B<yes>|3 1st, 3 2nd, 3 3rd, 3 4th, 3 5th, 2 6th
|+ 25|7th|B<yes>|3 1st, 3 2nd, 3 3rd, 3 4th, 3 5th, 2 6th, 1 7th
