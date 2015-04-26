package Util::ExternalLinks;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(external_links);
our @EXPORT_OK = qw(external_link);

use Base::Data qw(get_hash);
use HTML::Elements qw(anchor);

my $external_links = get_hash( 'file' => ['Util','external_links.txt'], 'headings' => ['site','base link','after link'] );

sub external_link {
  my ($site, $page_link, $link_title) = @_;
  
  my $base_link  = $external_links->{$site}{'base link'};
  my $after_link = $external_links->{$site}{'after link'} ? $external_links->{$site}{'after link'} : '';
  my $link = $base_link.$page_link.$after_link;
  my $title = $link_title ? $link_title : undef;
  
  return anchor($site, { 'href' => "http://$link", 'title' => $title, 'target' => 'ex_tab' });
}

sub external_links {
  my ($links) = @_;
  
  my @external_links;
  for my $link (@$links) {
    my ($site, $page_link, $title) = @$link;
    next if !$external_links->{$site};
    my $link_title = $site eq 'Google' ? "search Google for $title" : "$title on $site";
    push @external_links, external_link($site, $page_link, $link_title);
  }
  
  return '<small class="links">('.join(', ',@external_links).')</small>';
}

1;
