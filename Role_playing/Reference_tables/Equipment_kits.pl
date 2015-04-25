#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Data qw(get_array);
use Base::Page qw(page story);
use HTML::Elements qw(definition_list);

my @def_headings = ('cost', 'weight', 'items included');
my $definition_list = get_array( 'headings' => ['term', @def_headings] );
my $doc_magic = { 'equipment' => sub { definition_list(4, $definition_list, { 'headings' => \@def_headings }) }};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
Equipment kits are a way to save space on your player character worksheet and to save you time. The prices may vary by dungeon master or game edition.
2 Equipment
& equipment
SMALL<Prices here are from Dungeons and Dragons, 2nd Edition.>
2 Clothing
Clothing sets cost around 3 gp. A set is a shirt, a tabard or vest, and pants or a skirt. Often the pieces are the same color or at least coordinated.
