package Fancy::Rand;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(fancy_rand fancy_rand_from_array tiny_rand instant_rand);

use List::Util qw(shuffle uniq);

sub fancy_rand {
  my ($list, $user_input, $opt) = @_;
  
  my $random_item;
  if ($user_input && $user_input =~ /(?:help|options)/) {
    my $keys = join("\n  ", sort keys %{$list});
    $random_item = "Your options are:
  $keys
  by keys: get a random key
  all: get a random item from any key on the list
  keys: get the list of the keys
  data: get the whole hash";
  }
  elsif ($user_input && $user_input eq 'data') {
    $random_item = $list;
  }
  elsif ($user_input && $user_input eq 'keys') {
    $random_item = [keys %$list];
  }
  else {
    my @random_list;
    if ($user_input && $user_input eq 'by keys') {
      @random_list = keys %{$list};
    }
    elsif (!$user_input || $user_input eq 'all' ) {
      @random_list = uniq(map { @$_ } values %{$list});
    }
    elsif ($list->{$user_input}) {
      @random_list = @{$list->{$user_input}};
    }
    else {
      my $caller = $opt->{caller} ? " in ".$opt->{caller} : 'fancy_rand';
      die "Your option '$user_input' is not a list $caller.\n\tStopped$!"
    }
    push @random_list, @{$opt->{'additions'}} if $opt->{'additions'};
    @random_list = shuffle(@random_list);
    $random_item = $random_list[rand @random_list];
  }
  
  return $random_item;
}

sub fancy_rand_from_array {
  my @rand_array = shuffle(@_);
  return $rand_array[rand @rand_array];
}
sub tiny_rand    { fancy_rand_from_array(@_); }
sub instant_rand { fancy_rand_from_array(@_); }

=head1 NAME

B<Fancy::Rand> selects random items from sets of lists.

=head1 SYNOPSIS

  use Fancy::Rand qw(fancy_rand fancy_rand_from_array tiny_rand instant_rand);

  my $random_thing = fancy_rand($hash_of_arrays, $selected_list, { additions => [@additional_items], caller => $caller });
 
  my $fancy_rand_from_array = fancy_rand_from_array(qw(red yellow green cyan blue magenta black white));

=head1 DESCRIPTION

B<Fancy::Rand> has two tools to help you select where your randomness comes from: C<fancy_rand> and C<fancy_rand_from_array>.

=head2 fancy_rand

C<fancy_rand> takes a hash of arrays and returns a random result based on the list selected from the hash. It is meant to be used in the creation of other random subroutines.

  my %colors = (
    'general' => [qw(red yellow green cyan blue magenta white black gray)]
    'eye'  => [qw(amber black blue brown gray green hazel red violet)],
    'hair' => [qw(auburn brown black blond gray red white)],
    'rainbow'  => [qw(red orange yellow green blue indigo violet)],  
  );

  sub random_color {
    my ($selected_color_key, $color_additions) = @_;
    fancy_rand(\%colors, $selected_color_key, {  additions => $color_additions, caller => 'random_color' });
  }

=head3 Selections

=head4 all or nothing

When C<all> or C<undef> is selected or nothing is entered, C<random> will flatten the hash and return any value from the hash.

Using C<fancy_rand> by itself:

  my $random_color_one = fancy_rand(\%colors);
  my $random_color_two = fancy_rand(\%colors, undef);
  my $random_color_all = fancy_rand(\%colors, 'all');

Using the newly created C<random_color>:

  my $random_color_one = random_color();
  my $random_color_two = random_color(undef);
  my $random_color_all = random_color('all');

All of the above will return any color in the hair, eye, and rainbow lists.

=head4 a key

When a specific key is selected, C<fancy_rand> will return an item from the selected key.

Using C<fancy_rand> by itself:

  my $random_hair_color = fancy_rand(\%colors, 'hair');
  my $random_eyes_color = fancy_rand(\%colors, 'eye');

Using the newly created C<random_color>:

  my $random_hair_color = random_color('hair');
  my $random_eyes_color = random_color('eye');

=head4 by keys

When C<by keys> is selected, C<fancy_rand> will return a random key.

Using C<fancy_rand> by itself:

  my $random_color_key = fancy_rand(\%colors, 'by keys');

Using the newly created C<random_color>:

  my $random_color_key = random_color('by keys');
  
Both of the above will return a random key from C<%colors>: hair, eye, rainbow.

=head4 keys

When C<keys> is selected, C<fancy_rand> will return the list of keys from the hash to help remind you of your key options.

Using C<fancy_rand> by itself:

  my $random_color_keys = fancy_rand(\%colors, 'keys');

Using the newly created C<random_color>:

  my $random_color_keys = random_color('keys');

Both of the above will return a list of the keys: C<['hair', 'eye', 'rainbow']>.

=head4 data

When C<data> is selected, C<fancy_rand> will return the entire hash so you can refresh your memory of what is in the hash.

Using C<fancy_rand> by itself:

  my $random_color_data = fancy_rand(\%colors, 'data');

Using the newly created C<random_color>:

  my $random_color_data = random_color('data');

=head4 help or options

When C<help> or C<options> is selected, all of your options will be listed.

Using C<fancy_rand> by itself:

  my $random_color_help = fancy_rand(\%colors, 'help');
  my $random_color_opts = fancy_rand(\%colors, 'options');

Using the newly created C<random_color>:

  my $random_color_help = random_color('help');
  my $random_color_opts = random_color('options');

=head3 Optional parameters

There are two optional parameters you can use, C<additions> and C<caller>.

=head4 additions

C<additions> is a list that you want to add to the list you have already selected.

You might want to add the colors pink, blue, and purple to the choices of hair color or yellow and bloodshot to eye color.

Using C<fancy_rand> by itself:

  my $random_hair_color = fancy_rand(\%colors, 'hair', { additions => [qw(pink purple blue)] });
  my $random_eyes_color = fancy_rand(\%colors, 'eye',  { additions => [qw(yellow bloodshot)] });

Using the newly created C<random_color>:

  my $random_hair_color = random_color('hair', [qw(pink purple blue)]);
  my $random_eyes_color = random_color('eye',  [qw(yellow bloodshot)]);

=head4 caller

C<caller> can be used to create an error message with the specific subroutine your are using random in.

Using C<fancy_rand> by itself:

  my $random_color = fancy_rand(\%colors, 'rainboe', { caller => 'random_color' });

Using the newly created C<random_color>:

  my $random_color = random_color('rainboe');

If the user selects a list that will not produce a result, the error message from both of the above will read as follows.

  Your option 'rainboe' is not a list in random_color.
    Stopped at ...

=head2 fancy_rand_from_array

C<fancy_rand_from_array> takes an array and returns a random result. C<tiny_rand> and C<instant_rand> are aliases for C<fancy_rand_from_array>.

  my $fancy_rand_from_array = fancy_rand_from_array(qw(black white red yellow green cyan blue magenta));
  my $tiny_rand    = tiny_rand(qw(black white));
  my $instant_rand = instant_rand(qw(red yellow green cyan blue magenta));

=head1 AUTHOR

Lady Aleena

=cut

1;
