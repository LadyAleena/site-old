package RolePlaying::RacialLanguages;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT = qw(get_racial_languages);

use Base::Data qw(data_file);

my %racial_languages = (
  'dwarf'      => [qw(kobold gnome goblin)],
  'high elf'   => [qw(halfling hobgoblin orc gnoll gnome goblin)],
  'grey elf'   => [qw(halfling hobgoblin orc gnoll gnome goblin), 'high elf'],
  'half-elf'   => [qw(halfling hobgoblin orc gnoll gnome goblin), 'high elf'],
  'sylvan elf' => [qw(centaur pixie dryad treant), 'high elf', 'woodland animal'],
  'gnome'      => [qw(dwarf halfing kobold goblin), 'burrowing mammal'],
  'halfling'   => [qw(dwarf elf orc gnome goblin)],
  'ogre-mage'  => [qw(ogre)],
  'chaos elemental-kin' => ['planar','Limbo common']
);

sub get_racial_languages {
  my $race = shift;
  return $racial_languages{$race};
}

1;
