package RolePlaying::Spellbook;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(spellbook);

use CGI::Carp qw(fatalsToBrowser);
use Lingua::EN::Inflect qw(ORD);

use Base::Data qw(get_hash);
use Util::Columns;

sub spellbook {
  my ($directory, $file) = @_;
  
  my $spells = get_hash( 'file' => [$directory, $file], 'headings' => ['+'] );

  my $spell_list;
  for my $level (sort keys %$spells) {
    next if $level eq 'Note';
    my @spells = @{$spells->{$level}};
    my $columns = number_of_columns(3, scalar @spells, 1);
    push @$spell_list, { 'heading' => ORD($level).' level', 'list' => [\@spells, { class => $columns }] };
  }
  if ($spells->{'Note'}) {
    push @$spell_list, { 'heading' => 'Note about this spellbook', 'paragraph' => $spells->{'Note'}[0] };
  }
  return $spell_list;
}

1;
