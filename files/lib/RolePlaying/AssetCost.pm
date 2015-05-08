package RolePlaying::AssetCost;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(assets asset_data);

use Lingua::EN::Inflect qw(ORD);

use Base::Data qw(get_hash);

my $directory = 'Role_playing/Reference_tables';

my $assets = get_hash( 'file' => [$directory, 'equipment_costs.txt'] );

# Start additional items

for my $item ('basket', 'belt pouch', 'sack') {
  $assets->{"$item, small"} = 0.05;
  $assets->{"$item, large"} = 0.3;
}

for my $item ('skirt', 'pant') {
  $assets->{"$item set"} = 3;
  $assets->{"$item set, good cloth"} = 10;
}

for my $type ("a".."z") {
  $assets->{"poison, type $type"} = 100;
}

# Start armor

my %material_modifiers = get_hash( 'file' => [$directory, 'armor_materials.txt'] );

sub get_armor_value {
  my (%opt) = @_;
  my $base_value = $opt{'base'};
  my $value;
  $value = $opt{'material'} ? $base_value * $material_modifiers{$opt{'material'}} : $base_value;
  $value = $opt{'plus'} && $opt{'plus'} =~ /[1-4]/ ? $value + ($opt{'plus'} * 5000) : 
           $opt{'plus'} ? $value + 30000 : $value;
  return $value;
}

open(my $armor_file, '<', data_file($directory,'armor.txt')) || die "Can't open armor.txt. Stopped $!";
while (my $raw_armor = <$armor_file>) {
  chomp $raw_armor;
  my ($base_armor, $base_value) = split(/\|/, $raw_armor);
  $assets->{$base_armor}               = $base_value;
  $assets->{"$base_armor -1 (cursed)"} = 1000;
  $assets->{"$base_armor of blending"} = $base_value + 4000;

  if ($base_armor !~ /^(?:cord|leather|hide|padded) armor$/) {
    for my $material (keys %material_modifiers) {
      my $material_value = get_armor_value('base' => $base_value, 'material' => $material);
      $assets->{"$base_armor ($material)"} = $material_value;
      $assets->{"$base_armor -1 ($material cursed)"} = 1000;
      $assets->{"$base_armor of blending ($material)"} = $material_value + 4000;
    }
  }
  for my $plus (1..5) {
    my $magic_armor = "$base_armor +$plus";
    my $magic_value = get_armor_value('base' => $base_value, 'plus' => $plus);
    $assets->{$magic_armor} = $magic_value;
    $assets->{"$magic_armor of blending"} = $magic_value + 4000;

    if ($base_armor !~ /^(?:cord|leather|hide|padded) armor$/) {
      for my $material (keys %material_modifiers) {
        my $mm_value = get_armor_value('base' => $base_value, 'plus' => $plus, 'material' => $material);
        $assets->{"$magic_armor ($material)"} = $mm_value;
        $assets->{"$magic_armor of blending ($material)"} = $mm_value + 4000;
      }
    }
  }
}

# End armor

# Start weapons

sub add_vs {
  my ($weapon, $value) = @_;

  for my $vs_plus (1..5) {
    for my $vs_creature (
      'constructs', 'dragons', 'giants', 'lycanthropes', 'regenerating creatures', 'undead',
      'planar creatures', 'upper planar creatures', 'lower planar creatures', 'elemental creatures',
      'scaly creatures', 'furred creatures', 'snakes', 'spellcasters', 'psionics using creatures',
      'good creatures', 'evil creatures', 'lawful creatures', 'chaotic creatures', 'neutral creatures'
    ) {
      $assets->{"$weapon, +$vs_plus vs. $vs_creature"} = $value + ($vs_plus * 1000);
    }
  }
}

my %weapons = get_hash(
  'file' => [$directory,'Weapons.txt'],
  'headings' => ['Weapon','#AT','Dmg(S/M)','Dmg(L)','Range','Weight','Size','Type','Speed','KO','broad group','tight group','value']
);

