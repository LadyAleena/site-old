package RolePlaying::Random::Weapon;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_weapons random_magic_weapon random_weapon_damage);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use RolePlaying::Random::Misc qw(non);
use Base::Data qw(get_hash);

use Games::Dice qw(roll);
use Lingua::EN::Inflect qw(PL_N);

sub display_weapon {
  my ($text) = @_;
     $text =~ s/(.+) \((.+)\)/$2 $1/;

  my ($r_weapon, $accessory) = split(/ w\//,$text);
  
  my $weapon = join(' ',reverse(split(/, /,$r_weapon)));
     $weapon =~ s/\// or /;
     $weapon =~ s/ Hammer// if $weapon =~ /(?:Maul|Warhammer) Hammer/;
     $weapon =~ s/ Sword//  if $weapon !~ /(?:Bastard|Broad|Long|Short|Two-handed) Sword/;

  my $full_weapon = $accessory ? PL_N($weapon)." with $accessory" : PL_N($weapon);

  return lc $full_weapon;
}

my %weapons = get_hash(
  file => ['Role_playing/Reference_tables','Weapons.txt'],
  headings => ['Weapon','#AT','Dmg(S/M)','Dmg(L)','Range','Weight','Size','Type','Speed','KO','broad group','tight group'],
);

my %weapon_groups = (
  'broad group' => ['axes, hammers, and picks', 'bows', 'clubs, flails, and maces', 'firearms', 'javelins and spears', 'polearms', 'swords', 'unique weapons'],
  'tight group' => [qw(axes hammers picks bows crossbows clubs flails maces javelins lances spears glaives poleaxes staves),
                    map("$_ firearms",(qw(flintlock matchlock snaplock wheellock), 'hand match')),
                    map("$_ polarms",  qw(beaked billed spear-like)),
                    map("$_ swords",   qw(short medium large)),
                    map("$_ weapons", (qw(combined farm chain rope), 'aided missile', 'martial arts')),
                    'weapons of opportunity'
                   ],
  'material'    => [map("$_ weapons", qw(bone metal stone wooden))],
  'damage type' => [map("$_ weapons", qw(bludgeoning piercing slashing missile))],
  'weapons'     => [map(display_weapon($_),keys %weapons)],
);

sub random_weapons {
  my ($weapon_type) = @_;
  my $weapon = random(\%weapon_groups, $weapon_type);
  return $weapon;
}

sub random_magic {
  my @magics = ('',non.'magical');
  my $magic  = $magics[rand @magics];
  return $magic;
}

sub random_magic_weapon {
  my $magic   = random_magic;

  my @weapons = ("$magic ".random_weapons('all'), "all $magic weapons");
  my $weapon  = $weapons[rand @weapons];
     $weapon  =~ s/\s\s/ /g;
     $weapon  =~ s/^\s//;
  
  return $weapon;
}

sub random_weapon_damage {
  my @damage = (
    'immune to damage',
    map("takes $_ damage", (
      '1 hp per die',
      '½',
      '-1 hp per die',
      'maximum',
      '×'.roll('1d4+1'),
      'only '.random_magic
      )
    )
  );
  return $damage[rand @damage];
}

1;
