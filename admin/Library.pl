#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::HTML::Element qw(html head body section anchor paragraph list);
use Base::Data qw(get_directory alpha_hash);
use Util::Number qw(commify);

my %modules;
sub get_modules {
  my ($directory,$base) = @_;
  if (-e $directory) {
    my @dir_files = get_directory($directory, { 'full path' => 'yes' });

    for my $file (@dir_files) {
      if (-f $file && $file =~ /\.pm$/) {
        (my $module = $file) =~ s/\.pm$//;
        $module =~ s/\Q$base\E\///;
        $module =~ s/\//::/g;
        $modules{$module}++;
      }
      elsif (-d $file) {
        get_modules($file,$base);
      }
    }
  }
}

get_modules($_,$_) for @INC;

my $amount = commify(scalar(keys %modules));
open(my $file, '>', '../files/data/module_list.txt') || die "Can't open file, stopped";
print $file join("\n",keys %modules);
my %alpha_modules = alpha_hash(\%modules);

for my $alpha ( keys %alpha_modules ) {
  my @modules = map(anchor($_, { href => "http://search.cpan.org/perldoc?$_", title => "$_ on CPAN", target => '_blank' }), sort keys %{$alpha_modules{$alpha}});
  $alpha_modules{$alpha} = \@modules;
}

html(0, {
  'head' => {
    'title' => 'Modules on the server',
    'style' => ['
      body { font-family:arial; }
      ul {padding-left:1em; -moz-column-count:2; -webkit-column-count:2; column-count:2; font-size: smaller;}
      ', { 'type' => 'text/css' }
    ]
  },
  'body' => [
    sub {
      paragraph(3, "There are $amount of modules on this list.");
      for my $alpha ( sort keys %alpha_modules ) {
        section( 2, sub {
          my @alpha_list = @{$alpha_modules{$alpha}};
          list(3, 'u', \@alpha_list);
        }, { 'heading' => [2, $alpha] });
      };
    }, { 'heading' => [1, 'Modules on the server'] }
  ],
});
