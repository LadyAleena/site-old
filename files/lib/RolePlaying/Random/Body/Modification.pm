package RolePlaying::Random::Body::Modification;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_body_modification random_body_color_change random_aura);

# part of the 'random' suite from RolePlaying::Random
use RolePlaying::Random qw(random);
use RolePlaying::Random::Misc  qw(random_emotion);
use RolePlaying::Random::Color qw(random_color);
use RolePlaying::Random::Event qw(random_event);
use RolePlaying::Random::Range qw(random_radius);
use RolePlaying::Random::Size  qw(random_size);
use RolePlaying::Random::GemMetalJewelry qw(random_gem random_metal);
use RolePlaying::CharacterBuilding::Alignment qw(random_alignment);

use Games::Dice qw(roll);
use Lingua::EN::Inflect qw(PL_N PL_V ORD NUMWORDS NO A);

my @body_part = (qw(eye ear lip nail nose hair skin),'entire body');

my %adj_info = (
  asinine => 'donkey', 
  bovine => 'cattle',
  canine => 'dog',
  caprine => 'goat',
  equine => 'horse',
  feline => 'cat',
  leporine => 'rabbit',
  lupine => 'wolf',
  ovine  => 'sheep',
  porcine => 'pig',
  serpentine => 'snake',
  simian	=> 'monkey',
  ursine => 'bear',
  vulpine => 'fox'
);

my @animal = qw(amphibian avian insectoid mammalian reptilian);
my @animal_adj = map( qq(<span title="$adj_info{$_}">$_</span>), keys %adj_info );
my @animal_expanded = ('amphibian', 'avian', 'reptilian', 'mammalian', @animal_adj);

# Start body_specifics

my %body_specifics;

for my $part (qw(eye ear lip teeth arm leg)) {
  my $parts = $part !~ /teeth/ ? PL_N($part) : $part;
  push @{$body_specifics{$parts}}, $parts;
  push @{$body_specifics{$parts}}, map( "$_ $part", qw(left right) ) if $part !~ /(?:lip|teeth)/;
  push @{$body_specifics{$parts}}, map { my $p = $part =~ /(?:arm|leg)/ ? $parts : $part; "$_ $p" } qw(upper lower) if $part !~ /(?:eye|ear)/;
  push @{$body_specifics{$parts}}, map( "$_ $part", ('upper left','upper right','lower left','lower right') ) if $part =~ /(?:arm|leg)/;
}
push @{$body_specifics{'teeth'}}, map( "$_ teeth", qw(front canine bicuspid molar wisdom) );

$body_specifics{'hair'} = ['hair',map("$_ hair", ('head','facial','chest','back','arm','leg','pubic')),'eyebrows'];

my %digits = (
  'fingers' => [map( "$_ finger", qw(big pointer middle ring pinky) )],
  'toes'    => [map( "$_ toe",    qw(big long third fourth pinky) )]
);

my (@x_nails,@y_nails);

for my $part (qw(fingers toes)) {
  $body_specifics{$part} = [
    $part,
    ( map( PL_N($_), @{$digits{$part}} )),
    ( map( "left $_", ($part,  @{$digits{$part}} ))),
    ( map( "right $_", ($part, @{$digits{$part}} )))
  ];

  push @x_nails, (map( $_.'nail', @{$digits{$part}} ));
  (my $nail_part = $part) =~ s/s$//;
  push @y_nails, $part.'nails';
}

$body_specifics{'nails'} = [
  'nails',
  @y_nails,
  ( map( PL_N($_), @x_nails )),
  ( map( "left $_", (@y_nails,@x_nails) )),
  ( map( "right $_", (@y_nails,@x_nails) )),
];

