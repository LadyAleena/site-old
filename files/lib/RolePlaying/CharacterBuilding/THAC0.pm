package RolePlaying::CharacterBuilding::THAC0;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(THAC0_base THAC0 THAC0_table_rows);

use List::Util qw(min sum);
use POSIX qw(ceil);

use RolePlaying::CharacterBuilding::Class qw(convert_class class_level);
use Util::Columns;

# part of the Character Building table suite.

my %THAC0_chart;
while (my $line = <DATA>) {
  my ($class, $reduce, $by_levels, $familiarity, $non_proficiency) = split(/\|/, $line);
  $THAC0_chart{$class}{'reduce'}          = $reduce;
  $THAC0_chart{$class}{'by levels'}       = $by_levels;
  $THAC0_chart{$class}{'familiarity'}     = $familiarity;
  $THAC0_chart{$class}{'non-proficiency'} = $non_proficiency;
}

# math help from buu in #buubot on freenode
sub THAC0_base {
  my ($class, $opt) = @_;
  $class = convert_class($class,'THAC0');
  my $level = $opt->{'level'} ? $opt->{'level'} : class_level($class, $opt->{'experience'});

  my $THAC0 = 20 - ( (ceil($level/$THAC0_chart{$class}{'by levels'})-1) * $THAC0_chart{$class}{'reduce'} );
  return $THAC0;
}

sub THAC0 {
  my %opt = @_;
  my $class = $opt{'class'};
     $class = convert_class($class,'THAC0');
  my $level = $opt{'level'};
  my $weapon_type  = $opt{'weapon type'};
  my $hit_location = $opt{'hit location'} ? $opt{'hit location'} : 'front';
  my $proficiency  = $opt{'proficiency'};
  my $hit_probability = $opt{'hit probability'} =~ /Nor/i ? 0 : $opt{'hit probability'};

  my %proficiencies = (
    'non-proficient' => $THAC0_chart{$class}{'non-proficiency'},
    'familiar'       => $THAC0_chart{$class}{'familiarity'},
    'proficient'     => '0',
    'specialized'    => '-1',
    'master'         => '-3',
  );

  # to hit the opponent's flank is -1.
  # to hit the opponent's rear is -2.
  my %to_hit_locations = (
    'front' => '0',
    'flank' => '-1',
    'rear'  => '-2',
  );

  my $proficiency_mod  = $proficiencies{$proficiency};
  my $weapon_type_mod  = $weapon_type eq 'melee'  ? $hit_probability : 
                         $weapon_type eq 'missle' ? $opt{'missile attack adjustment'} : 0;
  my $hit_location_mod = $to_hit_locations{$hit_location};

  # to hit using the off hand is +2 unless the character is ambidextrous then it is 0.
  my $hand_mod         = !$opt{'hand'} ? 0 : $opt{'ambidexterity'} ? 0 : 2;

  my $modifier         = sum($proficiency_mod, $hit_location_mod, $hand_mod) - $weapon_type_mod;

  my $base_THAC0 = THAC0_base($class, { 'level' => $level });
  my $raw_THAC0  = $base_THAC0 + $modifier;
  
  # the highest THAC0 can be is 20.
  my $THAC0      = $raw_THAC0 <= 20 ? $raw_THAC0 : 20;
  
  return $THAC0;
}

sub THAC0_all {
  my %opt = @_;
  my $classes = $opt{'classes'};
  my $xp      = $opt{'experience'};

  my %THAC0s;
  for my $class (@{$classes}) {
    my $class_THAC0 = THAC0_base($class, { 'experience' => $xp });
    $THAC0s{$class_THAC0} = $class;
  }
  my $base_THAC0 = min(keys %THAC0s);
  my $class = $THAC0s{$base_THAC0};

  my @table_headings;
  my @table;
  for my $proficiency ('non-proficient', 'familiar', 'proficient', 'specialized', 'master') {
    my @table_row = ($proficiency);
    for my $weapon_type ('melee', 'missle') {
      for my $hand ('', 'off-hand') {
        for my $direction ('front', 'flank', 'rear') {
          my $table_heading = ucfirst "$weapon_type<br><small>$direction<br>$hand</small>";
          push @table_headings, $table_heading unless grep(/$table_heading/, @table_headings);

          my $THAC0 = THAC0(
            'class'           => $class,
            'level'           => class_level($class,$xp),
            'hit probability' => $opt{'hit probability'},
            'missile attack adjustment' => $opt{'missile attack adjustment'},
            'ambidexterity'   => $opt{'ambidexterity'},
            'weapon type'     => $weapon_type,
            'hit location'    => $direction,
            'proficiency'     => $proficiency,
            'hand'            => $hand,
          );

          push @table_row, $THAC0;
        }
      }
    }
    push @table, [@table_row];
  } 

  my %THAC0_table;
  $THAC0_table{'headings'} = \@table_headings;
  $THAC0_table{'table'}    = \@table;

  return \%THAC0_table;
}

sub THAC0_table_rows {
  my %opt = @_;
  my $weapons = $opt{'weapons'};

  my $THAC0_table = THAC0_all(
    'classes'         => $opt{'classes'},
    'experience'      => $opt{'experience'},
    'hit probability' => $opt{'hit probability'},
    'ambidexterity'   => $opt{'ambidexterity'},
    'missile attack adjustment' => $opt{'missile attack adjustment'},
  );

  my @rows = (
    [ 'header', [['Proficiency', map( [$_, { 'style' => 'vertical-align:text-top' }], (@{$THAC0_table->{'headings'}}) )]] ],
    [ 'whead', $THAC0_table->{'table'} ]
  );
  my $colspan = scalar @{$rows[0]->[1]->[0]};
  if ($weapons) {
    push @rows, [ 'header', [[['Weapons', { 'colspan' => $colspan }]]] ];
    push @rows, [ 'data', [[['list', { 'class' => 'info', 'colspan' => $colspan, 'list' => ['u', $weapons, { 'class' => number_of_columns( 3, scalar @$weapons, 1) }] }]]] ];
  }

  return \@rows;
}

1;

__DATA__
warrior|1|1|1|2
rogue|2|3|2|3
priest|2|3|2|3
wizard|1|3|3|5
psionisist|1|2|2|4
chaos warden|1|2|2|4
theopsyelementalist|1|3|3|4
