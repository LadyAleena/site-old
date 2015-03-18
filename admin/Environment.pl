#!/usr/bin/perl
use strict;
use warnings FATAL => qw(all);

use Data::Dumper;

use lib "../files/lib";
use Base::HTML qw(html story);
use Base::HTML::Element qw(pre);

my $doc_magic = {
  'uid'   => sub { pre(4, sub { print "$<\n" }) },
  'euid'  => sub { pre(4, sub { print "$>\n" }) },
  'gid'   => sub { pre(4, sub { print "$(\n" }) },
  'egid'  => sub { pre(4, sub { print "$)\n" }) },
  'env'   => sub { pre(4, sub { print Dumper(\%ENV) }) },
  'inc_d' => sub { pre(4, sub { print Dumper(\@INC) }) },
  'inc_f' => sub { pre(4, sub { print Dumper(\%INC) }) },
};

html( code => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
2 IDs
3 Real user ID
& uid
3 Effective user ID
& euid
3 Real group ID
& gid
3 Effective group ID
& egid
2 %ENV
& env
2 @INC
& inc_d
2 %INC
& inc_f
