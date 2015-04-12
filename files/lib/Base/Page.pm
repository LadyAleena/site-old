package Base::Page;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(page story);

use CGI::Carp qw(fatalsToBrowser);
use Cwd qw(cwd realpath);
use File::Basename;
use HTML::Entities qw(encode_entities);
use List::Util qw(max);

use Base::Root qw(get_root);
use Base::Data qw(get_array);
use Base::HTML::Element qw(html head style body header nav article section heading paragraph blockquote item list table anchor img div);
use Base::Inline qw(inline);
use Base::Line qw(line);
use Base::Menu qw(main_menu);
use Util::Convert qw(idify textify filify searchify);
use Util::Columns;
use Util::ExternalLinks;

my $full_path = realpath($0);
my $root_path = get_root('path');
my $root_link = get_root('link');
my $root_name = get_root('name');
my $root_user = get_root('user');
my $root_mail = get_root('mail');

my %link = (
  'mail' => anchor($root_user, { 'href' => "mailto:$root_mail" }),
  'name' => anchor($root_name, { 'href' => $root_link }),
);

my $relative_path = $full_path;
   $relative_path =~ s/$root_path\///;
   $relative_path =~ s/\.\w+$//;

my @relative_path_split = split(/\//,$relative_path);
my @styles = (get_root('css').'/main.css');

sub get_styles {
  my ($style_dir) = @_;

  while (@relative_path_split) {
    my $var = shift @relative_path_split;
       $var =~ s/(\.\w{2,4})$//;
    next if $var eq 'working';

    if (-f ("$style_dir/$var.css")) {
      my $new_style = "$style_dir/$var.css";
         $new_style =~ s/$root_path/$root_link/;
      push @styles, $new_style;
    }

    get_styles("$style_dir/$var");
  }

  return @styles;
}

sub get_contacts {
  my @contacts = get_array( 'file' => ['Base','other_sites.txt'], 'headings' => ['site','link'] );

  my @links = ( anchor('Email', { 'href' => 'mailto:fantasy@xecu.net' }) );
  for my $link (sort { lc $a->{'site'} cmp lc $b->{'site'} } @contacts) {
    my $text = $link->{'site'};
    my $address = $link->{'link'};
    my $title = "Lady Aleena on $text";
    my $image = img({ 'src' => "http://www.google.com/s2/favicons?domain=$address", 'alt' => $title });
    
    push @links, anchor($image, { 'href' => "http://$address", 'target' => 'ex_tab', 'title' => $title });
  }

  return @links;
}

sub page {
  my (%opt) = @_;
  my $heading = textify(basename($0)) !~ /index/ ? textify(basename($0)) : 'My '.lc((split(/\//,cwd))[-1]);
  if ($opt{'heading'}) {
    $relative_path =~ s/\/.+$/\/$opt{'heading'}/;
  }
  my $title = textify(join(' - ', ($root_name, map(ucfirst, grep(!/index/, split(/\//, $relative_path))))));
  my $page_heading = $opt{'heading'} ? textify($opt{'heading'}) : textify($heading);
  my $article_id = idify($page_heading);
  
  html(0, {
    'head' => {
      'title'    => $title,
      'links'    => [map {{ 'rel' => 'stylesheet', 'type' => 'text/css', 'href' => $_ }} get_styles($root_path.'/files/css')],
      'scripts'  => [
        { 'type' => 'text/javascript', 'src' => 'https://code.jquery.com/jquery-1.11.1.min.js' },
        { 'type' => 'text/javascript', 'src' => "$root_link/files/javascript/list.js" }
      ],
      'meta'     => [{'http-equiv' => 'Content-Type', 'content' => 'text/html; charset=windows-1252'}],
      'noscript' => sub { style(3, 'li.closed ol,li.closed ul,li.closed dl {display:block;}') },
    },
    'body' => [ sub {
      nav(2, sub {
        section(3, sub {
          list(4, 'u',
            main_menu( 'directory' => $root_path, 'tab' => 2, 'color' => 0, 'full' => 0, 'file menu' => $opt{'file menu'} ? $opt{'file menu'} : undef ),
            { 'id' => 'site_menu', 'onclick' => 'list_onclick(event)' }
          );
        }, { 'heading' => [2, 'Site menu', { 'id' => 'Site_menu' }] });
      }, { 'id' => 'main' });
      article(2, sub {
        &{$opt{'code'}};
      }, { 'id' => $article_id, 'heading' => [1, $page_heading, { 'style' => $page_heading =~ /Lady Aleena$/ ? 'display: none' : undef }] });
    }, { 'header' => [ sub {
      paragraph(3, join(' ',get_contacts()), { 'class' => 'no_indent' });
      div(3, anchor('Lady Aleena', { 'href' => $root_link, 'title' => 'Home' }));
    }] }]
  });
}

# Begin subroutines used in 'story' below.

sub convert_string {
  my ($string, $line_magic) = @_;
  $string =~ s/\^(.+?)\^/exists $line_magic->{$1} ? $line_magic->{$1} : $1/ge;
  return $string;
}

sub row_line {
  my ($line, $opt) = @_;
  my @row = split(/\|/, $line);
  my $row_data;
  for my $cell (@row) {
    push @{$row_data}, $cell =~ /^r(\d)\s(.+)$/ ? [inline(convert_string($2, $opt->{'line magic'})), { 'rowspan' => $1 }] :
                       $cell =~ /^c(\d)\s(.+)$/ ? [inline(convert_string($2, $opt->{'line magic'})), { 'colspan' => $1 }] :
                       inline(convert_string($cell, $opt->{'line magic'}));
  }
  return $row_data;
}

sub table_opts {
  my ($lines, $opt) = @_;
  my $table_opts;
  
  my $match = '|!*+-';
  for (my $lineno = 0; $lineno < @$lines; $lineno++) {
    my $line = $lines->[$lineno];
    $match = substr($line, 0, 1);

    if ($match eq '|') {
      $line =~ s/^\| (.+)$/$1/;
      $table_opts->{'class'} = $line;
    }
    elsif ($match eq '!') {
      $line =~ s/^\! (.+)$/$1/;
      $table_opts->{'caption'} = inline(convert_string($line), $opt->{'line magic'});
    }
    elsif ($match eq '*') {
      $line =~ s/^\* (.+)$/$1/;
      push @{$table_opts->{'rows'}}, ['header', row_line($line, $opt)];
    }
    elsif ($match =~ /[\+-]/) {
      my $start = $lineno;
      my $end   = $lineno;
      $end++ while ($end < $#$lines and $lines->[$end + 1] =~ /^[$match]/);
      
      my @table_rows = map { 
        $_ =~ s/^[\+-] (.+)/$1/;
        row_line($_, $opt); 
      } @{$lines}[$start..$end];

      my $type = $match =~ /\+/ ? 'whead' : 'data';
      push @{$table_opts->{'rows'}}, [$type, \@table_rows];
      
      $lineno = $end;
    }
    $match = '*+-';
  }

  return $table_opts;
}

# list_type and get_list are written by [hdb].
# [ig] wrote a version too.
sub list_type {
  my %type = ( '*' => 'u', '#' => 'o' );
  $type{ substr shift, -1 }
}

sub get_list {
  my ($list, $opt) = @_;
  $list     = [ map (inline(convert_string($_, $opt->{'line magic'})), @$list) ];
  my @lines = map {
    /([*#]*)(\d*)\s+(.*)/;
    $2 ? [$1, [$3, {value => $2}]] : [$1, $3]
  } @$list;
  my $maxlevel = max map { length $_->[0] } @lines;
  while( $maxlevel ) {
    my @indices = grep { $maxlevel == length $lines[$_]->[0] } 0..@lines - 1;
    while( @indices ) {
      my $end = pop @indices;
      my $start = $end;
      $start = pop @indices while @indices and $indices[-1] == $start-1;
      my $sublist = [
        list_type($lines[$start]->[0]),
        [ map { $_->[1] } splice @lines, $start, $end-$start + 1 ]
      ];
      $lines[$start-1]->[1] = [ $lines[$start-1]->[1], { 'inlist' => $sublist} ] if $maxlevel > 1;
      splice @lines, $start, 0, $sublist if $maxlevel == 1;
    }
    $maxlevel--;
  }
  @lines = grep { $_->[0] } @lines;
}

sub heading_w_links {
  my ($tab, $level, $text) = @_;
  my ($heading, $wikipedia) = split(/\|/,$text);
  my $article = $wikipedia ? $wikipedia : $heading;
  
  paragraph($tab + 1, external_links([['Wikipedia',filify($article)],['Google',searchify($heading)]]), { 'style' => 'float: right' } );
  heading($tab, $level, textify($heading), { 'id' => idify($heading), 'class' => 'wlinks' });
}

# End subroutines used in 'story' below.

sub story {
  my ($source, $opt) = @_;
  
  my $inc = 0;
  my $cols = 0;
  my @sections;
  my @toc;
  while (my $line = <$source>) {
    chomp($line);
    next if !$line;
    
    if ($line =~ /^2 /) {
      my ($number,$text) = split(/ /,$line,2);
      $text =~ s/ \+$//;
      push @toc, [anchor(textify($text), { 'href' => '#'.idify($text) })];
    }
    if ($line =~ /^3 /) {
      my ($number,$text) = split(/ /,$line,2);
      $text =~ s/ \+$//;
      $toc[$inc-1][1]->{inlist}[0] = 'u';
      push @{$toc[$inc-1][1]->{inlist}[1]}, anchor(textify($text), { 'href' => '#'.idify($text) });
      #$toc[$inc-1][1]->{inlist}[2]{'style'} = 'font-size: smaller;';
    }
    $inc++  if $line =~ /^2 /;
    $cols++ if $line =~ /^(?:2|3) /;
    
    push @{$sections[$inc]}, $line;
  }

  my $tab = 2;
  my $match = '\*#|';
  $inc = 0;
  for my $section (@sections) {
    if ($section) {
      section($tab, sub {
        $tab++;
        for (my $lineno = 0; $lineno < @$section; $lineno++) {
          my $line = $section->[$lineno];
          if ($line =~ /^[$match]/) {
            $match = substr($line, 0, 1);

            my $start = $lineno;
            my $end   = $lineno;
            $end++ while ($end < $#$section and $section->[$end+1] =~ /^[$match]/);

            my @list_lines = @{$section}[$start..$end];

            if ($match eq '|') {
              my @list = map { $_ =~ s/^\|(.+)/$1/; $_; } @list_lines;
              my $opts = table_opts(\@list, $opt);
              table($tab + 1, $opts);
            }
            else {
              my $class = $list_lines[0] =~ s/^[\*#]\| (.+)$/$1/ ? shift @list_lines : undef;
              my @list = get_list(\@list_lines, $opt);
              $list[0][2]->{'class'} = $class ? $class : undef;
              list($tab + 1, @{$list[0]});
            }

            $lineno = $end;
            $match = '\*#|';
          }
          else {
            heading_w_links($tab, $1, $2), next if $line =~ /^([1-6])\s+(.+) \+$/;
            heading($tab, $1, textify($2), { 'id' => idify($2) }), next if $line =~ /^([1-6])\s+(.+)/;
            div($tab, $2, { 'class' => "h$1" }), next if $line =~ /^([7-8])\s+(.+)/;

            $opt->{'doc magic'}->{$1}->(), next if $line =~ /^&\s+(.+)/;
            line($tab + 1, $line),     next if $line =~ /^<.+>/;
            line($tab + 1, "<$line>"), next if $line =~ /^[bh]r$/;
            blockquote($tab + 1, inline(convert_string($1, $opt->{'line magic'}))),  next if $line =~ /^bq\s(.+)/;
            # paragraphs
            paragraph($tab + 1, inline(convert_string($1, $opt->{'line magic'})),    { 'class' => 'stanza', 'break' => '\|' }), next if $line =~ /^stanza (.+)$/;
            paragraph($tab + 1, inline(convert_string($2, $opt->{'line magic'})),    { 'class' => "indent$1"}),   next if $line =~ /^\>(\d+) (.+)$/;
            paragraph($tab + 1, inline(convert_string($line, $opt->{'line magic'})), { 'class' => 'author' }), next if $line =~ /^(?:by|with|from|as) /;
            paragraph($tab + 1, inline(convert_string($line, $opt->{'line magic'})));
          }
        }
        $tab--;
      });
    }
    
    my $toc_start = $opt->{'toc at'} ? $opt->{'toc at'} : 3;
    if ($inc == 0 && $cols >= $toc_start) {
      nav($tab, sub {
        my $class = get_columns(4, $cols);
        list($tab + 2, 'u', \@toc, { 'class' => $class });
      }, { 'heading' => [2, 'Table of contents'], 'class' => 'contents'} );
    }
    $inc++;
  }
}

1;
