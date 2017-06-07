package RPG::Character::ProficiencySlots;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(proficiency_slots);

use RPG::Character::Class qw(convert_class class_level);

my %slots;
while (my $line = <DATA>) {
  chomp $line;
  my ($class, $weapon, $nonweapon) = split(/\|/, $line);
  my @slot_stats = qw(initial frequency);
  @{$slots{$class}{'weapon'}}{@slot_stats}     = split(/;/, $weapon);
  @{$slots{$class}{'non-weapon'}}{@slot_stats} = split(/;/, $nonweapon);
}

sub proficiency_slots {
  my ($class, $opt) = @_;
  $class = convert_class($class,'ProficiencySlots');
  my $level = $opt->{'level'} ? $opt->{'level'} : class_level($class, $opt->{'experience'});

  my $slots;
  for my $type ('weapon','non-weapon') {
    my $initial_slots = $slots{$class}{$type}{'initial'};
    my $frequency     = $slots{$class}{$type}{'frequency'};

    my $multiplier = int($level / $frequency);
    
    if ($opt->{'by the book'}) {
      $slots->{$type} = $initial_slots + $multiplier;
    }
    else {
      $slots->{$type} = $initial_slots + ($initial_slots * $multiplier);
    }
  }
  $slots->{'languages'} = $opt->{'# of languages'} if $opt->{'# of languages'};
  
  return $slots;
}

1;

__DATA__
warrior|4;3|3;3
rogue|2;4|3;4
priest|2;4|4;3
wizard|1;6|4;3
psionisist|2;5|3;3
chaos warden|4;6|4;4
theopsyelementalist|2;6|4;3
