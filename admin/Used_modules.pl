#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use lib '../files/lib';
use Base::Data qw(get_directory);
use Base::Page qw(page story);
use Base::Root qw(get_root);
use HTML::Elements qw(table);

my $root_path = get_root('path');

my %uses;
sub file_list {
  my $directory = shift;
  my @temp = get_directory($directory, { 'full path' => 'yes' });

  for (@temp) { 
    if (-f $_ && $_ =~ /\.p[lm]$/) {
      open(my $fh, '<', $_) || die $!;
      my $loop = 0;
      while (my $line = <$fh>) {
        chomp($line);
        $uses{$1}++ if $line =~ /^use ((\w|\:)+)(.+)$/;
        die "$_ isn't using strict" if ($loop == 1 && $line !~ /use strict/ && $_ !~ /index/);
        die "$_ isn't using strict" if ($loop == 2 && $line !~ /use strict/ && $_ =~ /index/);
        die "$_ isn't using warnings" if ($loop == 2 && $line !~ /use warnings/ && $_ !~ /index/);
        die "$_ isn't using warnings" if ($loop == 3 && $line !~ /use warnings/ && $_ =~ /index/);
        $loop++
      }
    }
    elsif (-d $_) {
      file_list($_);
    }
  }
}

file_list($root_path);

my @rows;
for my $use (sort { $a cmp $b } keys %uses) {
  push @rows, [$use, $uses{$use}]
}

my $doc_magic = { 'table' => sub { table(3, { rows => [['data',\@rows]] }) }};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
& table
