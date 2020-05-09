package Base::Page;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(page story passage convert_string);

use CGI::Carp qw(fatalsToBrowser);
use Cwd qw(cwd realpath);
use File::Basename;
use File::Spec;
use List::Util qw(max);

use Base::Path     qw(base_path);
use Base::Style    qw(base_stylesheets);
use Base::Inline   qw(inline);
use HTML::Elements qw(html style noscript nav main article section heading paragraph blockquote list table div pre anchor img input span);
use Fancy::Join    qw(grammatical_join);
use Util::Convert  qw(idify textify filify searchify);
use Util::Columns;
use Util::Data     qw(make_hash);
use Util::ExternalLinks;
use Util::Line     qw(line);
use Util::Menu     qw(base_menu);

my $full_path = realpath($0);
my $root_path = base_path('path');
my $root_link = base_path('link');

sub contact_links {
  my $contacts = make_hash( 'file' => ['Base', 'other_sites.txt'] );

  my @links = ( anchor('Email', { 'href' => 'mailto:fantasy@xecu.net', 'title' => 'E-mail Lady Aleena' }) );
  for my $link (sort { lc $a cmp lc $b } keys %$contacts) {
    my $address = $contacts->{$link};
    my $title = "Lady Aleena on $link";
    my $image = img({ 'src' => "https://www.google.com/s2/favicons?domain=$address", 'alt' => $title, 'class' => 'contact' });

    push @links, anchor($image, { 'href' => "https://$address", 'target' => 'ex_tab', 'title' => $title });
  }

  return @links;
}

