package RolePlaying::Character::Alignment;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(random_alignment expand_alignment);

my %alignments = (
  'parts'             => [qw(lawful chaotic good evil neutral)],
  'good vs evil'      => [qw(good neutral evil)],
  'lawful vs chaotic' => [qw(lawful neutral chaotic)],
);

$alignments{'evil'} = [map( "$_ evil", @{$alignments{'lawful vs chaotic'}} )];
$alignments{'good'} = [map( "$_ good", @{$alignments{'lawful vs chaotic'}} )];
$alignments{'chaotic'} = [map( "chaotic $_", @{$alignments{'good vs evil'}})];
$alignments{'lawful'}  = [map( "lawful $_",  @{$alignments{'good vs evil'}})];
$alignments{'neutral lvc'} = [map( "$_ neutral", grep {$_ ne "neutral"} @{$alignments{'lawful vs chaotic'}} ), "true neutral"];
$alignments{'neutral gve'} = [map( "neutral $_", grep {$_ ne "neutral"} @{$alignments{'good vs evil'}} ),      "true neutral"];

sub full {
  my @prefixes = @{$alignments{'lawful vs chaotic'}};
  my @suffixes = @{$alignments{'good vs evil'}};
  my $prefix = $prefixes[rand @prefixes];
  my $suffix = $suffixes[rand @suffixes];

  my $alignment;
  if ($prefix eq $suffix) {
    $alignment = "true neutral";
  }
  else {
    $alignment = "$prefix $suffix";
  }

  return $alignment;
}

sub random_alignment {
  my $type = shift;
  my $axis = $type ? $type : 'any';

  my $alignment;
  if (exists $alignments{$axis}) {
    $alignment = $alignments{$axis}[rand @{$alignments{$axis}}];
  }
  else {
    $alignment = full;
  }

  return $alignment;
}

sub expand_alignment {
  my ($var) = @_;
  $var = uc $var;
  $var =~ s/^(-\w|\w\+|\w\(\w\)|\w)(-\w|\w\+|\w\(\w\)|\w)$/$1 and $2/;
  $var =~ s/\((\w)\)/ with $1 tendencies/g;
  $var =~ s/(\w)\+/true $1/g;
  $var =~ s/-/non-/g;
  $var =~ s/T N/true neutral/;
  $var =~ s/N/neutral/g;
  $var =~ s/L/lawful/;
  $var =~ s/C/chaotic/;
  $var =~ s/G/good/;
  $var =~ s/E/evil/;
  $var =~ s/^(\w+) and (\w+)$/$1 $2/;
  return $var;
}

=head1 NAME

B<RolePlaying::Character::Alignment> expands and generates random alignments for AD&D 2nd Edition.

=head2 Use to get a random alignment

To use this module to return a random alignment, use the following.

	use RolePlaying::Character::Alignment qw(random_alignment);

When you want to generate a random alignment with this module, you can choose from any of the alignment axes.

	random_alignment('parts');              # returns lawful, chaotic, good, evil, or neutral.
	random_alignment('good vs evil');       # returns good, neutral, or evil.
	random_alignment('lawful vs chaotic');  # returns lawful, neutral, or chaotic.
	random_alignment('evil');               # returns lawful evil, neutral evil, or chaotic evil.
	random_alignment('good');               # returns lawful good, neutral good, or chaotic good.
	random_alignment('chaotic');            # returns chaotic good, chaotic neutral, or chaotic evil.
	random_alignment('lawful');             # returns lawful good, lawful neutral, or lawful evil.
	random_alignment('neutral lvc');        # returns lawful neutral, true neutral, or chaotic neutral.
	random_alignment('neutral gve');        # returns neutral good, true neutral, or neutral evil.
	random_alignment('any');                # returns any two part alignment and is the default setting.

The default random result is C<random_alignment('any')>.

=head2 Use to expand alignment abbreviations

To use this module to expand alignment abbreviations from their two character forms.

  use RolePlaying::Character::Alignment qw(expand_alignment);

Samples...

  expand_alignment('CG')                # returns "chaotic good".
  expand_alignment('LE')                # returns "lawful evil".

There is no default for expand_alignment.

=head2 Authors

Lady Aleena with lots of help from DrForr, whoppix, and rindolf in the #perlcafe on freenode.

=cut

1;
