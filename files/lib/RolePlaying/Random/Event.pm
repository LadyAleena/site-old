package RolePlaying::Random::Event;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_event);

# sub-part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(tinyrand);
use RolePlaying::Random::SavingThrow qw(random_saving_throw);
use RolePlaying::CharacterBuilding::AbilityScores qw(random_ability);

my @base_events = (
  random_ability.' check',
  'non-weapon proficiency check',
  'saving throw'.tinyrand('',' vs. '.random_saving_throw(tinyrand('by keys','all'))),
  'backstab',
  'undead turning',
  'spell memorization'
);

my @game_rolls = (
  random_ability.' checks',
  'on non-weapon proficiency checks',
  'to saving throws'.tinyrand('',' vs. '.random_saving_throw(tinyrand('by keys','all'))),
  'Armor Class',
  'THAC0 modifier',
  'to Surprise'
);

my @events;
for my $event (@base_events) {
  push @events, map("$_ $event",qw(successful failed));
}
push @events, map("critical $_",qw(hit miss));

sub random_event {
  return $events[rand @events];
}

1;
