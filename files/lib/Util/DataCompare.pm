package Util::DataCompare;
use strict;
use warnings;

use Data::Compare;
use Data::Dumper;

use Exporter qw(import);
our @EXPORT_OK = qw(data_compare);

sub data_compare {
  my ($tab, $data, $old_data, $new_data) = @_;

  my $old = $old_data;
  my $new = $new_data;
  my $main_c = new Data::Compare($old, $new);
  if ($main_c->Cmp == 0) {
    line($tab, $data);

    if (ref($old) eq 'HASH' && ref($new) eq 'HASH') {
      line($tab + 1, 'old to new');
      for (keys %$old) {
        data_compare($tab + 2, $_, $$old{$_}, $$new{$_});
      }
    }
    elsif (ref($old) eq 'ARRAY' && ref($new) eq 'ARRAY') {
      for my $ix ( 0 .. $#{ $old } ) {
        deep_data_compare( map $_->[ $ix ], $old, $new );
      }
    }
    else {
      print Dumper($new);
      print Dumper($old);
    }
  }
}

1;
