package Random::RPG::Alignment;
use strict;
use warnings FATAL => ( 'all' );
use Exporter qw(import);
our @EXPORT_OK = qw(random_alignment);

use Fancy::Rand qw(fancy_rand tiny_rand);

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

sub random_alignment {
  my ($user_alignment, $user_additions) = @_;
  my $alignment;
  if ($user_alignment && $user_alignment eq 'full') {
    $alignment = full();
  }
  else{
    $alignment = fancy_rand(\%alignments, $user_alignment, { caller => 'random_alignment', additions => $user_additions ? $user_additions : undef });
  }
  return $alignment;
}

sub full {
  my @prefixes = @{$alignments{'lawful vs chaotic'}};
  my @suffixes = @{$alignments{'good vs evil'}};
  my $prefix = tiny_rand(@prefixes);
  my $suffix = tiny_rand(@suffixes);

  my $alignment;
  if ($prefix eq $suffix) {
    $alignment = "true neutral";
  }
  else {
    $alignment = "$prefix $suffix";
  }

  return $alignment;
}

=head1 NAME

B<Random::RPG::Alignment> selects random alignments for AD&D 2nd Edition from I<Advanced Dungeons & Dragons, Second Edition>.

=head1 SYNOPSIS

To use this module to return a random alignment, use the following.

	use Random::RPG::Alignment qw(random_alignment);

When you want to generate a random alignment with this module, you can choose from any of the alignment axes.

	random_alignment('all');                # returns any two part alignment and is the default setting.
	random_alignment('parts');              # returns lawful, chaotic, good, evil, or neutral.
	random_alignment('good vs evil');       # returns good, neutral, or evil.
	random_alignment('lawful vs chaotic');  # returns lawful, neutral, or chaotic.
	random_alignment('evil');               # returns lawful evil, neutral evil, or chaotic evil.
	random_alignment('good');               # returns lawful good, neutral good, or chaotic good.
	random_alignment('chaotic');            # returns chaotic good, chaotic neutral, or chaotic evil.
	random_alignment('lawful');             # returns lawful good, lawful neutral, or lawful evil.
	random_alignment('neutral lvc');        # returns lawful neutral, true neutral, or chaotic neutral.
	random_alignment('neutral gve');        # returns neutral good, true neutral, or neutral evil.

The default random result is C<random_alignment('all')>.

=head1 AUTHOR

Lady Aleena with lots of help from DrForr, whoppix, and rindolf in the #perlcafe on freenode.

=cut

1;
