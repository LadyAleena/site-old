package RolePlaying::Monster;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(print_monster);

use CGI::Carp qw(fatalsToBrowser);
use File::Basename;

use Base::Data qw(get_hash);
use HTML::Elements qw(section heading paragraph table list);
use Util::Convert qw(textify);

my @monster_headings = ('Monster','Climate/Terrain','Frequency','Organization','Activity cycle','Diet','Intelligence','Treasure','Alignment','No. Appearing','Armor Class','Movement','Hit Dice','THAC0','No. of Attacks','Damage/Attack','Special Attacks','Special Defenses','Magic Resistance','Size','Morale','XP Value','Appearance','Combat','Habitat/Society','Ecology','Variants','Note');
my $monsters = get_hash(
  'file' => ['Role_playing','Monsters.txt'],
  'headings' => \@monster_headings,
);

my %rainbow_dragonette;
my %rainbow_dragonette_headings = (
  'odf' => ['Color','Breath Weapon','Range','Immunities'],
  'age' => ['Age','Body Lgt. (")','Tail Lgt. (")','AC','Breath Weapon','Spells Wizard','MR','Treas. Type','XP Value'],
);

for my $param ('odf','age') {
  $rainbow_dragonette{$param} = get_hash(
    'file'     => ['Role_playing/Monsters',"Rainbow_dragonette_$param.txt"],
    'headings' => \@{$rainbow_dragonette_headings{$param}},
    'sorted'   => 'yes',
  );
}

sub dragonette_table {
  my ($var) = @_;

  my @rows;
  for my $row (sort { $a->{'sort number'} <=> $b->{'sort number'} } values %{$rainbow_dragonette{$var}}) {
    push @rows, [map($row->{$_} ? $row->{$_} : '', @{$rainbow_dragonette_headings{$var}})];
  }
  table(4, { class => 'rainbow_dragonette', rows => [['header',$rainbow_dragonette_headings{$var}],['data',\@rows]] });
}

my $sub_hash = {
  'odf_table' => sub { dragonette_table('odf') },
  'age_table' => sub { dragonette_table('age') },
};

sub print_monster {
  my ($user_monsters) = @_;
  my @monsters = $user_monsters ? @$user_monsters : textify((basename($0)));
  my @long_values = ('Appearance','Combat','Habitat/Society','Ecology','Variants','Note');
  section(3, sub {
    my $columns = @monsters > 1 ? 'multi' : 'two';
    for my $monster (@monsters) {
      my @items;
      for my $key (grep($_ !~ join('|',@long_values),@monster_headings)) {
        push @items, $monsters->{$monster}{$key} ? [qq(<strong>$key:</strong> $monsters->{$monster}{$key}), { class => 'monster_attribute' }] : '';
      }
      list(4,'u',\@items, { class => "monster $columns" });
    }
  });
  for my $monster (@monsters) {
    my $heading_level = 2;
    my $heading = @monsters > 1 ? $monster : undef;
    section(3, sub {
      $heading_level++ if @monsters > 1;
      for my $long_key (@long_values) {
        next if !$monsters->{$monster}{$long_key};
        heading(5,$heading_level,$long_key);
        for my $line (split(/\\/,$monsters->{$monster}{$long_key})) {
          if ($line =~  s/&//) {
            $sub_hash->{$line}->();
          }
          else {
            paragraph(6,$line);
          }
        }
      }
    }, { 'heading' => $heading ? [ $heading_level, $heading ] : undef });
  }
}

1;
