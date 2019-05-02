package Xanth::Crossbreed;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(get_crossbreed);

use Fancy::Join::Defined qw(join_defined);

sub get_crossbreed {
  my ($raw_species, $mother, $father) = @_;
  
  my $species = $raw_species;

  if ($raw_species eq 'crossbreed') {
    my $mother_species = $mother ? Xanth_species($mother) : 'unknown';
    my $father_species = $father ? Xanth_species($father) : 'unknown';
    my $cross_species = join_defined('/', ($mother_species, $father_species));
    $species = "$cross_species";
  }

  #return $species;
  return "get_crossbreed does not work.";
}

1;