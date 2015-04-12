#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::HTML::Element qw(anchor list);
use Base::Data qw(get_hash);

my %BBSs = get_hash( 'file' => ['Miscellany', 'BBSs.txt'], 'headings' => [qw(name domain ip site)] );

my @items;
for my $BBS (sort { $a->{name} cmp $b->{name} } values %BBSs) {
  my $name = $BBS->{name};
  my $link = $BBS->{site};
  my $BBS_head = $link ? anchor($name, { href => "http://$link" }) : $name;
  my @telnet_links;
  for my $telnet_link ('domain','ip') {
    my $link = $BBS->{$telnet_link};
    push @telnet_links, anchor($link, { href => "telnet://$link" }) if $link;
  }
  push @items, qq{$BBS_head <small>(}.join(', ',@telnet_links).q{)</small>};
}

my $doc_magic = { 'bbss' => sub { list(4,'u',\@items, { class => 'two' }) } };

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a list of BBSs which I used to frequent or just know about. I am not sure any still exist. My accounts on those I frequented have probably lapsed.
& bbss
