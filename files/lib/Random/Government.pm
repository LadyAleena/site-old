package Random::Government;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_government);

my %government = (
  adhocracy    => 'unstructured fashion; an unstructured organization',
  anemocracy   => 'wind or whim',
  aristarchy   => 'best',
  aristocracy  => 'nobility',
  arithmocracy => 'simple majority',
  barbarocracy => 'barbarians',
  bureaucracy  => 'civil servants',
  cannonarchy  => 'superior firepower or cannons',
  chirocracy   => 'physical force',
  albocracy    => 'white people',
  corpocracy   => 'corporate bureaucrats',
  cosmarchy    => 'rulership over the entire world, esp. the devil',
  cryptarchy   => 'secret rulership',
  despotocracy => 'despots or tyrants',
  endarchy     => 'centralised government',
  ergatocracy  => 'workers or working class',
  foolocracy   => 'fools',
  hamarchy     => 'cooperative body of parts',
  heroarchy    => 'heroes',
  hetaerocracy => 'paramours',
  hyperarchy   => 'excessive government',
  iatrarchy    => 'physicians',
  isocracy     => 'equal political power',
  kakistocracy => 'worst',
  kleptocracy  => 'thieves',
  kritarchy    => 'judges',
  logocracy    => 'words',
  magocracy    => 'mages',
  meritocracy  => 'meritorious',
  merocracy    => 'part of the citizenry',
  hyperanarchy => 'extreme anarchy',
  oligarchy    => 'few',
  pantisocracy => 'all equally',
  pentarchy    => '5 people',
  hexarchy     => '6 people',
  octarchy     => '8 people',
  ennearchy    => '9 people',
  hendecarchy  => '11 people',
  dodecarchy   => '12 people',
  tridecarchy  => '13 people',
  icosarchy    => '20 people',
  kiloarchy    => '1,000 people',
  myriarchy    => '10,000 people',
  infantocracy => 'infant',
  patriarchy   => 'men or fathers',
  gerontocracy => 'aged',
  angelocracy  => 'angels',
  diabolocracy => 'Devil',
  ecclesiarchy => 'clerics or ecclesiastical authorities',
  exarchy      => 'bishops',
  hagiarchy    => 'saints or holy persons',
  hagiocracy   => 'holy men',
  statocracy   => 'state alone without ecclesiastical influence',
  jesuitocracy => 'Jesuits',
  paparchy     => 'pope',
  parsonarchy  => 'parsons',
  squarsonocracy => 'landholding clergymen',
  thearchy     => 'rule a god or gods; body of divine rulers',
  tritheocracy => '3 gods',
  mesocracy    => 'middle classes',
  neocracy     => 'new or inexperienced rulers',
  nomocracy    => 'legal system; rule of law',
  panarchy     => 'universal rule or dominion',
  pantarchy    => 'all the people; world government',
  papyrocracy  => 'newspapers or literature',
  partocracy   => 'single unopposed political party',
  pedantocracy => 'pedants or strict rule-bound scholars',
  philosophocracy => 'philosophers',
  phylarchy    => 'specific class or tribe',
  physiocracy  => 'according to natural laws or principles',
  plantocracy  => 'plantation owners',
  millionocracy => 'millionaires',
  policeocracy => 'police',
  popocracy    => 'populists',
  pornocracy   => 'harlots',
  prophetocracy => 'prophet',
  psephocracy  => 'resulting from election ballot',
  ptochocracy  => 'beggars or paupers; wholesale pauperization',
  punditocracy => 'political pundits',
  quangocracy  => 'quasi-autonomous non-governmental organizations',
  slavocracy   => 'slave-owners',
  snobocracy   => 'snobs',
  sociocracy   => 'society as a whole',
  stratocracy  => 'military rule',
  strumpetocracy => 'strumpets',
  synarchy     => 'joint sovereignty',
  technocracy  => 'technical experts',
  theatrocracy => 'gathered assemblies of citizens',
  whiggarchy   => 'Whigs',
);

$government{$_} = 'rulers of a particular skin colour' for qw(chromatocracy pigmentocracy);
$government{$_} = 'people' for qw(democracy demarchy);
$government{$_} = 'demons or evil forces' for qw(demonocracy demonarchy);
$government{$_} = 'slaves' for qw(doulocracy dulocracy);
$government{$_} = 'military' for qw(hoplarchy juntocracy stratocracy stratarchy);
$government{$_} = 'an ethnic group' for qw(ethnarchy ethnocracy);
$government{$_} = 'none' for qw(anarchy acracy antarchy);
$government{$_} = '1 individual' for qw(monarchy autarchy);
$government{$_} = '2 people' for qw(biarchy binarchy diarchy dinarchy duarchy dyarchy);
$government{$_} = '3 people' for qw(triarchy tritarchy);
$government{$_} = '4 people' for qw(tetrarchy tetradarchy);
$government{$_} = '7 people' for qw(heptarchy septarchy);
$government{$_} = '10 people' for qw(decarchy decadarchy);
$government{$_} = '100 people' for qw(hecatarchy hecatontarchy);
$government{$_} = 'children' for qw(paedarchy paedocracy);
$government{$_} = 'men' for qw(androcracy phallocracy);
$government{$_} = 'women' for qw(gynarchy gynaecocracy gynocracy gunarchy);
$government{$_} = 'women or mothers' for qw(matriarchy monocracy);
$government{$_} = 'priests or religious law' for qw(theocracy hierocracy hierarchy);
$government{$_} = 'mobs or crowds' for qw(mobocracy ochlocracy pollarchy);
$government{$_} = 'wealthy' for qw(plutarchy plutocracy plousiocracy chrysoaristocracy chrysocracy);
$government{$_} = 'money, monied classes' for qw(argentocracy moneyocracy);
$government{$_} = 'many people' for qw(polyarchy polycracy polarchy);
$government{$_} = 'squatters' for qw(squatterarchy squattocracy);
$government{$_} = 'squires' for qw(squirearchy squirocracy);
$government{$_} = 'propertied class' for qw(timarchy timocracy landocracy);
$government{$_} = 'foreigners' for qw(xenocracy heterarchy);

sub random_government {
  my @array = keys %government;
  my $random_government = $array[rand @array];
  my $gov_description = $government{$random_government};
  return "$random_government (ruled by $gov_description)";
}

=head1 NAME

B<Random::Government> returns a random government type.

=head1 SYNOPSIS

  use Random::Government qw(random_government);
  my $government = random_government;
  
=head1 NOTE

The options of this module came from L<The Phrontistery|http://phrontistery.info/> except magocracy which came from I<The World Builder's Guidebook>.

=head1 AUTHOR

Lady Aleena

=cut

1;
