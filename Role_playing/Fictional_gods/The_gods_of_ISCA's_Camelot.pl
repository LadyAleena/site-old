#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);

html( code => sub { story(*DATA) });

__DATA__
At one time on a BBS known as ISCA, there was a room called Camelot. It was a continuing story. The story centered around the characters created by the users. Some of these characters venerated the gods that were created for that world. Here they are for your amusement.
2 Good gods
* Aelstra - goddess of Light Elves symbolized by Green-Gold Eyes
* Amitir - goddess of Music symbolized by a Silver Harp or Lute
* Hundarian - god of Nature symbolized by a Miniature Oak Tree
* Lurastria - goddess of Love symbolized by a White Dove
* Mab'Riel - also known as just Mab, goddess of Light Fae symbolized by a Faerie-Winged Wand
* Neakron - god of Luck symbolized by a Smiling Copper Coin
* Riana - goddess of Order symbolized by a Platinum Circlet
* Syranna - goddess of Animals symbolized by a Red Fox-Head
* Thyfir - god of Mischief symbolized by a Cheshire Grin
2 Neutral gods
* Amadar - god of the Flames symbolized by a Red Bordered Yellow Flame
* Awara - goddess of the Oceans symbolized by Four Blue Waves
* Fates - symbolized by four distinctly colored parts of a spinning wheel and cloth icon, see Fates below.
* Hemalin - god of Halflings symbolized by crossed Peace Pipes
* Horstala - god of Souls and the Dead symbolized by a Grey Ghost
* Kanael - god of the Earth symbolized by a Brown Mountain
* Patriah - goddess of the Skies symbolized by a White Cloud
* Sjenniar - god of Magic symbolized by a Crystal Orb
* Tiamat - goddess of Dragons symbolized by a Multi-headed/colored Dragon
* Togstrin - god of Dwarves symbolized by a crossed Hammer and Anvil
2 Evil gods
* Aex Hellshadow - god of Chaos symbolized by a Red Sun and Black Cloud
* Betharora - goddess of Dark Elves symbolized by Red Eyes on Black Background
* Charnagar - god of War symbolized by Crossed Swords pointed down
* Harineth - god of Deception symbolized by a Domino Mask
* Ithram - god of Disease and Plague symbolized by a Dark Green Laughing Skull
* L'Tarinel - god of Dark Fae symbolized by Bloodied Fangs
* Mammon - god of Greed/Unluck symbolized by Three Tarnished Silver Coins
* Mithizar - god of Death symbolized by a Black Skull
* Niram - goddess of Ice/Cold symbolized by a Blue Snowflake
2 The Fates
* Ochrina - the Overseer
* Ayria - the Planner
* Gelia - the Plotter
* Zentia - the Instigator
