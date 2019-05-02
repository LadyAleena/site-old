package Xanth::Species;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(species_link get_species);

use Lingua::EN::Inflect qw(A);

use Fancy::Join    qw(join_defined);
use HTML::Elements qw(anchor);
use Util::Convert  qw(textify idify searchify);
use Util::Data     qw(data_file);
use Xanth::Util    qw(gendering);

open(my $gendered_file, '<', data_file('Fandom/Xanth', 'gendered_species.txt'));
my @gendered_species_list = map{chomp $_; $_} <$gendered_file>;
my $gendered_species = join('|', @gendered_species_list);

sub species_link {
  my ($in, $alt) = @_;
  my $text   = $alt ? textify($alt) : textify($in);
  my $search = searchify($in);
  my $link   = anchor($text, { href => "Characters.pl?species=$search" });
  return $link;
}

sub get_merfolk {
  my ($in, $gender) = @_;
  my $text;
  if ($gender eq 'female') {
    my ($merspecies, $mertype) = split(/, /, $in);
    if ($mertype eq 'fresh') { 
      $text = 'mermaid';
    }
    elsif ($mertype eq 'salt') {
      $text = 'merwoman';
    }
  }
  else {
    $text = 'merman';
  }
  return $text;
}

sub get_gendered_species {
  my ($species, $gendering) = @_;

  my $gender_text = $gendering->{text};
  my $gender_noun = $gendering->{noun};

  my $text = undef;
  if ($gender_text) {
    if ( $species eq 'human' ) {
      $text = $gender_noun;
    }
    elsif ( $species eq 'elf' ) {
      $text = "elven $gender_noun";
    }
    elsif ( $species =~ /(night|day) horse/ ) {
      my $alt_text = $species;
         $alt_text =~ s/(night|day) horse/$1/;
      $text = "$alt_text $gender_noun";
    }
    elsif ( $species =~ /curse fiend|goblin|horse|centaur|hippo|pooka|icorn/ ) {
      $text = "$species $gender_noun";
    }
    elsif ( $species =~ /merfolk/ ) {
      $text = get_merfolk($species, $gender_text);
    }
    elsif ( $species eq 'brassy' ) {
      $text = $gender_text eq 'female' ? 'brassie'  : $species;
    }
    elsif ( $species =~ /demon/ ) {
      # There are demons, dwarf demons, and major demons.
      (my $female = $species) =~ s/demon/demoness/;
      $text = $gender_text eq 'female' ? $female : $species;
    }
    elsif ( $species eq 'god' ) {
      $text = $gender_text eq 'female' ? 'goddess'  : $species;
    }
    elsif ( $species =~ /$gendered_species|tree|ghost|zombie/ ||
            $species =~ /harpy|nymph/ && $gender_text eq 'female' ||
            $species =~ /faun/ && $gender_text eq 'male' ) {
      $text = $species;
    }
    else {
      $text = join_defined(' ', ($gender_text, $species));
    }
  }
  
  return $text;
}

sub get_species {
  my ($in_species, $gender) = @_;
  my @list;
  my $species_text;
  for ( my $species_no = 0; $species_no < @$in_species; $species_no++ ) {
    my $curr_species = $in_species->[$species_no];
    my $prev_species = $species_no - 1 >= 0 ? $in_species->[$species_no - 1] : undef;
    my $link_species = $curr_species =~ /merfolk/ ? 'merfolk' : $curr_species;

    my $gendering = gendering($gender, $curr_species);
    my $gendered_text = get_gendered_species($curr_species, $gendering);

    my $base_text = $gendered_text ? A($gendered_text) : A($curr_species);
    my ($article, $alt_text) = split(/ /, $base_text, 2);
    my $link = species_link($link_species, $alt_text);

    if ($prev_species) {
      $species_text .= " who became $article $link";
    }
    else {
      $species_text .= "$article $link";
    }
  }
  return $species_text;
}

1;