for my $base_weapon (keys %weapons) {
  next if !$weapons{$base_weapon}{'value'};
  my $base_value = $weapons{$base_weapon}{'value'};
  $assets->{$base_weapon}                            = $base_value;
  $assets->{"$base_weapon -1 (cursed)"}              = 1000;
  $assets->{"$base_weapon of defending"}             = $base_value + 500;
  $assets->{"$base_weapon of disruption"}            = $base_value + 6000;
  $assets->{"$base_weapon of speed"}                 = $base_value + 4000;
  $assets->{"$base_weapon of vampiric regeneration"} = $base_value + 20000;

  if ($base_weapon =~ /^dagger/) {
    $assets->{"$base_weapon of venom"}      = $base_value + 3000;
  }
  if ($base_weapon =~ /^(?:dagger|knife|sword)/) {
    $assets->{"$base_weapon of dancing"}    = $base_value + 22000;
    $assets->{"$base_weapon of lightning"}  = $base_value + 900;
    $assets->{"$base_weapon of sharpness"}  = $base_value + 35000;
    $assets->{"$base_weapon of wounding"}   = $base_value + 22000;
    $assets->{"$base_weapon, Flame Blade"}  = $base_value + 9000;
    $assets->{"$base_weapon, Flame Tongue"} = $base_value + 4500;
    $assets->{"$base_weapon, Giant Slayer"} = $base_value + 4500;
    $assets->{"$base_weapon, Luck Blade"}   = $base_value + 9000;
    $assets->{"$base_weapon, Frost Brand"}  = $base_value + 4500;
    $assets->{"$base_weapon, Vorpal Blade"} = $base_value + 40000;
    $assets->{"$base_weapon, Sun Blade"}    = $base_value + 20000;
  }
  if ($base_weapon =~ /^(?:club|quarterstaff)/) {
    $assets->{"$base_weapon, ironwood"} = $base_value * 25;
  }
  
  my $staff_spear_cost = 5000;
  my $throwing_cost = 1250;
  for my $plus (1..5) {
    my $magic_weapon = "$base_weapon +$plus";
    my $magic_value = $plus =~ /(?:1|2)/ ? $base_value + 5000 : $plus =~ /(?:3|4)/ ? $base_value + 10000 : $base_value + 20000;
    $assets->{$magic_weapon}                            = $magic_value;
    add_vs($magic_weapon, $magic_value);
    $assets->{"$magic_weapon of defending"}             = $magic_value + 500;
    $assets->{"$magic_weapon of disruption"}            = $magic_value + 6000;
    $assets->{"$magic_weapon of lightning"}             = $magic_value + 900;
    $assets->{"$magic_weapon of speed"}                 = $magic_value + 4000;
    $assets->{"$magic_weapon of vampiric regeneration"} = $magic_value + 20000;

    $assets->{"staff-spear +$plus"} = $staff_spear_cost;
    $staff_spear_cost += 2500;

    if ($base_weapon eq 'dagger' || $base_weapon =~ /^sword, short/) {
      $assets->{"$magic_weapon of throwing"} = $magic_value + $throwing_cost;
      $throwing_cost += 500;
    }
    if ($base_weapon =~ /^(?:dagger|knife|sword)/) {
      $assets->{"$magic_weapon of sharpness"} = $magic_value + 35000;
      $assets->{"$magic_weapon, Luck Blade"}  = $magic_value + 9000;
      
      my $mod_cost = $base_value;
      if ($plus > 1) {
        $mod_cost += ($plus - 1) * 5000;
        $assets->{"$magic_weapon, Flame Blade"}  = $mod_cost + 9000;
        $assets->{"$magic_weapon, Flame Tongue"} = $mod_cost + 4500;
      }
      if ($plus > 2) {
        $mod_cost += ($plus - 2) * 5000;
        $assets->{"$magic_weapon, Sun Blade"}       = $mod_cost + 20000;
        $assets->{"$magic_weapon of life stealing"} = $mod_cost + 25000;
      }
      if ($plus > 3) {
        $mod_cost += ($plus - 3) * 5000;
        $assets->{"$magic_weapon, Frost Brand"}  = $mod_cost + 4500;
        $assets->{"$magic_weapon, Giant Slayer"} = $mod_cost + 4500;
        $assets->{"$magic_weapon, Vorpal Blade"} = $mod_cost + 40000;
      }
    }
    if ($base_weapon =~ /^(?:club|quarterstaff)/) {
      $assets->{"$magic_weapon, ironwood"} = ($base_value * 25) + ($magic_value - $base_value);
    }
  }
}

