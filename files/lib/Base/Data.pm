package Base::Data;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(data_directory data_file get_directory get_hash get_array alpha_array alpha_hash make_hash_from_arrays);

use File::Basename;
use File::Spec;
use List::Util qw(first);

use Base::Root qw(get_root);

sub get_directory {
  my ($directory, $opt) = @_;

  opendir(my $dir, $directory) || die "Can't open $directory $!";
  my @contents = File::Spec->no_upwards(readdir($dir));
  closedir($dir);
  chomp(@contents);
  
  @contents = map("$directory/$_", @contents) if $opt->{'full path'} && $opt->{'full path'} =~ /^[yt1]/;

  return @contents
}

sub data_directory {
  my ($dir) = @_;
  $dir =~ s/ /_/g;
  return get_root('data')."/$dir";
}

sub data_file {
  my ($directory,$filename) = @_;
  
  my $file_name = basename($0);

  my $root_path = get_root('path');
  my $root_data = get_root('data');
  
  my $relative_path = File::Spec->abs2rel($file_name,$root_path);
     $relative_path =~ s/\.\w+$//;
     $relative_path =~ s/working(?:\/|\\)//;

  my $data;
  if ($directory && $filename) {
    $data = "$root_data/$directory/$filename";
  }
  else {
    $data = "$root_data/$relative_path.txt";
  }
  
  if (!defined $data) {
    die "No file associated with $relative_path.";
  }
  
  return $data;
}

# Written with rindolf in #perlcafe on freenode; golfed with the help of [GrandFather] of PerlMonks.
# Changed to accept named parameters to make it prettier to use.
# The parameters are file, headings, and a very optional sorted.
sub get_hash {
  my %opt = @_;
  my $file = $opt{'file'} && ref($opt{'file'}) eq 'ARRAY' ? data_file(@{$opt{'file'}}) : $opt{'file'};
  open(my $fh, '<', $file) or die("can't open $file $!");

  my %hash;
  while (my $line = <$fh>) {
    chomp $line;
    die "This file is not for Base::Data! Stopped" if $line =~ /no Base::Data/i;
    my @headings = $opt{'headings'} ? @{$opt{'headings'}} : ('heading');
    my @values   = split(/\|/,$line);
    my $key = scalar @headings > 1 ? $values[0] : shift @values;

    $hash{$key}{'sort number'} = $. if $opt{'sorted'};

    my $n = 0;
    for my $r_heading (@headings) {
      my $split = $r_heading =~ /\+$/ ? 1 : 0;
      (my $heading = $r_heading) =~ s/\+$//;
      my $value = defined($values[$n]) ? $split == 1 ? [map { $_ =~ s/^ //; $_ } split(/;/,$values[$n])] : $values[$n] : undef;
      if (scalar @headings > 1) {
        $hash{$key}{$heading} = $value;
      }
      else {
        $hash{$key} = $value;
      }
      ++$n;
    }
  }

  return %hash;
}

sub get_array {
  my %opt = @_;
  my $file = $opt{'file'} && ref($opt{'file'}) eq 'ARRAY' ? data_file(@{$opt{'file'}}) :
             $opt{'file'} ? $opt{'file'} : data_file;
  open(my $fh, '<', $file) or die("can't open $file $!");

  my @array;
  while (my $line = <$fh>) {
    chomp $line;
    die "This file is not for Base::Data!" if $line =~ /no Base::Data/i;

    my %hash;
    my @values = split(/\|/,$line);
    @hash{@{$opt{'headings'}}} = @values;

    push @array, \%hash;
  }

  return @array;
}

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

sub alpha_array {
  my ($org_list) = @_;
  my %alpha_hash;
  for my $org_value (@{$org_list}) {
    my $alpha = first_alpha($org_value);
    push @{$alpha_hash{$alpha}}, $org_value;
  }
  return %alpha_hash;
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

sub make_hash_from_arrays {
  my ($keys, $values) = @_;
  
  my %hash;
  @hash{@$keys} = @$values;
  
  return \%hash;
}

1;