$body_specifics{'bones'} = [
  'bones','skull','ribs','spine',
  map ( "$_ bone", qw(collar tail) ),
  map { "$_ bones" } (
    qw(shoulder hip arm hand finger leg feet toe),
    @{$body_specifics{'arms'}}[1..$#{$body_specifics{'arms'}}],
    @{$body_specifics{'legs'}}[1..$#{$body_specifics{'legs'}}]
  )
];

# End body specifics

# Start body

my %body;

$body{'general'} = [
  map(roll('1d50')."% $_ than average",(random_size('height'),random_size('weight')))
];

$body{'somatotype'} = [qw(ectomorphic mesomorphic endomorphic)];

$body{'head'} = [
  'enlarged head',
  'shrunken head',
  'horns'
];

$body{'eyes'} = [
  ( map { (my $v = $_) =~ s/s$//; NO($v,roll('1d4+2')) } @{$body_specifics{'eyes'}} ),
  ( map( random_color('pure')." $_", @{$body_specifics{'eyes'}} )),
  ( map( "$_ in an odd position", @{$body_specifics{'eyes'}} )),
  ( map( "appearance of no $_", @{$body_specifics{'eyes'}} )),
  ( map( "glowing $_", @{$body_specifics{'eyes'}} )),
  'only one eye',
  'infravision <small>(ultravision if infravision is already present)</small>',
  colorblind().'-weakness color blindness',
  'photo-sensitivity',
  'can not cry'
];

$body{'ears'} = [
  ( map { (my $v = $_) =~ s/s$//; NO($v,roll('1d4+2')) } @{$body_specifics{'ears'}} ),
  ( map( "lobeless $_", @{$body_specifics{'ears'}} )),
  ( map( "no $_", @{$body_specifics{'ears'}} )),
  'only ear holes',
  'extra-sensitive hearing',
  roll('1d10*10').'% deafness'
];

$body{'nose'} = [
  'oversized nose',
  'only nose holes',
  'no nose',
  'nose with '.A(animal_attributes('expand')).' appearance',
  'nose is a blowhole',
  'extra-sensitive nose',
  'no sense of smell',
  'unbreakable nose'
];

$body{'lips'} = [
  ( map { (my $v = $_) =~ s/s$//; NO($v,roll('1d2+1')) } @{$body_specifics{'lips'}} ),
  ( map( random_color('pure')." $_", @{$body_specifics{'lips'}} )),
  ( map( "oversized $_", @{$body_specifics{'lips'}} )),
  ( map( "no $_", @{$body_specifics{'lips'}} )),
  ( map( "a bird's $_ for lips", qw(beak bill) ))
];

$body{'teeth'} = [
  ( map( "enlarged $_", @{$body_specifics{'teeth'}} )),
  ( map( "two sets of $_", @{$body_specifics{'teeth'}} )),
  ( map( random_gem." $_", @{$body_specifics{'teeth'}} )),
  ( map( random_metal." $_", @{$body_specifics{'teeth'}} )),
  ( map( random_color('pure')." $_", @{$body_specifics{'teeth'}} )),
  'fangs',
  'fangs with venom'
];

$body{'arms'} = [
  ( map( animal_attributes('expand')."-like $_", @{$body_specifics{'arms'}} )),
  ( map { my $n = $_ =~ /s$/ ? 2 : 1; "$_ ".PL_V('is',$n).' '.roll('1d50').'% '.random_size('length').' than average' } @{$body_specifics{'arms'}} ),
  ( map { (my $v = $_) =~ s/s$//; NO($v,roll('1d4+2'))." (all arms above double the normal amount are vestigial)" } @{$body_specifics{'arms'}} ),
  ( map( "unbreakable $_", @{$body_specifics{'arms'}} )),
  ( map( "no $_ joint", qw(elbow wrist) ) )
];

$body{'legs'} = [
  ( map( animal_attributes('expand')."-like $_", @{$body_specifics{'legs'}} )),
  ( map { my $n = $_ =~ /s$/ ? 2 : 1; "$_ ".PL_V('is',$n).' '.roll('1d50').'% '.random_size('length').' than average' } @{$body_specifics{'legs'}} ),
  ( map { (my $v = $_) =~ s/s$//; NO($v,roll('1d4+2'))." (all legs above double the normal amount are vestigial)" } @{$body_specifics{'legs'}} ),
  ( map( "unbreakable $_", @{$body_specifics{'legs'}} )),
  ( map( "no $_ joint", qw(knee ankle) ) )
];

$body{'fingers'} = [
  ( map( "no $_", @{$body_specifics{'fingers'}} )),
  ( map( "clawed $_", @{$body_specifics{'fingers'}} )),
  ( map( "elongated $_", @{$body_specifics{'fingers'}} )),
  ( map( "unbreakable $_", @{$body_specifics{'fingers'}} )),
  ( map( "double jointed $_", @{$body_specifics{'fingers'}} )),
  ( map( "snake $_", @{$body_specifics{'fingers'}} )),
  'webbed fingers',
  'animal paws',
];

$body{'toes'} = [
  ( map( "no $_", @{$body_specifics{'toes'}} )),
  ( map( "clawed $_", @{$body_specifics{'toes'}} )),
  ( map( "elongated $_", @{$body_specifics{'toes'}} )),
  ( map( "unbreakable $_", @{$body_specifics{'toes'}} )),
  ( map( "double jointed $_", @{$body_specifics{'toes'}} )),
  ( map( "snake $_", @{$body_specifics{'toes'}} )),
  'webbed toes',
  'animal paws',
];

$body{'nails'} = [
  ( map( "no $_", @{$body_specifics{'nails'}} )),
  ( map( "unbreakable $_",   @{$body_specifics{'nails'}} )),
  ( map( random_gem." $_",   @{$body_specifics{'nails'}} )),
  ( map( random_metal." $_", @{$body_specifics{'nails'}} )),
  ( map( random_color('pure')." $_", @{$body_specifics{'nails'}} )),
  ( map( "$_ grow ".random_size('speed').' than normal', @{$body_specifics{'nails'}} ))
];

$body{'bones'} = [
  ( map( "stone $_",   @{$body_specifics{'bones'}} )),
  ( map( "wooden $_",  @{$body_specifics{'bones'}} )),
  ( map( "fragile $_", @{$body_specifics{'bones'}} )),
  ( map( "unbreakable $_",   @{$body_specifics{'bones'}} )),
  ( map( random_gem." $_",   @{$body_specifics{'bones'}} )),
  ( map( random_metal." $_", @{$body_specifics{'bones'}} ))
];

$body{'hair'} = [
  ( map( "odd textured $_",  @{$body_specifics{'hair'}} )),
  ( map( "uncuttable $_",    @{$body_specifics{'hair'}} )),
  ( map( "uncurlable $_",    @{$body_specifics{'hair'}} )),
  ( map( "invisible $_",     @{$body_specifics{'hair'}} )),
  ( map( random_metal." $_", @{$body_specifics{'hair'}} )),
  ( map( random_color('pure')." $_", @{$body_specifics{'hair'}} )),
  ( map( "$_ grows ".random_size('speed').' than normal', @{$body_specifics{'hair'}} )),
  'hairless'
];

$body{'skin'} = [
  random_color('pure').' skin',
  animal_attributes('expand').' skin',
  'fur covered skin',
  'invisible skin',
  'ultra-sensitive skin',
  'fish scales',
  'feathers',
  'birthmark'
];

$body{'blood'} = [
  random_color('pure').' blood',
  'ichor for blood',
  'poisonous blood',
  'acidic blood'
];

$body{'other'} = [
  animal_attributes('').' wings',
  animal_attributes('expand').' tail',
  'gills',
  'reptillian tongue'
];

# End body

# Start random generators

sub animal_attributes {
  my ($list) = @_;
  if ($list eq 'expand') {
    return $animal_expanded[rand @animal_expanded];
  }
  else {
    return $animal[rand @animal];
  }
}

sub colorblind {
  my $colorblind = roll('1d100') > 80 ? 'green' : 'red';
  return $colorblind;
}

sub random_body_modification {
  my ($user_body) = @_;
  my $modification = random(\%body, $user_body);
  return $modification;
}

sub random_body_color_change {
  my $roll = roll('1d7')-1;
  my $verb = 'turns';
  my $part = $body_part[$roll];
  if ($roll < 4) {
    $part = PL_N($body_part[$roll]);
    $verb = PL_V('turns');
  }
  return join(' ',($part,$verb,random_color('pure')));
}

sub random_aura {
  my @auras = (map($_.' aura',('visible '.random_color('pure'), random_emotion, random_alignment('parts'))));
  return $auras[rand @auras];
}

1;