# Note: The following weapons have one-handed and two-handed varieties; the two-handed weapon is noted.
# harpoons; javelins; spears: normal, long and stone; tridents; swords: bastard and katana

# Start ammunition

sub add_ammo_of {
  my ($ammo, $value) = @_;

  $assets->{"$ammo of accuracy"}    = $value + 300;
  $assets->{"$ammo of fire"}        = $value + 240;
  $assets->{"$ammo of penetrating"} = $value + 300;
  $assets->{"$ammo of stunning"}    = $value + 750;
}

open(my $ammo_file, '<', data_file($directory,'ammunition.txt')) || die "Can't open ammunition.txt. Stopped $!";
while (my $raw_ammo = <$ammo_file>) {
  chomp $raw_ammo;
  my ($base_ammo, $base_value) = split(/\|/, $raw_ammo);
  $assets->{$base_ammo} = $base_value;
  $assets->{"$base_ammo -1 (cursed)"} = 1000;
  add_ammo_of($base_ammo, $base_value);
  
  for my $plus (1..5) {
    my $magic_ammo = "$base_ammo +$plus";
    my $magic_value = $plus =~ /(?:1|2)/ ? $base_value + 5000 : $plus =~ /(?:3|4)/ ? $base_value + 10000 : $base_value + 20000;
    $assets->{$magic_ammo} = $magic_value;
    add_ammo_of($magic_ammo, $magic_value);
    add_vs($magic_ammo, $magic_value);
  }
}

# End ammunition

# Start spelljamming rams

for my $damage_type ('blunt', 'grappling', 'piercing') {
  for my $plus (1..3) {
    for (my $weight = 10; $weight <= 70; $weight += 10) {
      my $ram_value;
      my $size;
      if ($weight >= 10 && $weight <= 40) {
        $size = 'small';
        $ram_value = $damage_type eq 'grappling' ? $weight * 2000 : $weight * 1000;
      }
      elsif ($weight > 40 && $weight <= 60) {
        $size = 'medium';
        $ram_value = $damage_type eq 'grappling' ? $weight * 4000 : $weight * 2000;
      }
      elsif ($weight > 60) {
        $size = 'large';
        $ram_value = $damage_type eq 'grappling' ? $weight * 8000 : $weight * 4000;
      }
      $assets->{"spelljamming ram +$plus, $size $damage_type ($weight tons)"} = $ram_value;
    }
  }
}

# End spelljamming rams

# End weapons

# Start magic items

for my $item (qw(amulet bell belt blanket bracelet buckle cape cloak earring gem mask necklace robe scarab shell stone)) {
  map( $assets->{"$item of protection +$_"} = $_ * 10000, (1..5) );
}

for my $number (1..100) {
  $assets->{"jewel of flawlessness, $number facets"} =  $number * 1000;
  $assets->{"amulet of magic resistance, $number%"}  = ($number * 1000) + 15000;
  $assets->{"ring of magic resistance, $number%"}    =  $number * 400;
}

my $defense_cost = 3000;
for my $defense (reverse (0..9)) {
  $assets->{"bracers of defense, ac $defense"} = $defense_cost;
  $assets->{"choker of defense, ac $defense"}  = $defense_cost;
  $defense_cost += 3000;
}

