package RolePlaying::Random::Monster;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_monster random_monster_list);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use Util::MapinMap qw(map_in_map);

use Lingua::EN::Inflect qw(PL_N);
use List::Util qw(shuffle);

my @elements = qw(air earth fire water);
my @paraelements = qw(ice magma ooze smoke);
my @quasielements = qw(ash dust lightning mineral mist radiant steam);
my @energy = map( "$_ energy", qw(positive negative));
my @all_elements = (@elements,@paraelements,@quasielements);

my %submonsters;
$submonsters{'amorphous monster'} = {
  'jelly monster'        => [map( "$_ jelly", qw(mustard stun ochre) )],
  'ooze monster'         => [map( "$_ ooze",  ('gray','crystal') )],
  'deadly pudding'       => [map( "$_ deadly pudding", qw(black white brown dun) )],
  'subterranean pudding' => [map( "$_ subterranean pudding", qw(dence gray stone) )],
  'slime monster'        => [map( "$_ slime", ('olive','green') ),'olive slime creature'],
  'mist monster'         => [map( "$_ mist",  ('crimson death','scarlet dancer','vampiric') )],
  'amorphous monster'    => ['gelatinous cube','slithering tracker','will o\'wisp']
};

$submonsters{'beholder'} = {
  'beholder-kin'         => [map( "$_ beholder-kin", ('death kiss','eye of the deep','gauth','spectator','hive mother'))],
  'beholder abomination' => [map( "$_ beholder abomination" ,qw(astereater director examiner lensman overseer watcher))],
  'undead beholder'      => ['undead beholder', map( "$_, undead beholder", ('doomsphere','kasharin') )],
  'beholder mage'        => ['beholder mage', map( "$_ beholder", ('elder orb','orbus','gorbel') )],
  'beholder'             => ['beholder']
};

