package Base::Style;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(base_stylesheets);

use Cwd qw(cwd realpath);
use File::Basename;
use File::Spec;

sub stylesheets {
  my ($css_dir, $relative_path_split, $in_styles) = @_;
  
  my $styles = $in_styles;
  while (@$relative_path_split) {
    my $var = shift @$relative_path_split;
       $var =~ s/(\.\w{2,4})$//;
    next if $var eq 'working';

    if (-f ("$css_dir/main.css")) {
      my $new_style = File::Spec->abs2rel("$css_dir/main.css");
      push @$styles, { href => $new_style, rel => 'stylesheet', type => 'text/css' };
    }

    if (-f ("$css_dir/$var.css")) {
      my $new_style = File::Spec->abs2rel("$css_dir/$var.css");
      push @$styles, { href => $new_style, rel => 'stylesheet', type => 'text/css' };
    }

    stylesheets("$css_dir/$var", $relative_path_split, $styles);
  }

  return $styles;
}

sub alternate_stylesheets {
  my ($css_dir) = @_;

  opendir(my $dir, $css_dir);
  my $alternates = [
    map  {{ 
      href  => File::Spec->abs2rel("$css_dir/$_"),
      title => (split(/(?:\/|\.|-)/, $_))[-2],
      rel   => 'alternate stylesheet',
      type  => 'text/css'
    }} 
    grep { /^alternate/ }
    File::Spec->no_upwards(readdir($dir))
  ];
  closedir($dir);

  return $alternates;
}

sub base_stylesheets {
  my ($css_dir, $relative_path) = @_;
  my $base_styles = stylesheets($css_dir, $relative_path);
  my $alt_styles  = alternate_stylesheets($css_dir);
  
  my $styles = [@$base_styles, @$alt_styles];
  return $styles;
}

1;
