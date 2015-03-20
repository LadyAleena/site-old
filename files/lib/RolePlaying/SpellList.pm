package RolePlaying::SpellList;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(print_spell_list);

use CGI::Carp qw(fatalsToBrowser);
use File::Slurp; # read_file

use Base::HTML::Element qw(section rparagraph list);
use Base::Data qw(data_file get_hash); # data_file used elsewhere
use Util::Convert qw(textify filify);

my @headings = qw(name school level range duration area_of_effect components casting_time saving_throw description);
my %spells = get_hash( 'file' => ['Role_playing','Spell_list.txt'], 'headings' => \@headings );

sub print_spell {
  my ($heading,$spell) = @_;

  my @items;
  for my $stat (grep($_ !~ /(?:name|description)/,@headings)) {
    my $stat_text = ucfirst textify($stat);
    push @items, qq(<strong>$stat_text:</strong> $spells{$spell}{$stat});
  }

  my $spell_file = filify($spell);
  my $spell_description = $spells{$spell}{'description'} ?
                          join("\n",map(rparagraph(5,$_),split(/\//,$spells{$spell}{'description'}))) :
                          read_file(data_file('Role_playing/Spell_descriptions',"$spell_file.txt"))."\n";

  section(3, sub {
    list(5,'u',\@items, { class => 'spell_stats' });
    print $spell_description;
  }, { 'heading' => [$heading, $spells{$spell}{'name'}] });
}

sub print_spell_list {
  my ($heading, $spells) = @_;
  print_spell($heading, $_) for @$spells;
}

1;
