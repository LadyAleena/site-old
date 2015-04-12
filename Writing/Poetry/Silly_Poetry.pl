#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
2 Mom's Kitchen
stanza Sizzle Sizzle on the stove|Mommy's cooking dinner|It'll taste good 'cause|Mom's cooking is a winner
2 Shivers
stanza Everyone gets them|Nobody sees them|But they're there|And they're going|to get you.
2 Aluminum Cans
stanza Aluminum cans can hold|things untold|And if you like it|You can spike it.
2 Ode to my Thread
I spontaneously wrote this poem on WXCity Forums.
stanza I love my thread.|I cherish my thread.|You want to put my thread to bed?|I feel a sense of dread.
stanza I am pouting.|I am sniffling.|Do you want to see me crying?|This long thread is dying.
stanza Create a FAQ?|I take that back.|Patience is the thing that I lack.|This thread is now off track.
stanza Do what you must.|You have a trust.|My bubble you will have to bust.|Now I will have to dust.
stanza You have control.|I'm on a roll.|This thread's death bell loudly will toll.|I will take a stroll.
stanza Good-bye my thread.|You are now dead.|I will have to press on ahead.|Ode to my thread.
