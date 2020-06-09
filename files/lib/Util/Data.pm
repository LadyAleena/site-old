package Util::Data;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(
  file_directory file_list data_file
  get_data
  make_hash make_array
  first_alpha alpha_hash alpha_array
  hash_from_arrays
);

use Encode qw(encode);
use File::Basename;
use File::Spec;
use List::Util qw(first);

use Base::Path qw(base_path);

# file_directory returns the directory by type of data wanted.
## The default data directory is 'data'.
## Other options for type are:
### text returns the text file for various pages.
### audio, images, and css return urls.
### imagesd returns the images directory, but not in url format.

sub file_directory {
  my ($dir, $type) = @_;
  $dir =~ s/ /_/g;
  $type = $type ? $type : 'data';
  return base_path($type)."/$dir";
}

# file_list returns a list of the contents in a directory.
## There are two options:
### 'uppercase' returns only files that begin with an initial uppercase letter.
### 'full path' returns the list with the files' full paths.

sub file_list {
  my ($directory, $opt) = @_;

  opendir(my $dir, $directory) || die "Can't open $directory. $!";
  my @files = File::Spec->no_upwards(readdir($dir));
  closedir($dir);
  chomp @files;

  @files = grep { /^\p{uppercase}/ } @files if $opt->{'uppercase'} && $opt->{'uppercase'} =~ /^[yt1]/;
  @files = map  { "$directory/$_" }  @files if $opt->{'full path'} && $opt->{'full path'} =~ /^[yt1]/;

  return @files
}

sub data_file {
  my ($directory, $filename, $opt) = @_;

  my $base = $opt->{'base'} ? $opt->{'base'} : 'data';
  my $ext  = $opt->{'ext'}  ? $opt->{'ext'}  : 'txt';

  my $file_name = basename($0);

  my $root_path = base_path('path');
  my $root_data = base_path($base);

  my $relative_path = File::Spec->abs2rel($file_name, $root_path);
     $relative_path =~ s/\.\w+$//;
     $relative_path =~ s/working(?:\/|\\)//;

  my $data = undef;
  if ($directory && $filename) {
    $data = "$root_data/$directory/$filename";
  }
  elsif ($directory && !$filename) {
    $data = "$root_data/$directory.$ext";
  }
  elsif (!$directory && $filename) {
    $data = "$root_data/$relative_path/$filename";
  }
  else {
    $data = "$root_data/$relative_path.$ext";
  }

  return $data;
}

sub get_data {
  my ($list, $in, $caller) = @_;

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
  open(my $fh, '<:encoding(utf-8)', $file) || die "Can not open $file$!";

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

        my $value = $split == 1 ? [map { $_ =~ s/^ //; $_ } split(/; ?/,$values[$n])] : $values[$n];

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
  open(my $fh, '<:encoding(utf-8)', $file) || die "Can not open $file $!";

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

# The 'article' parameter.
# Without the article parameter:
## the initial articles 'a', 'an', and 'the' will be stripped from the string
## first characters will be converted to uppercase
## place all strings starting with a digit under the '#' key
## place all strings starting with a non-word characters under the '!' key
# With the article parameter, the following will be preserved:
## the initial articles 'a', 'an', and 'the'
## the case of the first characters
## all the other first characters such as digits and initial punctuation

sub first_alpha {
  my ($string, $opt) = @_;

  my $alpha;
  if ($opt->{'article'} && $opt->{'article'} =~ /^[yt1]/i) {
    $alpha = substr($string, 0, 1);
  }
  else {
    $string =~ s/\s*\b(A|a|An|an|The|the)(_|\s)//xi;

    $alpha = uc encode('UTF-8', substr($string, 0, 1));
    if ($alpha =~ /^\d/) {
      $alpha = '#';
    }
    elsif ($alpha !~ /^\p{uppercase}/) {
      $alpha = '!';
    }
  }

  return $alpha;
}

# alpha_hash and alpha_array return a hash with single character keys.

# The original list for alpha_hash is a hash.
# The original list for alpha_array is an array.

sub alpha_hash {
  my ($org_list, $opt) = @_;
  my %alpha_hash;
  for my $org_value (keys %{$org_list}) {
    my $alpha = first_alpha($org_value, $opt);
    $alpha_hash{$alpha}{$org_value} = $org_list->{$org_value};
  }
  return \%alpha_hash;
}

sub alpha_array {
  my ($org_list, $opt) = @_;
  my %alpha_hash;
  for my $org_value (@{$org_list}) {
    my $alpha = first_alpha($org_value, $opt);
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

sub array_from_file {
  my $path = shift;
  open my $fh, '<:encoding(utf-8)', $path;
  my @array;
  while ( my $line = <$fh> ) {
    chomp $line;
    push @array, $line;
  }
  return @array
}

1;
