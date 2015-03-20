package RolePlaying::Random::Time;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_time_unit random_day_part random_time random_frequency);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use RolePlaying::Random::Misc qw(dice);

use Lingua::EN::Inflect qw(PL_N A);
use Games::Dice qw(roll);

my %times = (
  'general' => [qw(second minute hour day week month year decade century millennium)],
  'game'    => [qw(segment round turn)],
);

my %time_units;
$time_units{'second'}     = 1;
$time_units{'minute'}     = $time_units{'second'}  * 60;
$time_units{'hour'}       = $time_units{'minute'}  * 60;
$time_units{'day'}        = $time_units{'hour'}    * 24;
$time_units{'week'}       = $time_units{'day'}     * 7;
$time_units{'month'}      = $time_units{'week'}    * 4;
$time_units{'year'}       = $time_units{'week'}    * 52;
$time_units{'decade'}     = $time_units{'year'}    * 10;
$time_units{'century'}    = $time_units{'decade'}  * 10;
$time_units{'millennium'} = $time_units{'century'} * 10;
$time_units{'round'}      = $time_units{'minute'};
$time_units{'segment'}    = $time_units{'round'} / 10;
$time_units{'turn'}       = $time_units{'round'} * 10;

sub random_time_unit {
  my ($type) = @_;
  my $time = random(\%times, $type);
  return $time;
}

sub random_day_part {
  my @day_part = qw(dawn morning midmorning noon midday afternoon evening dusk night midnight);
  my $day_part = $day_part[rand @day_part];
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
  my $frequency = roll(dice);
  my $plural = PL_N('time',$frequency);
  my $time_unit = A(random_time_unit('all'));
  return "$frequency $plural $time_unit";
}

1;
