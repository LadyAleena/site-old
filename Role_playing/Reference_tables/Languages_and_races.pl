#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib "../../files/lib";
use Base::HTML qw(html story);
use Base::HTML::Element qw(list);

my %worlds = (
  'Abeir-Toril' => ['Anchorome', 'Faerûn', 'Kara-Tur', 'Maztica', 'Mulhorand', 'Unther', 'Zakhara'],
  'Athas'  => ['Dark Sun trader'],
  'Triador' => {
    'Nerus'   => '',
    'Renbar'  => [qw(Frazer Wavra Teril Hotri Oasa Damber)],
    'Peldeta' => {
      'Acremen' => [qw(Abrusian Acremar Satexi Teglar Vecily Yerethi Zilarban)],
      'Karshen' => [qw(Hopperate Jortanar Millera)],
      'Waratar' => [qw(Anichi Dapnoly Ylatian Zeptan)],
      'Frilynd' => '',
      'other'   => ['Dark centaur', 'Satexi dwarf', qw(Gobpry Zardan)]
    },
  },
  'general' => [qw(Oerth Earth Eberron Underdark Cerilia Krynn), 'Hollow World']
);

my @elements = qw(air earth fire water);
my @paraelements = qw(ice magma ooze smoke);
my @quasielements = qw(ash dust lightning mineral mist radiant steam);
my @all_elements = (@elements,@paraelements,@quasielements);

