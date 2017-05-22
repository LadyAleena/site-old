package RolePlaying::Random::SpecialAttack;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_attack random_special_attack);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random tinyrand);
use RolePlaying::Random::Misc qw(random_dice);
use RolePlaying::Random::Time qw(random_frequency);
use Fancy::Join::Defined;

my %special_attacks = (
  'gaze' => [qw(paralysis stone stun death)],
  'part' => [qw(acid cold electricity fire)],
  'range part' => [qw(gas sonic)],
  'touch part' => ['poison','energy drain'],
  'touch special' => [qw(befouls purifies), glob q({creates,destroys}\ {,un}holy\ water)],
  'vocal' => [qw(deafen fear terror flight)],
);
$special_attacks{$_} = [@{$special_attacks{'part'}}, @{$special_attacks{"$_ part"}}] for ('range','touch');

sub random_attack {
  my ($user_special_attack) = @_;
  my $special_attack = random(\%special_attacks, $user_special_attack);
  return $special_attack;
}

sub random_special_attack {
  my @attacks = qw(range gaze touch vocal);
  my $rand_attack = $attacks[rand @attacks];
  my $attack = $rand_attack ne 'range' ? "$rand_attack attack" : 'breath weapon';

  my $effect = random_attack($rand_attack);
  my $damage = $rand_attack =~ /(range|touch)/ ? 'for '.random_dice.' damage' : undef;
  my $freqency = random_frequency;

  return "$attack - ".join_defined(' ', ($effect, $damage, $freqency));
}

1;
