package Util::TimeStuff;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(duration half_life_date);

use Date::Calc qw(:all);

sub duration {
  my ($var) = @_;
  my $total_seconds;
  for my $duration (@{$var}) {
    my $split = ($duration =~ tr/\://);
    my ($hours,$minutes,$seconds);
    if ($split == 1) {
      $hours = 0;
      ($minutes,$seconds) = split(':',$duration);
    }
    elsif ($split == 2) {
      ($hours,$minutes,$seconds) = split(':',$duration);
    }
    else {
      die "Split didn't work";
    }
    $total_seconds += (($hours * 60) * 60) + ($minutes * 60) + $seconds;
  }

  my $total_minutes = int($total_seconds/60);
  my $total_hours   = int($total_minutes/60);
  my $total_days    = int($total_hours/24);
  my $total_weeks   = int($total_days/7);
  
  my $print_seconds = $total_seconds % 60;
  my $print_minutes = $total_minutes % 60;
  my $print_hours   = $total_hours % 24;
  my $print_days    = $total_days % 7;
  
  my @times = ($print_days,$print_hours,$print_minutes,$print_seconds);
  shift @times while @times && $times[0] == 0;
  
  return join(":",@times)."\n";
}

sub half_life_date {
  my ($meeting,$birthdate) = @_;
  my $date_difference = Delta_Days(@$birthdate,@$meeting);
  my ($double_year, $double_month, $double_day) = Add_Delta_Days(@$meeting,$date_difference);
  my $birthday = $birthdate->[2]." ".Month_to_Text($birthdate->[1])." ".$birthdate->[0];
  my $double_date = $double_day." ".Month_to_Text($double_month)." ".$double_year;
  
  my %half_life;
  $half_life{birthday} = $birthday;
  $half_life{days_from_birth} = $date_difference;
  $half_life{half_life_date} = $double_date;

  return \%half_life;
}

=head1 NAME

B<Util::TimeStuff> returns durations and half life date.

=head1 Author

Lady Aleena

=cut

1;
