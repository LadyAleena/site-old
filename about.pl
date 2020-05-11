#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib 'files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'code' => sub { story(*DATA) });

__DATA__
2 This site
About a decade ago, I got 10 megabytes of complimentary web space from my internet service provider along with several e-mail addresses. Wanting to put my mark on the net, I created my first web page in Microsoft Word. Everything was going fine. My site got bigger and bigger, and Word even gave me frames. It was when I wanted to put some code on my site from somewhere else when the need to know how to write HTML caught up with me. No matter what I did in Word, the block would not go where I wanted it. I got the message, learn how to write a web page. Before then I did not care about the markup, I just wanted my pages to look pretty.
At first I found a site here and there which told me what all those things meant in between the &#060; and &#062;. With just the basics, I started to rewrite my site. I kept the frames and still did a lot wrong. I had deprecated tags everywhere. The amount of &#060;font&#062; tags was enough to make some throw their hands up in the air in exasperation. Not only did I have a lot of deprecated tags, I had tags unclosed. I just plain did not get it.
It took some very patient people talking me through my hysterics when something on my site did not work to finally get my site looking better and most areas working right. Then I ran out of space. I had filled my 10 megabytes rather quickly. Hysterics ensued. Then someone casually mentioned CSS. When I saw what one line of CSS could do to cut my page size down, I nearly cried (or did I actually feel a tear?). Within weeks the size of my site was down by more than 75%. After that my whole coding philosophy became small is beautiful.
Let's pause for a moment. At the time the only browser on my computer was Internet Explorer. I was still a very lazy writer so some of my HTML was browser specific. I was not writing for the masses just those who were using IE. Then along came Firefox becoming the cause for a fresh bought of hysterics. I am still have some cross browser issues (with IE now), but they are not critical.
The main issue causing my headaches was my frames looked bad in Firefox. So, I had to find another way of making my pages look and act the same without frames. I was introduced to &#060;divs&#062;s and in CSS scrolling. The problem with getting rid of the frames was I would have to put the same stuff on all of the pages, making them bigger, and I did not want that. Then I was introduced to Server Side Includes. It was a miracle to me. I could put all kinds of stuff into one file and have it read by another. So slowly I had been altering all of my pages to have SSI.
After telling someone I use SSI on my site, I was told Perl would do an even better job. So now I am learning Perl so it can be the foundation of this site.
2 Me
I was born on July 10th, 1971 at Fort George G. Meade, Maryland. My father was posted to Fort Huachuca, Arizona, and we lived in Sierra Vista, Arizona. My father's next post took us to Fort Jackson, South Carolina where we lived on base. My family moved to Marktsteft and then to Kitzingen in, then, West Germany. After living there for a few years, my father was posted to Fort Ord, California. This was the last military post on which we would live. When my father retired, my family moved to Frederick, Maryland. We briefly lived in Brunswick, Maryland. I now live in Woodsboro, Maryland with my fiancé. I have gone back to Germany on a student exchange program. I have briefly visited Mexico and France.
I have ^Debian^ jessie with ^KDE^. I use ^Mozilla^ ^Firefox^ to browse the internet with A<Google|href="http://www.google.com"> as my preferred search engine. I connect with ^HexChat^ to chat on IRC. I used to send instant messages with A<Trillian|href="http://www.trillian.im">, but I now hang out on A<Twitter|href="http://www.twitter.com">. I do most of my editing off-line using ^Geany^. I use ^LibreOffice^ office sparingly. My favorite off-line computer games are those produced by ^PopCap Games^.
I like putting together jigsaw puzzles and enjoy playing A<chess|href="../Miscellany/Chess_variants.pl">, mahjong, and spades.
When I was younger, I was simultaneously interested in astronomy and mythology. From my interest in those fields, I became interested in the various fields of divination. My interest in gemstones and minor interest in mineralogy sprang from playing Dungeons & Dragons which interested me in titles of nobility and geography. I no longer play Dungeons & Dragons.
I am only mildly interested in politics and then only in theoretical applications.
3 Pets
We love cats. We have two cats. Nybble was given to us on 30 March 2016. Bitsy was brought home on 14 October 2018.
Our cat Cache, previously owned by my mother and named Cash, died on 8 March 2016. Our cat Peepers died on 8 January 2010. We have had two other cats, Percher and Snowball, both deceased. Percher died from feline leukemia.
While I lived with my mother and siblings, our family owned several cats: Critter, Casey, and Pepper; and dogs: Blackie and Tabitha; and a bird: Tweeter.
3 Colors
I do not have one favorite color but prefer shades of blue and yellow, though I do like other color combinations. This site used to use colors from the Maryland flag which I like.
3 Birthstones and the Zodiac
* B<Birth stone:> ruby
* B<Birthday stone:> turquoise or diamond
* B<Birth flowers>
** B<British:> larkspur
** B<United States:> water lily or delphinium
* B<Zodiac signs>
** B<Tropical:> Cancer (negative quality, water triplicity, cardinal quadrplicity, emerald stone)
** B<Sidereal:> Gemini (positive quality, air triplicity, mutable quadrplicity, spinel stone)
** B<Chinese:> Pig (element water, stone topaz).
2 Preferred user names
I have used many user names over the years. There are so many once offs, but those which are important are mentioned here. Lady Aleena is my favorite.
3 Fantasy
Fantasy is my favorite genre so when it came time to pick a CB handle, I chose it. (You used to be able to find me on channel 1.) Nothing more complicated than that. I use a derivative of it elsewhere on the web, Lady Fantasy.
3 Lady Aleena - a story
A woman sat at the keyboard of her computer and was posting on a Telnet BBS called Brinta (now defunct). She already had a user name but didn't want her comments in one "room" to come back to her, so she needed to post with another level of anonymity. The first name she came up with was ^Alexana^. After a while she got tired of it, so she used the name ^Eileen^. Even Eileen bored her, so she changed it to Olara.
Years later she started to play Dungeons and Dragons. She was creating new characters and needed names for them. She searched her memory for some names. She remembered her masks on Brinta and put them on her character sheets, ^Alexana Olara^ and ^Eileen Olara^. They were twin sisters who eventually were relegated to dormancy.
Not long after that, she found Excite.com. She needed a user name there and scanned her brain again for a name. She liked her characters Alexana and Eileen, so she merged them into a new one, Aleena. Well Aleena was a bit plain, so she prefixed it with Lady. She liked the user name so much that she has adopted it where ever she goes, when she can. She is sometimes annoyed when it is already taken. She has a few other user names out there, but Lady Aleena is her favorite.
3 Lady Aerianna
I only use this handle on Yahoo! since Lady Aleena was already taken. Aerianna is an amalgamation of two of my characters' names, ^Drianna^ and ^Aegyn^.
3 Lady Olara
I only used this handle on Hotmail since Lady Aleena was already taken.
3 Other names
I have also been known as Faerie Queen, Sorceress, and Lady Harper when I was active on a few telnet A<BBSs|href="Miscellany/BBSs.pl">. While on A<IRC|href="IRC_channels_I_visit.pl"> I use many abbreviations of Lady_Aleena. I've also used, briefly, Lady_Cookie, Scary_Aleena, and Santa_Aleena.
2 Favorite quotes
bq A man's knowledge is like an expanding sphere, the surface corresponding the boundary between the known and the unknown. As the sphere grows, so does its surface; the more a man learns, the more he realizes how much he does not know. Hence, the most ignorant man thinks he knows it all.
by L. Sprague de Camp
bq Do to others as you would have them do to you.
from Luke 6:31
bq An it harm none, do what ye will.
from the Wiccan Rede
3 My quotes
bq The stupid question is the question unasked.
bq Sticks and stones may break my bones, but whips and chains excite me.
bq Nothing is ever complete until all matter and energy are destroyed. Only when everything is gone is anything complete.
I simplified L. Sprague de Camp's quote above.
bq The more I know, the more I know I don't know. When I learn something, I know less about more.
bq Just because you like the cool Q<fad of the moment> doesn't make you cool.
bq Even if the shoe fits, if you think it is ugly or just doesn't match your outfit, you don't have to wear it. Pick another pair.
bq It takes the same passion to hate something as it does to love something. Their true opposite is indifference.SUP<1> 
SUP<1> SMALL<That's how characters in film and TV who initially hate each other can fall in love so easily. Building up love or hate from indifference is a I<lot> harder.>
2 Random thoughts
I like you for our similarities, I love you for our differences.
Twitter, the place where there are short conversations over long spans of time.
