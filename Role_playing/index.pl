#!/usr/bin/perl
# This is the site index.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Role-playing', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) } );

__DATA__
B<Role playing> is one of the larger player created resources for AD&amp;D 2nd Edition material on the web. Over 250 magic items are available and categorized as they would be listed if they were in the I<Encyclopedia Magica>&#169; TSR, Inc. There are a dozen A<monsters|href="Monsters"> for dungeon masters to pit against their players. Reference tables and random generators are included to help make 2nd Edition game play easier and a little more exciting. There is a comprehensive, though not complete, list of proficiencies that TSR, Inc.&#8482; and Wizards of the Coast, Inc.&#8482; have put out over the years. Conversions to other editions are welcome.
2 Acknowledgements
Many thanks to ^Robert Anderson^, Johnny Brant, Nathan Brown, ^Gabriel Elias^, ^Randy Furuyama^, ^Alan Gray^, Dan Grieg, Joshua Moore, Rob McDonald, ^Charlie Przybylek^, and Rich Rayburn for their contributions.
