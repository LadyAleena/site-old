package RPG::WeaponName;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(display_weapon);

use Lingua::EN::Inflect qw(PL_N);

sub display_weapon {
  my ($text, $plural) = @_;
     $text =~ s/(.+) \((.+)\)/$2 $1/;

  my ($r_weapon, $accessory) = split(/ w\//,$text);
  
  my $weapon = join(' ',reverse(split(/, /,$r_weapon)));
     $weapon =~ s/\// or /;
     $weapon =~ s/ hammer// if $weapon =~ /(?:maul|warhammer) hammer/;
     $weapon =~ s/ sword//  if $weapon !~ /(?:bastard|broad|long|short|two-handed) sword/;
     $weapon = $plural =~ /^[pyt1]/ ? PL_N($weapon) : $weapon;
     
  my $full_weapon = $accessory ? "$weapon with $accessory" : $weapon;

  return lc $full_weapon;
}

1;
