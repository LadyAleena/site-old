package RolePlaying::RacialLanguages;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT = qw(racial_languages);

my %racial_languages = (
  'dwarf'      => [qw(kobold gnome goblin)],
  'high elf'   => [qw(halfling hobgoblin orc gnoll gnome goblin)],
  'grey elf'   => [qw(halfling hobgoblin orc gnoll gnome goblin), 'high elf'],
  'half-elf'   => [qw(halfling hobgoblin orc gnoll gnome goblin), 'high elf'],
  'sylvan elf' => [qw(centaur pixie dryad treant), 'high elf', 'woodland animal'],
  'gnome'      => [qw(dwarf halfing kobold goblin), 'burrowing mammal'],
  'halfling'   => [qw(dwarf elf orc gnome goblin)],
  'ogre mage'  => [qw(ogre)],
  'chaos elemental-kin' => ['planar','Limbo common', qw(eledrin genie imp slaad), "tanar'ri"]
);

sub racial_languages {
  my $race = shift;
  return $racial_languages{$race} ? $racial_languages{$race} : undef;
}

=head1 NAME

B<RolePlaying::RacialLanguages> returns the racial languages for player characters.

=head1 SYNOPSIS

  use RolePlaying::RacialLanguages qw(get_racial_languages);
  
  my $racial_languages = racial_languages('gnome');
  
  [
    'dwarf',
    'halfling',
    'kobold',
    'goblin',
    'burrowing mammal'
  ]

=head1 DESCRIPTION

C<racial_languages> returns the racial languages for characters.

The options are dwarf, high elf, grey elf, sylvan elf, half-elf, gnome, halfling, ogre-mage, and chaos elemental-kin. More racial languages will be added later.

=head1 AUTHOR

Lady Aleena

=cut

1;
