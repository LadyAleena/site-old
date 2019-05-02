package Xanth::Character;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_open get_character);

use Lingua::EN::Inflect qw(A NUMWORDS ORD);

use Base::Page     qw(convert_string);
use Fancy::Join    qw(join_defined);
use Util::Convert  qw(textify idify searchify);
use Xanth::Dates     qw(get_birth get_death get_dates);
use Xanth::Family    qw(get_family);
use Xanth::LineMagic qw(Xanth_line_magic);
use Xanth::Location  qw(get_locations);
use Xanth::Novel     qw(char_intro_novel get_novels);
use Xanth::Species   qw(get_species);
use Xanth::Util      qw(character_link get_article gendering);

# Begin getting group character belongs to used in get_open

sub get_group {
  my $in = shift;
  my $text = "of ".get_article($in, { full => 1});
  return $text;
}

# End getting group character belongs to
# Begin getting link to character main entry used in get_open

sub get_see {
  my $in_char = shift;
  my $in_char_link = character_link($in_char);
  return "See $in_char_link for more.";
}

# End getting link to character main entry
# Start opening paragraph

sub get_open {
  my ($character, $opt) = @_;
  
  my $name  = $character->{Name};
  my $text  = textify($name);
  my @books = @{$character->{book}};
  my $link  = $character->{dates} || $character->{family} || $character->{other} || $character->{challenge} || @books > 1 ? character_link($name) : $text;

  my $species  = $character->{species};
  my $gender   = $character->{gender};
  my $location = $character->{places};
  my $intro    = $character->{intro};

  my $gendering  = gendering($gender, $species->[-1]);

  my $open_name  = $opt->{link} && $opt->{link} =~ /^[yt1]/ ? $link : $text;
  my $salutation = $character->{title} ? join(' ', ($character->{title}, $open_name)) : $open_name;
  my $address    = $character->{group} ? join(' ', ("<b>$salutation</b>", get_group($character->{group}))) : "<b>$salutation</b>";

  my $species_text  = get_species($species, $gender);
  my $location_text = get_locations($location);

  my $talent_text = $character->{talent} ? "$gendering->{possesive} talent is $character->{talent}." : undef;
  my $intro_text  = "$gendering->{pronoun} was ".char_intro_novel($intro->{book}, $intro->{type}, scalar(@books));
  my $see_text    = $character->{see} ? get_see($character->{see}) : undef;

  my $open_text   = "$address is $species_text from $location_text. ".join_defined(' ', map { ucfirst $_ if $_ } ($talent_text, $intro_text, $see_text));

  return $open_text;
}

# End opening paragraph
# Being dates and family paragraph

sub get_dates_family {
  my ($character, $gendering) = @_;
  
  my $name    = $character->{Name};
  my $text    = textify($name);
  my $dates   = $character->{dates};
  my $family  = $character->{family};
  my $species = $character->{species};
  my $places  = $character->{places};
  my $pronoun = $gendering->{pronoun};

  my $dates_family = undef;
  if ($dates || $family) {
    my $dates_text  = $dates && !$family ? get_dates($dates, $species, $places) : undef;
    my $birth_text  = $dates->{birth} && $family ? get_birth($dates->{birth}, $species, $places) : undef;
    my $death_text  = $dates->{death} && $family ? get_death($dates) : undef;

    my $family_text = undef;
    if ($family) {
      my $family_verb = $dates && $dates->{death} ? 'was' : 'is';
         $family_text = "$family_verb ".get_family($family, $gendering);
    }

    $dates_family = join_defined('. '.ucfirst $pronoun.' ', ($dates_text, $birth_text, $family_text, $death_text));
  }
  my $full_text = $dates_family ? "$text $dates_family." : undef;
  
  return $full_text;
}

# End dates and family paragraph
# Begin getting challenge

sub get_challenge {
  my $in = shift;
  my $num     = NUMWORDS(ORD($in->{number}));
  my $querant = character_link($in->{querant});
  my $text    = "was part of the $num challenge for $querant";
  return $text;
}

# End getting challenge
# Begin getting description paragraph

sub get_description {
  my ($character, $pronoun) = @_;

  my $name = $character->{Name};
  my $text = textify($name);
  my $line_magic = Xanth_line_magic('character');
  
  my $challenge_text = $character->{challenge} ? get_challenge($character->{challenge}) : undef;
  my $other_text     = $character->{other}     ? convert_string($character->{other}, $line_magic) : undef;

  my $description = undef;
  if ( $challenge_text || $other_text ) {
    if ( $challenge_text && $other_text ) {
      if ( $other_text =~ /^[a-z]/ ) {
        $description = "$text $challenge_text. ".ucfirst $pronoun." $other_text";
      }
      else {
        $description = "$text $challenge_text. $other_text";
      }
    }
    elsif ( $other_text ) {
      if ( $other_text =~ /^[a-z]/ ) {
        $description = "$text $other_text";
      }
      else {
        $description = "$other_text";
      }
    }
    elsif ( $challenge_text ) {
      $description = "$text $challenge_text.";
    }
  }
  
  return $description;
}

# End getting description paragraph
# Being putting the character together

sub get_character {
  my $character = shift;

  my $name      = $character->{Name};
  my $text      = textify($name);
  my $species   = $character->{species};
  my $gender    = $character->{gender};
  my $gendering = gendering($gender, $species->[-1]);

  my @paragraphs;
  my $open_text    = get_open($character);
  push @paragraphs, $open_text;
  my $dates_family = get_dates_family($character, $gendering);
  push @paragraphs, $dates_family if $dates_family;
  my $description  = get_description($character, $gendering->{pronoun});
  push @paragraphs, $description if $description;
  if ( scalar @{$character->{book}} > 1 ) {
    my $novel_text = get_novels($character->{book});
    push @paragraphs, $novel_text;
  }
  my $character_text = join_defined('::', @paragraphs);

  return $character_text;
}

# End putting the character together

1;