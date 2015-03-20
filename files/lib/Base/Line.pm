package Base::Line;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(line rline);

sub rline {
  my ($tab,$line) = @_;
  return q(  ) x $tab.qq($line\n);
}

sub line {
  print rline(@_);
}

1;
