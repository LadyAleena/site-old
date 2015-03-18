#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);

html( code => sub { story(*DATA) });

__DATA__
2 Contentment
stanza The morning, glorious appears|sunlight falls softly over me.|Birds singing, winds sigh|little ones playing, charmingly|What perfect joy, spreading|Life is all fulfilled|Everywhere life is blooming|Budding plants holding dew,|Grass blades bow, all unassuming|I recline in perfect repose|Hearing all, doing nothing,|Sitting quietly, in my robes,|not to disturb the most beautiful morning.
2 To Those Who Talk To Walls
stanza I will play the part|of the wall|I will be silent|as the wall|I will not go away|like the wall|I will lend a shoulder|unlike the wall|But I am flesh not stone|and at your beck and call|You can talk to me|as you would the wall|I would like you to talk to me|for I, too, talk to my wall.
2 Wanted: A Poem
stanza There is a poem I seek.|It speaks of children of the week.|The name and poet will do.|If I get it all, Thanks will go to you.|I wait for it with still breath.|Not receiving it won't bring my death.|So, if youknow it well.|To me please do tell.
