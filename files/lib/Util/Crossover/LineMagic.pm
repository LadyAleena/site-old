package Util::Crossover::LineMagic;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(crossover_magic);

use HTML::Elements qw(anchor object figure);
use Util::Convert  qw(textify searchify);
use Util::Data     qw(file_directory file_list);
use Util::Line     qw(line);
use Util::Movie    qw(movie_option series);


sub crossover_magic {
  my %opt = @_;

  our $magic;

# Start SVG groups

  my $open_directory = file_directory('Fandom/Crossovers', 'imagesd');
  my $link_directory = file_directory('Fandom/Crossovers', 'images');
  my @cross_files = file_list($open_directory);
  my @big_images = $opt{big} ? @{$opt{big}} : ();
  for my $cross_file (@cross_files) {
    my $link  = "$link_directory/$cross_file";
    my $text  = textify($cross_file);
    my $class = 'svg_group';
       $class .= ' right' unless grep( $text =~ /\b$_\b/i, @big_images );
    my $title = "$text chart";

    $magic->{$text} = sub {
      figure(6, sub {
        line(7, anchor( '', { 'href' => $link, 'target' => 'new' } ));
        line(7, object( '', { 'data' => $link, 'type' => 'image/svg+xml'} )); # object used instead of img, b/c img won't render svg properly
      }, { 'class' => "$class", 'title' => $title });
    };
  }

# End SVG groups
# Start getting series links

  my $series = series('data', 'me');
  my $series_list = movie_option('series');
  for my $item (sort keys %$series_list) {
    my $magic_search;
    my $magic_text;
    if ($series->{$item}) {
      for my $program (@{$series->{$item}->{programs}}) {
        my $magic_key    = $item eq $program ? "$program-single" : $program;
           $magic_text   = textify($program);
           $magic_search = searchify($item, [$program]);
        $magic->{$magic_key} = qq(A<$magic_text|href="$opt{dots}/Movies/Movies_by_series.pl?series=$magic_search">);
      }
    }
    $magic_text   = $item eq 'Scorpion' ? '&#60;/Scorpion&#62;' :
                    $item eq 'EUReKA'   ? 'EURSUP<e>KA' :
                    textify($item);
    $magic_search = searchify($item);
    $magic->{$item} = qq(A<$magic_text|href="$opt{dots}/Movies/Movies_by_series.pl?series=$magic_search">);
  }

# End getting series links
# Start Thomas Holbrook links

  $magic->{'Thommy'} = qq(A<Thomas Holbrook&#700;s groups|href="http://www.poobala.com/crossoverlistb.html#byreality" target="new">);
  $magic->{'TH-DCU'} = qq(A<Thomas Holbrook&#700;s DCU group|href="http://www.poobala.com/crossoverlistb.html#DCU" target="new">);
  for my $num (1..38) {
    $magic->{"TH-$num"} = qq(A<Thomas Holbrook&#700;s group $num|href="http://www.poobala.com/crossoverlistb.html#G$num" target="new">);
  }

# End Thomas Holbrook links

  return $magic;
}

1;
