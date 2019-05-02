#!/usr/bin/perl
use strict;
use warnings;

use CGI::Minimal;
use CGI::Carp           qw(fatalsToBrowser);
use HTML::Entities      qw(encode_entities);
use Lingua::EN::Inflect qw(NUM A NUMWORDS ORD PL_N PL_V NO classical);
use List::MoreUtils     qw(first_index);

use lib '../../files/lib';
use Base::Page     qw(page story);
use Base::Menu     qw(alpha_menu);
use Fancy::Join    qw(grammatical_join join_defined);
use HTML::Elements qw(section nav paragraph list anchor);
use Util::Columns  qw(number_of_columns);
use Util::Convert  qw(textify idify searchify);
use Util::Data     qw(data_file make_hash alpha_hash);
use Util::Number   qw(commify);
use Xanth::Character qw(get_open get_character);
use Xanth::Location  qw(location_link get_locations);
use Xanth::Novel     qw(novel_link novel_nav novel_intro);
use Xanth::PageLinks qw(locations_page_link species_page_link);
use Xanth::Species   qw(species_link get_species);
use Xanth::Util      qw(character_link gendering get_article);

# Begin importing data

my $headings = [qw(Name species gender places talent other book chapter)];
my $characters = make_hash(
  'file' => ['Fandom/Xanth','characters.csv'],
  'headings' => $headings,
);

my $date_headings = [qw(Name birth death), 'cause of death', 'killer'];
my $dates = make_hash(
  'file' => ['Fandom/Xanth', 'dates.txt'],
  'headings' => $date_headings,
);

my $family_headings = [qw(Name mother+ father+ spouse dating sibling+ multisibling+ pibling+ nibling+ cousin+ ancestor+ descendant+ other+)];
my $families  = make_hash(
  'file' => ['Fandom/Xanth', 'families.txt'],
  'headings' => $family_headings,
);

my $partner_headings = [qw(Name spouse+ widowed+ exspouse+ dating+ exdating+ lover+ exlover+)];
my $partners  = make_hash(
  'file' => ['Fandom/Xanth', 'partners.txt'],
  'headings' => $partner_headings,
);

open(my $unnamed_file, '<', data_file('Fandom/Xanth', 'unnamed.txt'));
my @unnamed_list = map { chomp $_; $_ } <$unnamed_file>;

my $group_headings = [qw(Name group title)];
my $groups = make_hash(
  'file' => ['Fandom/Xanth', 'groups.txt'],
  'headings' => $group_headings,
);

my $challenge_headings = [qw(Name number querant)];
my $challenges = make_hash(
  'file' => ['Fandom/Xanth', 'challenges.txt'],
  'headings' => $challenge_headings,
);
  
my $see_char = make_hash(
  'file' => ['Fandom/Xanth', 'see_character.txt'],
);

open(my $book_file, '<', data_file('Fandom/Xanth', 'books.txt'));
my @book_list = map { chomp $_; $_ } <$book_file>;

open(my $gendered_file, '<', data_file('Fandom/Xanth', 'gendered_species.txt'));
my @gendered_species_list = map{chomp $_; $_} <$gendered_file>;

# End importing data
# Begin data crunching

my $species_lists;
my $location_lists;
my $novel_lists;

