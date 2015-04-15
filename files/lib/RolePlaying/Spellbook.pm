package RolePlaying::Spellbook;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(print_spellbook);

use CGI::Carp qw(fatalsToBrowser);
use Lingua::EN::Inflect qw(ORD);

use Base::Data qw(get_hash);
use HTML::Elements qw(section paragraph list);
use Util::Columns;

sub print_spellbook {
  my ($directory, $file) = @_;
  
  my %spells = get_hash( 'file' => [$directory, $file], 'headings' => ['+'] );

  for my $level (sort keys %spells) {
    next if $level eq 'Note';
    my @spells = @{$spells{$level}};
    my $columns = get_columns(3,scalar @spells);

    section(3, sub {
      list(5, 'u', [@spells], { class => $columns });
    }, { 'heading' => [2, ORD($level).' level'] });
  }
  if ($spells{'Note'}) {
    section(3, sub {
      paragraph(5, $spells{'Note'}[0]);
    }, { 'heading' => [2, 'Note about this spellbook'] });
  }
}

1;
