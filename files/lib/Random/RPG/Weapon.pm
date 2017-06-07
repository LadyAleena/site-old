package Random::RPG::Weapon;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_weapon random_weapons random_magic_weapon random_weapon_damage);

use Games::Dice qw(roll);
use Lingua::EN::Inflect qw(PL_N);
use String::Util qw(collapse);

use Util::Data   qw(make_hash);
use Fancy::Rand  qw(fancy_rand tiny_rand);
use Random::Misc qw(random_non);
use RolePlaying::WeaponName qw(display_weapon);

my $weapons = make_hash(
  file => ['Role_playing/Reference_tables', 'Weapons.txt'],
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
  'weapon'      => [map(display_weapon($_, 'plural'), keys %$weapons)],
);

sub random_weapon {
  my @weapon_list = (map(display_weapon($_, 'singular'), keys %$weapons));
  my $weapon = tiny_rand(@weapon_list);
}

sub random_weapons {
  my ($user_weapons, $user_additions) = @_;
  my $weapon = fancy_rand(\%weapon_groups, $user_weapons, { caller => 'random_weapons', additions => $user_additions ? $user_additions : undef });
  return $weapon;
}

sub random_magic {
  my @magics = ('', random_non.'magical');
  my $magic  = tiny_rand(@magics);
  return $magic;
}

sub random_magic_weapon {
  my $magic   = random_magic();
  my $weapons = "$magic ".random_weapons('all', ['weapons']);
     $weapons = $weapons =~ /magic/ ? $weapons : "all $weapons";
  return collapse($weapons);
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
      'only '.random_non.'magical'
      )
    )
  );
  return tiny_rand(@damage);
}

=head1 NAME

B<Random::RPG::Weapon> selects random weapons from I<Advanced Dungeons & Dragons, Second Edition>.

=head1 SYNOPSIS

  use Random::RPG::Weapon qw(random_weapon random_weapons random_magic_weapon random_weapon_damage);

=head1 AUTHOR

Lady Aleena

=cut

1;
