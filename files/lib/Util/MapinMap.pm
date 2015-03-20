package Util::MapinMap;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(map_in_map);

# Written with the help of GotToBTru, RonW, and toolic of Perl Monks.
sub map_in_map {
  my ($opt,$list) = @_;
  map { 
    if (ref($_)) {
      map_in_map($opt,$_);
    }
    else {
      my $before = $opt->{'before'} ? $opt->{'before'}.' ' : '';
      my $after  = $opt->{'after'}  ? ' '.$opt->{'after'}  : '';
      $_ = $before.$_.$after;
    }
  } @{$list};
}

=head1 NAME

Util::MapinMap - map within a map.

=head1 SYNOPSIS

  my $colors = [map_in_map(
                 { 'before => 'glass', 'after' => 'beads' },
                 [map("sparkley $_",('red','yellow','green','cyan','blue','magenta')),'white','black','gray']
               )];
  
  [
    'glass sparkley red beads',
    'glass sparkley yellow beads',
    'glass sparkley green beads',
    'glass sparkley cyan beads',
    'glass sparkley blue beads',
    'glass sparkley magenta beads',
    'glass white beads',
    'glass black beads',
    'glass gray beads'
  ];

=head1 DESCRIPTION

The C<map_in_map> function, exported by default, returns a list of mapped values from a list which already has a map in it. It takes three parameters. The first two are in a hash reference with the values to be mapped before and after the values of the list. The third is a reference to the list.

  map_in_map( { 'before' => $before_value, 'after' => $after_value }, $list_with_a_map_in_it );
 
=head1 AUTHOR

Lady_Aleena

=cut

1;
