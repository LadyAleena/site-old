package RolePlaying::Random;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(random tinyrand);

use List::Util qw(shuffle);

sub random {
  my ($list, $user_input) = @_;
  
  my $random_thing;
  if ($user_input && $user_input =~ /(?:help|options)/) {
    my $keys = join(', ', sort keys %{$list});
    $random_thing = "Your options are: $keys, keys, list, or all.";
  }
  elsif ($user_input && $user_input eq 'list') {
    $random_thing = $list;
  }
  else {
    my @random_list;
    if ($user_input && $user_input eq 'keys') {
      @random_list = keys %{$list};
    }
    elsif (!$user_input || $user_input eq 'all' ) {
      @random_list = map { @$_ } values %{$list};
    }
    else {
      @random_list = shuffle(@{$$list{$user_input}});
    }
    $random_thing = $random_list[rand @random_list];
  }
  
  return $random_thing;
}

sub tinyrand { 
  my ($var1, $var2) = @_;
  return ($var1, $var2)[rand 2];
}

1;
