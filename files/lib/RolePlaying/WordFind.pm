package RolePlaying::WordFind;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(print_word_find);

use CGI::Carp qw(fatalsToBrowser);
use File::Basename;

use Base::HTML::Element qw(section paragraph list pre);
use Base::Data qw(data_file);
use Util::Convert qw(filify);

my $lone_gender = qw(He She)[rand 2];
my $lone_adj = qw(him her)[rand 2];
my $lone_sent = ("$lone_gender may need saving! :o","Try to find $lone_adj please! Have fun!")[rand 2];

sub print_word_find {
  my ($word_find, $lone) = @_;
  my $word_find_file = filify($word_find).'.txt';

  open(my $word_find_board, '<', data_file('Role_playing/Word_finds/boards',$word_find_file)) || die $!;

  open(my $word_find_list,  '<', data_file('Role_playing/Word_finds/lists',$word_find_file))  || die $!;
  my @monsters = map{chomp $_; $_} <$word_find_list>;
  my @items;
  for my $monster (@monsters) {
    push @items, [$monster, { class => 'monster_item' }];
  }

  section(3, sub {
    pre(3,sub { while (<$word_find_board>) { print $_ } });
  });
  section(3, sub {
    paragraph(3,'Find these monsters:');
    list(4,'u', \@items, { class => 'four' });
    paragraph(4,qq(There is a lone <span class="monster_item">$lone</span> in there too. $lone_sent));
  });
}
  
1;