for my $key ( keys %$characters ) {
  my $character = $characters->{$key};
  my $name      = $character->{Name};
  
  if ($groups->{$name}) {
    $character->{title} = $groups->{$name}->{title} if $groups->{$name}->{title};
    $character->{group} = $groups->{$name}->{group} if $groups->{$name}->{group};
  }

  my $species = [split(/; /, $character->{species})];
  $character->{species} = $species;
  
  my $places = [map { [split(/, /, $_, 2)] } split(/; /, $character->{places})];
  $character->{places} = $places;

  $character->{dates} = $dates->{$name} if $dates->{$name};
  
  if ($families->{$name}) {
    for my $relation ( map { $_ =~ s/\+//; $_ } grep { !/Name|spouse|dating/ } @$family_headings ) {
      if ( $families->{$name}->{$relation} ) {
        $character->{family}->{$relation} = $families->{$name}->{$relation};
      }
    }
    for my $parent_type (qw(mother father)) {
      my $parent = $character->{family}->{$parent_type} ? $character->{family}->{$parent_type} : undef;
      if ($parent) {
        for my $push_parent (@$parent) {
          if ($characters->{$push_parent}) {
            push @{$characters->{$push_parent}->{family}->{children}}, $name;
          }
        }
      }
    }
  }
  
  if ($partners->{$name}) {
    for my $relation ( map { $_ =~ s/\+//; $_ } grep { !/Name/  } @$partner_headings ) {
      if ( $partners->{$name}->{$relation} ) {
        $character->{family}->{$relation} = $partners->{$name}->{$relation};
      }
    }
  }
  
  if ($challenges->{$name}) {
    my $challenge = $challenges->{$name};
    $character->{challenge}->{number} = $challenge->{number};
    $character->{challenge}->{querant} = $challenge->{querant};
  }

  $character->{see} = $see_char->{$name} ? $see_char->{$name} : undef;

  my @novels = split(/, /, $character->{book});
  my $first_book = $novels[0];
  my $first_type = $first_book =~ /^M/ ? 'major' : $first_book =~ /^m/ ? 'mentioned' : undef;
     $first_book =~ s/\D//g;
  $character->{intro}->{book} = $book_list[$first_book];
  $character->{intro}->{type} = $first_type;
  $character->{book} = \@novels;

  next if $character->{see};
  
  for my $book (@novels) {
    my $book_num = $book;
       $book_num =~ s/\D//g;
    if ($book =~ /M\d+/) {
      push @{$novel_lists->{$book_list[$book_num]}->{Major}}, $name;
    }
    elsif ($book =~ /m\d+/) {
      push @{$novel_lists->{$book_list[$book_num]}->{Mentioned}}, $name;
    }
    else {
      push @{$novel_lists->{$book_list[$book_num]}->{Minor}}, $name;
    }
  }

  for my $place (@$places) {
    if ($place->[0] && $place->[1]) {
      push @{$location_lists->{$place->[0]}->{$place->[1]}}, $name;
    }
    else {
      push @{$location_lists->{$place->[0]}->{'main'}}, $name;
    }
  }

  for my $speci (@$species) {
    my ($base_species, $sub_species) = split(/, /, $speci);
    push @{$species_lists->{$base_species}}, $name;
  }
}

for my $unnamed (@unnamed_list) {
  for my $parent_type (qw(mother father)) {
    my $parent = $families->{$unnamed}->{$parent_type} ? $families->{$unnamed}->{$parent_type} : undef;
    if ($parent) {
      for my $push_parent (@$parent) {
        if ($characters->{$push_parent}) {
          push @{$characters->{$push_parent}->{family}->{children}}, $unnamed;
        }
      }
    }
  }
}

# End data crunching
# Begin outputting

my $cgi = CGI::Minimal->new;
my $select_character = $cgi->param('character') ? encode_entities($cgi->param('character'),  '<>"') : '';
my $select_alpha     = $cgi->param('alpha')     ? encode_entities($cgi->param('alpha'),      '<>"') : '';
my $select_novel     = $cgi->param('novel')     ? encode_entities($cgi->param('novel'),      '<>"') : '';
my $select_location  = $cgi->param('location')  ? encode_entities($cgi->param('location'),   '<>"') : '';
my $select_species   = $cgi->param('species')   ? encode_entities($cgi->param('species'),    '<>"') : '';

my $browse_alpha = alpha_hash($characters, {article => 'no'});
sub alpha_with_rand_character {
  my @character_list = keys %$characters;
  my $rand_character = $character_list[rand @character_list];
  my $character_link = character_link($rand_character, 'Random character');
  my $alpha_menu = alpha_menu($browse_alpha, { 'param' => 'alpha', 'join' => '|', addition => "&nbsp;".$character_link });
  return $alpha_menu;
}
my $browse_alpha_menu = alpha_menu($browse_alpha, { 'param' => 'alpha', 'join' => '|' });

my $head = $select_character && $characters->{$select_character} && $groups->{$select_character}->{title} ? "$groups->{$select_character}->{title} $select_character" :
           $select_character && $characters->{$select_character}  ? "$select_character" :
           $select_alpha     && $browse_alpha->{uc $select_alpha} ? "Xanth characters: ". uc $select_alpha :
           $select_novel     ? "$select_novel characters" : 
           $select_location  ? "Characters from ".get_article($select_location, { full => 1}) :
           $select_species   ? ucfirst "$select_species characters" : undef;

page( 'heading' => $head, 'code' => sub {
  section(3, sub {
    if ($select_character && $characters->{$select_character}) {
      my $character = $characters->{$select_character};
      my $pronoun   = gendering($character->{gender}, $character->{species}->[-1], 'pronoun');
      my $character_text = get_character($character);

      paragraph(5, $character_text, { separator => '::' });
      if ( scalar @{$character->{book}} > 1 ) {
        paragraph(5, "A <b><i>Bold Title</i></b> means $pronoun was a major character. A <small><i>Small Title</i></small> means $pronoun was only mentioned.", { class => 'noprint', style => 'font-size: smaller;' });
      }
    }
    elsif ($select_alpha && $browse_alpha->{uc $select_alpha}) {
      nav(4, "Xanth characters: ".alpha_with_rand_character, { 'class' => 'alpha_menu' });
      my $alpha = $browse_alpha->{uc $select_alpha};
      my $list;
      for my $key ( sort keys %$alpha ) {
        my $character = $characters->{$key};
        my $text = get_open($character, { link => 'yes' });
        push @{$list}, $text;
      }
      list(4, 'u', $list, { style => 'line-height: 1.5' });
    }
    elsif ($select_novel) {
      my $number      = first_index { $_ eq $select_novel } @book_list;
      my $novel_nav   = novel_nav($number);
      my $novel_intro = novel_intro($select_novel, $number);

      paragraph(4, $novel_intro) if ($select_novel ne 'Other source');
      for my $type ('Major', 'Minor', 'Mentioned') {
        if ($novel_lists->{$select_novel}->{$type}) {
          section(4, sub {
            if ($novel_lists->{$select_novel}->{$type}) {
              my @characters = @{$novel_lists->{$select_novel}->{$type}};
              my $col  = number_of_columns(4, scalar @characters, 'yes');
              my $list = [map { character_link($_) } sort @characters];
              list(5, 'u', $list, { class => $col });
            }
          }, { heading => $select_novel ne 'Other source' ? [2, "$type characters"] : undef });
        }
      }
      
      nav(4, $novel_nav, { class => 'alpha_menu', style => 'text-align:center' });
    }
    elsif ($select_location) {
      my $location_link = locations_page_link($select_location);
      my $locations = $location_lists->{$select_location};
      my $total_count;
      for my $key (keys %$locations) {
        my $location = $locations->{$key};
        $total_count += scalar(@{$location});

        my $list = [ map { 
          my $species = get_species($characters->{$_}->{species}, $characters->{$_}->{gender});
          my $link    = character_link($_);
          "$link is $species."
        } sort @{$location} ];
        $locations->{$key} = $list;
      }
      my $worded_count = NO('character', $total_count, { words_below => 101, comma_every => 3 });
      my $plural_verb  = PL_V('is', $total_count);
      paragraph(4, "There $plural_verb $worded_count from $location_link.");
      if ($locations->{main}) {
        my $list = $locations->{main};
        my $col  = number_of_columns(3, scalar @{$list}, 'yes');
        list(4, 'u', $list, { class => $col });
      }
      for my $section ( sort grep { !/main/ } keys %$locations ) {
        my $text  = get_article($section, { full => 1 });
        my $id    = idify($section);
        my $link  = locations_page_link($select_location, $section);
        my $list  = $locations->{$section};
        my $count = scalar @{$list};
        my $col   = number_of_columns(3, $count, 'yes');
        my $pl_characters = NO('character', $count, { words_below => 101 });
        my $pl_verb       = PL_V('is', $count);

        section(4, sub {
          paragraph(6, "There $pl_verb $pl_characters from $link.");
          list(6, 'u', $list, { class => $col });
        }, { heading => [ 3, ucfirst $text, { id => $id } ] } );
      }
    }
    elsif ($select_species) {
      my $list = [ map {
        my $location = get_locations($characters->{$_}->{places});
        my $link     = character_link($_);
        "$link is from $location."
      } sort @{$species_lists->{$select_species}} ];
      classical( names => 0 );
      my $count   = scalar @{$list};
      my $species = $count > 1 && $select_species !~ /folk$/ ? PL_N($select_species) : $select_species;
      my $worded_count = NUMWORDS($count);
      my $columns = number_of_columns(2, $count, 'yes');
      paragraph(4, "There are $worded_count <b>$species</b>.") if $count > 1;
      paragraph(4, "This character is a <b>$species</b>.") if $count == 1;
      list(4, 'u', $list, { class => $columns });
    }
    else {
      my $character_count = commify(scalar(keys %$characters) - scalar(keys %$see_char));
      paragraph(5, qq(Welcome to Lady Aleena\'s <b>List of <i>Xanth</i> Characters</b>. It covers all $character_count characters from <a href="http://www.hipiers.com/chartcnac.html"><i>Xanth</i> Character Database</a> by Douglas Harter.));
      nav(5, "Xanth characters: ".alpha_with_rand_character, { 'class' => 'alpha_menu' });
      section(4, sub {
        paragraph(5, 'You can browse character lists by novel.');
        my $show_list = [map { novel_link($_) } @book_list];
        list(5, 'o', $show_list, { class => 'three', start => '0' });
      }, { heading => [2, 'Novels', { id => 'Novels' }] });
      section(4, sub {
        paragraph(5, 'You can browse character lists by location. Most characters are from Xanth, so the list for it is very long.');
        my $location_list = [map { ucfirst location_link($_) } sort keys %$location_lists];
        list(5, 'u', $location_list, { class => 'four' });
      }, { heading => [2, 'Locations', { id => 'Locations' }] });
      section(4, sub {
        paragraph(5, 'You can browse character lists by species. The majority of characters are human, so the list for them is very long.');
        my $species_list = [map { species_link($_, ucfirst $_) } sort { lc $a cmp lc $b } keys %$species_lists];
        list(5, 'u', $species_list, { class => 'five' });
      }, { heading => [2, 'Species', { id => 'Species' }] });
      section(4, sub {
        paragraph(5, 'Human men and women will not have a species in their entries.::If the character is a child, it will be in the description. The child will more than likely be an adult by this time in the <i>Xanth</i> series.::Many species are single gender, so their entries will not mention it. The species are '.grammatical_join('and', sort @gendered_species_list).'. Harpies and nymphs are usually female, and fauns are usually male; but there have been a few exceptions that are noted.::In some instances, I have made educated guesses on gender, species, and some birth years.', { separator => '::' });
      }, { heading => [2, 'Notes'] });
    }
    nav(4, "Xanth characters: ".alpha_with_rand_character, { 'class' => 'alpha_menu' });
    paragraph(4, "<small>Please forgive the mess&hellip;</small>", { class => 'noprint' });
  });
});

# End outputting