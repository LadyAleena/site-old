#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use HTML::Entities qw(encode_entities);

use lib '../../files/lib';
use Base::Data qw(data_directory get_directory);
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use Util::Sort qw(name_sort);
use Util::Convert qw(textify filify);
use RolePlaying::Spellbook qw(print_spellbook);

my $directory = 'Role_playing/Player_characters/spellbooks';
my @selects = sort { name_sort(lc $a,lc $b) } map { textify($_) } get_directory(data_directory($directory));

my $cgi = CGI::Minimal->new;
my $select = encode_entities($cgi->param('spellbook'),'<>"');
my $head = $select && grep(/\Q$select\E/, @selects) ? "$select\'s spellbook" : 'My characters\' spellbooks';
page( 'heading' => $head, 'file menu' => file_menu('spellbook', \@selects , $select), 'code' => sub {
  print_spellbook($directory, filify($select).'.txt') if ($select && grep(/\Q$select\E/, @selects));
});
