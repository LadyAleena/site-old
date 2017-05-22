#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(pre);
use Util::FamilyTree qw(make_tree);

my $doc_magic = { 'tree' => sub {
  pre(3, sub {
    print make_tree(q(
 Cedric --+-- Niobe ----------+---------- Pacian --+-- Blanche
          |                   |                    |
          |    Leaga * Mym * Orb + Perry + Jolie   |
          |   Lilith *     |             *Lilith   |
          |  Rapture *     |                       |
          |                |                       |
          |     Gawain + Orlene * Norton           |
          |                     |                  |
          |                  Gawain II             |
          |                                        |
 Magician Cedric Jr. ----------+---------------- Blenda
                               |
                              Luna * Zane), { special => 'Incarnations' })
  }) 
}};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
I<The Incarnations of Immortality> created by Piers Anthony.
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