sub page {
  my (%opt) = @_;

  my $basename = basename($0);
  my $relative_path = $opt{'uri'} ? $opt{'uri'} : $full_path;
     $relative_path =~ s/^(?:$root_path\/|\/)//;

  my $page_heading = $opt{'heading'} && ref($opt{'heading'}) eq 'ARRAY' ? textify(@{$opt{'heading'}}, { html => 'yes' }) :
                     $opt{'heading'} ? textify($opt{'heading'}, { html => 'yes' }) :
                     $basename =~ /index/ ? textify((split(/\//, cwd))[-1]) : ucfirst textify($basename);;

  if ( $opt{'heading'} ) {
    my $file_title = $basename;
    my $opt_title = $opt{'heading'} && ref($opt{'heading'}) eq 'ARRAY' ? ${$opt{'heading'}}[0] : $opt{'heading'};
    $relative_path =~ s/$file_title/$opt_title/; # This regex sometimes does not work.
  }
  my $title = textify(join(' - ', ('Lady Aleena', map { ucfirst } grep { !/index/ } split(/\//, $relative_path))));

     $relative_path =~ s/\.\w+$//;
  my @relative_path_split = split(/\//,$relative_path);
  my $styles = base_stylesheets("$root_path/files/css", \@relative_path_split);

  my $main_id = idify($page_heading);

  my $menu = base_menu(
    'directory' => $root_path,
    'tab'   => 2,
    'color' => 0,
    'full'  => 0,
    'misc'  => 1,
    'file menu' => $opt{'file menu'} ? $opt{'file menu'} : undef
  );

  my $js = File::Spec->abs2rel("$root_path/files/lib/myjs.js");
  my $charset = $opt{'charset'} ? $opt{'charset'} : 'utf-8';

  html(0, {
    'lang' => 'en',
    'head' => {
      'title'    => $title,
      'links'    => $styles,
      'scripts'  => [
        { 'src' => $js }
      ],
      'meta'     => [
        {'charset' => $charset},
        {'name' => 'viewport', 'content' => 'width=device-width, initial-scale=1'}
      ],
      'noscript' => sub { style(3, 'li.closed ol, li.closed ul, li.closed dl {display:block;}') },
    },
    'body' => [
      sub {
        nav(2, sub {
          input(3, {
            'type' => 'checkbox',
            'id' => 'menu_collapse',
            'place label' => 'after',
            'label' => ['Site menu', { 'for' => 'menu_collapse', 'title' => 'Click here for the site menu.' }]
          });
          section(3, sub {
            div(4, sub {
              line(5, join("\n"." "x10, contact_links()))
            }, { 'id' => 'contacts_nav', 'title' => 'Ways to contact me' });
            list(4, 'u', $menu, { 'id' => 'site_menu' } );
          }, { 'id' => 'main_menu', 'title' => 'Site menu' });
        }, { 'id' => 'main_navigation' });
        main(2, sub {
          &{$opt{'code'}};
          if ($root_path =~ /fantasy/) {
            section(3, sub {
              div(4, '', { 'id' => 'disqus_thread'} );
              line(4, qq(<script>
              /* * * CONFIGURATION VARIABLES * * */
              var disqus_shortname = 'ladyaleena';
              var disqus_identifier = '$page_heading';

              /* * * DON'T EDIT BELOW THIS LINE * * */
              (function() {
                  var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                  dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                  (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
              })();
              </script>));
                noscript(4, q(Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus</a>.));
            }, { 'heading' => [2, 'Comments', { 'class' => 'disqus', 'id' => 'Comments' }], 'class' => 'disqus' } );
          }
          div(3, sub {
            line(4, anchor('&#9650; to top', { 'href' => "#${main_id}_title", 'class' => 'to_top', 'title' => 'Back to top' }));
          }, { 'class' => 'to_top' });
        }, { 'id' => $main_id, 'heading' => [1, $page_heading, { 'id' => "${main_id}_title", 'style' => $page_heading =~ /Lady Aleena$/ ? 'display: none' : undef }] });
        div(2, sub {
          line(3, anchor('&#9650; to top', { 'href' => "#title", 'class' => 'to_top', 'title' => 'Back to top' }));
        }, { 'class' => 'to_top' });
      },
      {
        'header' => [
          sub {
            div(3, sub {
              line(4, img({ 'src' => File::Spec->abs2rel("$root_path/files/images/avatar.jpg"), 'class' => 'avatar', 'alt' => "Lady Aleena's avatar", 'title' => "Lady Aleena's avatar" }));
            }, { id => 'avatar' });
            div(3, sub {
              line(4, anchor('Lady Aleena', { 'class' => 'home', 'href' => File::Spec->abs2rel($root_path), 'title' => 'Home' }));
            }, { id => 'title' });
            div(3, sub {
              line(4, join("\n"." "x8, contact_links()))
            }, { 'id' => 'contacts', 'title' => 'Ways to contact me' });
            div(3, sub {
              line(4, anchor('About Lady Aleena', { 'href' => "$root_link/about.pl", 'title' => 'About Lady Aleena and the site'}));
            }, { 'id' => 'about' });
          }, { 'id' => 'main_header'}
        ],
        'class' => $opt{'class'} ? $opt{'class'} : undef
      }
    ]
  });
}

# Start the story

sub story {
  my ($source, $opt) = @_;

  my $d_source = dissect_source($source);
  my $cols     = $d_source->{'cols'};
  my $toc      = $d_source->{'toc'};
  my $sections = $d_source->{'sections'};

  my $tab = 2;
  my $inc = 0;
  for my $section (@$sections) {
    section($tab + 1, sub { passage($tab + 2, $section, $opt) }, { 'class' => 'content' }) if $section;

    if ($inc == 0 && $cols > 3) {
      nav($tab + 1, sub {
        my $class = number_of_columns(4, $cols, 1);
        list($tab + 2, 'u', $toc, { 'class' => $class });
      }, { 'heading' => [2, 'Table of contents'], 'class' => 'contents'} );
    }
    $inc++;
  }
}

# Start dissecting the source

sub dissect_source {
  my ($source) = @_;

  my $inc = 0;
  my $cols = 0;
  my @sections;
  my @toc;

  while (my $line = <$source>) {
    chomp $line;
    next if !$line;

    if ($line =~ /^2 /) {
      my ($number, $text) = split(/ /, $line, 2);
      $text =~ s/ \+$//;
      push @toc, [anchor(textify($text), { 'href' => '#'.idify($text) })];
    }
    if ($line =~ /^3 /) {
      my ($number,$text) = split(/ /, $line, 2);
      $text =~ s/ \+$//;
      $toc[$inc-1][1]->{inlist}[0] = 'u';
      push @{$toc[$inc-1][1]->{inlist}[1]}, anchor(textify($text), { 'href' => '#'.idify($text) });
    }

    $inc++  if $line =~ /^2 /;
    $cols++ if $line =~ /^(?:2|3) /;

    push @{$sections[$inc]}, $line;
  }
  push @toc, [anchor('Comments', { 'href' => '#Comments' })];

  return { 'cols' => $cols, 'toc' => \@toc, 'sections' => \@sections };
}

# End dissecting the source
# Start passage

sub passage {
  my ($tab, $section, $opt) = @_;
  my $match = ':\*#|';

  for (my $lineno = 0; $lineno < @$section; $lineno++) {
    my $line = $section->[$lineno];
    if ($line =~ /^[$match]/) {
      $match = substr($line, 0, 1);

      my $start = $lineno;
      my $end   = $lineno;
      $end++ while ($end < $#$section and $section->[$end+1] =~ /^[$match]/);

      my @list_lines = @{$section}[$start..$end];

      $tab++;
      if ($match eq ':') {
        my $class = $list_lines[0] =~ s/^:\| (.+)$/$1/ ? shift @list_lines : undef;
        pre($tab, sub { print join("\n", map(substr($_, 2), @list_lines)) }, { 'class' => $class });
      }
      elsif ($match eq '|') {
        my @list = map { $_ =~ s/^\|(.+)/$1/; $_; } @list_lines;
        my $opts = table_opts(\@list, $opt);
        table($tab, $opts);
      }
      else {
        my $class = $list_lines[0] =~ s/^[\*#]\| (.+)$/$1/ ? shift @list_lines : undef;
        my @list = list_opts(\@list_lines, $opt);
        $list[0][2]->{'class'} = $class ? $class : undef;
        list($tab, @{$list[0]});
      }
      $tab--;

      $lineno = $end;
      $match = ':\*#|';
    }
    else {
      heading_w_links($tab, $1, $2), next if $line =~ /^([1-6])\s+(.+) \+$/;
      heading($tab, $1, textify($2, { html => 1 }), { 'id' => idify($2) }), next if $line =~ /^([1-6])\s+(.+)/;
      heading($tab, $1, textify($2, { html => 1 }), { 'id' => idify($2), class => "noclear" }), next if $line =~ /^([1-6])n\s+(.+)/;

      $tab++;
      $opt->{'doc magic'}->{$1}->(), next if $line =~ /^&\s+(.+)/;
      line($tab, $line),             next if $line =~ /^<.+>/;
      line($tab, "<$line>"),         next if $line =~ /^[bh]r$/;
      blockquote($tab, inline(convert_string($1, $opt->{'line magic'}))),  next if $line =~ /^bq\s(.+)/;
      # paragraphs
      paragraph($tab, inline(convert_string($1,    $opt->{'line magic'})), { 'class' => 'stanza', 'break' => '\|' }), next if $line =~ /^stanza (.+)$/;
      paragraph($tab, inline(convert_string($2,    $opt->{'line magic'})), { 'class' => sprintf "indent_%02s", $1}),  next if $line =~ /^\>(\d+) (.+)$/;
      paragraph($tab, inline(convert_string($line, $opt->{'line magic'})), { 'class' => 'author' }),                  next if $line =~ /^(?:by|with|from|as) /;
      paragraph($tab, inline(convert_string($line, $opt->{'line magic'})));
      $tab--;
    }
  }
}

# Start tables
# Start the options to create tables
# |# is the id
# || is the class(es)
# |! is the caption
# |* is headings put into thead
# |= is footings put into tfoot
# |+ is rows starting with head
# |- is a normal row

sub table_opts {
  my ($lines, $opt) = @_;
  my $table_opts;

  my $match = '#|!*=+-';
  for (my $lineno = 0; $lineno < @$lines; $lineno++) {
    my $line = $lines->[$lineno];
    $match = substr($line, 0, 1);

    if ($match eq '#') {
      $line =~ s/^# (.+)$/$1/;
      $table_opts->{'id'} = $line;
    }
    elsif ($match eq '|') {
      $line =~ s/^\| (.+)$/$1/;
      $table_opts->{'class'} = $line;
    }
    elsif ($match eq '!') {
      $line =~ s/^\! (.+)$/$1/;
      $table_opts->{'caption'} = inline(convert_string($line), $opt->{'line magic'});
    }
    elsif ($match eq '*') {
      my $thead_start = $lineno;
      my $thead_end   = $lineno;
      $thead_end++ while ($thead_end < $#$lines and $lines->[$thead_end + 1] eq '*');

      my @table_rows = map {
        $_ =~ s/^[\*\+-] (.+)/$1/;
        row_line($_, $opt);
      } @{$lines}[$thead_start..$thead_end];

      push @{$table_opts->{'thead'}->{'rows'}}, ['header', \@table_rows];

      $lineno = $thead_end;
    }
    elsif ($match eq '=') {
      my $thead_start = $lineno;
      my $thead_end   = $lineno;
      $thead_end++ while ($thead_end < $#$lines and $lines->[$thead_end + 1] eq '*');

      my @table_rows = map {
        $_ =~ s/^[\*\+-] (.+)/$1/;
        row_line($_, $opt);
      } @{$lines}[$thead_start..$thead_end];

      push @{$table_opts->{'thead'}->{'rows'}}, ['whead', \@table_rows];

      $lineno = $thead_end;
    }
    elsif ($match =~ /[\+-]/) {
      my $row_start = $lineno;
      my $row_end   = $lineno;
      $row_end++ while ($row_end < $#$lines and $lines->[$row_end + 1] =~ /^[$match]/);

      my @table_rows = map {
        $_ =~ s/^[\+-] (.+)/$1/;
        row_line($_, $opt);
      } @{$lines}[$row_start..$row_end];

      my $type = $match =~ /\+/ ? 'whead' : 'data';
      push @{$table_opts->{'rows'}}, [$type, \@table_rows];

      $lineno = $row_end;
    }
    $match = '*=+-';
  }

  return $table_opts;
}

# End the options to create tables

sub row_line {
  my ($line, $opt) = @_;
  my @row = split(/\|/, $line);
  my $row_data;
  for my $cell (@row) {
    push @{$row_data}, $cell =~ /^r(\d)\s(.+)$/ ? [inline(convert_string($2, $opt->{'line magic'})), { 'rowspan' => $1 }] :
                       $cell =~ /^c(\d)\s(.+)$/ ? [inline(convert_string($2, $opt->{'line magic'})), { 'colspan' => $1 }] :
                       $cell && length $cell    ? inline(convert_string($cell, $opt->{'line magic'})) : '&nbsp';
  }
  return $row_data;
}

# End tables
# Start lists
# list_type and list_opts are written by [hdb].
# [ig] wrote a version too.

sub list_type {
  my %type = ( '*' => 'u', '#' => 'o' );
  $type{ substr shift, -1 }
}

sub list_opts {
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
      $lines[$start-1]->[1] = [ $lines[$start-1]->[1], { 'inlist' => $sublist } ] if $maxlevel > 1;
      splice @lines, $start, 0, $sublist if $maxlevel == 1;
    }
    $maxlevel--;
  }
  @lines = grep { $_->[0] } @lines;
}

# End lists
# Start headings with links

sub heading_w_links {
  my ($tab, $level, $text) = @_;
  my ($heading, $wikipedia) = split(/\|/,$text);
  my $article = $wikipedia ? $wikipedia : $heading;
  my $links = external_links([['Wikipedia', $article, $article], ['Google', searchify($article), $article]]);
  my $links_text = grammatical_join('or', @$links);

  heading($tab, $level, textify($heading), { 'id' => idify($heading), 'class' => 'wlinks' });
  paragraph($tab + 1, "See more about $article on $links_text.", { 'class' => 'heading_links' } );
}

# End headings with links
# Start converting strings

sub convert_string {
  my ($string, $line_magic) = @_;
  $string =~ s/\^(.+?)\^/exists $line_magic->{$1} ? $line_magic->{$1} : $1/ge;
  return $string;
}

# End converting strings
# End passage
# End story

1;
