package Random::Misc;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_divinity random_emotion random_generation random_group random_henchmen random_language_common random_non random_parent
                    random_proficiency_type random_relationship random_sexual_orientation random_shadow random_sign random_zstuff);

use RolePlaying::Random qw(random);

my %misc = (
  'emotion'            => [qw(joy sorrow trust fear love hate indifference)],
  'game'               => [map("$_ game", ('board', 'card', 'role-playing', 'video'))],
  'generation'         => ['', 'grand', 'great-grand', 'ancestral '],
  'group'              => [qw(group band cabal tribe caravan army)],
  'non'                => ['', 'non-'],
  'parent'             => ['mother', 'father'],
  'relationship'       => [qw(single dating attached engaged married divorced widowed)],
  'sexual orientation' => [qw(heterosexual heteroflexible bisexual homoflexible homosexual pansexual polysexual asexual)],
  'shadow'             => [qw(umbra penumbra antumbra)],
  'sign'               => [qw(+ -)],
  'zstuff'             => ['things', 'doohickeys', 'widgets', 'thingamabobs', 'stuff'],

  'divinity'           => [map("${_}power",('demi-', 'lesser ', 'intermediate ', 'greater '))],
  'henchmen'           => [qw(friends servants minions slaves mercenaries)],
  'language common'    => [map("$_ common",qw(beholder dragon dwarven elven faerie giant gnome goblinoid halfling human planar))],
  'proficiency type'   => ['weapon', 'non-weapon proficiency', 'language'],
);

sub random_divinity           { random(\%misc, 'divinity'          , { 'caller' => (caller(0))[3] }) }
sub random_emotion            { random(\%misc, 'emotion'           , { 'caller' => (caller(0))[3] }) }
sub random_game               { random(\%misc, 'game'              , { 'caller' => (caller(0))[3] }) }
sub random_generation         { random(\%misc, 'generation'        , { 'caller' => (caller(0))[3] }) }
sub random_group              { random(\%misc, 'group'             , { 'caller' => (caller(0))[3] }) }
sub random_henchmen           { random(\%misc, 'henchmen'          , { 'caller' => (caller(0))[3] }) }
sub random_language_common    { random(\%misc, 'language common'   , { 'caller' => (caller(0))[3] }) }
sub random_non                { random(\%misc, 'non'               , { 'caller' => (caller(0))[3] }) }
sub random_parent             { random(\%misc, 'parent'            , { 'caller' => (caller(0))[3] }) }
sub random_proficiency_type   { random(\%misc, 'proficiency type'  , { 'caller' => (caller(0))[3] }) }
sub random_relationship       { random(\%misc, 'relationship'      , { 'caller' => (caller(0))[3] }) }
sub random_sexual_orientation { random(\%misc, 'sexual orientation', { 'caller' => (caller(0))[3] }) }
sub random_shadow             { random(\%misc, 'shadow'            , { 'caller' => (caller(0))[3] }) }
sub random_sign               { random(\%misc, 'sign'              , { 'caller' => (caller(0))[3] }) }
sub random_zstuff             { random(\%misc, 'zstuff'            , { 'caller' => (caller(0))[3] }) }


1;
