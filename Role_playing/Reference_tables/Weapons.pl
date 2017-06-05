#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../../files/lib';
use Base::Page qw(page);
use Base::Data qw(make_hash);
use HTML::Elements qw(section table);
use HTML::Forms qw(tiny_select);
use RolePlaying::WeaponName qw(display_weapon);

my $cgi = CGI::Minimal->new;
my $broad = $cgi->param('broad') ? encode_entities($cgi->param('broad'),'<>"') : '';
my $tight = $cgi->param('tight') ? encode_entities($cgi->param('tight'),'<>"') : '';

my @headings = ('Weapon','#AT','Dmg(S/M)','Dmg(L)','Range','Weight','Size','Type','Speed','KO');

my $weapons_list = make_hash( 
  'file' => ['Role_playing/Reference_tables','Weapons.txt'],
  'headings' => [@headings, 'broad group', 'tight group', 'value']
);

my @rows;
for my $weapon (sort { $a->{'Weapon'} cmp $b->{'Weapon'} } values %$weapons_list) {
  next if $broad && (!$weapon->{'broad group'} || $weapon->{'broad group'} ne $broad);
  next if $tight && (!$weapon->{'tight group'} || $weapon->{'tight group'} ne $tight);
  $weapon->{'Weapon'} = display_weapon($weapon->{'Weapon'});
  push @rows, [map($weapon->{$_} ? $weapon->{$_} : '', @headings)];
}

my $head = $broad  ? $broad : $tight ? $tight : undef;
page( 'heading' => $head, 'code' => sub {
  section(3, sub {
    tiny_select(4, { 'location' => 'Weapons.pl', 'file' => ['Role_playing/Reference_tables','Weapons_select.txt'], 'class' => 'proficiency' });
    table(4, { 'class' => 'proficiency', 'rows' => [['header',[\@headings]],['data',\@rows]] });
  });
});
