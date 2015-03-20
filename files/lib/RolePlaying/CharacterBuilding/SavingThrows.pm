package RolePlaying::CharacterBuilding::SavingThrows;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(get_saving_throws get_multiclass_saving_throws saving_throw_table_rows);

# part of the Character Building table printing suite.

use List::Util qw(min max);

use RolePlaying::CharacterBuilding::Class qw(convert_class get_level);

#These are other items that confer a bonus to saving throws.
#start magic items

my %st_modifiers;
for my $item (qw(amulet bell belt blanket bracelet buckle cape cloak earring gem mask necklace ring robe scarab shell)) {
  map( $st_modifiers{"$item of protection +$_"} = $_, (1..5) );
}

$st_modifiers{$_} = 1 for ('robe of the archmagi', 'robe of stars');
$st_modifiers{$_} = 2 for ('staff of power', 'staff of the magi', 'ring of protection +4/+2');
$st_modifiers{'arm of valor'} = 3;

#end magic items

sub ST_modifier {
  my ($modifiers) = @_;
  
  my $st_mod = 0;
  for my $modifier (@{$modifiers}) {
    $st_mod += $st_modifiers{lc $modifier} ? $st_modifiers{lc $modifier} : 0;
  }

  return $st_mod;
}

my %masks = (
  'paralyzation' => 'ppd',
  'poison'       => 'ppd',
  'death magic'  => 'ppd',
  'rod'   => 'rsw',
  'staff' => 'rsw',
  'wand'  => 'rsw',
  'petrification' => 'pp',
  'polymorph'     => 'pp',
  'dragon breath' => 'breath weapon',
);

