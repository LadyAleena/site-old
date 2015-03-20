package RolePlaying::CharacterBuilding::AttacksPerRound;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(get_attacks);

use POSIX qw(floor);

use RolePlaying::CharacterBuilding::Class qw(convert_class get_level);

my %classes;
$classes{'warrior'}      = 6;
$classes{'chaos warden'} = 8;

sub get_attacks {
  my ($class, $opt) = @_;
  $class = convert_class($class,'AttacksPerRound');
  my $level = $opt->{'level'} ? $opt->{'level'} : get_level($class, $opt->{'experience'});
  
  $class = 'warrior' if $class =~ /(?:fighter|paladin|ranger)/;

  my $attacks = 1;
  if ($classes{$class}) {
    my $mod = .5 * floor($level / $classes{$class});
    $attacks += $mod;

    if ($attacks != int($attacks)) {
      $attacks *= 2;
      $attacks .= '/2';
    }
  }
  
  return $attacks;
}

=head1 AttacksPerRound

B<AttacksPerRound> returns the amount of attacks characters can make in combat. Most classes receive only 1 attack per round with only B<warriors> and B<chaos wardens> (a new class of my creation) receiving more as they advance in level.

=head2 Use

To use this module to return the slots needed, use the following. C<get_attacks> is exported by default.

  use RolePlaying::CharacterBuilding::AttacksPerRound;

=head2 Getting attacks per level

To get the number of attacks per round a character has, you will need the character's class and level or experience.

  my $attacks_per_round = get_attacks($class, { 'level' => $level });
  my $attacks_per_round = get_attacks($class, { 'experience' => $xp });
  
C<get_attacks> will return C<1> for any class other than C<warrior> or C<chaos warden> because that is all your character gets. If you see a fraction returned, it means you get the first number of attacks every two rounds.

=head2 Note

Rules used for C<AttacksPerRound> for B<warriors> levels 13 and below are standard, however the levels beyond it are house rules and not in any book.

=head2 Author

Lady Aleena

=cut

1;
