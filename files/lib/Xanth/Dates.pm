package Xanth::Dates;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_birth get_death get_dates);

use Fancy::Join qw(join_defined grammatical_join);
use Xanth::PageLinks qw(timeline_link);
use Xanth::Util      qw(character_link);

# Begin getting dates

# Begin getting birth date and method
# People in Xanth are delivered by storks, except centaurs and derivatives thereof, because live births are "painful and messy".

sub get_birth {
  my ($birth, $species, $places) = @_;

  my $birth_type = $species->[0] =~ /centaur/ || $places->[0]->[0] =~ /(Mundania|Two Moons)/ ? 'born' : 'delivered';
  my $birth_link = $birth ? timeline_link($birth) : undef;
  my $birth_text = $birth ? "was $birth_type in $birth_link" : undef;
  
  return $birth_text;
}

# End getting birth date
# Begin getting death date and cause

sub get_death {
  my $dates = shift;

  my $death       = $dates->{death};
  my $death_link  = $death ? timeline_link($death) : undef;
  my $killer      = $dates->{killer} ? character_link($dates->{killer}) : undef;
  my $death_cause = $dates->{'cause of death'} ? 'was '.join_defined(' ', ($dates->{'cause of death'}, $killer)) : 'died';
  my $death_text  = $death ? "$death_cause in $death_link" : undef;

  return $death_text;
}

# End getting death date
# Begin getting dates together

sub get_dates {
  my ($dates, $species, $places) = @_;

  my $birth_text = $dates->{birth} ? get_birth($dates->{birth}, $species, $places) : undef;
  my $death_text = $dates->{death} ? get_death($dates) : undef;
  my $dates_text = $dates->{birth} || $dates->{death} ? grammatical_join('and', ($birth_text, $death_text)): undef;

  return $dates_text;
}

# End getting dates together
# End getting dates

1;