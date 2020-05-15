#!/usr/bin/perl
# This is the Fandom/Fictional_family_trees index.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use IO::All;

use lib '../../files/lib';
use Base::Page     qw(page story);
use HTML::Elements qw(anchor object div figure list);
use Util::Convert  qw(textify);
use Util::Data     qw(file_list);
use Util::Line     qw(line);
use Util::Menu     qw(index_menu);

my $directory = '../../files/images/Fandom/Fictional_family_trees';
my @tree_files = file_list($directory);

my $doc_magic;
for my $tree_file (@tree_files) {
  my $link = "$directory/$tree_file";
  my $class = 'svg_group';
  my $text = textify($tree_file);
  my ($family, $source) = split(/ /, $text, 2);
  my $title = $family && $source ? "The $family family from $source." : $text;

  $doc_magic->{$text} = sub {
    figure(6, sub {
      line(7, anchor( '', { 'href' => $link, 'target' => 'new' }));
      line(7, object( '', { 'data' => $link, 'type' => 'image/svg+xml'})); # object used instead of img, b/c img won't render svg properly
    }, { 'class' => $class, 'title' => $title });
  };
}

my $files = index_menu('.');
$doc_magic->{pages} = sub { list(4, 'u', $files, { class => 'two' }); };

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
These are B<fictional family trees> I have drawn over time. I have also drawn other family trees for various series and A<Xanth families|href="../Xanth/Families.pl">. Trees are drawn if there are five or more people across two or more generations. Birth order is maintained except when keeping the birth order would make the tree too wide. For instance, Deven Woodcomb in the Bartowski family is the oldest child, but he is farthest right under his parents.
SMALL<Click images for enlarged versions where necessary.>
2 Family trees
The following film and television series have their own pages.
& pages
2 Journey to the Center of the Earth
The Anderson family was created in the I<A<Journey to the Center of the Earth|href="../../Movies/index.pl?series=Journey">> (2008) series
& Anderson Journey to
2 The Mummy
The Carnahan-O'Connell family was created in I<A<The Mummy|href="../../Movies/index.pl?series=The+Mummy+(1999)">> (1999) series
& Carnahan-OConnell The Mummy
2 Necessary Roughness
The Santino family was created in I<A<Necessary Roughness|href="../../Movies/index.pl?series=Necessary+Roughness">>.
& Santino Necessary Roughness
2 Scarecrow &amp; Mrs. King
The West-King family was created in I<A<Scarecrow &amp; Mrs. King|href="../../Movies/index.pl?series=Scarecrow+and+Mrs.+King">>.
& West-King Scarecrow and Mrs. King
2 Buffy the Vampire Slayer vampires
The family of vampires was created in I<A<Buffy the Vampire Slayer|href="../../Movies/index.pl?series=Buffy+the+Vampire+Slayer">>.
& Vampire Buffy the Vampire Slayer
2 Key
& family key
