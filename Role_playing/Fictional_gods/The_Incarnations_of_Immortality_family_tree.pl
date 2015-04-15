#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(pre);

my $doc_magic = { 'tree' => sub { pre(3, sub { print q(
 Cedric---+---<span style="background:#999;">Niobe</span>-------+-------Pacian---+---Blanche
          |               |                |
          |    Leaga*<span style="background:#f99;">Mym</span>*<span style="background:#9f9;">Orb</span>+<span style="background:#9ff;">Perry</span>+Jolie   |
          |   Lilith*   |         *Lilith  |
          |  Rapture*   |                  |
          |             |                  |
          |    Gawain+<span style="background:#f9f;">Orlene</span>*<span style="background:#99f;">Norton</span>        |
          |                 |              |
          |              Gawain II         |
          |                                |
 Magician Cedric Jr.------+--------------Blenda
                          |
                        Luna*<span style="background:#ff9;">Zane</span>
) }) }};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
Created by Piers Anthony and compiled by me.
2 The Family
& tree
2 The Incarnations
* Zane - Death (Thanatos)
* Norton - Time (Chronos)
* Niobe - Fate (Clotho and Lachesis)
* Mym - War (Mars)
* Orb - Nature (Gaea)
* Perry - Evil (Satan)
* Orlene - Good (God)
