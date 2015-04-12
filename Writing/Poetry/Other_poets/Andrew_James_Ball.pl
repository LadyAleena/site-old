#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
Send a message to A<Andrew James Ball|href="mailto:ajball@cox.net">.
2 Curse Of The Wolf
stanza The moon is creeping over the hill,|I feel its power growing in me,|You better run for your life,|For soon I'll lose control and the|Monster in me will be coming out.
stanza I can't control the beast anymore,|For the moon's light has awaken the|Demon buried deep inside.
stanza The moon has brought the wolf within me out,|I fear that it's coming after you,|So bar your doors and windows,|And pray that I may not find you.
stanza The howling of this monster is getting louder,|As it runs towards you,|Maybe it will pass and never find you,|For it hungers for a piece of your living flesh.
