#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::HTML qw(html story);

html( code => sub { story(*DATA) });

__DATA__
2 Ship Orientation
* All ships will orient themselves to the same Z axis as the capital ship.
* The largest ship will be considered the capital ship when meeting with smaller craft.
* When two ships of the same size meet, the ship with the commander in higher standing will be considered the capital ship.
** If the commanders are of the same standing, the ship with the earlier launch date will be the capital ship.
** If the ships are working in conjunction on the same mission, the ship with the commander in command of the mission is the capital ship regardless of standing.
* The ship with the commander of a fleet is not the capital ship if it is smaller than another ship in the same fleet. It must orient itself to the capital ship.
* A ship with damage to its navigational controls is exempt.
* Ships will orient themselves to best advantage when joined in battle.
