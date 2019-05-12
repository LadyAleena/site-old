package Xanth::Family;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_family);

use Lingua::EN::Inflect qw(A);

use Fancy::Join qw(join_defined grammatical_join);
use Util::Data  qw(make_hash);
use Xanth::Util qw(character_link group_character_link gendering);

my $date_headings = [qw(Name birth death)];
my $dates = make_hash(
  'file' => ['Fandom/Xanth', 'dates.txt'],
  'headings' => $date_headings,
);

# Start getting family for characters

sub get_parents {
  my ($mother, $father, $child_type) = @_;

  my $parent_text = undef;

  if ( $mother || $father ) {
    my ($birth_mother, $adoptive_mother) = $mother ? @$mother : (undef, undef);
    my ($birth_father, $adoptive_father) = $father ? @$father : (undef, undef);
    
    my $birth_parents = undef;
    if ( $birth_mother || $birth_father ) {
      my $birth_mother_name = $birth_mother && $birth_mother ne 'unknown' ? character_link($birth_mother) : undef;
      my $birth_father_name = $birth_father && $birth_father ne 'unknown' ? character_link($birth_father) : undef;

      $birth_parents = join_defined(' and ', ($birth_mother_name, $birth_father_name));
    }

    my $adoptive_parents = undef;
    if ( $adoptive_mother || $adoptive_father ) {
      my $adoptive_mother_name = $adoptive_mother && $adoptive_mother ne 'unknown' ? character_link($adoptive_mother) : undef;
      my $adoptive_father_name = $adoptive_father && $adoptive_father ne 'unknown' ? character_link($adoptive_father) : undef;

      $adoptive_parents = join_defined(' and ', ($adoptive_mother_name, $adoptive_father_name));
    }
    
    if ( $birth_parents && $adoptive_parents ) {
      $parent_text = "$child_type of $birth_parents and was adopted by $adoptive_parents";
    }
    elsif ( !$birth_parents && $adoptive_parents ) {
      $parent_text = "adoptive $child_type of $adoptive_parents";
    }
    else {
      $parent_text = "$child_type of $birth_parents";
    }
  }

  return $parent_text;
}

sub get_multisibling {
  my ($siblings, $sibling_type) = @_;
  my $count = scalar(@$siblings);
  my $multi_type = $count == 2 ? 'triplet' : 'twin';
  my $multisibling_text = $siblings ? "$multi_type $sibling_type of ".group_character_link($siblings) : undef;
  return $multisibling_text;
}

sub get_children {
  my $children = shift;
  if ($children) {
    my @bare_children;
    my @known_births;
    my @unknown_births;
    if (@{$children} > 1) {
      for my $child (@{$children}) {
        push @known_births, $child if $dates->{$child}->{birth};
        push @unknown_births, $child if !$dates->{$child}->{birth};
      }
      push @bare_children, sort { $dates->{$a}->{birth} <=> $dates->{$b}->{birth} || $a cmp $b } @known_births if @known_births;
      push @bare_children, sort @unknown_births if @unknown_births;
    }
    else {
      push @bare_children, $children->[0];
    }
    my @children;
    for my $child (@bare_children) {
      my $child_text;
      if ( $child =~ /^\d/ ) {
        my ($num, $bare_child) = split(/ /, $child);
        $child_text = $num." unnamed $bare_child";
      }
      elsif ( $child =~ /^[a-z]/ ) {
        my ($bare_child, $other) = split(/ of /, $child);
        $child_text = "unnamed $bare_child"
      }
      else {
        $child_text = $child;
      }
      push @children, $child_text;
    }
    
    $children = grammatical_join('and', map { character_link($_) } @children);
  }
  return $children;
}

