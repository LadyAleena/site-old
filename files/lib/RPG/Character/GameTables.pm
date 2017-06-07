package RPG::Character::GameTables
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(game_tables);

use RPG::Character::GameTable::THAC0 qw(THAC0_table_rows);
use RPG::Character::GameTable::ArmorClass qw(armor_class_table_rows);
use RPG::Character::GameTable::SavingThrows qw(saving_throw_table_rows);
use RPG::Character::GameTable::RogueSkills qw(rogue_skills_table_rows);
use RPG::Character::GameTable::SpellProgression qw(spell_progression_table_rows);
use RPG::Character::GameTable::Psionics qw(psionics_table_rows);
use RPG::Character::GameTable::TurningUndead qw(turning_undead_table_rows);

sub game_tables {
  my ($character) = @_;
  
  my $ability_scores = $character->{'ability scores'};
  my $classes        = $character->{'class'};

  my %options = (
    'classes'    => $character->{'class'},
    'experience' => $character->{'experience'},
  );

  my %game_tables;
  $game_tables{'THAC0'} = THAC0_table_rows( %options,
    'hit probability' => game_effect('Hit Probability', $ability_scores->{'strength'},  'strength'),
    'missile attack adjustment' => game_effect('Missile Attack Adjustment', $ability_scores->{'dexterity'}, 'dexterity'),
    'weapons'       => $character->{'weapons'},
    'ambidexterity' => grep( /ambidexterity/, @{$character->{'nwp'}}) ? 1 : 0
  );
  $game_tables{'armor class'} = armor_class_table_rows( %options,
    'defense adjustment' => game_effect('Defensive Adjustment', $ability_scores->{'dexterity'}, 'dexterity'),
    'intelligence' => $ability_scores->{'intelligence'},
    'wisdom'       => $ability_scores->{'wisdom'},
    'armor'        => $character->{'armor worn'}
  );
  $game_tables{'spell progression'} = spell_progression_table_rows( %options,
    'name'         => $character->{'name'},
    'intelligence' => $ability_scores->{'intelligence'},
    'wisdom'       => $ability_scores->{'wisdom'},
    'spellbook'    => $character->{'spellbook'}
  ) if grep(/(?:wizard|priest|paladin|ranger|bard|theopsyelementalist)/, map( convert_class($_, 'SpellProgression'), @$classes ));
  $game_tables{'saving throws'}  = saving_throw_table_rows(%options, modifiers => $character->{'saving throw modifiers'});
  $game_tables{'rogue skills'}   = rogue_skills_table_rows(%options, skills => $character->{'thief skills'}) if grep(/(?:thief|bard)/, @$classes );
  $game_tables{'turning undead'} = turning_undead_table_rows(%options) if grep(/(?:priest|paladin)/, map( convert_class($_, 'TurningUndead'), @$classes ));
  $game_tables{'psionics'}       = psionics_table_rows(%options) if grep(/psionisist/, @$classes);

  my @game_tables_data;
  for my $game_table ('THAC0', 'armor class', 'saving throws', 'rogue skills', 'spell progression', 'turning undead', 'psionics') {
    if ($game_tables{$game_table}) {
      my $name        = $character->{'name'};
      my $table_class = idify($game_table);
      my $break       = $game_table ne 'THAC0' ? '<br>' : '';
      my $table_name  = "$name\'s$break $game_table";
      my $table_id    = idify($table_name);
      push @game_tables_data, { 'id' => $table_id, 'class' => "player_character $table_class", 'caption' => $table_name, 'rows' => $game_tables{$game_table} };
    }
  }
  
  return \@game_tables_data;
}

1;
