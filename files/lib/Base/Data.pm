package Base::Data;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(file_list data_directory data_file get_data get_hash get_array alpha_hash alpha_array hash_from_arrays);

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

sub data_directory {
  my ($dir) = @_;
  $dir =~ s/ /_/g;
  return base_path('data')."/$dir";
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
  my ($list, $in, $caller) = @_;

  my $out = undef;
  if ($in =~ /^(?:help|options)$/) {
    $out = "Your options are:
      'data' to get the hash
      'keys' to get a list of keys
      or a specific key name to get its data";
  }
  elsif ($in eq 'data') {
    $out = $list;
  }
  elsif ($in eq 'keys') {
    $out = [keys %$list];
  }
  elsif ($list->{$in}) {
    $out = $list->{$in};
  }
  return $out;
}

# Written with rindolf in #perlcafe on freenode; golfed with the help of [GrandFather] of PerlMonks.
# Changed to accept named parameters to make it prettier to use.
# The parameters are file and headings.
sub get_hash {
  my %opt = @_;
  my $file = $opt{'file'} && ref($opt{'file'}) eq 'ARRAY' ? data_file(@{$opt{'file'}}) : $opt{'file'};
  open(my $fh, '<', $file) || die "Can not open $file $!";

  my %hash;
  while (my $line = <$fh>) {
    chomp $line;
    die "This file is not for Base::Data! Stopped $!" if $line =~ /no Base::Data/i;
    my @headings = $opt{'headings'} ? @{$opt{'headings'}} : ('heading');
    my @values   = split(/\|/,$line);
    my $key = scalar @headings > 1 ? $values[0] : shift @values;

    my $n = 0;
    for my $r_heading (@headings) {
      goto INC if (!defined($values[$n]) || length($values[$n]) == 0);
      my $split = $r_heading =~ /\+$/ ? 1 : 0;
      (my $heading = $r_heading) =~ s/\+$//;
      my $value = defined($values[$n]) ? $split == 1 ? [map { $_ =~ s/^ //; $_ } split(/;/,$values[$n])] : $values[$n] : undef;
      if (scalar @headings > 1) {
        $hash{$key}{$heading} = $value;
      }
      else {
        $hash{$key} = $value;
      }
      INC: ++$n;
    }
  }
  return \%hash;
}

sub get_array {
  my %opt = @_;
  my $file = $opt{'file'} && ref($opt{'file'}) eq 'ARRAY' ? data_file(@{$opt{'file'}}) :
             $opt{'file'} ? $opt{'file'} : data_file;
  open(my $fh, '<', $file) || die "Can not open $file $!";

  my @array;
  while (my $line = <$fh>) {
    chomp $line;
    die "This file is not for Base::Data! Stopped $!" if $line =~ /no Base::Data/i;

    my %hash;
    my @values = split(/\|/,$line);
    @hash{@{$opt{'headings'}}} = @values;

    push @array, \%hash;
  }
  return \@array;
}

# start alpha section

sub first_alpha {
  my $alpha = shift;
  $alpha = ucfirst($alpha) if $alpha =~ /^\l./;
  $alpha =~ s/\s*\b(A|a|An|an|The|the)(_|\s)//xi;
  if ($alpha =~ /^\d/) {
    $alpha = '#';
  }
  elsif ($alpha =~ /^(\W)/ && $alpha !~ /^Æ/) {
    $alpha = '!';
  }
  else {
    $alpha =~ s/^(.)(\w|\W)+/$1/;
  }
  return $alpha;
}

sub alpha_hash {
  my ($org_list) = @_;
  my %alpha_hash;
  for my $org_value (keys %{$org_list}) {
    my $alpha = first_alpha($org_value);
    $alpha_hash{$alpha}{$org_value} = $org_list->{$org_value};
  }
  return %alpha_hash;
}

sub alpha_array {
  my ($org_list) = @_;
  my %alpha_hash;
  for my $org_value (@{$org_list}) {
    my $alpha = first_alpha($org_value);
    push @{$alpha_hash{$alpha}}, $org_value;
  }
  return %alpha_hash;
}

# end alpha section

sub hash_from_arrays {
  my ($keys, $values) = @_;

  my %hash;
  @hash{@$keys} = @$values;
  return \%hash;
}

1;
