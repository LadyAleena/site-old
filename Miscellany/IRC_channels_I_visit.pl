#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page);
use HTML::Elements qw(section heading list anchor);
use Util::Columns;

my %irc = (
  freenode => {
    web        => [qw(apache css html httpd svg javascript web design)],
    linux      => [qw(linux winehq alsa bash videolan rsync sed vim emacs awk geany)],
    perl       => [qw(perlcafe cbstream)],
    computing  => [qw(hardware programming windows sql yaml Openoffice.org notepad++)],
    mediawiki  => [qw(autowikibrowser mediawiki mediawiki-scripts wikimedia wikimedia-commons wikimedia-tech wikipedia wikipedia-en wikipedia-en-help wikipedia-plot wikipedia-social wp-doctor-who)],
    chat       => [qw(hexchat xchat)],
    fangirling => [qw(scarecrow-and-mrs-king bruce-campbell)],
    general    => [qw(chat freenode comcast-users scifi)],
    'linux distributions' => [qw(debian linuxmint debian-offtopic)],
    'desktop environments' => [qw(kde gnome)],
    'desktop environment - kde' => [qw(kde amarok kde-chat kde-women kontact okular)],
  },
  moznet => {
    general => [qw(amo Chatzilla firefox firebug)],
  },
  slashnet => {
    general => ['perlmonks'],
  },
);

my @double_bang = qw(chat windows linux gnome javascript linuxmint scarecrow-and-mrs-king bruce-campbell design hardware programming);
my @favorites = qw(cbstream linux programming perlcafe scarecrow-and-mrs-king bruce-campbell debian-offtopic);

sub irc_link {
  my ($server, $channel) = @_;
  my $channel_link = grep($_ eq $channel, @double_bang) ? '%23%23'.$channel   : $channel;
  my $channel_text = grep($_ eq $channel, @favorites)   ? $channel.' &#9829;' : $channel;
  return anchor($channel_text, { href => "irc://$server/$channel_link" });
}

sub irc_list {
  my ($server, $list, $subject) = @_;
  my @channel_list = map ( irc_link( $server, $_ ), sort { lc $a cmp lc $b } @$list);
  return (\@channel_list, { 'class' => number_of_columns(3, scalar @channel_list, 1) });
}

page( 'code' => sub {
  section(3, 'These are the IRC channels in which I sometimes chat. My favorites are marked &#9829;.');
  for my $server (sort {lc $a cmp lc $b} keys %irc) {
    section(3, sub {
      list(4, 'u', irc_list($server, $irc{$server}{'general'}));
      for my $subject (sort {lc $a cmp lc $b} grep(!/general/, keys %{$irc{$server}})) {
        heading(4, 3, $subject);
        list(5, 'u', irc_list($server, $irc{$server}{$subject}, $subject));
      }
    }, { 'heading' => [2, anchor($server, { 'href' => "irc://$server" })] });
  }  
});
