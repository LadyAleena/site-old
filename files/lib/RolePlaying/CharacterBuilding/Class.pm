package RolePlaying::CharacterBuilding::Class;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(convert_class get_level return_classes);

use Lingua::EN::Inflect qw(ORD);

use Base::Data qw(get_hash);

my @specialists = qw(enchanter illusionist invoker necromancer);
my @elementalists = qw(pyromancer hydromancer geomancer aeromancer);
my @other_wizards = ('arcanist',"sha'ira");
my $wizards = join('|', (@specialists, @elementalists, @other_wizards));

sub convert_class {
  my ($class, $module) = @_;

  $class = 'warrior' if (
    ($class eq 'fighter' && $module !~ /(?:Level|WeaponSlots)/) ||
    ($class eq 'paladin' && $module ne 'TurningUndead') ||
    ($class =~ /(?:paladin|ranger)/i && $module ne 'SpellProgression') ||
    ($class eq 'askara')
  );
  $class = 'rogue'   if (
    ($class eq 'thief' && $module ne 'RogueSkills') ||
    ($class eq 'bard' && $module !~ /(?:SpellProgression|RogueSkills)/)
  );
  $class = 'priest'  if (
    ($class =~ /(?:cleric|witch doctor)/i) ||
    ($class eq 'druid' && $module !~ /(?:Level|TurningUndead)/) ||
    ($class eq 'specialty priest' && $module ne 'Level')
  );
  $class = 'wizard'  if ($class =~ /(?:mage|$wizards)/i);

  return $class;
}

my %xpchart = get_hash(
  'file' => ['Role_playing/Classes','Levels.txt'],
  'headings' => [qw(level fighter warrior rogue priest druid),'specialty priest','wizard','psionisist','chaos warden','theopsyelementalist']
);

sub get_level {
  my ($class, $user_xp, $user_level) = @_;
  $class = convert_class($class,'Level');
  my $xp = $user_xp ? $user_xp : 0;
  my $level = $user_level ? $user_level : 1;
  my $next_level = $level + 1;

  if ($level == 100) {
    return 100;
  }
  elsif ($xp >= $xpchart{$level}{$class} && $xp < $xpchart{$next_level}{$class}) {
    return $level;
  }
  else {
    get_level($class, $xp, $next_level);
  }
}

sub return_classes {
  my ($class, $experience) = @_;

  my @classes;
  for (@{$class}) {
    my $level = ORD(get_level($_,$experience));
    push @classes, "$level level $_";
  }

  return \@classes;
}

1;
