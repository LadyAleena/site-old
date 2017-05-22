package RolePlaying::Random::Misc;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_alpha random_dice random_disorder random_divinity random_emotion random_generation random_group random_henchmen
                    random_language_common random_non random_parent random_proficiency_type random_relationship random_sexual_orientation
                    random_shadow random_sign random_Greek_letter);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);

my %misc = (
  'alpha'              => ['A'..'Z'],
  'dice'               => [qw(1d4 1d6 1d8 1d10 1d12 1d20)],
  'disorder'           => [
    map( "${_}active",   qw(hypo hyper) ),
    map( "$_ psychosis", qw(hallucinatory delusional) ),
    'amnesia','anxiety','catatonia','dementia','fugue','manic','melancholy','obsessive-compulsive','panic','paranoia','schizophrenia','split personality'
  ],
  'divinity'           => [map("${_}power",('demi-','lesser ','intermediate ','greater '))],
  'emotion'            => [qw(joy sorrow trust fear love hate indifference)],
  'generation'         => ['', 'grand', 'great-grand', 'ancestral '],
  'group'              => [qw(group band cabal tribe caravan army)],
  'henchmen'           => [qw(friends servants minions slaves)],
  'language common'    => [map("$_ common",qw(beholder dragon dwarven elven faerie giant gnome goblinoid halfling human planar))],
  'non'                => ['', 'non-'],
  'parent'             => ['mother', 'father'],
  'proficiency type'   => ['weapon','non-weapon proficiency','language'],
  'relationship'       => [qw(single dating attached engaged married divorced widowed)],
  'sexual orientation' => [qw(heterosexual heteroflexible bisexual homoflexible homosexual pansexual polysexual asexual)],
  'shadow'             => [qw(umbra penumbra antumbra)],
  'sign'               => [qw(+ -)],
  'zstuff'             => ['things','doohickeys','widgets','thingamabobs','stuff'],
  'Greek letter'       => [qw(Alpha Beta Gamma Delta Epsilon Digamma Zeta Eta Theta Iota Kappa Lambda Mu Nu Xi Omicron Pi San Qoppa Rho Sigma Tau Upsilon Phi Chi Psi Omega Sampi)],
);

sub random_alpha              { random(\%misc, 'alpha'             ) }
sub random_dice               { random(\%misc, 'dice'              ) }
sub random_disorder           { random(\%misc, 'disorder'          ) }
sub random_divinity           { random(\%misc, 'divinity'          ) }
sub random_emotion            { random(\%misc, 'emotion'           ) }
sub random_generation         { random(\%misc, 'generation'        ) }
sub random_group              { random(\%misc, 'group'             ) }
sub random_henchmen           { random(\%misc, 'heanchman'         ) }
sub random_language_common    { random(\%misc, 'language common'   ) }
sub random_non                { random(\%misc, 'non'               ) }
sub random_parent             { random(\%misc, 'parent'            ) }
sub random_proficiency_type   { random(\%misc, 'proficiency type'  ) }
sub random_relationship       { random(\%misc, 'relationship'      ) }
sub random_sexual_orientation { random(\%misc, 'sexual orientation') }
sub random_shadow             { random(\%misc, 'shadow'            ) }
sub random_sign               { random(\%misc, 'sign'              ) }
sub random_zstuff             { random(\%misc, 'zstuff'            ) }
sub random_Greek_letter       { random(\%misc, 'Greek letter'      ) }

1;
