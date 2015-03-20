package Fun::AstroBody;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(astro_body);

sub astro_body {
  my @astronomical_body = qw(world sun moon star comet);
  my %astronomical_adjectives = (
    star => ['', qw(falling twinkling)],
    moon => ['', qw(full cresent new harvest blue)],
  );
  
  my $a_body = $astronomical_body[rand @astronomical_body];

  if ($astronomical_adjectives{$a_body}) {
    my $a_adj = ${$astronomical_adjectives{$a_body}}[rand @{$astronomical_adjectives{$a_body}}];
    return length $a_adj ? "$a_adj $a_body" : $a_body;
  }
  else {
    return $a_body;
  }
}

1;
