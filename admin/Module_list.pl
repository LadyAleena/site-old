#!/usr/bin/perl
use strict;
use warnings;

use Lingua::EN::Inflect qw(NUMWORDS);
use LWP::Simple qw(get);

use lib '../files/lib';
use Base::Data qw(alpha_hash);
use Base::Page qw(page);
use Base::Menu qw(alpha_menu);
use HTML::Elements qw(section paragraph list anchor);

my $filename = 'files/data/module_list.txt';
my %files = (
  'fantasy' => "http://fantasy.xecu.net/$filename",
  'user'    => "http://users.xecu.net/fantasy/$filename",
  'local'   => "http://localhost/$filename"
);

my %modules;
for my $file (keys %files) {
  my $work_file = get($files{$file});
  my @lines = split(/\n/,$work_file);
  push @{$modules{$_}}, $file for @lines;
}

my %styles = ('one' => 'none', 'two' => '#efe', 'three' => '#eef');
my %alpha_modules = alpha_hash(\%modules);
for my $alpha (keys %alpha_modules) {
  my @items;
  for my $module (sort keys %{$alpha_modules{$alpha}}) {
    my $style = $styles{NUMWORDS(scalar @{$alpha_modules{$alpha}{$module}})};
    my $link = anchor($module, { href => "http://search.cpan.org/perldoc?$module", target => 'ex_tab', title => "$module on CPAN" });
    my $places = join(', ',sort @{$modules{$module}});
    push @items, ["$link - $places", { 'style' => "background-color:$style" }]; 
  }
  $alpha_modules{$alpha} = undef;
  $alpha_modules{$alpha} = \@items;
}
my $alpha_menu = alpha_menu(\%alpha_modules);

page( 'code' => sub {
  for my $alpha (sort keys %alpha_modules) {
    section(3, sub {
      list(5, 'u', $alpha_modules{$alpha});
      paragraph(5, $alpha_menu, { 'class' => 'alpha_menu' });
    }, { 'heading' => [2, $alpha, { id => "section_$alpha" }]});
  }
});
