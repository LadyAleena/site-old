package Xanth::Crossbreed;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(get_crossbreed);

use Fancy::Join::Defined qw(join_defined);

sub get_crossbreed {
  my ($character) = @_;
  
  my $species = $character->{species}->[-1];
  
  if ($species eq 'crossbreed') {
    my @species_list;
    for my $parent_type ( qw(mother father) ) {
      my $parent_name = $character->{family}->{$parent_type}->[0] ? $character->{family}->{$parent_type}->[0] : undef;
      
      my $parent_species = undef;
      if ($parent_name) {
        if ( $parent_name =~ /^[a-z]/ && $parent_name ne 'unknown' ) {
          $parent_species = $parent_name;
        }
        else {
          my $parent = $characters->{$parent_name};
          $parent_species = get_crossbreed($parent);
        }
      }
      push @species_list, $parent_species;
    }
    $species = join_defined('/', @species_list);
  }

  return $species;
}

1;
