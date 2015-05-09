#!/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib/';
use Base::Data qw(get_hash);
use Base::Page qw(page story);
use HTML::Elements qw(list anchor);
use Util::Sort qw(article_sort);

my $program_sites = get_hash( 'file' => ['Miscellany','Program_sites.txt'], 'headings' => [qw(name using programs+)] );
my $program_links = get_hash( 'file' => ['Miscellany','Program_links.txt'] );

my @items;
for my $site (sort {article_sort(lc $a->{'name'},lc $b->{'name'})} values %$program_sites) {
  my $name = $site->{'name'};
  my $use  = $site->{'using'} ? $site->{'using'} : undef;
  my $link = $program_links->{$name} ? $program_links->{$name} : undef;
  my $item = $link ? anchor( $name, { href => "http://$link", target => 'ex_tab', class => $use } ) : $name;

  if ($site->{'programs'}) {
    my @in_items;
    my @programs = @{$site->{'programs'}};
    for my $program (sort {article_sort(lc $a, lc $b)} @programs) {
      my ($p_name, $p_use) = split(/:/, $program);
      my $p_link = $program_links->{$p_name} ? $program_links->{$p_name} : undef;
      my $p_item = $p_link ? anchor( $p_name, { href => "http://$p_link", target => 'ex_tab', class => $p_use } ) : $p_name;
      push @in_items, $p_item;
    }
    
    my $item_bk = $item;
    $item = @in_items > 1 ? [$item_bk, { 'inlist' => ['u', \@in_items] } ] : "$item_bk - $in_items[0]";
  }
  push @items, $item;
}

my $doc_magic = { 'programs' => sub { list(3, 'u', \@items, { class => 'two' } ) } };

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a list of programs that I B<am using> or have used. I can not account for I<all> the software we have had and used over the years. Some of it was so bad, we blanked it out of our heads. This list does not have the full list of hardware drivers either. So much software, so little time or in this case patience.
& programs