sub get_saving_throws {
  my ($class, $opt) = @_;
  $class = convert_class($class,'SavingThrows');
  
  my %saving_throws;
  if ($class eq 'warrior') {
    $saving_throws{$_} = { 'ppd' => 14, 'rsw' => 16, 'pp' => 15, 'breath weapon' => 17, 'spell' => 17 } for 1..2;
    $saving_throws{$_} = { 'ppd' => 13, 'rsw' => 15, 'pp' => 14, 'breath weapon' => 16, 'spell' => 16 } for 3..4;
    $saving_throws{$_} = { 'ppd' => 11, 'rsw' => 13, 'pp' => 12, 'breath weapon' => 13, 'spell' => 14 } for 5..6;
    $saving_throws{$_} = { 'ppd' => 10, 'rsw' => 12, 'pp' => 11, 'breath weapon' => 12, 'spell' => 13 } for 7..8;
    $saving_throws{$_} = { 'ppd' => 8,  'rsw' => 10, 'pp' => 9,  'breath weapon' => 9,  'spell' => 11 } for 9..10;
    $saving_throws{$_} = { 'ppd' => 7,  'rsw' => 9,  'pp' => 8,  'breath weapon' => 8,  'spell' => 10 } for 11..12;
    $saving_throws{$_} = { 'ppd' => 5,  'rsw' => 7,  'pp' => 6,  'breath weapon' => 5,  'spell' => 8 }  for 13..14;
    $saving_throws{$_} = { 'ppd' => 4,  'rsw' => 6,  'pp' => 5,  'breath weapon' => 4,  'spell' => 7 }  for 15..16;
    $saving_throws{17} = { 'ppd' => 3,  'rsw' => 5,  'pp' => 4,  'breath weapon' => 4,  'spell' => 6 };
  }

  if ($class eq 'rogue') {
    $saving_throws{$_} = { 'ppd' => 13, 'rsw' => 14, 'pp' => 12, 'breath weapon' => 16, 'spell' => 15 } for 1..4;
    $saving_throws{$_} = { 'ppd' => 12, 'rsw' => 12, 'pp' => 11, 'breath weapon' => 15, 'spell' => 13 } for 5..8;
    $saving_throws{$_} = { 'ppd' => 11, 'rsw' => 10, 'pp' => 10, 'breath weapon' => 14, 'spell' => 11 } for 9..12;
    $saving_throws{$_} = { 'ppd' => 10, 'rsw' => 8,  'pp' => 9,  'breath weapon' => 13, 'spell' => 9 }  for 13..16;
    $saving_throws{17} = { 'ppd' => 9,  'rsw' => 6,  'pp' => 8,  'breath weapon' => 12, 'spell' => 7 };
  }

  if ($class eq 'priest') {
    $saving_throws{$_} = { 'ppd' => 10, 'rsw' => 14, 'pp' => 13, 'breath weapon' => 16, 'spell' => 15 } for 1..3;
    $saving_throws{$_} = { 'ppd' => 9,  'rsw' => 13, 'pp' => 12, 'breath weapon' => 15, 'spell' => 14 } for 4..6;
    $saving_throws{$_} = { 'ppd' => 7,  'rsw' => 11, 'pp' => 10, 'breath weapon' => 13, 'spell' => 12 } for 7..9;
    $saving_throws{$_} = { 'ppd' => 6,  'rsw' => 10, 'pp' => 9,  'breath weapon' => 12, 'spell' => 11 } for 10..12;
    $saving_throws{$_} = { 'ppd' => 5,  'rsw' => 9,  'pp' => 8,  'breath weapon' => 11, 'spell' => 10 } for 13..15;
    $saving_throws{$_} = { 'ppd' => 4,  'rsw' => 8,  'pp' => 7,  'breath weapon' => 10, 'spell' => 9 }  for 16..18;
    $saving_throws{19} = { 'ppd' => 2,  'rsw' => 6,  'pp' => 5,  'breath weapon' => 8,  'spell' => 7 };
  }

  if ($class eq 'wizard') {
    $saving_throws{$_} = { 'ppd' => 14, 'rsw' => 11, 'pp' => 13, 'breath weapon' => 15, 'spell' => 12 } for 1..5;
    $saving_throws{$_} = { 'ppd' => 13, 'rsw' => 9,  'pp' => 11, 'breath weapon' => 13, 'spell' => 10 } for 6..10;
    $saving_throws{$_} = { 'ppd' => 11, 'rsw' => 7,  'pp' => 9,  'breath weapon' => 11, 'spell' => 8 }  for 11..15;
    $saving_throws{16} = { 'ppd' => 10, 'rsw' => 5,  'pp' => 7,  'breath weapon' => 9,  'spell' => 4 };
  }

  if ($class eq 'psionisist') {
    $saving_throws{$_} = { 'ppd' => 13, 'rsw' => 15, 'pp' => 10, 'breath weapon' => 16, 'spell' => 15 } for 1..4;
    $saving_throws{$_} = { 'ppd' => 12, 'rsw' => 13, 'pp' => 9,  'breath weapon' => 15, 'spell' => 14 } for 5..8;
    $saving_throws{$_} = { 'ppd' => 11, 'rsw' => 11, 'pp' => 8,  'breath weapon' => 13, 'spell' => 12 } for 9..12;
    $saving_throws{$_} = { 'ppd' => 10, 'rsw' => 9,  'pp' => 7,  'breath weapon' => 12, 'spell' => 11 } for 13..16;
    $saving_throws{17} = { 'ppd' => 9,  'rsw' => 7,  'pp' => 6,  'breath weapon' => 11, 'spell' => 9 };
  }

  if ($class eq 'chaos warden') {
    $saving_throws{$_} = { 'ppd' => 13, 'rsw' => 14, 'pp' => 13, 'breath weapon' => 16, 'spell' => 15 } for 1..4;
    $saving_throws{$_} = { 'ppd' => 12, 'rsw' => 12, 'pp' => 12, 'breath weapon' => 15, 'spell' => 14 } for 5..8;
    $saving_throws{$_} = { 'ppd' => 11, 'rsw' => 10, 'pp' => 10, 'breath weapon' => 13, 'spell' => 12 } for 9..12;
    $saving_throws{$_} = { 'ppd' => 10, 'rsw' => 8,  'pp' => 9,  'breath weapon' => 12, 'spell' => 11 } for 13..16;
    $saving_throws{17} = { 'ppd' => 9,  'rsw' => 6,  'pp' => 7,  'breath weapon' => 10, 'spell' => 9 };
  }

  if ($class eq 'theopsyelementalist') {
    $saving_throws{$_} = { 'ppd' => 14, 'rsw' => 11, 'pp' => 13, 'breath weapon' => 15, 'spell' => 12 } for 1..4;
    $saving_throws{$_} = { 'ppd' => 13, 'rsw' => 9,  'pp' => 11, 'breath weapon' => 13, 'spell' => 10 } for 5..8;
    $saving_throws{$_} = { 'ppd' => 11, 'rsw' => 7,  'pp' => 9,  'breath weapon' => 11, 'spell' => 8 }  for 9..12;
    $saving_throws{$_} = { 'ppd' => 10, 'rsw' => 5,  'pp' => 7,  'breath weapon' => 9,  'spell' => 4 }  for 13..16;
    $saving_throws{17} = { 'ppd' => 8,  'rsw' => 3,  'pp' => 5,  'breath weapon' => 7,  'spell' => 2 };
  }
  
  my $saves;
  my $modifiers = $opt->{'modifiers'} ? ST_modifier($opt->{'modifiers'}) : 0;
  if (ref($class) eq 'ARRAY') {
    my $class_saving_throws;
    $$class_saving_throws{$_} = get_saving_throws($_, { 'experience' => $opt->{'experience'} }) for (@{$class});
    
    for my $save ('ppd','rsw','pp','breath weapon','spell') {
      $$saves{$save} = min(map $_->{$save}, values %{ $class_saving_throws }) - $modifiers; # Thank you yitzchak!
    }
  }
  else {
    my $max_level = max(keys %saving_throws);
    my $level = $opt->{'level'} && $opt->{'level'} <= $max_level ? $opt->{'level'} :
                get_level($class,$opt->{'experience'}) <= $max_level ? get_level($class, $opt->{'experience'}) : $max_level;
    $saves = $saving_throws{$level};
  }

  return $saves;
}

sub saving_throw_table_rows {
  my %opt = @_;
  my $modifiers = $opt{'modifiers'};

  my $saving_throws = get_saving_throws($opt{'classes'}, { 'experience' => $opt{'experience'}, 'modifiers' => $modifiers });
  my @data_rows;
  for my $throw ('ppd','rsw','pp','breath weapon','spell') {
    my $value = $saving_throws->{$throw};
    my $pthrow = $throw =~ /(?:ppd|rsw|pp)/i ? uc $throw : $throw;
    push @data_rows, [$pthrow,$value];
  }
  
  my @rows = (
    [ 'header', ['Save', 'Throw'] ],
    [ 'whead', \@data_rows ]
  );
  if (scalar @$modifiers > 0) {
    push @rows, [ 'header', [['Modifiers', { 'colspan' => 2}]]];
    push @rows, [ 'data', [[[ 'list', { 'class' => "info", 'colspan' => 2, 'list' => ['u', $modifiers] }]]] ];
  }
  
  return \@rows;
}

1;
