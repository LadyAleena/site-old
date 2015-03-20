package RolePlaying::CharacterBuilding::RogueSkills;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(thief_skills bard_skills rogue_skills rogue_skills_table_rows);

# part of the Character Building table printing suite.

use RolePlaying::CharacterBuilding::Class qw(get_level);

my @rogue_skills = ('Pick Pockets','Open Locks','Find/Remove Traps','Move Silently','Hide in Shadows','Detect Noise','Climb Walls','Read Languages','Bribe','Detect Illusion','Detect Magic','Escape Bonds','Tunneling');

sub backstab {
  my $level = shift;
  my $backstab = $level > 13 ? 5 : $level > 8  ? 4 : $level > 4  ? 3 : 2;
  return $backstab;
}

sub read_scroll {
  my $level = shift;
  my $reading = $level >= 10 ? 1 : 0;
  return $reading;
}

sub know_magic_item {
  my $level = shift;
  my $knowing = $level * 5;
  return $knowing;
}

sub influence { 
  my $level = shift;
  my $influence = -1 * int($level / 3);
  return $influence;
}

sub thief_skills {
  my $level = shift;
  my $backstab = backstab($level);

  my $list;
  push @{$list}, "backstab &#215;$backstab";
  push @{$list}, 'can read spell scrolls' if read_scroll($level);
  
  return $list;
}

sub bard_skills {
  my $level = shift;
  my $influence = influence($level);
  my $knowing   = know_magic_item($level);
  
  my $list;
  push @{$list}, "can reduce a crowd's reaction by $influence";
  push @{$list}, "has a $knowing/% chance to know the function of a magic item";
  push @{$list}, 'can inspire companions and give a +1 to attack rolls or saving throws or +2 to morale';
  
  return $list;
}

sub rogue_skills {
  my ($class, $opt) = @_;
  my $level = $opt->{'level'} ? $opt->{'level'} : get_level($class, $opt->{'experience'});

  return thief_skills($level) if $class eq 'thief';
  return bard_skills($level)  if $class eq 'bard';
}

sub rogue_skills_table_rows {
  my %opt = @_;
  my $skills  = $opt{'skills'};

  my $class = ( grep( /(?:thief|bard)/, @{$opt{'classes'}} ) )[0];
  my $other_skills = rogue_skills($class, { 'experience' => $opt{'experience'} });

  my @data_rows;
  for my $skill (@rogue_skills) {
    push @data_rows, [$skill, $skills->{$skill}] if $skills->{$skill};
  }

  my @rows = (
    [ 'header', ['Skill', '%'] ],
    [ 'whead', \@data_rows ],
    [ 'header', [['Other', { 'colspan' => 2 }]] ],
    [ 'data', [[['list', { 'class' => 'info', 'colspan' => 2, 'list' => ['u', $other_skills] }]]] ]
  );

  return \@rows;
}

1;
