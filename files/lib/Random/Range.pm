package Random::Range;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_range random_radius);

use Fancy::Rand qw(fancy_rand);

my %units = (
  'imperial' => [qw(in ft yd mi)],
  'metric'   => [qw(cm dm m km)],
);

sub random_unit {
  my ($user_unit, $user_additions) = @_;
  my $unit = fancy_rand(\%units, $user_unit, { caller => 'random_unit', additions => $user_additions ? $user_additions : undef });
  return $unit;
}

sub random_range {
  my ($list, $unit) = @_;

  my @ranges = (1,5,10,20,50,100);
  push @ranges, 'touch' if $list eq 'touch';

  my $range = $ranges[rand @ranges];

  my $full_range;
  if ($range ne 'touch') {
    my $measure = $units{$unit} ? random_unit($unit) : $unit;
    $full_range = join(' ',($range, $measure))
  }
  else {
    $full_range = $range;
  }
  
  return $full_range;
}

sub random_radius {
  my ($list, $unit) = @_;
  my $radius = random_range($list, $unit);

  my $full_radius = $radius eq 'touch' ? "by $radius" : "in a $radius radius";
  return $full_radius;
}

=head1 NAME

B<Random::Range> selects random ranges or radiuses.

=head1 SYNOPSIS

To use this module, please enter the following.

	use Random::Range qw(random_range random_radius);

When you want to generate a random range with this module, you can choose from the following.

	random_range('simple','imperial')    # selects 1, 5, 10, 20, 50, or 100 in, ft, yd, or mi.
	random_range('simple','metric')      # selects 1, 5, 10, 20, 50, or 100 cm, dm, m, or km.
	random_range('simple','your choice') # selects 1, 5, 10, 20, 50, or 100 and your measurement choice.
	random_range('touch','imperial')     # selects 1, 5, 10, 20, 50, or 100 in, ft, yd, or mi or touch.
	random_range('touch','metric')       # selects 1, 5, 10, 20, 50, or 100 cm, dm, m, or km or touch.
	random_range('touch','your choice')  # selects 1, 5, 10, 20, 50, or 100 and your measurement choice or touch.

You can substitute C<random_range> with C<random_radius> to get some extra text with the returned value.

=head1 AUTHOR

Lady Aleena

=cut

1;
