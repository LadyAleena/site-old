package RolePlaying::Monster;
use strict;
use warnings; # FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(monster_info);

use Util::Convert qw(filify);
use Util::Data qw(data_file make_hash);

my @selects = ('Chaos elemental-kin', 'Daemar', 'Dark centaur', 'Demi-lycanthrope', 'Dragod', 'Eldent', 'Gobpry', 'Phase elemental', 'Rainbow dragonette', 'Throglin', 'Tralg', 'Trobold', 'Twarg', 'Zarden');
my @monster_headings = (
  'Monster', 'Climate/Terrain', 'Frequency', 'Organization', 'Activity cycle', 'Diet', 'Intelligence', 'Treasure', 'Alignment', 'No. Appearing', 'Armor Class',
  'Movement', 'Hit Dice', 'THAC0', 'No. of Attacks', 'Damage/Attack', 'Special Attacks', 'Special Defenses', 'Magic Resistance', 'Size', 'Morale', 'XP Value'
);
my @long_values = ('Appearance', 'Combat', 'Habitat/Society', 'Ecology', 'Variants', 'Note');

my $monsters = make_hash(
  'file' => ['Role_playing','Monsters.txt'],
  'headings' => \@monster_headings,
);
$monsters->{'Wild hairs'}{'Monster'} = 'Wild hairs';

sub monster_attributes {
  my ($heading_level, $in_monster) = @_;
  my $monster_data = $in_monster;
  my $attributes;

  for my $attribute (@monster_headings) {
    push @$attributes, qq(<strong class="caps">$attribute:</strong> $monster_data->{$attribute}) if $monster_data->{$attribute};
  }

  return $attributes;
}

sub monster_info {
  my ($heading_level, $in_monster, $opt) = @_;
  my $monster = $monsters->{$in_monster};
     $monster->{attributes} = monster_attributes($heading_level, $monster);

  my $file_name = filify($in_monster);
  my $file = data_file('Role_playing/Monsters', "$file_name.txt");
  open(my $fh, '<', $file) || warn "$file: $!";

  my $heading = 'description';
  my $inc = 0;
  while (my $line = <$fh>) {
    chomp $line;
    next if !$line;

    if ($line =~ /^\! /) {
      my ($marker, $text) = split(/ /, $line, 2);
      $heading = $text if ($opt->{slurp} !~ /^[yt1]/);
      $line =~ s/^\!/$heading_level/ if $heading_level;
      next if !$heading_level;
    }
    push @{$monster->{$heading}}, $line;
  }
  return $monster;
}

1;
