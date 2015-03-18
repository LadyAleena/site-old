#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../../files/lib';
use Base::HTML qw(html story);

html( code => sub { story(*DATA) });

__DATA__
Send a message to A<Jayne Moon|href="mailto:mandyhawkes65@yahoo.com">.
2 oh to be loved
stanza When I was a little girl, I can't remember much,|Apart from loving mother, whose heart I couldn't touch.|I was always crying out for love,I guess she could see,|as the child that was so naughty, it wasn't really me.|Growing up was quite tough, with so much pain inside,|I knew deep down I wasn't bad, but that I had to hide.|The years went by and all I did was seem to run amok,|With worn out shoes, clothes to small, and holes within my socks.|My mum would make me knock on doors, with odds and sods to sell,|Everyone would laugh at me, so I slipped in my shell.|When I left home I was quite young, it really shouldn't have been,|As all I wanted was unconditional love, for someone to give me.|It wasn't until my later years, that I met my one true love,|He is my earth angel, probably sent from up above.|All those years of struggling, I guess were not in vain,|As my husband is my perfect mate, who cleared me of my pain.
