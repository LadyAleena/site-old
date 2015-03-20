package Fun::ConvertFileSize;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(convert_filesize random_filesize);

use List::MoreUtils qw(firstidx apply);

use Util::Number qw(pretty_number);

=head1 Filesize converter

This script converts one filesize to another filesize like gigabytes to kilobytes and the reverse.
There is also a random filesize generator included for fun.

=head2 Author(s)

Lady_Aleena with lots of help from PerlMonks.

=head2 Usage

To use this script, please use the following.

  convert_filesize(
    size => 10101101,
    from => 'megabytes',
    to => 'kb',
    decimals => 2,
    base => 1000,
  );
  print $conversion;

size is the original size you want to convert and is required.

from is the filesize name you want to convert from and is required.

to is the filesize name you want to convert to and is required.

decimals is the how many decimals you want returned. Conversions from smaller to larger can lead to a lot of decimals places. The default is 0.

base is how many of a smaller is in a larger. Some use 1024 as the base while others use 1000. Default is 1024.

=head3 from and to

For the from and to fields, you do not have to worry about case.

  byte(s) or bb
  kilobyte(s) or kb
  megabyte(s) or mb
  gigabyte(s) or gb
  terabyte(s) or tb
  petabyte(s) or pb
  exabyte(s) or eb
  zettabyte(s) or zb
  yottabyte(s) or yb

  
=head2 Random

To use the random generator if you happen to have a secret agent protecting a file of a size you don't feel like coming up with, you'd do...

  my $random_filesize = random_filesize();
  
You could get anything from a bit to a yottabyte.
=cut

local $\ = "\n";

my @filesize_names = qw(bit nibble byte kilobyte megabyte gigabyte terabyte petabyte exabyte zettabyte yottabyte);

# I put the these sizes here just for my information.
my %little_filesizes;
$little_filesizes{bit} = 1;
$little_filesizes{nibble} = $little_filesizes{bit} * 4;
$little_filesizes{byte} = $little_filesizes{bit} * 8;

# I never know when I'll want a random file size.
sub random_filesize {
  return $filesize_names[rand @filesize_names]
}

sub make_singular {
  my $word = shift;
     $word =~ s/s$//;
  my @short_sizes = apply {$_ =~ s/^(\w)\w{1,}$/$1b/} @filesize_names;
  if (grep(/^\L$word\E$/,@short_sizes)) {
    $word = $filesize_names[firstidx { $_ eq lc $word } @short_sizes];
  }
  return $word;
}

# from tye: my %hash; @hash{@sizes} = 0..$#sizes;
# from MidLifeXis: $result = $original * $units{$inmultiplier} / $units{$outmultiplier}

sub convert_filesize {
  my %opt = @_;

  # I took out bits and nibbles just to keep me sane.
  my @filesizes = grep($_ =~ /byte/,@filesize_names);
  
  my $from = firstidx { $_ eq make_singular($opt{from}) } @filesizes;
  my $to   = firstidx { $_ eq make_singular($opt{to}) } @filesizes;
  my $dec  = $opt{decimals} ? $opt{decimals} : 0;
  my $base = $opt{base} ? $opt{base} : 1024;
  
  my ($diff,$converted);
  
  if ( $from > $to ) {
    $diff = $from - $to;
    $converted = $opt{size} * ($base ** $diff);
  }
  elsif ( $to > $from ) {
    $diff = $to - $from;
    $converted = $opt{size} / ($base ** $diff);
  }
  else {
    $converted = $opt{size};
  }
  
  my $org_filesize = pretty_number($dec,$opt{size});
  my $new_filesize = pretty_number($dec,$converted);
  return "$org_filesize $opt{from} is $new_filesize $opt{to}";
}
1;
