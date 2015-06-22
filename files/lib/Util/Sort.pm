package Util::Sort;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(article_sort name_sort short_sorts split_sort);

use HTML::Entities qw(decode_entities);

sub split_out_leading_number {
    my $s = shift;
    if ( $s =~/^((\d|,|\.)+)(.*)$/) {
        my ($leading_number, $rest) = ($1,$3);
        # Take any commas out of the number.
        $leading_number =~ s/,//g;
        return ($leading_number, $rest);
    }

    die "split_out_leading_number received bogus input '$s'!\n";
}

# Written by roboticus on PerlMonks.
# When sorting lists of files, I want the index file to always come first.
# There may be an index file in a folder of files I want sorted by name.
sub my_index_sort {
    my ($c, $d) = @_;
    # We want any item starting with "index." to sort to the top of
    # the list.  The rest of the ordering is handled by the caller.
    # So there are four cases we must handle:
    #
    #   Matches?
    #   $c    $d   return
    #   No    No     0 
    #   Yes   No    -1
    #   No    Yes   +1
    #   Yes   Yes    0     (-1 + +1 == 0)
    #
    # In the fourth case, when both strings have the "index." prefix,
    # we want them to sort via the normal method so that "index.1" will
    # always sort before "index.2".

    my $return_value = 0;
    --$return_value  if $c =~ /^index\./;
    ++$return_value  if $d =~ /^index\./;
    return $return_value;
}

# This is the default sorting method.
# Written first with the help of kent/n in #perl on freenode,
# then later roboticus on PerlMonks.
sub article_sort {
  my ($c,$d) = @_;

  my $t = my_index_sort($c, $d);
  return $t if $t;

  for ($c, $d) {
    s/<.+?>//g; # Strip out any html tags.
    s/\s*\b(A|a|An|an|The|the)(_|\s)//xi; # Strip off leading articles (in English).
    s/\((.+)\)/$1/g;
    decode_entities($_);
  }
  if ( $c =~/^((\d|,|\.)+)(.*)$/ && $d =~ /^((\d|,|\.)+)(.*)$/) {
    my ($num1, $text1) = split_out_leading_number($c);
    my ($num2, $text2) = split_out_leading_number($d);

    # First compare the numbers, then compare the remaining parts of the string.
    $num1 <=> $num2 || $text1 cmp $text2
  }
  else {
    $c cmp $d;
  }
}

sub name_sort {
  my ($c,$d) = @_;

  my $t = my_index_sort($c, $d);
  return $t if $t;

  # When I sort by name I prefer lastname firstname.
  # I have not yet written this to account for Sr., Jr., or Roman numerals after the last name.
  
  for ($c,$d) {
    s/ (?:Jr.|Sr.)$//;
    $_ = join(' ', (reverse split(/(?:_|\s)(?=[^_\s]+$)/, $_, 2))) if $_ !~ /^_/;
    s/^_//;
    s/\s*\b(A|a|An|an|The|the)(_|\s)//xi; # Strip off leading articles (in English).
    s/<.+?>//g; # Strip out any html tags.
    s/\|.+$//;
    decode_entities($_);
  }
  return $c cmp $d;
}

sub short_sorts {
  my ($a,$b,$type) = @_;
  
  # Legend:
  # s = case sensitive
  # i = case insensitive
  # a = ascending
  # d = descending
  # r = reverse (right to left)
  # n = numbers
  # l = length of value
  
  my %sorts;
  $sorts{$_} = sub { $_[0] cmp $_[1] } for qw(sa as);
  $sorts{$_} = sub { $_[1] cmp $_[0] } for qw(sd ds);
  $sorts{$_} = sub { uc $_[0] cmp uc $_[1] } for qw(ia ai);
  $sorts{$_} = sub { uc $_[1] cmp uc $_[0] } for qw(id di);
  $sorts{$_} = sub { $_[0] <=> $_[1] } for qw(na an);
  $sorts{$_} = sub { $_[1] <=> $_[0] } for qw(nd dn);
  $sorts{$_} = sub { reverse($_[0]) cmp reverse($_[1]) } for qw(sar sra asr ars rsa ras);
  $sorts{$_} = sub { reverse($_[1]) cmp reverse($_[0]) } for qw(sdr srd dsr drs rsd rds);
  $sorts{$_} = sub { uc reverse($_[0]) cmp uc reverse($_[1]) } for qw(iar ira air ari ria rai);
  $sorts{$_} = sub { uc reverse($_[1]) cmp uc reverse($_[0]) } for qw(idr ird dir dri rid rdi);
  $sorts{$_} = sub { reverse $_[0] <=> reverse $_[1] } for qw(nar nra anr arn rna ran);
  $sorts{$_} = sub { reverse $_[1] <=> reverse $_[0] } for qw(ndr nrd dnr drn rnd rdn);
  $sorts{$_} = sub { length($_[0]) <=> length($_[1]) } for qw(la al);
  $sorts{$_} = sub { length($_[1]) <=> length($_[0]) } for qw(ld dl);
  
  if ($type) {
    die "$type is not supported" if !exists $sorts{$type};
    return $sorts{$type}->($a,$b);
  }
  else {
    die "A sort type was not selected.";
  }
}

sub split_sort {
  my ($in_a, $in_b, $split, $sort_type) = @_;
  $split = qr($split);
  
  my ($numa1, $numa2) = split(/$split/, $in_a);
  my ($numb1, $numb2) = split(/$split/, $in_b);
  
  if ($sort_type =~ /^num/) {
    $numa1 <=> $numb1 || $numa2 <=> $numb2
  }
  elsif ($sort_type =~ /^(alpha|letter)/) {
    $numa1 cmp $numb1 || $numa2 cmp $numb2
  }
}

1;
