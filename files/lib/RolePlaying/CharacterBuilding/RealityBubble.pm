package RolePlaying::CharacterBuilding::RealityBubble;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(get_reality_bubble);

use List::Util qw(sum);

use RolePlaying::CharacterBuilding::Class qw(convert_class get_level);

sub get_reality_bubble {
  my ($class,$opt) = @_;
  $class = convert_class($class,'RealityBubble');
  my $level = $opt->{'level'} ? $opt->{'level'} : get_level('chaos warden', $opt->{'experience'});

  my $bubble = sum(1..$level);
  return $bubble;
}

1;
