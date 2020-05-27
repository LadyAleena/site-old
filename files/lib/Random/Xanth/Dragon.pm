package Random::Xanth::Dragon;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_Xanth_dragon random_old_Xanth_dragon);

use Fancy::Rand qw(fancy_rand tiny_rand);

my $dragon_attributes;
$dragon_attributes->{size}        = [ qw(giant large medium small tiny) ];
$dragon_attributes->{nature}      = [ qw(friendly trainable indifferent vicious committed) ];
$dragon_attributes->{mental}      = [ qw(telepathic precognitive memory rational invisible) ];
$dragon_attributes->{weapon}      = [ qw(fire smoke steam suction), 'prehensile tongue' ];
$dragon_attributes->{environment} = [ qw(land water air tunneling jumping) ];
$dragon_attributes->{old}         = [ qw(fire smoker steamer) ];

sub dragon_size {
  return fancy_rand($dragon_attributes, 'size', { caller => 'dragon_size in random_Xanth_dragon' });
}

sub dragon_nature {
  return fancy_rand($dragon_attributes, 'nature', { caller => 'dragon_nature in random_Xanth_dragon' });
}

sub dragon_mental {
  return fancy_rand($dragon_attributes, 'mental', { caller => 'dragon_mental in random_Xanth_dragon' });
}

sub dragon_weapon {
  return fancy_rand($dragon_attributes, 'weapon', { caller => 'dragon_weapon in random_Xanth_dragon' });
}

sub dragon_environment {
  return fancy_rand($dragon_attributes, 'environment', { caller => 'dragon_environment in random_Xanth_dragon' });
}

sub random_old_Xanth_dragon {
  my $type   = fancy_rand($dragon_attributes, 'old', { caller => 'random_old_Xanth_dragon' });
  my $gender = tiny_rand(qw(male female));
  return "$gender $type dragon";
}

sub random_Xanth_dragon {
  my $gender = tiny_rand(qw(male female));
  my $size   = dragon_size;
  my $nature = dragon_nature;
  my $mental = dragon_mental;
  my $weapon = dragon_weapon;
  my $environment = dragon_environment;

  return "$gender $size $nature $mental $weapon $environment dragon";
}

=head1 NAME

B<Random::Dragon::Xanth> generates random dragons from the I<Xanth> series by Piers Anthony.

=head1 SYNOPSIS

  use Random::Dragon::Xanth qw(random_Xanth_dragon random_old_Xanth_dragon);

  my $Xanth_dragon = random_Xanth_dragon;
    # returns a random Xanthian dragon from after the events of Currant Events.

  my $old_Xanth_dragon = random_old_Xanth_dragon;
    # returns a soulless Xanthian dragon from prior to the events of Current Events.

=head1 HISTORY

Prior to I<Current Events> there were three species of dragon in Xanth: fire dragons, smokers, and steamers. In I<Current Events> we find out these dragons are soulless and dying off in Xanth. Clio and Sherlock travelled to Dragon World, a moon of Ida, and began to bring the souls of dragons from there to repopulate Xanth with dragons. These new dragons have five attributes.

=head2 New dragon attributes

The new drgaons in Xanth have five attributes: size, nature, mental, weapon, and environment. There are five possible values of the the five attributes.

The five sizes are: giant, large, medium, small, and tiny.

The five natures are: friendly, trainable, indifferent, vicious, and committed.

The five mental attributes are: telepathic, precognitive, memory, rational, and invisible.

The five weapons are: fire, smoke, steam, suction, and prehensile tongue.

The five environments are: land, water, air, tunneling, and jumping.

=head1 SEE ALSO

This module is used in L<Random::Dragon>.

=head1 AUTHOR

Lady Aleena

=cut

1;
