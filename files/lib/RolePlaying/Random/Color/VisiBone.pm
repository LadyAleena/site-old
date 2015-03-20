package Random::Color::VisiBone;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(VisiBone_color);

# HTML color from Web Designer's Color Reference Poster by VisiBone (http://www.visibone.com/color/poster4x.html)
my %VisiBone_colors = (
  brightness => [qw(white pale light medium dark obscure black)],
  vividness => [qw(vivid hard faded dull weak grey)],
  hue => [qw(red orange yellow spring green teal cyan azure blue violet magenta pink)],
);

sub random_VisiBone_color {
  my $name = shift;
  return $VisiBone_colors{$name}[rand @{$VisiBone_colors{$name}}];
}

sub VisiBone_color {
  my $brightness = random_VisiBone_color('brightness');
  my $vividness = random_VisiBone_color('vividness');
  my $hue = random_VisiBone_color('hue');

  if ($brightness eq 'white'||$brightness eq 'black') {
    return $brightness;
  }
  elsif ($vividness eq "grey") {
    return "$brightness $vividness";
  }
  else {
    return "$brightness $vividness $hue";
  }
}

1;
