package RolePlaying::Random::Misc;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(dice disorder divinity emotion group henchmen language_common non proficiency_type relationship sexual_orientation shadow sign);

use RolePlaying::Random qw(random);

my %misc = (
  'dice'               => [qw(1d4 1d6 1d8 1d10 1d12 1d20)],
  'disorder'           => [
    map( "${_}active",   qw(hypo hyper) ),
    map( "$_ psychosis", qw(hallucinatory delusional) ),
    'amnesia','anxiety','catatonia','dementia','fugue','manic','melancholy','obsessive-compulsive','panic','paranoia','schizophrenia','split personality'
  ],
  'divinity'           => [map("${_}power",('demi-','lesser ','intermediate ','greater '))],
  'emotion'            => [qw(joy sorrow trust fear love hate indifference)],
  'group'              => [qw(group band cabal tribe caravan army)],
  'henchmen'           => [qw(friends servants minions slaves)],
  'language common'    => [map("$_ common",qw(beholder dragon dwarven elven faerie giant gnome goblinoid halfling human planar))],
  'non'                => ['', 'non-'],
  'proficiency type'   => ['weapon','non-weapon proficiency','language'],
  'relationship'       => [qw(single dating attached engaged married divorced widowed)],
  'sexual orientation' => [qw(heterosexual heteroflexible bisexual homoflexible homosexual pansexual polysexual asexual)],
  'shadow'             => [qw(umbra penumbra antumbra)],
  'sign'               => [qw(+ -)],
  'zstuff'             => ['things','doohickeys','widgets','thingamabobs','stuff'],
);

sub dice               { random(\%misc, 'dice'              ) }
sub disorder           { random(\%misc, 'disorder'          ) }
sub divinity           { random(\%misc, 'divinity'          ) }
sub emotion            { random(\%misc, 'emotion'           ) }
sub group              { random(\%misc, 'group'             ) }
sub henchmen           { random(\%misc, 'heanchman'         ) }
sub language_common    { random(\%misc, 'language common'   ) }
sub non                { random(\%misc, 'non'               ) }
sub proficiency_type   { random(\%misc, 'proficiency type'  ) }
sub relationship       { random(\%misc, 'relationship'      ) }
sub sexual_orientation { random(\%misc, 'sexual orientation') }
sub shadow             { random(\%misc, 'shadow'            ) }
sub sign               { random(\%misc, 'sign'              ) }
sub zstuff             { random(\%misc, 'zstuff'            ) }

1;
