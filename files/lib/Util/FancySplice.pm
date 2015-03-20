package Util::FancySplice;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(fancy_splice);

# written with the help of farang and wjw on PerlMonks
sub fancy_splice { 
  my ($amount, @in_list) = @_;
  my @list;
  while (@in_list) {
    push @list,[splice(@in_list,0,$amount)];
  }
  return \@list;
}

=head1 NAME

Util::FancySplice - splice an array into groups.

=head1 SYNOPSIS

  my @colors = ('red', 'orange', 'yellow', 'spring', 'green', 'teal', 'cyan', 'azure',
                'blue', 'violet', 'magenta', 'pink', 'white', 'black', 'gray');
  my $list = fancy_splice(2,@colors);

  [
    ['red','orange'],
    ['yellow','spring'],
    ['green','teal'],
    ['cyan','azure'],
    ['blue','violet'],
    ['magenta','pink'],
    ['white','black'],
    [gray']
  ];

=head1 DESCRIPTION

The C<fancy_splice> function, exported by default, returns a referenced array of arrays spliced by a user specified amount. It takes two paraments: the size of the groups and the list. The size can be any whole number, and the list is an array.

=head1 AUTHOR

Lady Aleena

=cut

1;
