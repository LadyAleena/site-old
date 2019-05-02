package Base::Page;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(page story passage convert_string);

use CGI::Carp qw(fatalsToBrowser);
use Cwd qw(cwd realpath);
use File::Basename;
use File::Spec;
use HTML::Entities qw(encode_entities);
use List::Util qw(max);

use Base::Menu  qw(base_menu);
use Base::Path  qw(base_path);
use Base::Style qw(base_stylesheets);
use Base::Inline qw(inline);
use HTML::Elements qw(html style noscript nav main article section heading paragraph blockquote list table div pre anchor img);
use Util::Convert qw(idify textify filify searchify);
use Util::Columns;
use Util::Data qw(make_hash);
use Util::ExternalLinks;
use Util::Line qw(line);

my $full_path = realpath($0);
my $root_path = base_path('path');

my $relative_path = $full_path;
   $relative_path =~ s/$root_path\///;
   $relative_path =~ s/\.\w+$//;

my @relative_path_split = split(/\//,$relative_path);
my $styles = base_stylesheets("$root_path/files/css", \@relative_path_split);

sub contact_links {
  my $contacts = make_hash( 'file' => ['Base', 'other_sites.txt'] );

  my @links = ( anchor('Email', { 'href' => 'mailto:fantasy@xecu.net' }) );
  for my $link (sort { lc $a cmp lc $b } keys %$contacts) {
    my $address = $contacts->{$link};
    my $title = "Lady Aleena on $link";
    my $image = img({ 'src' => "http://www.google.com/s2/favicons?domain=$address", 'alt' => $title, 'class' => 'contact' });
    
    push @links, anchor($image, { 'href' => "http://$address", 'target' => 'ex_tab', 'title' => $title });
  }

  return @links;
}

sub page {
  my (%opt) = @_;
  my $heading = basename($0) !~ /index/ ? textify(basename($0)) : (split(/\//, cwd))[-1];
  if ($opt{'heading'}) {
    $relative_path =~ s/\/.+$/\/$opt{'heading'}/;
  }
  my $title = textify(join(' - ', ('Lady Aleena', map(ucfirst, grep(!/index/, split(/\//, $relative_path))))));
  my $page_heading = $opt{'heading'} ? textify($opt{'heading'}) : textify($heading);
  my $main_id = idify($page_heading);
  my $menu = base_menu( 'directory' => $root_path, 'tab' => 2, 'color' => 0, 'full' => 0, 'file menu' => $opt{'file menu'} ? $opt{'file menu'} : undef );
  my $js = File::Spec->abs2rel("$root_path/files/lib/myjs.js");

  html(0, {
    'head' => {
      'title'    => $title,
      'links'    => $styles,
      'scripts'  => [
        { 'type' => 'text/javascript', 'src' => 'https://code.jquery.com/jquery-1.11.1.min.js' },
        { 'type' => 'text/javascript', 'src' => $js }
      ],
      'meta'     => [
        {'http-equiv' => 'Content-Type', 'content' => 'text/html; charset=windows-1252'},
        {'http-equiv' => 'Cache-Control', 'content' => 'max-age=300'},
        {'name' => 'viewport', 'content' => 'width=device-width, initial-scale=1'}
      ],
      'noscript' => sub { style(3, 'li.closed ol, li.closed ul, li.closed dl {display:block;}') },
    },
    'body' => [
      sub {
        nav(2, sub {
          section(3, sub {
            div(4, sub {
              line(5, join(' ', contact_links())) 
            }, { 'id' => 'contacts_main' });
            list(4, 'u', $menu, { 'id' => 'site_menu', 'onclick' => 'list_onclick(event)' } );
          });
        }, { 'id' => 'main' });
        main(2, sub {
          &{$opt{'code'}};
          section(3, sub {
          div(4, '', { 'id' => 'disqus_thread'} );
          line(4, qq(<script type="text/javascript">
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
          }, { 'heading' => [2, 'Comments', { 'class' => 'disqus' }], 'class' => 'disqus' } );
        }, { 'id' => $main_id, 'heading' => [1, $page_heading, { 'style' => $page_heading =~ /Lady Aleena$/ ? 'display: none' : undef }] });
      },
      {
        'header' => [
          sub {
            div(3, sub {
              line(4, join(' ', contact_links())) 
            }, { 'id' => 'contacts' });
            div(3, sub { line(4,
              img({ 'src' => File::Spec->abs2rel("$root_path/files/images/avatar.jpg"), 'alt' => "Lady Aleena's avatar", 'class' => 'avatar' }).
              anchor('Lady Aleena', { 'href' => File::Spec->abs2rel($root_path), 'title' => 'Home', 'class' => 'home'})
            )}, { 'style' => 'height:100%;' });
          }
        ],
        'class' => $opt{'class'} ? $opt{'class'} : undef
      }
    ]
  });
}

# Begin subroutines used in 'story' below.

# divvy's up the source
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
      my ($number,$text) = split(/ /,$line,2);
      $text =~ s/ \+$//;
      push @toc, [anchor(textify($text), { 'href' => '#'.idify($text) })];
    }
    if ($line =~ /^3 /) {
      my ($number,$text) = split(/ /,$line,2);
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
                       $cell && length $cell    ? inline(convert_string($cell, $opt->{'line magic'})) : '&nbsp';
  }
  return $row_data;
}

# |# is id
# || is class(es)
# |! is caption
# |* is head row
# |+ is row starting with head
# |- is a normal row

sub table_opts {
  my ($lines, $opt) = @_;
  my $table_opts;
  
  my $match = '#|!*+-';
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
    elsif ($match =~ /[\*\+-]/) {
      my $start = $lineno;
      my $end   = $lineno;
      $end++ while ($end < $#$lines and $lines->[$end + 1] =~ /^[$match]/);
      
      my @table_rows = map { 
        $_ =~ s/^[\*\+-] (.+)/$1/;
        row_line($_, $opt); 
      } @{$lines}[$start..$end];

      my $type = $match =~ /\*/ ? 'header' : $match =~ /\+/ ? 'whead' : 'data';
      push @{$table_opts->{'rows'}}, [$type, \@table_rows];
      
      $lineno = $end;
    }
    $match = '*+-';
  }

  return $table_opts;
}

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

sub heading_w_links {
  my ($tab, $level, $text) = @_;
  my ($heading, $wikipedia) = split(/\|/,$text);
  my $article = $wikipedia ? $wikipedia : $heading;
  
  paragraph($tab + 1, external_links([['Wikipedia', filify($article), $article],['Google', searchify($heading), $article]]), { 'style' => 'float: right' } );
  heading($tab, $level, textify($heading), { 'id' => idify($heading), 'class' => 'wlinks' });
}

# End subroutines used in 'story' below.

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
      heading($tab, $1, textify($2), { 'id' => idify($2) }), next if $line =~ /^([1-6])\s+(.+)/;

      $tab++;
      $opt->{'doc magic'}->{$1}->(), next if $line =~ /^&\s+(.+)/;
      line($tab, $line),     next if $line =~ /^<.+>/;
      line($tab, "<$line>"), next if $line =~ /^[bh]r$/;
      blockquote($tab, inline(convert_string($1, $opt->{'line magic'}))),  next if $line =~ /^bq\s(.+)/;
      # paragraphs
      paragraph($tab, inline(convert_string($1, $opt->{'line magic'})),    { 'class' => 'stanza', 'break' => '\|' }), next if $line =~ /^stanza (.+)$/;
      paragraph($tab, inline(convert_string($2, $opt->{'line magic'})),    { 'class' => sprintf "indent_%02s", $1}), next if $line =~ /^\>(\d+) (.+)$/;
      paragraph($tab, inline(convert_string($line, $opt->{'line magic'})), { 'class' => 'author' }),  next if $line =~ /^(?:by|with|from|as) /;
      paragraph($tab, inline(convert_string($line, $opt->{'line magic'})));
      $tab--;
    }
  }
}

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

1;
