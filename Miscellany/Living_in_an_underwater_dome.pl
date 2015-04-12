#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA); });

__DATA__
2 Oxygen
Oxygen will be taken from the water. The creation of man made "gills" will provide the oxygen needed. Also a pipe going to the surface of the water will provide some breathable air for the inhabitants for the first few months. The air will always circulate out of the dome so that the new clean air will be circulate.
2 Water
Water will be pumped into a large water purifier. The purifier will be working constantly. It will be shut down one hour a week for cleaning. During that hour all inhabitants will be put on water saving alert at least five hours before the purifier is turned off.
2 Electricity
Electricity will be acquired by floating solar panels. The panels will be on the water in a protective shell so that the energy will be safely transferred to the dome.
2 Light
Light will be acquired by fiber optic cables attached to the platform. Many of the cables will be connected to the dome so that there will be an illusion of sunlight.
2 Waste
In the dome will be recycling stations for paper, plastic, and some metals. Body waste will be passed through a waste purifier before being passed to the ocean floor. Food will not be wasted because of the limited supply of it at the start.
