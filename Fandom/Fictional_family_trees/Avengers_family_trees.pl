#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use IO::All;

use lib '../../files/lib';
use Base::Page     qw(page story);
use HTML::Elements qw(anchor object div figure list);
use Util::Convert  qw(textify);
use Util::Data     qw(file_list file_directory data_file);
use Util::Line     qw(line);
use Util::Menu     qw(index_menu);

my $directory = '../../files/images/Fandom/Fictional_family_trees/Avengers';
my @tree_files = file_list($directory);

my $doc_magic;
for my $tree_file (@tree_files) {
  my $link  = "$directory/$tree_file";
  my $class = 'svg_group';
  my $text  = textify($tree_file);
  my $title = "The $text family tree";

  $doc_magic->{textify($tree_file)} = sub {
    figure(6, sub {
      line(7, anchor( '', { 'href' => $link, 'target' => 'new' }));
      line(7, object( '', { 'data' => $link, 'type' => 'image/svg+xml'})); # object used instead of img, b/c img won't render svg properly
    }, { 'class' => $class,  'title' => $title });
  };
}

my $files = index_menu('.');
$doc_magic->{pages} = sub { list(4, 'u', $files, { class => 'two' }); };

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
These B<fictional families> were created in the B<A<Marvel Cinematic Universe|href="../../Movies/index.pl?series=Marvel+Cinematic+Universe">>. Trees are drawn if there are five or more people across two or more generations.
Go to the A<key|href="index.pl#Key">.
SMALL<Click images for enlarged versions where necessary.>
2 The Barton family
& Barton
2 The Pym and Lang families
& Pym-Lang
2 The Stark family
& Stark
2 The family of T'Challa
& TChalla
2 Other family trees
& pages