package RolePlaying::Monster;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(print_monster);

use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use IO::All;

use Base::Page qw(passage);
use Base::Data qw(get_hash get_array data_file);
use HTML::Elements qw(section list table);
use Util::Convert qw(filify textify);

my @monster_headings = ('Monster','Climate/Terrain','Frequency','Organization','Activity cycle','Diet','Intelligence','Treasure','Alignment','No. Appearing','Armor Class','Movement','Hit Dice','THAC0','No. of Attacks','Damage/Attack','Special Attacks','Special Defenses','Magic Resistance','Size','Morale','XP Value');
my $monsters = get_hash(
  'file' => ['Role_playing','Monsters.txt'],
  'headings' => \@monster_headings,
);
my @long_values = ('Appearance','Combat','Habitat/Society','Ecology','Variants','Note');

my %multi_monsters = (
  'Throglin' => ['Throglin','Freshwater throglin','Saltwater throglin'],
  'Tralg'    => ['Arctic tralg','Desert tralg','Two-headed tralg'],
  'Twarg'    => ['Hill twarg','Mountain twarg','Jungle twarg'],
);

my %rainbow_dragonette;
my %rainbow_dragonette_headings = (
  'odf' => ['Color','Breath Weapon','Range','Immunities'],
  'age' => ['Age','Body Lgt. (")','Tail Lgt. (")','AC','Breath Weapon','Spells Wizard','MR','Treas. Type','XP Value'],
);

for my $param ('odf','age') {
  $rainbow_dragonette{$param} = get_array(
    'file'     => ['Role_playing/Monsters',"Rainbow_dragonette_$param.txt"],
    'headings' => \@{$rainbow_dragonette_headings{$param}},
  );
}

sub dragonette_table {
  my ($var) = @_;

  my @rows;
  for my $row (@{$rainbow_dragonette{$var}}) {
    push @rows, [map($row->{$_}, @{$rainbow_dragonette_headings{$var}})];
  }
  table(4, { class => 'rainbow_dragonette centered', rows => [['header', [$rainbow_dragonette_headings{$var}]], ['data', \@rows]] });
}

my $doc_magic = {
  'odf_table' => sub { dragonette_table('odf') },
  'age_table' => sub { dragonette_table('age') },
};

sub print_monster {
  my ($in_monster) = @_;
  my $in_monsters = $multi_monsters{$in_monster} ? $multi_monsters{$in_monster} : [$in_monster];
  my @monsters = @$in_monsters;
  my $columns = @monsters > 1 ? 'multi' : 'two';
  my @lists;
  my @passages;
  for my $monster (@monsters) {
    my $heading_level = 2;
    my $heading = @monsters > 1 ? [ $heading_level, $monster ] : undef;
    $heading_level++ if @monsters > 1;
    
    my @items;
    for my $key (@monster_headings) {
      push @items, $monsters->{$monster}{$key} ? [qq(<strong class="caps">$key:</strong> $monsters->{$monster}{$key}), { class => 'monster_attribute' }] : '';
    }
    push @lists, [\@items, $columns];
    
    my $file = filify($monster).'.txt';
    my @file_lines = io(data_file('Role_playing/Monsters',$file))->slurp;
    chomp @file_lines;

    my %long_fields;
    @long_fields{@long_values} = @file_lines;

    my @lines;
    for my $value (@long_values) {
      next if !$long_fields{$value};
      my @in_lines = split(/\\/, $long_fields{$value});
      unshift @in_lines, "$heading_level $value";
      push @lines, @in_lines;
    }
    push @passages, [$heading, \@lines];
  }

  section(3, sub {
    for my $list (@lists) {
      list(4, 'u', $list->[0], { class => "monster $list->[1]" });
    }
  });
  for my $passage (@passages) {
    section(3, sub {
      passage(4, $passage->[1], { 'doc magic' => $doc_magic });
    }, { heading => $passage->[0] });
  }
}

1;
