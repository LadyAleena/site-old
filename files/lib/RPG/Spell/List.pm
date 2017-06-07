package RPG::Spell::List;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(spell_data);

use CGI::Carp qw(fatalsToBrowser);
use IO::All;

use Util::Convert qw(filify);
use Util::Data qw(data_file make_hash);

my @headings = (qw(name school level range duration), 'area of effect', 'components', 'casting time', 'saving throw', 'description');
my $spells = make_hash( 'file' => ['Role_playing','Spell_list.txt'], 'headings' => \@headings );

sub spell_data {
  my ($spell) = @_;

  my @items;
  for my $stat (grep($_ !~ /(?:name|description)/, @headings)) {
    next if !$spells->{$spell}{$stat};
    my $stat_text = ucfirst $stat;
    push @items, qq(<strong>$stat_text:</strong> $spells->{$spell}{$stat});
  }

  my $spell_file = filify($spell);
  my @spell_description = $spells->{$spell}{'description'} ?
                          split(/\//, $spells->{$spell}{'description'}) :
                          io(data_file('Role_playing/Spell_descriptions',"$spell_file.txt"))->slurp;

  my $spell_out = { 'heading' => $spells->{$spell}{'name'}, 'stats' => [\@items, { class => 'spell_stats' }], 'description' => \@spell_description };
  return $spell_out;
}

1;
