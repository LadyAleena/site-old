#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Data qw(get_hash);
use Base::Page qw(page story);
use HTML::Elements qw(anchor list);

my $BBSs = get_hash( 'file' => ['Miscellany', 'BBSs.txt'], 'headings' => [qw(name domain ip site)] );

my @items;
for my $BBS (sort { $a->{'name'} cmp $b->{'name'} } values %$BBSs) {
  my $name = $BBS->{'name'};
  my $link = $BBS->{'site'};
  my $BBS_head = $link ? anchor($name, { 'href' => "http://$link" }) : $name;
  my @telnet_links = map { $BBS->{$_} ? anchor($BBS->{$_}, { 'href' => "telnet://$BBS->{$_}" }) : undef } ('domain','ip');
  push @items, qq{$BBS_head <small>(}.join(', ', grep(defined, @telnet_links)).q{)</small>};
}

my $doc_magic = { 'bbss' => sub { list(4, 'u', \@items, { class => 'two' }) } };

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a list of BBSs which I used to frequent or just know about. I am not sure any still exist. My accounts on those I frequented have probably lapsed.
& bbss
