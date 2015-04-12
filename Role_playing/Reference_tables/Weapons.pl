#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib '../../files/lib';
use Base::Page qw(page);
use Base::HTML::Element qw(section table);
use Base::Data qw(get_hash);
use HTML::Forms qw(tiny_select);

my $cgi = CGI->new;
my $broad = $cgi->param('broad') ? encode_entities($cgi->param('broad'),'<>"') : '';
my $tight = $cgi->param('tight') ? encode_entities($cgi->param('tight'),'<>"') : '';

my @headings = ('Weapon','#AT','Dmg(S/M)','Dmg(L)','Range','Weight','Size','Type','Speed','KO');

my %weapons_list = get_hash( 
  'file' => ['Role_playing/Reference_tables','Weapons.txt'],
  'headings' => [@headings,'broad group','tight group','value']
);

my @rows;
for my $weapon (sort { $a->{'Weapon'} cmp $b->{'Weapon'} } values %weapons_list) {
  next if $broad && (!$weapon->{'broad group'} || $weapon->{'broad group'} ne $broad);
  next if $tight && (!$weapon->{'tight group'} || $weapon->{'tight group'} ne $tight);
  push @rows, [map($weapon->{$_} ? $weapon->{$_} : '',@headings)];
}

my $head = $broad  ? $broad : $tight ? $tight : undef;
page( 'heading' => $head, 'code' => sub {
  section(3, sub {
    tiny_select(4, { 'location' => 'Weapons.pl', 'file' => ['Role_playing/Reference_tables','Weapons_select.txt'], });
    table(4, { 'class' => 'proficiency', 'rows' => [['header',\@headings],['data',\@rows]] });
  });
});
