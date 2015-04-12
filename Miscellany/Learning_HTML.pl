#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
Hypertext markup language (HTML) and cascading style sheets (CSS) are two of the more common elements of writing a web page. With HTML you define what is a paragraph, a list, a table, and more. You can change a font or the color of the background among other things with CSS.
2 Getting started
I strongly suggest you not use ACRONYM<WYSIWYG|title="what you see is what you get"> web page writing programs. When you are just starting out, you should not fall into the bad habit of trusting their output. If you start using a text editor, you will know exactly what you are putting on your pages and understand what to change when you feel the need. This site was first made using a web page program, and I was totally lost when something did not work.
While you are learning HTML, learn CSS as well. ^PageResource^ is a wonderful place to start learning HTML and CSS. The ^World Wide Web Consortium^ (W3C) is depreciating formatting elements and attributes. A good understanding of CSS will also make writing your markup faster. Keeping up with the latest technology is key. It is a pain to have to remarkup a page. I am still agonizing over my pages with old markup.
When you are finally ready to write your site, it is suggested that you first get some paper and a pencil and draw out what you want your site, and the pages therein, to generally look like. This way you will have a guide, and your markup will go a lot faster. I did it that way when rebuilding this site from the ground up. I was able to markup my site in less time with those drawings as a reference.
When you stop having fun, take a break from learning markup or writing your site, as it might show on your site. The more fun you are having, the more fun your users will have.
If you have questions, ^#HTML^ on freenode or ^WXCity Forum^ are great places to get them answered. This site was built with the help of a lot of people in there.
After a while unchanging text may not be enough for you. There are many scripting languages out there that you can learn including but not limited to javascript, perl, and python.
2 HTML links
* ^HTML An Interactive Tutorial for Beginners^
* ^HTML Code Tutorial^
* ^PageResource^
* ^PageTutor^
* ^Web Design Group^
* ^World Wide Web Consortium^
