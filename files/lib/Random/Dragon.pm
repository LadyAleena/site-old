package Random::Dragon;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(
  random_DreamWorks_dragon
  random_Harry_Potter_dragon
  random_Pern_dragon
  random_Xanth_dragon
  random_old_Xanth_dragon
  random_RPG_dragon
  random_dragon
);

use Fancy::Rand qw(fancy_rand tiny_rand instant_rand);
use Util::Data qw(data_file);
use Random::Color qw(random_color);
use Random::Xanth::Dragon qw(random_Xanth_dragon random_old_Xanth_dragon);
use Random::RPG::Monster qw(random_RPG_dragon);

open(my $DreamWorks_fh,  '<', data_file('Random/Dragons', 'DreamWorks_dragons.txt')) ||
  die "Can not open DreamWorks_dragons.txt. $!";
my @DreamWorks_dragons = map { chomp($_); $_ } <$DreamWorks_fh>;

open(my $Harry_Potter_fh, '<', data_file('Random/Dragons', 'Harry_Potter_dragons.txt')) ||
  die "Can not open Harry_Potter_dragons.txt. $!";
my @Harry_Potter_dragons = map { chomp($_); $_ } <$Harry_Potter_fh>;

my $dragons;
$dragons->{'DreamWorks'}   = [@DreamWorks_dragons];
$dragons->{'Harry Potter'} = [@Harry_Potter_dragons];

sub random_DreamWorks_dragon {
  return fancy_rand($dragons, 'DreamWorks', { caller => 'random_DreamWorks_dragon' });
}

sub random_Harry_Potter_dragon {
  return fancy_rand($dragons, 'Harry Potter', { caller => 'random_Harry_Potter_dragon' });
}

sub random_Pern_dragon {
  my $dragon_color = random_color('Pern dragon');
  my $dragon_type  = tiny_rand('dragon', 'fire lizard');
  return "$dragon_color $dragon_type";
}

sub random_dragon {
  my $dragon = instant_rand(
    random_DreamWorks_dragon,
    random_Harry_Potter_dragon,
    random_Pern_dragon,
    random_Xanth_dragon,
    random_old_Xanth_dragon,
    random_RPG_dragon,
  );
  return $dragon;
}

=head1 NAME

B<Random::Dragon> generates random dragons from the DreamWorks Dragons, Harry Potter, Pern, and Xanth series and dragons from I<Advanced Dungeons & Dragons>, 2nd Edition.

=head1 SYNOPSIS

  use Random::Dragon qw(
    random_DreamWorks_dragon
    random_Harry_Potter_dragon
    random_Pern_dragon
    random_Xanth_dragon
    random_old_Xanth_dragon
    random_RPG_dragon
    random_dragon
  );

  my $DreamWorks_dragon = random_DreamWorks_dragon;
    # generates a random dragon from the DreamWorks dragon franchise
    # based on the novels by Cressida Cowell

  my $Harry_Potter_dragon = random_Harry_Potter_dragon;
    # generates a random dragon from the Harry Potter series by J.K. Rowling

  my $Pern_dragon = random_Pern_dragon;
    # generates a random dragon or fire lizard from the Pern series by Anne McCaffrey

  my $Xanth_dragon = random_Xanth_dragon;
    # generates a random new dragon from the Xanth series by Piers Anthony

  my $old_Xanth_dragon = random_old_Xanth_dragon;
    # generates a random old dragon from the Xanth series by Piers Anthony

  my $RPG_dragon = random_RPG_dragon;
    # generates a random dragon from AD&D, 2nd ed.

  my $dragon = random_dragon;
    # generates a random dragon from all of the above

=head1 SEE ALSO

This module uses L<Random::Color> and L<Random::Xanth::Dragon> for generating those dragons.

=head1 AUTHOR

Lady Aleena

=cut

1;
