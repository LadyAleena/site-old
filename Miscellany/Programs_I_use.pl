#!/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib/';
use Base::Data qw(get_hash);
use Base::Page qw(page story);
use HTML::Elements qw(section paragraph list anchor);
use Util::Sort qw(article_sort);

my %program_sites = get_hash( 'file' => ['Miscellany','Program_sites.txt'], 'headings' => [qw(name link using programs+)] );
my %program_links = get_hash( 'file' => ['Miscellany','Program_links.txt'], 'headings' => [qw(name link using)] );

# I haven't added Mircosoft just yet, because it is an exception to the structure below. I am not sure what I will do with it.

sub program_link {
  my ($using, $link, $name) = @_;
  
  my $use = $using ? $using : 'none';
  my $link_text = $link ? anchor( $name, { href => "http://$link", target => '_new', class => $using } ) : $name;
  
  return $link_text;
}

my @items;
for my $site (sort {article_sort(lc $a->{'name'},lc $b->{'name'})} values %program_sites) {
  my $site_name = $site->{'name'};
  my ($site_link,$download_link) = split(/;/,$site->{'link'});
  my $site_link_text = program_link($site->{'using'},$site_link,$site_name);
  my $download_link_text = $download_link ? anchor('download', { href => "http://$download_link",  target => '_new' }) : undef;
  my $links = join(' - ',grep(defined,($site_link_text,$download_link_text)));

  if (!$site->{'programs'}) {
    push @items, $links;
  }
  else {
    my @initems;
    my @programs = @{$site->{'programs'}};
    for my $program (sort {article_sort(lc $a,lc $b)} @programs) {
      my $info = $program_links{$program};
      my $link = program_link($info->{'using'}, $info->{'link'}, $program);
      push @initems, $link;
    }
    
    if (@initems == 1) {
      push @items, qq($links - $initems[0]);
    }
    else {
      push @items, [$links, { 'inlist' => ['u', \@initems] } ];
    }
  }
}

my $doc_magic = { 'programs' => sub { list(3,'u',\@items, { class => 'two' } ) } };

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
This is a list of programs that I B<am using> or have used. Some have been made obsolete by others.
& programs
