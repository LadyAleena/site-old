package Util::FamilyTree;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(make_tree);

my %boxes;
@boxes{qw(l v t)} = map {"&box$_;"} qw(hu hd vh);

sub make_tree {
  my ($read, $opt) = @_;

  $read =~ s/:/&brvbar;/g;
  $read =~ s/(\s|\+|\*|\()-/$1<span style="color:red">-/g;
  $read =~ s/-(\s|\+|\*|\))/-<\/span>$1/g;
  $read =~ s/(?<=\W)-(?=\W)/&boxH;/g;
  $read =~ s/_([lvt])_/_$boxes{$1}_/g;
  $read =~ s/\|/&boxv;/g;
  $read =~ s/_(\s|$)/&boxdl;$1/g;
  $read =~ s/(\s)_/$1&boxdr;/g;
  $read =~ s/_/&boxh;/g;
  $read =~ s/\+/<span style="color:red">&#9829;<\/span>/g;
  $read =~ s/\*/<span style="color:red">&#9830;<\/span>/g;
  
  if ($opt && $opt->{special} eq 'Incarnations') {
    $read =~ s/Niobe/<span style="background:#ccc;">Niobe<\/span>/;
    $read =~ s/Mym/<span style="background:#f99;">Mym<\/span>/;
    $read =~ s/Orb/<span style="background:#9f9;">Orb<\/span>/;
    $read =~ s/Perry/<span style="background:#9ff;">Perry<\/span>/;
    $read =~ s/Norton/<span style="background:#99f;">Norton<\/span>/;
    $read =~ s/Orlene/<span style="background:#f9f;">Orlene<\/span>/;
    $read =~ s/Zane/<span style="background:#ff9;">Zane<\/span>/;
  }
  
  return $read;
}

1;
