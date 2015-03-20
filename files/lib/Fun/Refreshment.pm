package Fun::Refreshment;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(refreshment);

use Lingua::EN::Inflect qw(A);

my @refreshments = ('cookies','carrots','chips','chocolate mousse','soda','wine'); 
my %containers = (
  'cookies' => 'platter',
  'carrots' => 'tray',
  'chips' => 'bowl',
  'chocolate mousse' => 'bowl',
  'soda' => 'cooler',
  'wine' => 'carafe',
);

sub refreshment {
  my @table = map(A($containers{$_})." of ".$_,@refreshments);
  return "puts out ".$table[rand @table];
}  

1;
