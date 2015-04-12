#!/usr/bin/perl
use strict;
use warnings;

use Lingua::EN::Inflect qw(NUMWORDS);
use LWP::Simple qw(get);

use lib '../files/lib';
use Base::Page qw(page);
use Base::HTML::Element qw(anchor section heading list);
use Base::Data qw(alpha_hash);
use Base::Menu qw(alpha_menu);

my $filename = 'files/data/module_list.txt';

my %files = (
  'fantasy' => "http://fantasy.xecu.net/$filename",
  'user'    => "http://users.xecu.net/fantasy/$filename",
  'local' => "/home/me/Documents/fantasy/$filename",
);

my %modules;
for my $file (keys %files) {
  my $work_file;
  my @modules;

  if ($file ne 'local') {
    $work_file = get($files{$file});
    @modules = split(/\n/,$work_file);
  }
  else {
    open($work_file,'<',$files{$file}) || die "Can't open $files{$file}. $!";
    @modules = <$work_file>;
    chomp (@modules);
  }

  for my $module (@modules) {
    push @{$modules{$module}}, $file;
  }
}

my %styles = ('one' => 'fcc', 'two' => 'cfc', 'three' => 'ccf');

my %alpha_modules = alpha_hash(\%modules);

page( 'code' => sub {
  for my $alpha (sort keys %alpha_modules) {
    my $section_name = $alpha eq uc $alpha ? "$alpha" : "l$alpha";
    my @items;
    for my $module (sort keys %{$alpha_modules{$alpha}}) {
      my $style = $styles{NUMWORDS(scalar @{$alpha_modules{$alpha}{$module}})};
      my $link = anchor($module, { href => "http://search.cpan.org/perldoc?$module", target => '_blank', title => "$module on CPAN" });
      my $places = join(', ',sort @{$modules{$module}});
      push @items, ["$link - $places", { style => "background-color:#$style" }];
    }
    section(3, sub {
      list(3,'u',\@items);
      alpha_menu(3,\%alpha_modules);
    }, { 'heading' => [2,$alpha, { id => "section_$section_name" }]});
  }
});
