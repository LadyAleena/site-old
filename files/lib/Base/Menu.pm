package Base::Menu;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(main_menu alpha_menu file_menu link_color);

use Cwd qw(cwd realpath);

use Base::Data qw(get_directory);
use HTML::Elements qw(anchor);
use Util::Sort qw(article_sort name_sort);
use Util::Convert qw(linkify textify searchify);

sub link_color {
  my ($file,$style) = @_;
  my $color = '000';

  my %colors;
  $colors{'pl'}    = 'f00';
  $colors{'pm'}    = '900';
  $colors{'html'}  = '00c';
  $colors{'shtml'} = '009';
  $colors{'svg'}   = '60c';
  $colors{'css'}   = '060';
  $colors{'csv'}   = '0f0';
  $colors{'txt'}   = '090';
  $colors{'zip'}   = '990';
  $colors{'js'}    = '099';
  $colors{'pdf'}   = 'c33';
  $colors{'wav'}   = '939';
  $colors{'xls'}   = '696';
  $colors{'doc'}   = '669';
  $colors{'pub'}   = '699';
  $colors{'opx'}   = '036';
  $colors{$_}      = 'c0c' for (qw(gif ico jpg png bmp));

  my ($extension,$name) = reverse split(/\./,$file);
  $color = $colors{$extension} ? $colors{$extension} : $color;

  return qq(color:#$color);
}

sub main_menu {
  my %opt = @_;
  my $directory = $opt{'directory'};
  my $curr_cwd = cwd;

  my @contents = get_directory($directory); 
  @contents = grep {/^\p{uppercase}/} @contents if (!$opt{'full'} || $opt{'full'} !~ /^[yt1]/); # Thank you [tye]!

  # Thank you [davido]!
  my $sub = $directory =~ /(Other_poets|Player_characters|Spellbooks)$/ ? \&name_sort : \&article_sort;
  @contents = sort { $sub->($a,$b) } @contents;

  my (@files, @directories);
  for my $content (@contents) {
    my $long_content = "$directory/$content";
    my $link = linkify($long_content);
    my $text = $content !~ /^\./ ? textify($content) : $content;

    if (-f $long_content) {
      my $active = realpath($0) eq $long_content ? 'active' : 'inactive';
      my $color = $opt{'color'} == 1 ? link_color($content,1) : undef;
      my $inlist = $active eq 'active' && $opt{'file menu'} ? ['u', $opt{'file menu'}] : undef;
         $active .= $active eq 'active' && $opt{'file menu'} ? ' open' : '';
      push @files, [anchor($text, { 'href' => $link, 'title' => $text, 'style' => $color }), { 'class' => $active, 'inlist' => $inlist } ];
    }
    
    if (-d $long_content) {
      my $active = $curr_cwd =~ /$long_content/ ? 'open active' : 'closed inactive';
      my $file_list;

      if (-e "$long_content/index.pl") {
        $link .= "/index.pl";
        my $color = $opt{'color'} == 1 ? link_color($link,1) : undef;
        $text = anchor($text, { 'href' => $link, 'title' => $text, 'style' => $color });
        $file_list = $0 =~ /index/ && $active =~ / active$/ && $opt{'file menu'} ? $opt{'file menu'} : undef;
      }

      my $next_list = main_menu( 'directory' => $long_content, 'color' => $opt{'color'}, 'full' => $opt{'full'}, 'file menu' => $opt{'file menu'} );
      unshift @$next_list, @$file_list if $file_list;
      my $inlist = $next_list ? ['u', $next_list] : undef;
      $active =~ s/^(?:open|closed) // if !$inlist;
      push @directories, [$text, { 'class' => $active, 'inlist' => $inlist}];
    }
  }
  my @file_lines = (@files, @directories);

  return @file_lines > 0 ? \@file_lines : undef;
}

# returns a list of links for any sub pages generated for cgi param
sub file_menu {
  my($param, $list, $select) = @_;
  my @params = map {[
    anchor(ucfirst textify($_, { 'parens' => 'yes' }), { 'href' => '?'.searchify($param).'='.searchify($_), 'title' => textify($_) }),
    { 'class' => $select && $select eq $_ ? 'active' : 'inactive' } ]
  } @$list;
  return \@params;
}

# alpha_menu prints a line of links based on keys of a hash.
sub alpha_menu {
  my ($hash, $list_addition) = @_;

  my @line;
  for my $letter (sort { article_sort($a,$b) } keys %{$hash}) {
    my $section_name = $letter eq uc($letter) ? $letter : "l$letter";
    push @line, anchor($letter, { 'href' => "#section_$section_name" });
  }

  push @line, $list_addition if $list_addition;
  my $line = join(' - ',@line);

  return $line;
}

1;
