package RolePlaying::CharacterBuilding::ArmorClass;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(armor_class_table_rows armor_class armor_class_modifier armor_list);

use List::Util qw(max);

# part of the Character Building table suite.

#start armor
#This section builds the different types of armor that could be worn by a character. The order is extremely important as each builds upon the last.

#This section builds the list of non-magical armor.
my %defense_modifiers = (
  'shield' => 1,
  'plate mail' => 7,
  'field plate armor' => 8,
  'full plate armor' => 9,
);
$defense_modifiers{$_} = 2 for ('large shield', 'leather armor', 'cord armor', 'padded armor');
$defense_modifiers{$_} = 3 for (map( "$_ armor", ('studded leather', 'light scale', 'wood', 'bone') ), 'ring mail');
$defense_modifiers{$_} = 4 for ('brigandine armor', 'scale mail', 'hide armor');
$defense_modifiers{$_} = 5 for ('chain mail', 'metal lamellar', 'elven chain mail');
$defense_modifiers{$_} = 6 for map( "$_ mail", ('splint', 'banded', 'bronze plate', 'improved'));

#This section adds the magical plusses to the armor.
for my $armor (keys %defense_modifiers) {
  map($defense_modifiers{"$armor +$_"} = $defense_modifiers{$armor} + $_,(1..5));
}

#This section adds other special abilities to the magical armor.
for my $magical_armor (keys %defense_modifiers) {
  if ($magical_armor =~ m/\+/) {
    map( $defense_modifiers{"$magical_armor of $_"} = $defense_modifiers{$magical_armor},
        (qw(blending comfort command coolness haste healing swimming), 'cure wounds', 'concealed wizardry', 'underwater action')
    );
  }
}

#end armor

#start magic items
#These are other items that confer a bonus to armor class which are not armor.

for my $item (qw(amulet bell belt blanket bracelet buckle cape cloak earring gem mask necklace ring robe scarab shell)) {
  map( $defense_modifiers{"$item of protection +$_"} = $_, (1..5) );
}

my @of_defense = reverse(0..9);
my @of_defense_modifiers = 1..10;
for my $item (qw(bracers choker cape earring)) {
  map( $defense_modifiers{"$item of defense, ac $of_defense[$_]"} = $of_defense_modifiers[$_], (0..9) );
}

$defense_modifiers{$_} = 2 for ('cloak of displacement', 'staff of power', 'helmet of brilliance', 'arm of valor', 'boots of speed');
$defense_modifiers{'robe of the archmagi'} = 5;

#end magic items

sub armor_list {
  return %defense_modifiers;
}

sub armor_class_modifier {
  my ($armor) = @_;
  
  my $armor_mod = 0;
  for my $armor (@{$armor}) {
    warn $armor." is not on the list." if !$defense_modifiers{lc $armor};
    $armor_mod += $defense_modifiers{lc $armor} ? $defense_modifiers{lc $armor} : 0;
  }

  return $armor_mod;
}

sub mental_armor_class {
  my ($intelligence, $wisdom) = @_;
  
  my $MAC = 10;
  my %MACmod;
  $MACmod{$_} = 0  for 1..15;
  $MACmod{$_} = -1 for 16..17;
  $MACmod{$_} = -2 for 18..19;
  $MACmod{$_} = -3 for 20..22;
  $MACmod{$_} = -4 for 23..25;
  for my $ability ($intelligence,$wisdom) {
    my @ability = split('/',$ability);
    pop @ability if scalar @ability == 3;
    my $max = max(@ability);
    $MAC += $MACmod{$max};
  }
  
  return $MAC;
}

sub armor_class {
  my ($defense_adjustment, $intelligence, $wisdom, $armor) = @_;

  my $base = 10 + $defense_adjustment;
  my $armor_mod = $armor ? armor_class_modifier($armor) : 0;
  my $MAC = mental_armor_class($intelligence, $wisdom);

  my %AC;
  $AC{'front'}  = { 'unarmored' => $base,     'armored' => $base - $armor_mod };
  $AC{'flank'}  = { 'unarmored' => $base + 1, 'armored' => $base + 1 - $armor_mod };
  $AC{'rear'}   = { 'unarmored' => $base + 2, 'armored' => $base + 2 - $armor_mod };
  $AC{'mental'} = { 'unarmored' => $MAC,      'armored' => $MAC };

  return {%AC};
}

sub armor_class_table_rows {
  my %opt = @_;
  my $armor = $opt{'armor'};

  my $AC = armor_class($opt{'defense adjustment'}, $opt{'intelligence'}, $opt{'wisdom'}, $armor);
  my @data_rows;
  for my $key (qw(front flank rear mental)) {
    my $value = $AC->{$key};
    push @data_rows, [ucfirst $key, $value->{'unarmored'}, $value->{'armored'}];
  }

  my @rows = (
    [ 'header', [['&nbsp;', map( ucfirst $_, qw(unarmored armored) )]] ],
    [ 'whead', \@data_rows],
  );
  if (scalar @$armor > 0) {
    push @rows, [ 'header', [[[ 'Armor', { 'colspan' => 3 } ]]] ];
    push @rows, [ 'data', [[[ 'list', { 'class' => 'info', 'colspan' => 3, 'list' => ['u', $armor] } ]]] ];
  }
  
  return \@rows;
}

1;
