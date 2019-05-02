package Xanth::Location;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(section_link location_link get_locations);

use Fancy::Join    qw(join_defined grammatical_join);
use HTML::Elements qw(anchor);
use Util::Convert  qw(textify idify searchify);
use Util::Data     qw(data_file);
use Xanth::Util    qw(get_article);

open(my $moons_file, '<', data_file('Fandom/Xanth', 'moons.txt'));
my @moons_list = map { chomp $_; $_ } <$moons_file>;
my $moon_list = join('|', @moons_list);

open(my $worlds_file, '<', data_file('Fandom/Xanth', 'worlds.txt'));
my @worlds_list = map { chomp $_; $_ } <$worlds_file>;
my $world_list = join('|', @worlds_list);

sub section_link {
  my ($main, $section) = @_;

  my $text    = textify($section);
  my $id      = idify($section);
  my $link    = anchor($text, { href => "Characters.pl?location=$main#$id" });
  my $article = $main ne 'Mundania' ? get_article($section) : undef;
  my $section_text = join_defined(' ', ($article, $link));

  return $section_text;
}

sub location_link {
  my ($main, $section) = @_;

  my $text    = textify($main);
  my $search  = searchify($main);
  my $link    = anchor($text, { href => "Characters.pl?location=$search" });
  my $article = $main ne 'Mundania' ? get_article($main) : undef;
  my $main_text    = join_defined(' ', ($article, $link));
  my $section_text = $section ? section_link($search, $section) : undef;
  my $prep         = $main =~ /^($moon_list)$/ ? 'on' : 'in';
  my $place_text   = join_defined(" $prep ", ($section_text, $main_text));

  return $place_text;
}

sub get_locations {
  my $in_places = shift;
  my @out_places;
  for ( my $place_no = 0; $place_no < @$in_places; $place_no++ ) {
    my $curr_place = $in_places->[$place_no];
    my $next_place = $in_places->[$place_no + 1];
    if ($next_place && $curr_place->[0] eq $next_place->[0] && $curr_place->[1] ) {
      push @out_places, section_link($curr_place->[0], $curr_place->[1]);
    }
    else {
      push @out_places, location_link($curr_place->[0], $curr_place->[1]);
    }
  }
  my $place_text = grammatical_join('then', @out_places);
  return $place_text;
}

1;