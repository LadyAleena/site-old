package Random::RPG::Event;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_event);

use Fancy::Rand qw(tiny_rand);
use Random::RPG::AbilityScores qw(random_ability);
use Random::RPG::SavingThrow qw(random_saving_throw);

my @base_events = (
  random_ability.' check',
  'non-weapon proficiency check',
  'saving throw'.tiny_rand('',' vs. '.random_saving_throw(tiny_rand('by keys','all'))),
  'backstab',
  'undead turning',
  'spell memorization'
);

my @game_rolls = (
  random_ability.' checks',
  'on non-weapon proficiency checks',
  'to saving throws'.tiny_rand('',' vs. '.random_saving_throw(tiny_rand('by keys','all'))),
  'Armor Class',
  'THAC0 modifier',
  'to Surprise'
);

my @events;
for my $event (@base_events) {
  push @events, map("$_ $event", qw(successful failed));
}
push @events, map("critical $_", qw(hit miss));

sub random_event {
  return tiny_rand(@events);
}

=head1 NAME

B<Random::RPG::Event> selects random game events based on I<Advanced Dungeons & Dragons, Second Edition>.

=head1 SYNOPSIS

  use Random::RPG::Event qw(random_event);

=head1 AUTHOR

Lady Aleena

=cut

1;
