package Base::Menu;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(main_menu alpha_menu file_menu link_color);

use Cwd qw(cwd realpath);

use Base::Root qw(get_root);
use Base::HTML::Element qw(anchor paragraph);
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
  my $root_path = get_root('path');
  my $root_link = get_root('link');
  my $directory = $opt{'directory'};
  my $curr_cwd = cwd;

  $0 =~ s/\\/\//g;

  opendir(my $base_directory, $directory) || die "Can't open $directory $!";
  my $grep_match = $opt{'full'} =~ /^[yt1]/ ? qr(^\w) : qr(^\p{uppercase});
  my @contents = grep {/$grep_match/} readdir($base_directory);
  chomp(@contents);
  closedir($base_directory);

  if ($directory =~ /(Other_poets|Player_characters|Spellbooks)$/) {
    @contents = sort {name_sort($a,$b)} @contents;
  }
  else {
    @contents = sort {article_sort($a,$b)} @contents;
  }

  my (@files, @directories);
  for my $content (@contents) {
    my $long_content = "$directory/$content";
    if ($opt{full} == 0) {
      push @files, $content if -T $long_content;
    }
    else {
      push @files, $content if -f $long_content;
    }
    push @directories, $content if -d $long_content;
  }

  my @file_lines;
  for my $file (@files) {
    my $long_content = "$directory/$file";
    my $active = realpath($0) eq $long_content ? 'active' : 'inactive';
    my $link = linkify($long_content);
    my $text = textify($file);
    my $color = $opt{'color'} == 1 ? link_color($file,1) : undef;
    my $inlist = $active eq 'active' && $opt{'file menu'} ? $opt{'file menu'} : undef;
       $active .= $active eq 'active' && $opt{'file menu'} ? ' open' : '';
    push @file_lines, [anchor($text, { 'href' => $link, 'title' => $text, 'style' => $color }), { 'class' => $active, 'inlist' => $inlist ? ['u', $inlist] : undef } ];
  }

  for my $next_directory (@directories) {
    my $long_content = "$directory/$next_directory";
    my $active = $curr_cwd =~ /$long_content/ ? 'open active' : 'closed inactive';
    my $link = linkify($long_content);
    my $text = textify($next_directory);
    my $file_list;
    if (-e "$long_content/index.pl") {
      my $index = "$link/index.pl";
      my $color = $opt{'color'} == 1 ? link_color($index,1) : undef;
      $text = anchor($text, { 'href' => $index, 'title' => $text, 'style' => $color });
      $file_list = $0 =~ /index/ && $active =~ / active$/ && $opt{'file menu'} ? $opt{'file menu'} : undef;
    }
    
    my $next_list = main_menu( 'directory' => $long_content, 'color' => $opt{'color'}, 'full' => $opt{'full'}, 'file menu' => $opt{'file menu'} );
    unshift @$next_list, @$file_list if $file_list;
    my $inlist = $next_list ? ['u', $next_list] : undef;
    $active =~ s/^(?:open|closed) // if !$inlist;
    push @file_lines, [$text, { 'class' => $active, 'inlist' => $inlist}];
  }
  return @file_lines > 0 ? \@file_lines : undef;
}

# returns a list of links for any sub pages generated for cgi param
sub file_menu {
  my($param, $list, $select) = @_;
  my @params = map {[
    anchor(ucfirst textify($_, { 'parens' => 'yes' }), { 'href' => '?'.searchify($param).'='.searchify($_) }),
    { 'class' => $select && $select eq $_ ? 'active' : 'inactive' } ]
  } @$list;
  return \@params;
}

# alpha_menu prints a line of links based on keys of a hash.
sub alpha_menu {
  my ($tab, $hash, $list_addition) = @_;

  my @line;
  for my $letter (sort { article_sort($a,$b) } keys %{$hash}) {
    my $section_name = $letter eq uc($letter) ? "$letter" : "l$letter";
    push @line, anchor($letter, { 'href' => "#section_$section_name" });
  }

  push @line, $list_addition if $list_addition;
  my $line = join(' - ',@line);

  paragraph($tab,$line, { 'style' => 'text-align:center; font-size:smaller;' });
}

1;
