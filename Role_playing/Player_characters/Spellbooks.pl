#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use HTML::Entities qw(encode_entities);

use lib '../../files/lib';
use Base::Page qw(page);
use Base::Menu qw(file_menu);
use HTML::Elements qw(section paragraph list);
use Util::Convert qw(textify filify);
use Util::Data qw(file_directory file_list);
use Util::Sort qw(name_sort);
use RolePlaying::Spellbook qw(spellbook);

my $directory = 'Role_playing/Player_characters/spellbooks';
my @selects = sort { name_sort(lc $a,lc $b) } map { textify($_) } file_list(file_directory($directory));

my $cgi = CGI::Minimal->new;
my $select = encode_entities($cgi->param('spellbook'),'<>"');
my $head = $select && grep(/\Q$select\E/, @selects) ? "$select\'s spellbook" : 'My characters\' spellbooks';
my $file_menu = file_menu('spellbook', \@selects , $select);

page( 'heading' => $head, 'file menu' => $file_menu, 'code' => sub {
  if ($select && grep(/\Q$select\E/, @selects)) {
    my $spell_levels = spellbook($directory, filify($select).'.txt');
    for my $spell_level (@$spell_levels) {
      section(3, sub {
        list(5, 'u', @{$spell_level->{'list'}}) if $spell_level->{'list'};
        paragraph(5, $spell_level->{'paragraph'}) if $spell_level->{'paragraph'};
      }, { 'heading' => [2, $spell_level->{'heading'}] });
    }
  }
  else {
    section(3, sub {
      paragraph(5, "You can read the lists of spells in my characters' spellbooks.");
      list(5, 'u', $file_menu, { 'class' => 'three' });
    });
  }
});
