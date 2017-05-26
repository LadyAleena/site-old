package RolePlaying::Character::AbilityScores;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(all_abilities ability_score_table game_effect random_ability random_game_effect);

use List::Util qw(max);

use Base::Data qw(make_hash);

my @abilities = qw(strength dexterity constitution intelligence wisdom charisma);

my %game_effects = (
  'strength'     => ['Hit Probability','Damage Adjustment','Weight Allow','Maximum Press','Open Doors','Bend Bars/Lift Gates'],
  'dexterity'    => ['Surprise Reaction Adjustment','Missile Attack Adjustment','Defensive Adjustment'],
  'constitution' => ['Hit Point Adjustment','System Shock','Resurrection Survival','Poison Save','Regeneration'],
  'intelligence' => ['# of Languages','Spell Level','Chance to Learn Spell','Maximum # of Spells/Lvl','Illusion Immunity'],
  'wisdom'       => ['Magical Defense Adjustment','Bonus Spells','Chance of Spell Failure','Spell Immunity'],
  'charisma'     => ['Maximum # of Henchmen','Loyalty Base','NPC Reaction Adjustment'],
);

my %abilities;
for my $ability (@abilities) {
  $abilities{$ability} = make_hash( 
    'file' => ['Role_playing/Abilities', "$ability.txt"],
    'headings' => ['score', @{$game_effects{$ability}}]
  );
}

# Anno gave the this to me. Thank you Anno!
$abilities{'strength'}{"18($_)"} = {'Hit Probability' => '+1','Damage Adjustment' => '+3','Weight Allow' => '135','Maximum Press' => '280','Open Doors' => '12','Bend Bars/Lift Gates' => '20%'} for 1 .. 50;
$abilities{'strength'}{"18($_)"} = {'Hit Probability' => '+2','Damage Adjustment' => '+3','Weight Allow' => '160','Maximum Press' => '305','Open Doors' => '13','Bend Bars/Lift Gates' => '25%'} for 51 .. 75;
$abilities{'strength'}{"18($_)"} = {'Hit Probability' => '+2','Damage Adjustment' => '+4','Weight Allow' => '185','Maximum Press' => '305','Open Doors' => '14','Bend Bars/Lift Gates' => '30%'} for 76 .. 90;
$abilities{'strength'}{"18($_)"} = {'Hit Probability' => '+2','Damage Adjustment' => '+5','Weight Allow' => '235','Maximum Press' => '380','Open Doors' => '15 (3)','Bend Bars/Lift Gates' => '35%'} for 91 .. 99;
$abilities{'strength'}{'18(00)'} = {'Hit Probability' => '+3','Damage Adjustment' => '+6','Weight Allow' => '335','Maximum Press' => '480','Open Doors' => '16 (6)','Bend Bars/Lift Gates' => '40%'};

my %col_widths;
$col_widths{'strength'} = [("14") x 5, "15"];
$col_widths{$_} = [qw(28 29 28)] for qw(dexterity wisdom charisma);
$col_widths{$_} = [("18") x 5]   for qw(constitution intelligence);

sub game_effect {
  my ($game_effect, $score, $ability) = @_;
  if ($score =~ /\//) {
    my @scores = split('/',$score);
    if (@scores == 3) {
      pop @scores;
    }
    $score = $scores[1];
  } 
  return $abilities{$ability}{$score}{$game_effect};
}

# These next two subroutines return the data around the ability scores to go into tables.

sub ability_score_table {
  my ($ability, $ability_score, $user_enhanced, $score_modifier) = @_;
  my $enhanced = $user_enhanced ? $user_enhanced : '0';
  my $print_enhanced = '' ;
     $print_enhanced = '<br><small>(normal)</small>' if ($enhanced == 1);
     $print_enhanced = '<br><small>(enhanced)</small>' if ($enhanced == 2);
  my $ability_score_text = $ability_score;
  if ($ability eq 'strength' and $ability_score =~ m/18\(/) {
    $ability_score_text =~ s/18\(/18<br>(/;
  }
  my @cols = map({ class=> "width_$_" },('12','03',@{$col_widths{$ability}}));

  my @rows;
  my @top_row;
  push @top_row, [ucfirst $ability.$print_enhanced, { class=> 'ability_name', rowspan => '2' }];
  push @top_row, [$ability_score_text, { class => 'ability_score', rowspan => '2', type_override => 'd' }];
  for my $game_effect_heading (grep($_ ne 'Spell Immunity',@{$game_effects{$ability}})) {
    push @top_row, [$game_effect_heading, { class => 'sub_score' }];
  }
  push @rows, ['header',[\@top_row]];

  my @game_effects;
  for (grep($_ ne 'Spell Immunity',@{$game_effects{$ability}})) {
    push @game_effects, $abilities{$ability}{$ability_score}{$_};
  }
  push @rows, ['data',[\@game_effects]];
  
  my $colspan = scalar(@{$col_widths{$ability}}) + 1;
  if ($ability eq 'wisdom' and $ability_score >= 19) {
    my $wisdom_spell_immunity = $abilities{wisdom}{$ability_score}{'Spell Immunity'};
    push @rows, ['whead',[['Spell Immunity',[$wisdom_spell_immunity, { class => 'info', colspan => $colspan }]]]];
  }

  if (defined $score_modifier and $enhanced == 2) {
    push @rows, ['whead',[['Modifier',[$score_modifier, { class => 'info', colspan => $colspan }]]]];
  }

  return { class => 'player_character ability_score', cols => \@cols, rows => \@rows };
}

sub all_abilities {
  my ($opt) = @_;
  my @ability_data;
  for my $ability (@abilities) {
    my $score = $opt->{$ability};
    if ($score =~ /\//) {
      my @score_array = split("/", $score);
      my $score_modifier = scalar @score_array == 3 ? pop @score_array : undef;
      my $num = 1;
      for my $sub_score (@score_array) {
        push @ability_data, ability_score_table($ability, $sub_score, $num, $score_modifier);
        ++$num;
      }
    }
    else {
      push @ability_data, ability_score_table($ability, $score);
    }
  }
  return \@ability_data;
}

# The last two subroutines return random ability scores and game effects.

sub random_ability {
  return $abilities[rand @abilities];
}

sub random_game_effect {
  my $random_ability = random_ability;
  my @game_effects = @{$game_effects{$random_ability}}; 
  my $random_game_effect = lc $game_effects[rand @game_effects];
  return qq{$random_game_effect <small>($random_ability)</small>};
}

1;
