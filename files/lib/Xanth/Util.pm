package Xanth::Util;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(character_link group_character_link gendering get_article);

use Lingua::EN::Inflect qw(A NUMWORDS ORD);

use Fancy::Join    qw(grammatical_join join_defined);
use HTML::Elements qw(anchor);
use Util::Convert  qw(textify idify searchify);
use Util::Data     qw(make_hash);

my $see_char = make_hash(
  'file' => ['Fandom/Xanth', 'see_character.txt'],
);

# Begin creating links for characters

sub character_link {
  my ($in, $alt) = @_;
  my $num_text;
  if ($in =~ /^\d/) {
    my ($num, $new_text) = split(/ /, $in, 2);
    $num_text = NUMWORDS($num)." $new_text";
  }
  my $text   = $alt ? textify($alt) : textify($in);
  my $search = $see_char->{$in} ? searchify($see_char->{$in}) : searchify($in);
  my $link   = $in =~ /^[A-Z]/  ? anchor($text, { href => "Characters.pl?character=$search" }) :
               $in =~ /^\d/     ? $num_text : A($text);
  return $link;
}

sub group_character_link {
  my $in = shift;
#  my @characters = split(/; /, $in);
  my $out = grammatical_join('and', map { character_link($_) } @$in);
  return $out;
}

# End creating links for characters
# Gets gender text for different relationships and species in Xanth
## pibling and nibling are referenced at https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1570791/

sub gendering {
  my ($in_gender, $in_species, $case) = @_;
  my $gender = $in_gender ? $in_gender : 'neuter';
  my $gendering;
  $gendering->{text}      = $gender ne 'neuter' ? $gender : undef;
  $gendering->{pronoun}   = $gender eq 'male' ? 'he'        : $gender eq 'female' ? 'she'        : 'it';
  $gendering->{possesive} = $gender eq 'male' ? 'his'       : $gender eq 'female' ? 'her'        : 'its'; 
  $gendering->{sibling}   = $gender eq 'male' ? 'brother'   : $gender eq 'female' ? 'sister'     : 'sibling';
  $gendering->{pibling}   = $gender eq 'male' ? 'uncle'     : $gender eq 'female' ? 'aunt'       : 'pibling';
  $gendering->{nibling}   = $gender eq 'male' ? 'nephew'    : $gender eq 'female' ? 'neice'      : 'nibling';
  $gendering->{dating}    = $gender eq 'male' ? 'boyfriend' : $gender eq 'female' ? 'girlfriend' : 'lover';
  $gendering->{lover}     = 'lover';
  $gendering->{widowed}   = $gender eq 'male' ? 'widower'   : $gender eq 'female' ? 'widow'      : 'widowed';
  $gendering->{Magician}  = $gender eq 'male' ? 'Magician'  : $gender eq 'female' ? 'Sorceress'  : 'Magician';

  if ( $in_species && $in_species =~ /horse|centaur|pooka|hippo|icorn/ ) {
    $gendering->{noun}    = $gender eq 'male' ? 'stallion'  : $gender eq 'female' ? 'mare'     : 'person';
  }
  else {
    $gendering->{noun}    = $gender eq 'male' ? 'man'       : $gender eq 'female' ? 'woman'    : 'person';
  }

  if ( $in_species && $in_species =~ /horse|centaur|pooka|hippo|icorn/ ) {
    $gendering->{child}   = $gender eq 'male' ? 'colt'      : $gender eq 'female' ? 'filly'    : 'offspring';
  }
  else {
    $gendering->{child}   = $gender eq 'male' ? 'son'       : $gender eq 'female' ? 'daughter' : 'offspring';
  }

  if ( $in_species && $in_species =~ /horse|centaur|pooka|hippo|icorn|dog|cat|wolf/ ) {
    $gendering->{parent}  = $gender eq 'male' ? 'sire'      : $gender eq 'female' ? 'dam'      : 'parent';
  }
  else {
    $gendering->{parent}  = $gender eq 'male' ? 'father'    : $gender eq 'female' ? 'mother'   : 'creator';
  }

  if ( $in_species && $in_species =~ /horse|centaur|pooka|hippo|icorn|dog|cat|wolf/ ) {
    $gendering->{spouse}  = "mate";
  }
  else {
    $gendering->{spouse}  = $gender eq 'male' ? 'husband'   : $gender eq 'female' ? 'wife'     : 'mate';
  }

  my $out = $case ? $gendering->{$case} : $gendering;
  return $out;
}

# Begin getting an article for groups and places

sub get_article {
  my ($in, $opt) = @_;
  my $article = $in =~ /^(Cloud|OuterNet|Gourd|Lost Path|Void|Inside|Outside|Stork Works|Punderground|Ticks|Britons)$/ ||
                $in =~ /^(Isle|Region|Gap|Faun|Library|Gourd|Realm|Good Magician\'s)/ ||
                $in =~ /(System|Galaxy|Face|Retreat|Village|Stockade|Elves|Gnomes|Goblins|Clan|Pack|Wave|Annex)$/ ||
                $in =~ /\b[a-z]/ ? 'the' :
                $in =~ /^Comic Strip/ ? 'a' : undef;
  my $text    = $opt->{full} && $opt->{full} =~ /^[yt1]/ ? join_defined(' ', ($article, $in)) : $article;
  return $text;
}

# End getting an article for groups and places

1;