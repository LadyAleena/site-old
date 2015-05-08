package RolePlaying::WordFind;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(print_word_find);

use CGI::Carp qw(fatalsToBrowser);
use File::Basename;

use Base::Data qw(data_file);
use HTML::Elements qw(section paragraph list pre);
use Util::Convert qw(filify);

my $lone_gender = qw(He She)[rand 2];
my $lone_adj = qw(him her)[rand 2];
my $lone_sent = ("$lone_gender may need saving! :o","Try to find $lone_adj please! Have fun!")[rand 2];

sub print_word_find {
  my ($word_find, $lone) = @_;
  my $word_find_file = filify($word_find).'.txt';

  open(my $word_find_board, '<', data_file('Role_playing/Word_finds/boards',$word_find_file)) || die $!;
  open(my $word_find_list,  '<', data_file('Role_playing/Word_finds/lists',$word_find_file))  || die $!;
  my @monsters = map { chomp $_; [$_, { class => 'monster_item' }] } <$word_find_list>;

  section(3, sub {
    pre(3,sub { while (<$word_find_board>) { print $_ } });
  });
  section(3, sub {
    list(4, 'u', \@monsters, { class => 'four' });
    paragraph(4,qq(There is a lone <span class="monster_item">$lone</span> in there too. $lone_sent));
  }, { 'heading' => [2, 'Find these monsters'] });
}
  
1;
