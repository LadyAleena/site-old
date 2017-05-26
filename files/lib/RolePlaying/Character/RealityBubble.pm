package RolePlaying::Character::RealityBubble;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT = qw(reality_bubble);

use List::Util qw(sum);

use RolePlaying::Character::Class qw(convert_class class_level);

sub reality_bubble {
  my ($class,$opt) = @_;
  $class = convert_class($class, 'RealityBubble');
  my $level = $opt->{'level'} ? $opt->{'level'} : class_level('chaos warden', $opt->{'experience'});

  my $bubble = sum(1..$level);
  return $bubble;
}

1;
