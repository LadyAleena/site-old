package RolePlaying::CharacterBuilding::Psionics;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(get_psionics psionics_table_rows);

# part of the Character Building table printing suite.

use Base::Data qw(get_hash);
use RolePlaying::CharacterBuilding::Class qw(get_level);

sub get_psionics {
  my ($class, $opt) = @_;
  my $level = $opt->{'level'} ? $opt->{'level'} : get_level($class, $opt->{'experience'});
  
  my $psionics = get_hash( 
    'file' => ['Role_playing/Classes/Psionics','progression.txt'],
    'headings' => ['level','disciplines','sciences','devotions','defense modes'],
  );

  return $psionics->{$level} ? $psionics->{$level} : undef;
}

sub psionics_table_rows {
  my %opt = @_;
  my $xp  = $opt{'experience'};

  my $psionics = get_psionics('psionisist', { 'experience' => $xp });
  my @data_rows;
  push @data_rows, [ucfirst $_, $psionics->{$_}] for ('disciplines','sciences','devotions','defense modes');
  
  my @rows = (
    ['header',['&nbsp;','Amount']],
    ['whead',\@data_rows]
  );

  return \@rows;
}

1;
