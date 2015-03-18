#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);
use Lingua::EN::Inflect qw(PL_N);

use lib '../../files/lib';
use Base::HTML qw(html story);
use Util::Convert qw(searchify);

my $line_magic;
for (qw(twarg throglin tralg trobold gobpry zarden), 'dark centaur') {
  my $search = searchify(ucfirst $_);
  my $text   = PL_N($_);
  $line_magic->{$text} = qq(A<$text|href="Monsters/index.pl?monster=$search">);
}

html( code => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
A high priest of Miskel, the evil godess of Triador, thought it would please his Mistress and gain favor within his order, and a dark conjurer were experimenting with the merging of different species. They did not expect their test subjects to revolt, but the ^twargs^, ^throglins^, ^tralgs^, ^trobolds^, ^gobpries^, and ^zardens^ did. Only the ^dark centaurs^ stayed loyal to their masters. The twargs took the brunt of the attacks from the priest, conjuer, and their apprentices. The tralgs, throglins, and trobolds fought the dark centaurs. The zardens and gobpries either fought the non-magical henchmen or freed the people used in the experiments.
When the rebillion was over the priest's and conjurer's bodies could not be found. Some think the gobpries flew off with them and either dropped or ate them. No one has ever found them. The dark centaurs fled when the battle turned against them and there were only three studs and five mares left.
The twargs gained the respect of the other new races for their intelligence and wisdom which won the day. A throglin tried to take advantage of the situation to gain control of the throglins, tralgs, and trobolds. The temprorary twarg leader of the battle convinced him to give up the notion before they began fighting among themselves. Over the days after the battle, only the zardens decided to stay together to find a new home. Most of the other new races scattered in small bands. Each race thrives in several communities spread across the four continents leaving each other alone with the exception of rare attacks.
They all left the city-sized caves where they were imprisoned with a deep resentment for the clergy of Miskel, but not Miskel herself, and magic users in general. The twargs and zardans have great animosity towards the Church of Miskel. Even the dark centraurs who fought with the priests and clerics keep themselves aloof from them. All of the new races hate the dark centaurs to the point where the dark centaurs are the species enemy to them all.
The zardans are the most successful of all of the races. Since they are part human, they can reproduce with humans. They rule Zilarb, the southernmost nation in the Acrema Empire, and some southern parts of Abru, the eastern island nation in The Acrama Empire.
STRONG<Note:> Triador is a campaign world I began creating and may one day put something of it up. Until then, you can use any evil god or goddess in place of Miskel.