$submonsters{'centaur'} = {
  'centaur-kin' => [map( "$_ centaur-kin", qw(dorvesh gnoat ha'pony zebranaur) )],
  'centaur'     => ['centaur','dracotaur','manotaur','pegataur']
};

my $lsc = 'life shaped creation';
$submonsters{'construct'} = {
  'automaton' => ['automaton','scalander', map( "$_, Trioband automaton", qw(farragan silversan thanatar) )],
  'gargoyle'  => ['gargoyle','margoyle',
    map( "$_ gargoyle", (qw(any archer spouter),'grandfather plaque','stone lion','stone wolf') )],
  'life shaped creation' => ['life shaped creation',
    map( "$_, guarding $lsc",  ('climb dog','darkstrike','protector','sheildbug','watcher')),
    map( "$_, transport $lsc", ('ber-etherin','dhev-sahr','gun-evauth','yihn-eflan'))
  ],
  'clockwork horror'    => ['clockwork horror',    map( "$_ clockwork horror",     qw(copper silver electrum gold platinum adamantite) )],
  'lesser golem'        => ['lesser golem',        map( "$_ lesser golem",         qw(clay flesh) )],
  'greater golem'       => ['greater golem',       map( "$_ greater golem",        qw(iron stone) )],
  'gemstone golem'      => ['gemstone golem',      map( "$_ gemstone golem",       qw(diamond emerald ruby) )],
  'stone variant golem' => ['stone variant golem', map( "$_ stone variant golem", (qw(caryatid juggernaut),'stone guardian'))],
  'golem' => ['golem',
    'burning man','carrionette','helmed horror','metagolem','phantom flyer','clockwork swordsman',
    map( "$_ golem", qw(bone brain doll gargoyle glass hammer magic necrophidius salt scarecrow shaboath spiderstone) )
  ]
};

$submonsters{'dragon'} = {
  'chromatic dragon' => [map( "$_ dragon", qw(black blue green red white) )],
  'gemstone dragon'  => [map( "$_ dragon", qw(amethyst crystal emerald sapphire topaz) )],
  'metallic dragon'  => [map( "$_ dragon", qw(brass bronze copper gold silver) )],
  'neutral dragon'   => [map( "$_ neutral dragon", qw(amber jacinth jade pearl moonstone) )],
  'ferrous dragon'   => [map( "$_ ferrous dragon", qw(iron nickel tungsten cobalt chromium) )],
  'linnorm dragon'   => [map( "$_ linnorm dragon", qw(dread flame forest frost gray land midgard rain sea) ), 'corpse tearer'],
  'dragonet'         => ['faerie dragon','firedrake','pseudodragon','rainbow dragonette'],
  'dragon-kin'       => [qw(dracotaur dracolisk dragon-kin half-dragon weredragon sea-wyrm chimera dragonne gorynych salamander scalamagdrion wyvern),'albino wyrm'],
  'undead dragon'    => ['dracolich','ghost dragon'],
  'Thessalamonster'  => [map("$_, Thessalamonster",qw(Thessalhydra Thessalmerro Thessalgorgen Thessaltrice))],
  'elemental drake'  => [map( "elemental $_ drake", (@elements,@paraelements) )],
  'hydra'            => [qw(hydra pyrohydra cryohydra gulgutghhydra), 'lemaean hydra'],
  'dragon'           => ['dragon', map( "$_ dragon", qw(brine brown Cerillian cloud deep electrum fang mercury mist radiant shadow spider steel yellow prismatic) )]
};

$submonsters{'faerie'} = {
  'brownie' => [qw(brownie dobie killmoulis quickling)],
  'nymph' => [
    map { ref $_ ? [ map "$_ nymph", @$_ ] : "$_ nymph" } ( #the map inside a map came from j_wright in #perlcafe.
      'grain','unseelie',
      ( map "$_ petty", qw(bramble gorse squeaker stinger) )
    ),
  ],
  'sprite' => ['sprite', map( "$_ sprite",qw(atomie grig nixie pixie sea) )],
  'faerie' => [map( "$_ faerie", qw(seelie unseelie) ),'dryad','leprechaun','satyr']
};

my $tralg    = [ map( "$_ tralg",    qw(arctic desert two-headed) )]; # Tralgs are giant/troll hybrids.
my $twarg    = [ map( "$_ twarg",    qw(hill jungle mountain) )];     # Twargs are giant/dwarf hybrids.
my $throglin = [ map( "$_ throglin", qw(freshwater saltwater) )];     # Throglins are hobgoblin/troll hybrids.

$submonsters{'giant'} = {
  'giant' => [
    'giant',
    ( map( "$_ giant", qw(cloud crag desert fire fog fomorian frost hill jungle mountain reef stone storm swamp wood) ) ),
    ( qw(cyclops ettin fhoimorien firbolg verbeeg titan) ),
    @$tralg, @$twarg
  ],
  'ogre' => [qw(ogre merrow ogrillion),'ogre mage','neo orog']
};

# Trobolds are kobold/troll hybrids.
# Gobpries are goblin/harpy hybrids.
$submonsters{'goblinoid'} = {
  'gnoll'           => [qw(gnoll flind)],
  'hobgoblin'       => [qw(hobgoblin koalinth), @$throglin],
  'kobold'          => [qw(kobold urd trobold)],
  'orc'             => [qw(orc ondonti scro)],
  'ogre'            => [qw(ogre merrow),'ogre mage','ogrima'],
  'orc/ogre hybrid' => ['ogrillion', 'orog', map( "$_ neo orog", qw(black red) )],
  'troll'           => ['troll', map( "$_ troll", qw(desert freshwater giant ice saltwater snow spectral), 'two-headed'), 'trobold', @$tralg, @$throglin],
  'goblinoid'       => ['goblin','bugbear','mongrelman','gobpry']
};

# Deep gnarves are deep dwarf/rock gnome hybrids.
$submonsters{'humanoid'} = {
  'dwarf'    => ['dwarf',    map( "$_ dwarf",    qw(arctic deep duerger gully hill mountain urdunnir wild)), 'deep gnarve', @$twarg],
  'elf'      => ['elf',      map( "$_ elf",      qw(aquatic dark grey high rockseer sylvan winged) )],
  'gnome'    => ['gnome',    map( "$_ gnome",    qw(deep forest rock spriggin tinker)), 'deep gnarve'],
  'halfling' => ['halfling', map( "$_ halfling", qw(furchin hairfoot stout tallfellow) )]
};

$submonsters{'insectoid monster'}  = {
  'giant beetle' => [map("$_ beetle", qw(bombardier boring fire rhinoceros stag water deathwatch slicer stink))],
  'neogi'        => ['neogi', 'great old master neogi'],
  'insectoid monster' => [qw(ankheg manscorpion neogi rastipede thri-kreen xixchil)]
};

$submonsters{'planar creature'} = {
  'aasimon'  => ['aasimon',  map( "$_ aasimon",  qw(agathinon deva light planetar solar) ), 'aasimar'],
  'eledrin'  => ['eledrin',  map( "$_ eledrin",  qw(bralani coure firre ghaele noviere shiere tulani) )],
  'guadinal' => ['guadinal', map( "$_ guadinal", qw(avoral cervidal equinal leonal lupinal ursinal) )],
  'modron'   => ['modron',   map( "$_ modron",   qw(monodrone duodrone tridrone quadrone pentadrone decaton nonaton octon septon hexton quinton quarton tertian secundi primus) )],
  'rilmani'  => ['rilmani',  map( "$_ rilmani",  qw(rilmani abiorach argenach auramach cuprilach ferrumach plumach) )],
  'slaad'    => ['slaad',    map( "$_ slaad",    qw(red blue green gray death) )],
  'time'     => [map( "$_ time dimensional", qw(common noble royal) )],
  'baatezu' => [
    'baatezu',
    map_in_map({ 'after' => 'baatezu' }, [
      [map( "$_ least",    qw(lemure nupperibo spinagon) )],
      [
        map_in_map({ 'after' => 'lesser' },[
          [map( "$_ abishai", qw(black green red) )],
          qw(barbazu erinyes hamatula osyuth)
        ])
      ],
      [map( "$_ greater", (qw(amnizu cornugon gelugon logokron),'pit fiend') )]
    ])
  ],
  'elemental' => [
    'elemental',       map( "$_ elemental",       @elements ),
    'paraelemental',   map( "$_ paraelemental",   @paraelements ),
    'quasi-elemental', map( "$_ quasi-elemental", @quasielements ),
    'genasi', map( "$_ genasi", (@elements, @paraelements) ),
    'grue',   map( "$_ grue",   @all_elements ),
    'mephit', map( "$_ mephit", @all_elements ),
    map( "$_ swarm", ('elemental',@all_elements) ),
    'elemental-kin',   map("$_, elemental-kin",    qw(nereid pech salamander sylph) ),
    'elemental vermin',map("$_, elemental vermin", qw(crawler duster flameling spitter) ),
  ],
  'genie' => [
    'genie', 'jann',
    'dao',     'tasked minor dao',
    'djinni',   map( "tasked $_ djinni", qw(administrator deceiver messenger) ),
    'efreeti', 'tasked oathbinder efreeti',
    'marid',   'tasked administrator marid',
  ],
  "tanar'ri" => [
    "tanar'ri", 'tiefling',
    map_in_map({ 'after' => "tanar'ri" },[
      [map( "$_ least",    qw(dretch jovoc mane rutterkin) )],
      [map( "$_ lesser",   qw(alu-fiend armanite bar-lgura bulezau cambian colchiln incubus maurezhi succubis uridezu yochlol) )],
      [map( "$_ greater", (qw(babau chasme goristro nabassu palrethee wastrilith),'arrow demons') )],
      [map( "$_ true",     qw(alkilith balor glabrezu hezrou jarilith marilith myrmixicuse nalfeshnee vrock),'sorrowsworn demon' )],
      [map( "$_ guardian", qw(molydeus klurichir) )],
    ])
  ],
  'yugoloth' => [
    'yugoloth',
      map_in_map({ 'after' => 'yugoloth' },[
      [map( "$_ lesser",      qw(mezzoloth dergholoth piscoloth hydroloth yagnoloth marraenoloth) )],
      [map( "$_ greater",     qw(nycaloth arcanaloth ultroloth) )],
      [map( "$_ battleloth", (qw(arrow axe crossbow pick sword),'spiked chain') )],
      [map( "$_ guardian",    qw(least lesser greater) )],
      [qw(baernoloth canoloth echinoloth gacholoth skeroloth)]
    ])
  ],
  'planar creature' => ['imp','lillend']
};

$submonsters{'reptilian monster'} = {
  'basilisk'   => ['lesser basilisk','greater basilisk','dracolisk'],
  'cockatrice' => [qw(cockatrice pyrolisk)],
  'lizard man' => ['lizard man', 'lizard king'],
  'naga'       => ['naga',    map( "$_ naga",    qw(bone dark guardian spirit water) )],
  'snake'      => [map( "$_ snake", qw(messenger winged) )],
  'reptilian monster' => [qw(behir laerti muckdweller troglodyte yuan-ti)]
};

$submonsters{'undead'} = {
  'banshee'      => ['banshee','racked spirit'],
  'beholder'     => [qw(doomsphere kasharin), 'undead beholder'],
  'crypt thing'  => ['crypt thing', 'crypt servant', 'chosen one', 'coffer corpse', 'meorty', 'undead dwarf'],
  'death knight' => ['death knight', 'banedead', 'dread warrior', 'undead dragon slayer'],
  'geist'        => ['geist', 'greater geist'],
  'ghost'        => [qw(ghost casura dhaot ker), 'ghost dragon'],
  'ghoul'        => [qw(ghoul lacendon ghast)],
  'ghul'         => ['great ghul', 'soultaker ghul-kin', 'witherer ghul-kin'],
  'krag'         => [qw(krag kragling)],
  'lich'         => [qw(lich dracolich baelnorm kaisharga suel alhoon inquisitor), 'psionic lich', 'bane lich'],
  'mummy'        => ['mummy', 'crypt cat', 'large crypt cat', map( "$_ mummy", qw(bog greater animal monster) )],
  'shadow'       => [qw(shadow arch-shadow demi-shade)],
  'skeleton'     => [
    qw(skeleton baneguard bonebat dread), 'blazing bones', 'bone naga', 'flame skull',
    map( "$_ skeleton", qw(animal monster giant warrior obsidian) ),
    map( "$_ skeleton variant", qw(dust spike) )
  ],
  'spectre'      => ['spectre', 'spectral wizard'],
  'vampire'      => ['vampire', 'nosferatu', 'eastern vampire', 'cerebral vampire', 'vampiric wolf'],
  'wraith'       => ['wraith', 'shimmering wraith', 'wraith spider', 'Athasian wraith'],
  'zombie'       => [
    'zombie', 'zombie lord', 'dread wolf', 'zombie wolf', 'Amiq Rasol', 'Son of Kyuss',
    map( "$_ zombie", qw(monster ju-ju mud sea thinking) )
  ],
  'undead'       => [
    'arcane head', 'undead lakemonster',
    qw(crust ephemeral fael haunt hecuva kholidathra meorty phantom poltergeist raaig revenant tuyewara wight)
  ],
};

$submonsters{'underwater monster'} = {
  'aboleth'     => ['aboleth', map( "aboleth $_", qw(savant skum) )],
  'ixitxachitl' => [qw(ixitxachitl ixzan)],
  'underwater monster' => [qw(crabman hippocampus kuo-toa locathah sehaugin merman triton), 'dragon turtle']
};

my %monsters;
for my $submonster (keys %submonsters) {
  $monsters{$submonster}  = [map { @$_ } values %{$submonsters{$submonster}}];
}
$monsters{'grell'}              = ['grell',       map( "$_ grell", qw(worker philosopher patriarch) )];
$monsters{'hag'}                = ['hag',         map( "$_ hag", qw(annis green sea) ), 'bheur'];
$monsters{'lycanthrope'}        = ['lycanthrope', map( "were$_" , qw(badger bat bear boar crocodile dragon fox jackal jaguar leopard panther rat raven ray shark spider tiger wolf) ), 'seawolf','loop du noir','lythari','loup-garou'];
$monsters{'saurial'}            = ['saurial',     map( "$_ saurial", qw(bladeback finhead flyer hornhead) )];
$monsters{'sphinx'}             = ['sphinx',      map( "${_}sphinx", ('andro','crio','gyno','hieraco','draco') )];
$monsters{'gargantua'}          = [map( "$_ gargantua", qw(humanoid insectoid reptilian) )];
$monsters{'gith (special)'}     = [map( "$_  githyanki", ("'g'lathk","mlar","hr'a'cknir") ), 'githzerai'];
$monsters{'amphibian monster'}  = [qw(bullywug grippli)];
$monsters{'antherion'}          = [qw(jackalwere wolfwere)];
$monsters{'avian moster'}       = [qw(aarakocra couatl kenku)];
$monsters{'equine monster'}     = [qw(hippogriff nightmare pegasus unicorn), 'black unicorn'];
$monsters{'gremlin'}            = [qw(fremlin galltrit gremlin jermlaine mite snyad)];
$monsters{'harpy'}              = [qw(harpy gobpry)];
$monsters{'illithid'}           = ['mind flayer', 'psionic illithid', 'alhoon'];
$monsters{'medusa'}             = [qw(medusa maedar), 'greater medusa'];
$monsters{'spacefaring'}        = [qw(grommish hadozee hurwaeti)];
$monsters{'unsorted'}            = [
  qw(arcane cloaker doppleganger giff gith grimlock mimic minotaur),
  'broken one', 'galeb dur', 'hook horror','living wall'
];

sub random_monster {
  my ($user_monster, $user_submonster) = @_;
  
  my $monster;
  if ($user_submonster && $submonsters{$user_monster}) {
    my $monsters = $submonsters{$user_monster};
    $monster = random($monsters, $user_submonster);
  }
  else {
    $monster = random(\%monsters, $user_monster);
  }
  
  return $monster;
}

sub random_monster_list {
  my $monster_list = random_monster('keys');
  my @monsters = ( '<strong>Random monster:</strong> '.random_monster, map( "<strong>Random $_:</strong> ".random_monster($_), sort @$monster_list ) );
  return \@monsters;
}

1;
