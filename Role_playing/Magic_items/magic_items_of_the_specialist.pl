#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magic items of the specialist', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
Saving throws vary by who is wielding the item when using the special abilities of these items. When the wielder is a specilist wizard for which the item was designed, the victims of the abilities save at a -3. When the weilder is a magic user who is not a specialist for which the item was designed, the victims save at a -1. When the wielder is a specialist wizard of the opposition school, the abilities backfire, and the wizard must make a saving throw at -3. The special abilities, other than the bonues to armor class, to hit, or damage, do not work for non-wizards.
There is a 50% chance a wild magic surge will occur when a wizard of the oppostion school uses the item. There is a 10% chance the item will not confer any of it's special abilities to a non-specialist.
These magic items each have a presence about them. They are slightly intelligent since they know who is wielding them. If a non-specialist uses the item, there is a 5% chance, not cumulative, the item will try to change the wielder into a specialist wizard with which the item is linked. It will first change the character's abilities to meet the requirements of the specialist wizard. Once the character's abilities meet the requirements, the item will alter the character's class to the specialty wizard class. Wizards will be altered faster, however, even the toughest fighter who uses these items could become a specialist wizard. Current wizards will choose to memorize and cast spells primarily in the specialty. Other classes will become bored with their current class and wish to become wizards. With each successful roll, something will change for the character such as a fighter forgetting how to use a weapon or a thief losing a thieving ability. Dungeon masters should take care with clerics and priests. The priest may become dissatisfied with preaching, however, the god the priest serves may intervene to protect the priest from the item's power. Gods have been known to destroy items which interfere with their clergy.
