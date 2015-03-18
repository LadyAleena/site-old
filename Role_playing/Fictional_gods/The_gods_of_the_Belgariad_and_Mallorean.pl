#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::HTML qw(html story);

html( code => sub { story(*DATA) });

__DATA__
The gods created by David and Leigh Eddings.
* Overpower - UL
* Greater powers
** Aldur - god of none
** Belar - god of Aloria
** Chaldan - god of Arendia
** Eriond - new god of the Angarak
** Issa - god of Nyissa
** Mara - god of Maragor
** Nedra - god of Tol Nedra
** Torak - dead god of the Angarak
