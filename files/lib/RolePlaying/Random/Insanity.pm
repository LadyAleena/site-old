package RolePlaying::Random::Insanity;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random_mental_condition);

sub random_mental_condition {
  my @disorder = (
    map("${_}active",qw(hypo hyper)),
    map("$_ psychosis",qw(hallucinatory delusional)),
    'amnesia','anxiety','catatonia','dementia','fugue','manic','melancholy','obsessive-compulsive','panic','paranoia','schizophrenia','split personality'
  );
  return $disorder[rand @disorder];
}

1;