sub get_family {
  my ($family, $gendering) = @_;

  my @family_list;

  my $parent_text   = $family->{mother} || $family->{father} ? get_parents($family->{mother}, $family->{father}, $gendering->{child}) : undef;
  push @family_list, $parent_text if $parent_text;

  my $multisibling_text = $family->{multisibling} ? get_multisibling($family->{multisibling}, $gendering->{sibling}) : undef;
  push @family_list, $multisibling_text if $multisibling_text;

  my $sibling       = $family->{sibling}  ? group_character_link($family->{sibling}) : undef;
  my $sibling_text  = $sibling ? $gendering->{sibling}." of $sibling" : undef;
  push @family_list, $sibling_text if $sibling_text;

  my $exdating      = $family->{exdating} ? group_character_link($family->{exdating}) : undef;
  my $exdating_text = $exdating ? 'ex-'.$gendering->{dating}." of $exdating" : undef;
  push @family_list, $exdating_text if $exdating_text;

  my $dating        = $family->{dating}   ? group_character_link($family->{dating}) : undef;
  my $dating_text   = $dating ? $gendering->{dating}." of $dating" : undef;
  push @family_list, $dating_text if $dating_text;

  my $widowed       = $family->{widowed}  ? group_character_link($family->{widowed}) : undef;
  my $widowed_text  = $widowed ? $gendering->{widowed}." of $widowed" : undef;
  push @family_list, $widowed_text if $widowed_text;
  
  my $exspouse      = $family->{exspouse} ? group_character_link($family->{exspouse}) : undef;
  my $exspouse_text = $exspouse ? 'ex-'.$gendering->{spouse}." of $exspouse" : undef;
  push @family_list, $exspouse_text if $exspouse_text;

  my $spouse        = $family->{spouse}   ? group_character_link($family->{spouse}) : undef;
  my $spouse_text   = $spouse ? $gendering->{spouse}." of $spouse" : undef;
  push @family_list, $spouse_text if $spouse_text;

  my $exlover       = $family->{exlover}  ? group_character_link($family->{exlover}) : undef;
  my $exlover_text  = $exlover ? 'ex-'.$gendering->{lover}." of $exlover" : undef;
  push @family_list, $exlover_text if $exlover_text;

  my $lover         = $family->{lover}    ? group_character_link($family->{lover}) : undef;
  my $lover_text    = $lover ? $gendering->{lover}." of $lover" : undef;
  push @family_list, $lover_text if $lover_text;

  my $child_text    = $family->{children} ? $gendering->{parent}." of ".get_children($family->{children}) : undef;
  push @family_list, $child_text if $child_text;

  my $pibling       = $family->{pibling}  ? group_character_link($family->{pibling}) : undef;
  my $pibling_text  = $pibling ? $gendering->{nibling}." of $pibling" : undef;
  push @family_list, $pibling_text if $pibling_text;

  my $nibling       = $family->{nibling}  ? group_character_link($family->{nibling}) : undef;
  my $nibling_text  = $nibling ? $gendering->{pibling}." of $nibling" : undef;
  push @family_list, $nibling_text if $nibling_text;

  my $cousin        = $family->{cousin}   ? group_character_link($family->{cousin}) : undef;
  my $cousin_art    = scalar(@family_list) > 0 ? A('cousin') : 'cousin';
  my $cousin_text   = $cousin ? "$cousin_art of $cousin" : undef;
  push @family_list, $cousin_text if $cousin_text;

  my $descendant      = $family->{descendant} ? group_character_link($family->{descendant}) : undef;
  my $descendant_art  = scalar(@family_list) > 0 ? A('ancestor') : 'ancestor';
  my $descendant_text = $descendant ? "$descendant_art of $descendant" : undef;
  push @family_list, $descendant_text if $descendant_text;

  my $ancestor      = $family->{ancestor}     ? group_character_link($family->{ancestor}) : undef;
  my $ancestor_art  = scalar(@family_list) > 0 ? A('descendant') : 'descendant';
  my $ancestor_text = $ancestor ? "$ancestor_art of $ancestor" : undef;
  push @family_list, $ancestor_text if $ancestor_text;

  my $other      = $family->{other} ? group_character_link($family->{other}) : undef;
  my $other_text = $other ? "related to $other" : undef;
  push @family_list, $other_text if $other_text;

  my $whole_family = @family_list ? grammatical_join('and', @family_list): undef;
  my $family_text  = $whole_family =~ /^(ancestor|descendant|cousin)/ ? A($whole_family) :
                     $whole_family =~ /related/ ? $whole_family : "the $whole_family";
  
  return $family_text;
}

# End getting family for characters

1;
