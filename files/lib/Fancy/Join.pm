package Fancy::Join;
use strict;
use warnings;
use Exporter qw(import);

use Fancy::Join::Defined     qw(join_defined);
use Fancy::Join::Grammatical qw(grammatical_join);

our @EXPORT_OK = qw(
  join_defined
  grammatical_join
);

1;