my %races = (
  'amphibian'    => [qw(bullywug grippli)],
  'beholder'     => {
    'beholder-kin'          => ['death kiss','eye of the deep','gauth','spectator','hive mother'],
    'beholder abominations' => [qw(astereater director examiner lensman overseer watcher)],
    'undead beholders'      => ['undead beholder','doomsphere','kasharin'],
    'general'               => ['beholder mage','elder orb','orbus','gorbel']
  },
  'centaur'     => {
    'centaur-kin' => [qw(dorvesh gnoat ha'pony zebranaur)],
    'dracotaur'   => '',
  },
  'dragon'      => {
    'chromatic'  => [map( "$_ dragon", qw(black blue green red white) )],
    'gemstone'   => [map( "$_ dragon", qw(amethyst crystal emerald sapphire topaz) )],
    'metallic'   => [map( "$_ dragon", qw(brass bronze copper gold silver) )],
    'neutral'    => [map( "$_ dragon", qw(amber jacinth jade pearl moonstone))],
    'ferrous'    => [map( "$_ dragon", qw(iron nickel tungsten cobalt chromium) )],
    'dragonet'   => ['faerie dragon', 'rainbow dragonette', qw(firedrake pseudodragon)],
    'dragon-kin' => ['dragon-kin', 'sea-wyrm', 'dracotaur', 'weredragon', 'albino wyrm', 'half-dragon', 'dragon turtle', qw(chimera dragonne gorynych salamander scalamagdrion wyvern)],
    'undead'     => ['dracolich', 'ghost dragon'],
    'Linnorm'    => [map( "$_ dragon", ('corpse tearer', qw(dread flame forest frost gray land midgard rain sea)) )],
    'Thessalamonster'  => [qw(Thessalhydra Thessalmerro Thessalgorgen Thessaltrice)],
    'elemental drakes' => [map( "elemental $_ drake", (@elements,@paraelements) )],
    'hydra'      => [qw(pyrohydra cryohydra gulgutghhydra), 'lemaean hydra'],
    'basilisk'   => ['lesser basilisk','greater basilisk','dracolisk'],
    'general'    => [map( "$_ dragon", qw(brine brown cloud deep electrum fang mercury mist shadow steel yellow prismatic) )]
  },
  'faerie'      => {
    'brownie' => [qw(dobie killmoulis quickling)],
    'nymph'   => {
      'petty'   => [qw(bramble gorse squeaker stinger)],
      'sprite'  => [qw(atomie grig nixie pixie),'sea sprite','seelie faerie','unseelie faerie'],
      'general' => [qw(unseelie grain)]
    },
    'general' => [qw(dryad leprechaun satyr)]
  },
  'gith (special)' => {
    'githyanki' => ['g\'lathk','mlar','hr\'a\'cknir'],
    'githzerai' => '',
  },
  'grell'       => [qw(worker philosopher patriarch)],
  'gremlin'     => [qw(fremlin galltrit gremlin jermlaine mite snyad)],
  'hag'         => [qw(annis green sea)],
  'harpy'       => ['gobpry'],
  'insectoids'  => [qw(ankheg neogi rastipede thri-kreen xixchil)],
  'planar creatures' => {
    'aasimon'    => [qw(agathinon deva light planetar solar)],
    'baatezu'    => {
      'greater'    => [qw(amnizu cornugon gelugon logokron),'pit fiend'],
      'lesser'     => {
        'abishai'  => [qw(black green red)],
        'general'  => [qw(barbazu erinyes hamatula osyuth)]
      },
      'least'      => [qw(lemure nupperibo spinagon)]
    },
    'eledrin'    => [qw(bralani coure firre ghaele noviere shiere tulani)],
    'elementals' => {
      'elemental'        => [ map( "$_ elemental", @elements )],
      'paraelemental'    => [ map( "$_ elemental", @paraelements )],
      'quasi-elemental'  => [ map( "$_ elemental", @quasielements )],
      'elemental-kin'    => [qw(nereid pech salamander sylph)],
      'elemental vermin' => [qw(crawler duster flameling spitter)],
      'elemental swarm'  => [ map( "elemental $_ swarm", @all_elements )],
      'elemental drake'  => [ map( "elemental $_ drake", (@elements,@paraelements) )],
      'grue'             => [ map( "$_ grue",   @all_elements )],
      'mephit'           => [ map( "$_ mephit", @all_elements )],
    },
    'genie'      => {
      'dao'        => ['tasked minor'],
      'djinni'     => {
        'tasked'   => [qw(administrator deceiver messenger)],
      },
      'efreeti'    => ['tasked oathbinder'],
      'jann'       => '',
      'marid'      => ['tasked administrator'],
    },
    'guadinal'   => [qw(avoral cervidal equinal leonal lupinal ursinal)],
    'imp'        => '',
    'modron'     => [qw(monodrone duodrone tridrone quadrone pentadrone decaton nonaton octon septon hexton quinton quarton tertian secundi primus)],
    'rilmani'    => [qw(abiorach argenach auramach cuprilach ferrumach plumach)],
    'slaad'      => [qw(red blue green gray death)],
    'tanar\'ri'  => {
      'least'      => [qw(dretch jovoc mane rutterkin)],
      'lesser'     => [qw(alu-fiend armanite bar-lgura bulezau cambian colchiln incubus maurezhi succubis uridezu yochlol)],
      'greater'    => [qw(babau chasme goristroi nabassu palrethee wastrilith),'arrow demons'],
      'true'       => [qw(alkilith balor glabrezu hezrou jarilith marilith myrmixicuse nalfeshnee vrock),'sorrowsworn demon'],
      'guardian'   => [qw(molydeus klurichir)],
      'general'    => ['dratch']
    },
    'yugoloth'   => {
      'lesser'     => [qw(mezzoloth dergholoth piscoloth hydroloth yagnoloth marraenoloth)],
      'greater'    => [qw(nycaloth arcanaloth ultroloth)],
      'battleloth' => [qw(arrow axe crossbow pick sword),'spiked chain'],
      'guardian'   => [qw(least lesser greater)],
      'general'    => [qw(baernoloth canoloth echinoloth gacholoth skeroloth messoloth)]
    },
  },
  'scaly' => {
    'lizard man' => ['zarden','Zilarben','Abrusian','lizard king'],
    'naga'       => [qw(dark guardian spirit water)],
    'general'    => [qw(behir laerti muckdweller troglodyte), 'yuan-ti']
  },
  'saurial'     => [qw(bladeback finhead flyer hornhead)],
  'sphinx'      => [map("${_}sphinx",('andro','crio','gyno','hieraco','draco'))],
  'triton'      => ['eldent'],
  'underwater'  => {
    'aboleth' => [qw(savant skum)],
    'general' => [qw(crabman kuo-toa locathah sehaugin)],
  },
  'spacefaring' => [qw(grommish hadozee hurwaeti)],
  'general'     => [qw(aarakocra arcane cloaker couatl giff gith grimlock minotaur), 'galeb dur', 'hook horror', 'mind flayer']
);

my $tralg    = [ map( "$_ tralg",    qw(arctic desert two-headed) )]; # Tralgs are giant/troll hybrids.
my $twarg    = [ map( "$_ twarg",    qw(hill jungle mountain) )];     # Twargs are giant/dwarf hybrids.
my $throglin = [ map( "$_ throglin", qw(freshwater saltwater) )];     # Throglins are hobgoblin/troll hybrids.

# Orogs and neo orogs are ogre/orc hybrids.
my $orog_gen = [qw(orog ogrillion)];
my $neo_orog = [ map( "$_ neo orog", qw(black red) )];

# Ogres are both giants and goblinoids.
my $ogre = {
  'neo orog'  => $neo_orog,
  'general'   => [@$orog_gen, 'merrow', 'ogre mage', 'ogrima']
};

my $orc = {
  'neo orog'  => $neo_orog,
  'general'   => [@$orog_gen, 'ondonti', 'scro']
};

$races{'giant'} = {
  'tralg'   => $tralg,
  'twarg'   => $twarg,
  'ogre'    => $ogre,
  'general' => [
    map("$_ giant",qw(cloud crag desert fire fog fomorian frost hill jungle mountain reef stone storm swamp wood)),
    qw(cyclops ettin fhoimorien firbolg verbeeg titan)
  ]
};

$races{'goblinoid'} = {
  'gnoll'     => ['flind'],
  'goblin'    => ['gobpry'],
  'hobgoblin' => {
    'koalinth'  => '',
    'throglin'  => $throglin
  },
  'kobold'    => [qw(trobold urd)],
  'orc'       => $orc,
  'ogre'      => $ogre,
  'troll'     => {
    'tralg'     => $tralg,
    'throglin'  => $throglin,
    'general'   => [map("$_ troll",(qw(desert freshwater giant ice saltwater snow spectral), 'two-headed')), 'trobold']
  },
  'general'   => [qw(bugbear mongrelman)]
};
$races{'harpy'} = ['gobpry'];

$races{'humanoid'}{'dwarf'} = {
  'twarg'   => $twarg,
  'general' => [map("$_ dwarf", qw(arctic deep duerger gully hill mountain urdunnir wild)), 'deep gnarve', 'Satexi', 'dethek']
};
$races{'humanoid'}{'elf'} = {
  'aquatic' => ['eldent'],
  'dark'    => ['dark centaur'],
  'general' => [qw(Abrusian grey high rockseer sylvan winged espruar Lendorian)]
};
$races{'humanoid'}{'gnome'} = [map( "$_ gnome", qw(deep forrest rock spriggin tinker) ), 'deep gnarve', 'Strafeti'];
$races{'humanoid'}{'halfling'} = [qw(furchin hairfoot stout Strafeti tallfellow)];

sub get_races {
  my (%hash) = @_;
  my @races;
  if ($hash{'general'}) {
    $hash{$_} = '' for @{$hash{'general'}}
  }
  for my $race (sort { lc $a cmp lc $b } keys %hash) {
    if (ref($hash{$race}) eq 'HASH') {
      push @races, ["<a>$race</a>", { 'class' => 'closed', 'inlist' => ['u', get_races(%{$hash{$race}})] }];
    }
    elsif (ref($hash{$race}) eq 'ARRAY' && $race ne 'general') {
      my @subraces = sort @{$hash{$race}};
      push @races, ["<a>$race</a>", { 'class' => 'closed', 'inlist' => ['u', \@subraces] }];
    }
    else {
      push @races, $race if $race ne 'general';
    }
  }
  return \@races;
}

my $doc_magic = { 
  'races'  => sub { list(3,'u',get_races(%races),  { 'onclick' => 'list_onclick(event)' }) },
  'worlds' => sub { list(3,'u',get_races(%worlds), { 'onclick' => 'list_onclick(event)' }) }
};

html( code => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a list of languages and races for AD&amp;D. Constructs and undead are not races. They nor lycanthropes have their own specific languages. Like humans these races can have sub-dialects by a region. A hill dwarf from Krynn might not be able to understand a hill dwarf from Oerth. It is thought all elves descend from the same ancestors, so their languages across the worlds may not have changed much since they separated. Creatures like elementals may have a language which can not be spoken by anyone other than another elemental.
This is just a small sample of languages and races available. It will continue to be built over time.
2 Worlds
& worlds
2 Races
& races
