package Xanth::Dates;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_age get_age_suspension get_dates_family);

use Util::Convert  qw(textify idify searchify);
use Fancy::Join qw(join_defined grammatical_join);
use Xanth::Family    qw(get_family);
use Xanth::Novel     qw(current_year);
use Xanth::PageLinks qw(timeline_link);
use Xanth::Util      qw(character_link);

# Begin getting dates and age

my $current_year = current_year();

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
  my $dates_text = $dates->{birth} || $dates->{death} ? join_defined(' and ', ($birth_text, $death_text)): undef;

  return $dates_text;
}

# End getting dates together
# Start getting age

sub get_age {
  my $dates = shift;
  my $age;
  my $current_year = current_year();
  my $birth = $dates->{birth};
  my $last  = $dates->{death} ? $dates->{death} : $current_year;
  
  $age = $last - $birth;
  
  if ($dates->{suspension}) {
    my @suspensions = @{$dates->{suspension}};
    for my $suspension (@suspensions) {
      my $end = $suspension->{end} ? $suspension->{end} : $current_year;
      my $suspension_modifier = $end - $suspension->{begin};
      $age = $age - $suspension_modifier;
    }
  }
  
  if ($dates->{reage}) {
    my $reage = $dates->{reage};
    $age = $reage->{age}  + ($last - $reage->{year});
  }
  
  return $age;
}

# End getting age
# Start getting text for when a character's age was suspended

sub get_age_suspension {
  my ($dates, $pronoun) = @_;
  my @suspensions = @{$dates->{suspension}};

  my $birth_year  = $dates->{birth};

  my @suspensions_text;
  my $begin_age;
  for (my $supend_no = 0; $supend_no < @suspensions; $supend_no++) {
    my $suspension   = $suspensions[$supend_no];
    my $prev_suspend = $supend_no - 1 >= 0 ? $suspensions[$supend_no - 1] : undef; 

    my $begin_year  = $suspension->{begin};
    my $begin_event = $suspension->{'begin event'};
       $begin_event =~ s/Brain Coral/character_link('Brain Coral')/e;

    if ($prev_suspend) {
      my $prev_end_year = $prev_suspend->{end};
      $begin_age += ($begin_year - $prev_end_year);
    }
    else {
      $begin_age += $begin_year - $birth_year;
    }

    my $end_year  = $suspension->{end} ? $suspension->{end} : undef;
    my $end_event = $suspension->{'end event'} ? $suspension->{'end event'} : undef;

    my $begin_link = timeline_link($begin_year);
    my $end_link   = timeline_link($end_year) if $end_year;
    
    my $prep = $begin_event =~ /past|future/ ? 'from' : 'in';
    
    my $age_text;
    if ($birth_year) {
      $age_text = "was $begin_age years old when $pronoun";
    }
    
    my $event_text = "$begin_event $prep $begin_link";
    if ($end_year && $end_event) {
      $event_text .= " and began aging again when $pronoun $end_event in $end_link";
    }
    elsif ($end_year) {
      if ($begin_event =~ /past|future/) {
        $event_text .= " to $end_link";
      }
      else {
        $event_text .= " and began aging again in $end_link";
      }
    }
    else {
      $event_text .= " and stopped aging";
    }

    my $suspension_text = join_defined(' ', ($age_text, $event_text));
    push @suspensions_text, $suspension_text;
  }
  
  return @suspensions_text;
}

# End getting text for when a character's age was suspended
# Begin getting text for when a character was reaged.

sub get_reage {
  my ($dates, $pronoun) = @_;

  my $birth_year  = $dates->{birth};

  my $reage = $dates->{reage};
  my $reage_age   = $reage->{age};
  my $reage_year  = $reage->{year};
  my $reage_event = $reage->{event};
  my $year_link   = timeline_link($reage_year);

  my $age_reage;
  if ($dates->{suspension} && $dates->{suspension}->[-1]->{end}) {
    $age_reage = ($reage_year - $dates->{suspension}->[-1]->{end}) + ($dates->{suspension}->[-1]->{begin} - $birth_year);
  }
  else {
    $age_reage = $reage_year - $birth_year;
  }

  my $start_verb = $reage_event && $reage_event =~ /compressed/ ? 'would have been' : 'was';
  my $start_text = "$start_verb $age_reage in $year_link" if $age_reage > 0;
  
  my $pre_event;
  if (($reage_event && $reage_event =~ /takes/) && $age_reage > 0) {
    $pre_event = "but $pronoun";
  }
  elsif ($reage_event && $age_reage > 0) {
    $pre_event = "when $pronoun";
  }

  my $post_event;
  if ($reage_event && $reage_event =~ /maintain/) {
    $post_event = "the age of";
  }
  elsif ($reage_event && $reage_event =~ /switched/) {
    $post_event = "who was";
  }
  elsif ($reage_event && $reage_event =~ /youth|aged/) {
    $post_event = "and became";
  }
  elsif ($reage_event) {
    $post_event = "at the age of";
  }
  else {
    $post_event = "but unclear how $pronoun became"
  }

  my $reage_text = join_defined(' ', ($start_text, $pre_event, $reage_event, $post_event, $reage_age));

  return $reage_text;
}

# End getting text for when a character was reaged.
# End getting dates and age
# Being dates and family paragraph

sub get_dates_family {
  my ($character, $gendering) = @_;
  
  my $name    = $character->{Name};
  my $text    = textify($name);
  my $dates   = $character->{dates};
  my $family  = $character->{family};
  my $species = $character->{species};
  my $places  = $character->{places};
  my $pronoun = $gendering->{pronoun};

  my $dates_family = undef;
  if ($dates || $family) {
    my $verb = $dates && $dates->{death} ? 'was' : 'is';
    
    my @dates_and_family;
    push @dates_and_family, get_dates($dates, $species, $places)          if ($dates && !$family);
    push @dates_and_family, get_birth($dates->{birth}, $species, $places) if ($dates->{birth} && $family);
    push @dates_and_family, "$verb ".get_family($family, $gendering)      if $family;
    push @dates_and_family, get_age_suspension($dates, $pronoun)          if $dates->{suspension};
    push @dates_and_family, get_reage($dates, $pronoun)                   if $dates->{reage};
    push @dates_and_family, get_death($dates)                             if ($dates->{death} && $family);
    push @dates_and_family, "$verb ".get_age($dates).' years old'         if $dates->{birth};
    
    my $first = shift @dates_and_family;
    @dates_and_family = map { ucfirst "$pronoun $_." } @dates_and_family;
    unshift @dates_and_family, "$first.";

    $dates_family = join(' ', @dates_and_family);
  }
  my $full_text = $dates_family ? "$text $dates_family" : undef;
  
  return $full_text;
}

# End dates and family paragraph

1;
