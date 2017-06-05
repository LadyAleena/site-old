package Fancy::Functions;
use strict;
use warnings;
use Exporter qw(import);

use Fancy::Map               qw(fancy_map);
use Fancy::Rand              qw(fancy_rand fancy_rand_from_array);
use Fancy::Splice            qw(fancy_splice);
use Fancy::Split             qw(fancy_split);
use Fancy::Join::Defined     qw(join_defined);
use Fancy::Join::Grammatical qw(grammatical_join);

our @EXPORT_OK = qw(
  fancy_map
  fancy_rand
  fancy_rand_from_array
  fancy_splice
  fancy_split
  join_defined
  grammatical_join
);

1;
