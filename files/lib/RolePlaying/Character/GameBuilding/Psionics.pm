package RolePlaying::Character::GameTable::Psionics;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(psionics_by_level psionics_table_rows);

use Base::Data qw(make_hash);
use RolePlaying::Character::Class qw(class_level);

# part of the Character Building table suite.

sub psionics_by_level {
  my ($class, $opt) = @_;
  my $level = $opt->{'level'} ? $opt->{'level'} : class_level($class, $opt->{'experience'});
  
  my $psionics = make_hash( 
    'file' => ['Role_playing/Classes/Psionics', 'progression.txt'],
    'headings' => ['level', 'disciplines', 'sciences', 'devotions', 'defense modes'],
  );

  return $psionics->{$level} ? $psionics->{$level} : undef;
}

sub psionics_table_rows {
  my %opt = @_;
  my $xp  = $opt{'experience'};

  my $psionics = psionics_by_level('psionisist', { 'experience' => $xp });
  my @data_rows;
  push @data_rows, [ucfirst $_, $psionics->{$_}] for ('disciplines', 'sciences', 'devotions', 'defense modes');
  
  my @rows = (
    ['header', [['&nbsp;','Amount']]],
    ['whead', \@data_rows]
  );

  return \@rows;
}

1;
