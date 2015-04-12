#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use lib '../files/lib';
use Base::Page qw(page story);
use Base::HTML::Element qw(table);

sub get_opts {
  my ($color, $class, $rowspan) = @_;
  my $hash;
  $hash->{'style'} = "background-color:#$color";
  $hash->{'class'} = $class if $class;
  $hash->{'rowspan'} = $rowspan if $rowspan;
  return [$color, $hash];
}

my @rows = (
  ['data', [
    [ get_opts('330000', 'dark', '5'), get_opts('660033', 'dark', '2'), get_opts('990033', 'dark', '2'), get_opts('cc0066', 'dark'), get_opts('ff0066'), get_opts('ff3399'), get_opts('ff6699', '', '2'), get_opts('ff99cc', '', '2'), get_opts('ffcccc', '', '5') ],
    [ get_opts('cc0033', 'dark'),      get_opts('ff0033'), get_opts('ff3366') ],
    [ get_opts('660000', 'dark'),      get_opts('990000', 'dark'), get_opts('cc0000', 'dark'), get_opts('ff0000', 'prime'), get_opts('ff3333'), get_opts('ff6666'), get_opts('ff9999') ],
    [ get_opts('663300', 'dark', '4'), get_opts('993300', 'dark', '2'), get_opts('cc3300', 'dark'), get_opts('ff3300'), get_opts('ff6633'), get_opts('ff9966', '', '2'), get_opts('ffcc99', '', '4') ],
    [ get_opts('cc6600', 'dark', '2'), get_opts('ff6600'), get_opts('ff9933', '', '2') ],
    [ get_opts('333300', 'dark', '5'), get_opts('996600', 'dark', '2'), get_opts('ff9900'), get_opts('ffcc66', '', '2'), get_opts('ffffcc', '', '5') ],
    [ get_opts('cc9900', 'dark'),      get_opts('ffcc00'), get_opts('ffcc33') ],
    [ get_opts('666600', 'dark'),      get_opts('999900', 'dark'), get_opts('cccc00', 'dark'), get_opts('ffff00', 'prime'), get_opts('ffff33'), get_opts('ffff66'), get_opts('ffff99') ],
    [ get_opts('336600', 'dark', '4'), get_opts('669900', 'dark', '2'), get_opts('99cc00', 'dark'), get_opts('ccff00'), get_opts('ccff33'), get_opts('ccff66', '', '2'), get_opts('ccff99', '', '4') ],
    [ get_opts('66cc00', 'dark', '2'), get_opts('99ff00'), get_opts('99ff33', '', '2') ],
    [ get_opts('003300', 'dark', '5'), get_opts('339900', 'dark', '2'), get_opts('66ff00'), get_opts('99ff66', '', '2'), get_opts('ccffcc', '', '5') ],
    [ get_opts('33cc00', 'dark'),      get_opts('33ff00'), get_opts('66ff33') ],
    [ get_opts('006600', 'dark'),      get_opts('009900', 'dark'), get_opts('00cc00', 'dark'), get_opts('00ff00', 'prime'), get_opts('33ff33'), get_opts('66ff66'), get_opts('99ff99') ],
    [ get_opts('006633', 'dark', '4'), get_opts('009933', 'dark', '2'), get_opts('00cc33', 'dark'), get_opts('00ff33'), get_opts('33ff66'), get_opts('66ff99', '', '2'), get_opts('99ffcc', '', '4') ],
    [ get_opts('00cc66', 'dark', '2'), get_opts('00ff66'), get_opts('33ff99', '', '2') ],
    [ get_opts('003333', 'dark', '5'), get_opts('009966', 'dark', '2'), get_opts('00ff99'), get_opts('66ffcc', '', '2'), get_opts('ccffff', '', '5') ],
    [ get_opts('00cc99', 'dark'),      get_opts('00ffcc'), get_opts('33ffcc') ],
    [ get_opts('006666', 'dark'),      get_opts('009999', 'dark'), get_opts('00cccc', 'dark'), get_opts('00ffff', 'prime'), get_opts('33ffff'), get_opts('66ffff'), get_opts('99ffff') ],
    [ get_opts('003366', 'dark', '4'), get_opts('006699', 'dark', '2'), get_opts('0099cc', 'dark'), get_opts('00ccff'), get_opts('33ccff'), get_opts('66ccff', '', '2'), get_opts('99ccff', '', '4') ],
    [ get_opts('0066cc', 'dark', '2'), get_opts('0099ff'), get_opts('3399ff', '', '2') ],
    [ get_opts('000033', 'dark', '5'), get_opts('003399', 'dark', '2'), get_opts('0066ff'), get_opts('6699ff', '', '2'), get_opts('ccccff', '', '5') ],
    [ get_opts('0033cc', 'dark'),      get_opts('0033ff'), get_opts('3366ff') ],
    [ get_opts('000066', 'dark'),      get_opts('000099', 'dark'), get_opts('0000cc', 'dark'), get_opts('0000ff', 'prime'), get_opts('3333ff'), get_opts('6666ff'), get_opts('9999ff') ],
    [ get_opts('330066', 'dark', '4'), get_opts('330099', 'dark', '2'), get_opts('0033cc', 'dark'), get_opts('3300ff'), get_opts('6633ff'), get_opts('9966ff', '', '2'), get_opts('cc99ff', '', '4') ],
    [ get_opts('6600cc', 'dark', '2'), get_opts('6600ff'), get_opts('9933ff', '', '2') ],
    [ get_opts('330033', 'dark', '5'), get_opts('660099', 'dark', '2'), get_opts('9900ff'), get_opts('cc66ff', '', '2'), get_opts('ffccff', '', '5') ],
    [ get_opts('9900cc', 'dark'),      get_opts('cc00ff'), get_opts('cc33ff') ],
    [ get_opts('660066', 'dark'),      get_opts('990099', 'dark'), get_opts('cc00cc', 'dark'), get_opts('ff00ff', 'prime'), get_opts('ff33ff'), get_opts('ff66ff'), get_opts('ff99ff') ],
    [ get_opts('660033', 'dark', '2'), get_opts('990066', 'dark', '2'), get_opts('cc0099', 'dark'), get_opts('ff00cc'), get_opts('ff33cc'), get_opts('ff66cc', '', '2'), get_opts('ff99cc', '', '2') ],
    [ get_opts('cc0066', 'dark'),      get_opts('ff0099'), get_opts('ff3399') ],
    
    [ ['&nbsp;', { 'rowspan' => '21' } ], ['Secondary Color Table', { 'colspan' => '5' } ], ['Tirtiary Color Table',  { 'colspan' => '3' } ] ],
    [ get_opts('663333', 'dark', '3'), get_opts('993366', 'dark'), get_opts('cc3366'), get_opts('cc6699'), get_opts('cc9999', '', '3'), ['&nbsp', { 'rowspan' => '20' } ], get_opts('996666', 'dark'), ['&nbsp', { 'rowspan' => '20' } ] ],
    [ get_opts('993333', 'dark'),      get_opts('cc3333'), get_opts('cc6666'),          get_opts('999966', 'dark') ],
    [ get_opts('996633', 'dark', '2'), get_opts('cc6633'), get_opts('cc9966', '', '2'), get_opts('669966', 'dark') ],
    [ get_opts('666633', 'dark', '3'), get_opts('cc9933'), get_opts('cccc99', '', '3'), get_opts('669999', 'dark') ],
    [ get_opts('999933', 'dark'),      get_opts('cccc33'), get_opts('cccc66'),          get_opts('666699', 'dark') ],
    [ get_opts('669933', 'dark', '2'), get_opts('99cc33'), get_opts('99cc66', '', '2'), get_opts('996699', 'dark') ],
    [ get_opts('336633', 'dark', '3'), get_opts('66cc33'), get_opts('99cc99', '', '3'), ['&nbsp', { 'rowspan' => '16' }] ],
    [ get_opts('339933', 'dark'),      get_opts('33cc33'), get_opts('66cc66') ],
    [ get_opts('339966', 'dark', '2'), get_opts('33cc66'), get_opts('66cc99', '', '2') ],
    [ get_opts('336666', 'dark', '3'), get_opts('33cc99'), get_opts('99cccc', '', '3') ],
    [ get_opts('339999', 'dark'),      get_opts('33cccc'), get_opts('66cccc') ],
    [ get_opts('336699', 'dark', '2'), get_opts('3399cc'), get_opts('6699cc', '', '2') ],
    [ get_opts('333366', 'dark', '3'), get_opts('3366cc'), get_opts('9999cc', '', '3') ],
    [ get_opts('333399', 'dark'),      get_opts('3333cc'), get_opts('6666cc') ],
    [ get_opts('663399', 'dark', '2'), get_opts('6633cc'), get_opts('9966cc', '', '2') ],
    [ get_opts('663366', 'dark', '3'), get_opts('9933cc'), get_opts('cc99cc', '', '3') ],
    [ get_opts('993399', 'dark'),      get_opts('cc33cc'), get_opts('cc66cc') ],
    [ get_opts('993366', 'dark'),      get_opts('cc3399'), get_opts('cc6699') ],
  ]],
);

my $doc_magic = { 'colors' => sub { table( 2, { 'class' => 'color', 'style' => 'width:99%', 'rows' => \@rows } ) } };
#print Dumper(\@rows);
page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
& colors
