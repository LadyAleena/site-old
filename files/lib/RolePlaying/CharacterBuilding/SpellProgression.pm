package RolePlaying::CharacterBuilding::SpellProgression;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(get_spells spell_progression_table_rows);

# part of the Character Building table printing suite.

use List::Util qw(max);

use Base::Data qw(data_file get_hash);
use HTML::Elements qw(anchor);
use Util::Convert qw(filify searchify);
use RolePlaying::CharacterBuilding::Class qw(convert_class get_level);

my @classes = qw(wizard priest paladin ranger bard theopsyelementalist);
my $choices = join(', ',@classes);

sub get_spells {
  my ($class, $opt) = @_;
  
  my $spell_progression;
  if (ref($class) eq 'ARRAY') {
    for (@{$class}) {
      $spell_progression->{$_} = get_spells($_, $opt);
    }
  }
  else {
    $class = convert_class($class, 'SpellProgression');
    my $level = $opt->{'level'} ? $opt->{'level'} : get_level($class, $opt->{'experience'});

    my $file = data_file('Role_playing/Classes/Spell_progression',"$class.txt");

    if (-f $file) {
      my $spell_progression_table = get_hash(
        'file' => $file,
        'headings' => ['level',1..9],
      );

      my $max_available_level = max(keys %$spell_progression_table);
      
      if ($level > $max_available_level) {
        $level = $max_available_level;
        $spell_progression_table->{$level}{'note'} = "I only have spell progression up to level $level.";
      }
      
      $spell_progression = $spell_progression_table->{$level};
    }
  }
 
  return $spell_progression ? $spell_progression : undef;
}

sub spell_progression_table_rows {
  my %opt = @_;
  my $name    = $opt{'name'};
  my $classes = $opt{'classes'};

  my $spell_progression = get_spells($classes, { 'experience' => $opt{'experience'} });
  my @classes = grep( defined( $$spell_progression{$_} ), @$classes );

  my @headings = ('Level', map( ucfirst, @classes ));
  my @data_rows;
  for my $level (1..9) {
    my @spells = map(defined $$spell_progression{$_}{$level} ? $$spell_progression{$_}{$level} : '', @classes);
    push @data_rows, [$level,@spells] if grep(length,@spells);
  }

  my @rows = (
    [ 'header', [\@headings] ],
    [ 'whead', \@data_rows ]
  );
  my $colspan = scalar(@classes) + 1;
  if (-f data_file('Role_playing/Player_characters/spellbooks',filify($name).'.txt')) {
    my $searchname   = searchify($name);
    my $spellbook = anchor("$name\'s spellbook", { 'href' => "../../../Role_playing/Player_characters/Spellbooks.pl?spellbook=$searchname" });
    push @rows, [ 'header', [[['Spellbook', { 'colspan' => $colspan }]]] ];
    push @rows, [ 'data', [[[$spellbook, { 'colspan' => $colspan }]]] ];
  }

  return \@rows;
}

1;
