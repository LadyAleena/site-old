#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::HTML qw(html);
use Base::HTML::Element qw(section heading paragraph list anchor);
use Util::Columns;

my %irc = (
  freenode => {
    web        => [qw(apache css html httdp svg javascript web design)],
    linux      => [qw(linux winehq alsa bash videolan rsync sed vim emacs awk)],
    perl       => [qw(perl perlcafe cbstream)],
    computing  => [qw(hardware programming windows sql yaml Openoffice.org notepad++)],
    mediawiki  => [qw(autowikibrowser mediawiki mediawiki-scripts wikimedia wikimedia-commons wikimedia-tech wikipedia wikipedia-en wikipedia-en-help wikipedia-plot wikipedia-social wp-doctor-who)],
    chat       => [qw(hexchat xchat)],
    fangirling => ['scarecrow-and-mrs-king','bruce-campbell'],
    general    => [qw(chat freenode comcast-users scifi)],
    'linux distributions' => ['debian','linuxmint','debian-offtopic'],
    'desktop environments' => ['kde','gnome'],
    'desktop environment - kde' => ['kde','amarok','kde-chat','kde-women','kontact'],
  },
  moznet => {
    general => [qw(amo Chatzilla firefox firebug)],
  },
  slashnet => {
    general => ['perlmonks'],
  },
);

my @double_bang = qw(chat windows linux gnome javascript linuxmint scarecrow-and-mrs-king bruce-campbell design hardware programming windows);
my @favorites = qw(linux cbstream perlcafe scarecrow-and-mrs-king bruce-campbell debian-offtopic);

sub irc_link {
  my ($server, $channel) = @_;
  my $channel_link = grep($_ eq $channel,@double_bang) ? '%23%23'.$channel   : $channel;
  my $channel_text = grep($_ eq $channel,@favorites)   ? $channel.' &#9829;' : $channel;
  return anchor($channel_text, { href => "irc://$server/$channel_link" });
}

sub irc_list {
  my ($tab, $server, $list, $subject) = @_;
  my @channel_list = map ( irc_link( $server, $_ ), sort { lc $a cmp lc $b } @$list);
  if ($subject) {
    heading( $tab, 3, $subject);
    $tab++;
  }
  list( $tab, 'u', \@channel_list, { 'class' => get_columns(3, scalar @channel_list) } );
}

html( code => sub {
  section(3, sub {
    paragraph(4,'These are the IRC channels in which I sometimes chat. My favorites are marked &#9829;.');
  });
  for my $server (sort {lc $a cmp lc $b} keys %irc) {
    section(3, sub {
      irc_list( 4, $server, $irc{$server}{'general'} );
      for my $subject (sort {lc $a cmp lc $b} keys %{$irc{$server}}) {
        next if $subject eq 'general';
        irc_list(4, $server, $irc{$server}{$subject}, $subject);
      }
    }, { 'heading' => [2, anchor($server, { 'href' => "irc://$server" })] });
  }  
});
