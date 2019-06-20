package Util::Data;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(
  file_list file_directory data_file get_data
  make_hash make_array
  first_alpha alpha_hash alpha_array
  hash_from_arrays
);

use File::Basename;
use File::Spec;
use List::Util qw(first);

use Base::Path qw(base_path);

sub file_list {
  my ($directory, $opt) = @_;

  opendir(my $dir, $directory) || die "Can't open $directory $!";
  my @contents = File::Spec->no_upwards(readdir($dir));
  closedir($dir);
  chomp @contents;

  @contents = map("$directory/$_", @contents) if $opt->{'full path'} && $opt->{'full path'} =~ /^[yt1]/;

  return @contents
}

sub file_directory {
  my ($dir, $type) = @_;
  $dir =~ s/ /_/g;
  $type = $type ? $type : 'data';
  return base_path($type)."/$dir";
}

sub data_file {
  my ($directory, $filename) = @_;

  my $file_name = basename($0);

  my $root_path = base_path('path');
  my $root_data = base_path('data');

  my $relative_path = File::Spec->abs2rel($file_name, $root_path);
     $relative_path =~ s/\.\w+$//;
     $relative_path =~ s/working(?:\/|\\)//;

  my $data = undef;
  if ($directory && $filename) {
    $data = "$root_data/$directory/$filename";
  }
  elsif ($directory && !$filename) {
    $data = "$root_data/$directory.txt";
  }
  elsif (!$directory && $filename) {
    $data = "$root_data/$relative_path/$filename";
  }
  else {
    $data = "$root_data/$relative_path.txt";
  }
  
  return $data;
}

sub get_data {
  my ($list, $in) = @_;

  my $out = undef;
  if ($in =~ /^(help|options)$/) {
    $out = "Your options are:
      'data' to get the hash
      'keys' to get the list of hash keys
      'key name' to get its data";
  }
  elsif (ref($list) eq 'HASH' && $in eq 'keys') {
    $out = [keys %$list];
  }
  elsif (ref($list) eq 'HASH' && $list->{$in}) {
    $out = $list->{$in};
  }
  elsif (ref($list) eq 'ARRAY' && $list->[$in]) {
    $out = $list->[$in];
  }
  elsif (!$in || $in eq 'data') {
    $out = $list;
  }
  
  return $out;
}

# Written with rindolf in #perlcafe on freenode; golfed with the help of [GrandFather] of PerlMonks.
# Changed to accept named parameters to make it prettier to use.
# The parameters are file and headings for make_hash and make_array.
sub make_hash {
  my %opt = @_;
  my $file = $opt{'file'} && ref($opt{'file'}) eq 'ARRAY' ? data_file(@{$opt{'file'}}) : $opt{'file'};
  open(my $fh, '<', $file) || die "Can not open $file $!";

  my @headings = $opt{'headings'} ? @{$opt{'headings'}} : ('heading');

  my %hash;
  while (my $line = <$fh>) {
    chomp $line;
    die "This file is not for Util::Data! Stopped $!" if $line =~ /no Util::Data/i;

    my @values = split(/\|/,$line);
    my $key = scalar @headings > 1 ? $values[0] : shift @values;

    my $n = 0;
    for my $r_heading (@headings) {
      if (defined($values[$n]) && length($values[$n]) > 0) {
        my $split = $r_heading =~ /\+$/ ? 1 : 0;
        (my $heading = $r_heading) =~ s/\+$//;

        my $value = $split == 1 ? [map { $_ =~ s/^ //; $_ } split(/;/,$values[$n])] : $values[$n];

        if (scalar @headings > 1) {
          $hash{$key}{$heading} = $value;
        }
        else {
          $hash{$key} = $value;
        }
      }
      $n++;
    }
  }
  return \%hash;
}

sub make_array {
  my %opt = @_;
  my $file = $opt{'file'} && ref($opt{'file'}) eq 'ARRAY' ? data_file(@{$opt{'file'}}) : $opt{'file'};
  open(my $fh, '<', $file) || die "Can not open $file $!";

  my @array;
  while (my $line = <$fh>) {
    chomp $line;
    die "This file is not for Util::Data! Stopped $!" if $line =~ /no Util::Data/i;

    my %hash;
    my @values = split(/\|/,$line);
    @hash{@{$opt{'headings'}}} = @values;

    push @array, \%hash;
  }
  return \@array;
}

# start alpha section

sub first_alpha {
  my $string = shift;
  $string =~ s/\s*\b(A|a|An|an|The|the)(_|\s)//xi;

  my $alpha = uc substr($string, 0, 1);
  if ($alpha =~ /^\d/) {
    $alpha = '#';
  }
  elsif ($alpha !~ /^\p{uppercase}/) {
    $alpha = '!';
  }
  return $alpha;
}

# alpha_hash and alpha_array return a hash with single character keys.

# The list for alpha_hash is a hash.
# The list for alpha_array is an array.

# Both have the 'article' option.
# Without the article option:
## articles 'a', 'an', and 'the' will be stripped from the beginning of the strings
## first characters will be converted to uppercase
## place all strings starting with a digit under the '#' key
## place all strings starting with a non-word characters under the '!' key
# With the article option, the following will be preserved:
## articles 'a', 'an', and 'the'
## the case of the first characters
## all the other first characters such as digits and initial punctuation

sub alpha_hash {
  my ($org_list, $opt) = @_;
  my %alpha_hash;
  for my $org_value (keys %{$org_list}) {
    my $alpha = $opt->{article} && $opt->{article} =~ /^[yt1]/i ? substr($org_value, 0, 1) : first_alpha($org_value);
    $alpha_hash{$alpha}{$org_value} = $org_list->{$org_value};
  }
  return \%alpha_hash;
}

sub alpha_array {
  my ($org_list, $opt) = @_;
  my %alpha_hash;
  for my $org_value (@{$org_list}) {
    my $alpha = $opt->{article} && $opt->{article} =~ /^[yt1]/i ? substr($org_value, 0, 1) : first_alpha($org_value);
    push @{$alpha_hash{$alpha}}, $org_value;
  }
  return \%alpha_hash;
}

# end alpha section

sub hash_from_arrays {
  my ($keys, $values) = @_;

  my %hash;
  @hash{@$keys} = @$values;
  return \%hash;
}

1;
