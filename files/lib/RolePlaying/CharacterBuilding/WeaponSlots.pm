package RolePlaying::CharacterBuilding::WeaponSlots;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT = qw(slots_needed);

use RolePlaying::CharacterBuilding::Class qw(convert_class);

# part of the Character Building table suite.

my @classes     = ('fighter','warrior','rogue','priest','wizard','psionisist','chaos warden','theopsyelementalist');
my @sub_classes = ('rogue','priest','psionisist','chaos warden','theopsyelementalist');

my %slots;
$slots{'proficiency'}{$_}     = 1  for (@classes);
$slots{'specialization'}{$_}  = 2  for (@classes);

$slots{'mastery'}{$_}       = 3  for ('fighter','warrior');
$slots{'mastery'}{$_}       = 4  for ('fighter2','fighter3');
$slots{'mastery'}{$_}       = 5  for (@sub_classes);
$slots{'mastery'}{'wizard'} = 6;

$slots{'high mastery'}{'fighter'}   = 4;
$slots{'high mastery'}{'warrior'}   = 5;
$slots{'high mastery'}{'fighter2'}  = 6;
$slots{'high mastery'}{'fighter3'}  = 7;
$slots{'high mastery'}{$_}          = 8 for (@sub_classes);
$slots{'high mastery'}{'wizard'}    = 10;

$slots{'grand mastery'}{'fighter'}  = 5;
$slots{'grand mastery'}{'warrior'}  = 7;
$slots{'grand mastery'}{'fighter2'} = 8;
$slots{'grand mastery'}{'fighter3'} = 10;
$slots{'grand mastery'}{$_}         = 12 for (@sub_classes);
$slots{'grand mastery'}{'wizard'}   = 14;

my %multipliers;
$multipliers{'single weapon'}{$_}       = 1 for (@classes,'fighter2','fighter3');

$multipliers{'tight group'}{'fighter'}  = 2;
$multipliers{'tight group'}{$_}         = 3 for ('fighter2','warrior');
$multipliers{'tight group'}{$_}         = 4 for ('fighter3',@sub_classes);
$multipliers{'tight group'}{'wizard'}   = 5;

$multipliers{'broad group'}{'fighter'}  = 3;
$multipliers{'broad group'}{$_}         = 5 for ('fighter2','warrior');
$multipliers{'broad group'}{'fighter3'} = 7;
$multipliers{'broad group'}{$_}         = 8 for (@sub_classes);
$multipliers{'broad group'}{'wizard'}   = 9;

sub slots_needed {
  my %opt = @_;
  my $class = $opt{'class'};
  $class = convert_class($class,'WeaponSlots');
  my $skill_level = $opt{'skill_level'};
  die "Sorry, the class you've chosen is not listed." if !$slots{$skill_level}{$class};

  my $group = $opt{'group'};

  if ($class eq 'fighter' && !$opt{'multiclass'}) {
    die "Fighters must include how many total classes they have!";
  }

  if ($class eq 'fighter') {
    my $multiclass = $opt{'multiclass'};
    $class .= $multiclass if $multiclass > 1;
  }

  my $slots = $slots{$skill_level}{$class};
  $slots *= $multipliers{$group}{$class};

  if ($class ne 'fighter' && $opt{'multiclass'} > 1 && $opt{'skill_level'} =~ /mastery/) {
    $slots = 0;
  }

  return $slots;
}

=head1 WeaponSlots

B<WeaponSlots> returns the amount of slots for weapon proficiency, specialization, and mastery for your character's class or classes.

=head2 Usage

To use this module to return the slots needed, use the following. C<slots_needed> is exported by default.

  use RolePlaying::CharacterBuilding::WeaponSlots;

=head3 Determining class

For all classes other than B<fighters>, you will only need the base class for your character: B<warrior>, B<rogue>, B<priest>, B<wizard>, or B<psionisist>. If your multiclassed character's classes do not include B<fighter>, you need only two slots to specialize in your weapon but can not go beyond specialization. Only multiclassed B<fighters> can go beyond specialization and into mastery.

C<0> will be returned if the C<skill_level> is not available to your character.

=head3 C<skill_level>

The options for C<skill_level> are:

  proficiency
  specialization
  mastery
  high mastery
  grand mastery

=head3 C<group>

The options for C<group> are:

  single weapon
  tight group
  broad group
    
=head3 Putting it all together

  my $slots = slots_needed(
    class => $yourclass,
    multiclass => $number_of_classes,
    skill_level => $level_of_proficiency,
    group => $weapon_group,
  );

=head2 Note

Most of the rules used for C<WeaponSlots> are house rules and not in any book.

=head2 Author

Lady Aleena

=cut

1;
