#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Data qw(data_file alpha_array);
use Base::Page qw(page);
use Base::Menu qw(alpha_menu);
use HTML::Elements qw(section paragraph list);
use Util::Convert qw(searchify);
use Util::Columns;
use Util::ExternalLinks;

open(my $gems_file, '<', data_file) || die "Can't open ".data_file.". Stopped at $!";
my @gems = <$gems_file>;
chomp @gems;

my %alpha_gems = alpha_array(\@gems);
for my $gems (keys %alpha_gems) {
  my @list = @{$alpha_gems{$gems}};
  $alpha_gems{$gems} = undef;
  @{$alpha_gems{$gems}} = map { "$_ ".external_links([['Wikipedia', $_, $_],['Google', searchify($_), $_]]) } sort @list;
}
my $alpha_menu = alpha_menu(\%alpha_gems);

page( 'code' => sub {
  for my $alpha (sort keys %alpha_gems) {
    my $class = get_columns(3, scalar @{$alpha_gems{$alpha}});
    section(3, sub {
      list(5, 'u', $alpha_gems{$alpha}, { 'class' => $class });
      paragraph(5, $alpha_menu, { 'class' => 'alpha_menu' });
    }, { 'heading' => [2, $alpha, { 'id'=> "section_$alpha" }] });
  }
});
