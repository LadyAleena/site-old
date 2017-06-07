package Util::WordFind;
use strict;
use warnings FATAL => qw(all);
use Exporter qw(import);
our @EXPORT_OK = qw(word_find);

use CGI::Carp qw(fatalsToBrowser);
use File::Basename;
use IO::All;

use Util::Convert qw(filify);
use Util::Data qw(data_file);

my $lone_gender = qw(He She)[rand 2];
my $lone_adj = qw(him her)[rand 2];
my $lone_sent = ("$lone_gender may need saving! :o","Try to find $lone_adj please! Have fun!")[rand 2];

sub word_find {
  my ($word_find, $lone) = @_;
  my $word_find_file = filify($word_find).'.txt';

  open(my $word_find_board, '<', data_file('Role_playing/Word_finds/boards', $word_find_file)) || die $!;
  open(my $word_find_list,  '<', data_file('Role_playing/Word_finds/lists', $word_find_file))  || die $!;
  my @monsters = map { chomp $_; [uc $_, { class => 'word_find' }] } <$word_find_list>;

  my $find_out = { 'list' => \@monsters, 'lonely' => $lone_sent };
  $find_out->{'board'} = io(data_file('Role_playing/Word_finds/boards',$word_find_file))->slurp;
  
  return $find_out;
}
  
1;
