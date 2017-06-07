package Random::Time;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_time_unit random_day_part random_time random_frequency);

use Lingua::EN::Inflect qw(PL_N A);

use Fancy::Rand qw(fancy_rand tiny_rand);
use Random::SpecialDice qw(random_die);

my %times = (
  'general' => [qw(second minute hour day week month year decade century millennium)],
  'game'    => [qw(segment round turn)],
);

my %time_units;
$time_units{'second'}     = 1;
$time_units{'minute'}     = $time_units{'second'}  * 60;
$time_units{'hour'}       = $time_units{'minute'}  * 60;
$time_units{'day'}        = $time_units{'hour'}    * 24;
$time_units{'week'}       = $time_units{'day'}     *  7;
$time_units{'month'}      = $time_units{'week'}    *  4;
$time_units{'year'}       = $time_units{'week'}    * 52;
$time_units{'decade'}     = $time_units{'year'}    * 10;
$time_units{'century'}    = $time_units{'decade'}  * 10;
$time_units{'millennium'} = $time_units{'century'} * 10;
$time_units{'round'}      = $time_units{'minute'};
$time_units{'segment'}    = $time_units{'round'}   / 10;
$time_units{'turn'}       = $time_units{'round'}   * 10;

sub random_time_unit {
  my ($user_time, $user_additions) = @_;
  my $time = fancy_rand(\%times, $user_time, { caller => 'random_time_unit', additions => $user_additions ? $user_additions : undef });
  return $time;
}

sub random_day_part {
  my @day_part = qw(dawn morning midmorning noon midday afternoon evening dusk night midnight);
  my $day_part = tiny_rand(@day_part);
  if ($day_part =~ /^(morning|afternoon|evening)$/) {
    return "in the $day_part";
  }
  else {
    return "at $day_part";
  }
}

sub random_time {
  my ($type) = @_;
  my $time_unit = $type ? random_time_unit($type) : random_time_unit('all');
  my $day_part = random_day_part;
  if ($time_units{$time_unit} <= $time_units{'day'}) {
    return $time_unit
  }
  else {
    return "$time_unit $day_part";
  }
}

sub random_frequency {
  my $time_unit = A(random_time_unit('all'));
  my $frequency = $time_unit =~ /(?:second|segment)/ ? 1 : random_die(1);
  my $plural = PL_N('time', $frequency);
  return "$frequency $plural $time_unit";
}

=head1 NAME

B<Random::Time> selects a random time unit, random day part, random time, or random frequency.

=head1 SYNOPSIS

  use Random::Time qw(random_time_unit random_day_part random_time random_frequency);

  my $time_unit          = random_time_unit;            # selects any time unit
  my $standard_time_unit = random_time_unit('general'); # selects a general time unit from second to millennium
  my $game_time_unit     = random_time_init('game');    # selects a game time unit from segment to turn

  my $day_part = random_day_part; # selects part of the day such as dawn, noon, or dusk and more.

  my $time          = random_time;            # selects a random time unit, if the time unit is greater than a day, then adds a day part to it.
  my $standard_time = random_time('general'); # selects a general random time unit
  my $game_time     = random_time('game');    # selects a game random time unit

  my $frequency = random_frequency; # selects a frequency by time unit

=head1 AUTHOR

Lady Aleena

=cut

1;