for my $dragon (
  'evil', 'white', 'black', 'green', 'blue', 'red',
  'good', 'copper', 'brass', 'bronze', 'silver', 'gold',
  'neutral', 'crystal', 'topaz', 'emerald', 'sapphire', 'amethyst',
  'brown', 'cloud', 'deep', 'mercury', 'mist', 'shadow', 'steel', 'yellow'
) {
  $assets->{"cloak of the dragon, $dragon"}      = 10000;
  $assets->{"potion of dragon breath, $dragon"}  = 1400;
  $assets->{"potion of dragon control, $dragon"} = 7000;
}

my $armor_cost  = 80000;
my $shield_cost = 12000;
my $plus = 1;
for my $dragon ('white', 'black', 'green', 'blue', 'red') {
  $assets->{"dragon scale armor, $dragon +$plus"}  = $armor_cost;
  $assets->{"dragon scale shield, $dragon +$plus"} = $shield_cost;
  $plus++;
  $armor_cost  += 5000;
  $shield_cost += 2000;
}

for my $element ('air', 'earth', 'fire', 'water') {
  $assets->{"oil of elemental invulnerability, $element"}     = 1000;
  $assets->{"ring of $element elemental command"}             = 25000;
  $assets->{"scroll of protection from elementals, $element"} = 4500;
  $assets->{"staff of the elements, $element"}                = 25000;
}

my $gauntlet_cost = 10000;
my $girdle_cost   = 15000;
my $potion_cost   = 800;
for my $giant ('ogre', 'hill', 'stone', 'frost', 'fire', 'cloud', 'storm', 'titan') {
  $assets->{"gauntlets of giant power, $giant"} = $gauntlet_cost;
  $assets->{"girdle of giant strength, $giant"} = $girdle_cost;
  $assets->{"potion of giant strength, $giant"} = $potion_cost;
  $gauntlet_cost += 2500;
  $girdle_cost   += 5000;
  $potion_cost   += 100;
}

for my $bag (1..5) {
  my $lb   = $bag * 50;
  my $cost = $bag * 5000;
  $assets->{"bag of holding, $lb lb"} = $cost;
}

my $c_x = 3;
my $c_y = 5;
for my $carpet (1..4) {
  my $cost = 12500 * $carpet;
  $assets->{"carpet of flying, $c_x'×$c_y"} = $cost;
  $c_x++;
  $c_y += $carpet == 4 ? 2 : 1;
}

for my $medallion (1..3) {
  my $range = 30 * $medallion;
  my $cost  = 10000 * $medallion;
  $assets->{"medallion of esp, $range' range"} = $cost;
  $assets->{"medallion of esp, $range' range with empathy"} = $cost + 5000;
}

my $wizardry_cost = 54000;
for my $raw_level (2..9) {
  my $level = ORD($raw_level);
  $assets->{"ring of wizardry 1st-$level lvl spells"} = $wizardry_cost;
  $wizardry_cost += 2000;
}

# End magic items

# End additional items

sub assets {
  return $assets
}

sub asset_data {
  my ($asset, $raw_value) = @_;

  my $lookup_asset = $asset;
     $lookup_asset =~ s/ \".+?\"//;
  my $amount;
  my $base_value;
  my $total_value;

  if ($raw_value =~ /\*/) {
    $total_value = eval($raw_value);
    ($amount, $base_value) = split(/\*/,$raw_value);
  }
  elsif ($raw_value =~ /\//) {
    $base_value = eval($raw_value);
    ($total_value, $amount) = split(/\//, $raw_value);
  }
  else {
    $amount = $raw_value;
    $base_value = $assets->{$lookup_asset} ? $assets->{$lookup_asset} : 0;
    $total_value = $amount * $base_value;
  }

  my $asset_data = {
    'asset'      => $asset,
    'amount'     => $amount      ? $amount      : 1,
    'base value' => $base_value  ? $base_value  : 0,
    'value'      => $total_value ? $total_value : 0
  };
  
  return $asset_data;
}

1;
