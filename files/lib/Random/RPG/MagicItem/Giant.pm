package Random::RPG::MagicItem::Giant;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_gauntlets random_girdle);

use Fancy::Rand qw(tiny_rand);
use Random::RPG::MagicItem qw(magic_item_enhancement magic_item_quirk);
my @giants = (
  { giant => 'ogre',  strength => '18(00)', xp  => { gauntlets => 1000 , girdle => 1500 } },
  { giant => 'hill',  strength => 19, xp => { gauntlets => 1250, girdle => 2000 } },
  { giant => 'stone', strength => 20, xp => { gauntlets => 1500, girdle => 2500 } },
  { giant => 'frost', strength => 21, xp => { gauntlets => 1750, girdle => 3000 } },
  { giant => 'fire',  strength => 22, xp => { gauntlets => 2000, girdle => 3500 } },
  { giant => 'cloud', strength => 23, xp => { gauntlets => 2250, girdle => 4000 } },
  { giant => 'storm', strength => 24, xp => { gauntlets => 2500, girdle => 4500 } },
  { giant => 'titan', strength => 25, xp => { gauntlets => 2750, girdle => 5000 } },
);

sub gp_value {
  my $xp = shift;
  my $gp = $xp * 10;
  return $gp;
}

sub random_giant_item {
  my $item_type = shift;
  my $rand_giant = tiny_rand(@giants);

  my $item;
  my $giant = ucfirst $rand_giant->{giant};
     $giant = $giant eq 'Ogre' ? $giant : "$giant Giant";

  $item->{item} = $item_type;
  $item->{giant} = $giant;
  $item->{strength} = $rand_giant->{strength};
  $item->{xp} = $rand_giant->{xp}{$item_type};
  $item->{gp} = gp_value($item->{xp});

  my $enhancement = magic_item_enhancement($item_type);

  if ($enhancement) {
    my $enh_quirk =  magic_item_quirk('enhancement');
    $item->{enhancement} = 'enhanced';
    $item->{enhancement} .= " with $enh_quirk quriks" if $enh_quirk;
  }

  return $item;
}

sub random_gauntlets {
  my $gauntlets = random_giant_item('gauntlets');

  my $giant = $gauntlets->{giant};
  my $item  = ucfirst $gauntlets->{item};

  $gauntlets->{'gauntlets'} = "$item of $giant Power";

  delete $gauntlets->{item};
  delete $gauntlets->{giant};

  return $gauntlets;
}

sub random_girdle {
  my $girdle = random_giant_item('girdle');

  my $giant = ucfirst $girdle->{giant};
  my $item  = ucfirst $girdle->{item};

  $girdle->{'girdle'} = "$item of $giant Strength";

  delete $girdle->{item};
  delete $girdle->{giant};

  return $girdle;
}

1;
