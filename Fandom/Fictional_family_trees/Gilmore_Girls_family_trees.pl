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

my $directory = '../../files/images/Fandom/Fictional_family_trees/Gilmore_Girls';
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
These B<fictional families> were created in B<I<A<Gilmore Girls|href="../../Movies/index.pl?series=Gilmore+Girls">>>. Some relationships are supposition based on dialog. Trees are drawn if there are five or more people across two or more generations.
SMALL<Click images for enlarged versions where necessary.>
2 The Gilmore and Danes families
& Gilmore-Danes
The Huntzberger family connection is supposition.
2 The St. James-Belleville family
& StJames-Belleville
2 The Forester family
& Forester
2 Other family trees
& pages