#!/usr/bin/perl
#This is the Role_playing/Player_characters index.
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);

use Lingua::EN::Inflect qw(PL_N);

use lib '../../files/lib';
use Base::Page qw(page);
use HTML::Elements qw(section list table span);
use Fancy::Join::Defined qw(join_defined);
use Util::Convert qw(idify);
use Util::Data qw(make_hash);
use Util::Number qw(commify);
use RolePlaying::Character::Alignment qw(expand_alignment);

my $player_characters = make_hash(
  'file' => ['Role_playing','Player_characters.txt'],
  'headings' => ['full name', 'id', 'last name', 'first name', qw(alignment class+ experience race special_race gender strength dexterity constitution intelligence wisdom charisma languages)],
);

my @general_information_headings = qw(experience alignment race gender);
my @ability_scores_headings = qw(strength dexterity constitution intelligence wisdom charisma);

sub player_classes {
  my ($classes) = @_;
  
  my @print_classes;
  for my $class (@$classes) {
    my ($spec_class, $base_class) = split(/\//,$class);

    $spec_class =~ s/^(\w+ of )(\w)(\w+)$/$1\U$2\L$3/;
    my $full_class = ucfirst "$spec_class";

    push @print_classes, $full_class;
  }
  return join(' / ',@print_classes)
}

sub split_ability {
  my ($ability_name,$raw_ability) = @_;
  my ($base,$modified,$modifier) = split(/\//,$raw_ability);
  
  my @abilities;
  push @abilities, [$ability_name, $base];
  push @abilities, ["$ability_name<br><small>(modified)</small>",$modified] if $modified;
  push @abilities, ["$ability_name<br><small>(modifier)</small>",$modifier] if $modifier;

  return @abilities;
}

sub info_loop {
  my ($data_hash, $hash_headings) = @_;
  my @items;
  for my $key (@$hash_headings) {
    my $value = span($data_hash->{$key});
    push @items, qq(<strong class="caps">).ucfirst $key.qq(:</strong> $value);
  }
  return \@items;
}

page( 'code' => sub {
  section(3, 
    'I have taken down all of the individual pages for my player characters for a while. I am revamping this whole section of my site and the current files are a mess. Please bear with me as I working on getting them back online.'
  );
  for my $character (sort {$a->{'last name'} cmp $b->{'last name'} || $a->{'first name'} cmp $b->{'first name'}} values %$player_characters) {
    my $name = $character->{'full name'};

    my %general_information;
    %general_information = (
      experience => commify($character->{experience} + 0),
      alignment => expand_alignment($character->{alignment}),
      gender => $character->{gender}
    );

    my @classes = @{$character->{'class'}};
    my $class_key = PL_N('class', scalar @classes);
    unshift @general_information_headings, $class_key;

    $general_information{$class_key} = player_classes(\@classes);

    my $race = join_defined(' / ', ($character->{'race'}, $character->{'special_race'}));
    $general_information{'race'} = $race;
    
    my @ability_scores = map { split_ability($_, $character->{$_}) } @ability_scores_headings;

    section(3, sub {
      table(5, { rows => [['whead', \@ability_scores]], class => 'ab_box', 'caption' => 'Ability scores' });
      list(5, 'u', info_loop(\%general_information, \@general_information_headings), { 'class' => 'headed' });
    }, { 'heading' => [2, $name, { id => idify($name) }] });
    
    shift @general_information_headings;
  }
});
