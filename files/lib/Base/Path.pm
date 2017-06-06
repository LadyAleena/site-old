package Base::Path;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(base_path);

my $server = $ENV{SERVER_NAME} ? $ENV{SERVER_NAME} : 'localhost';
my $http   = $ENV{HTTPS} && $ENV{HTTPS} eq 'on' ? 'https' : 'http';

my %hosts = (
  'localhost' => {
    'path' => '/home/me/Documents/www',
    'link' => "//localhost",
  },
  'office.home' => {
    'path' => '/home/me/Documents/www',
    'link' => "//office.home",
  },
  'fantasy.xecu.net' => {
    'path' => '/www/fantasy/public_html',
    'link' => "//fantasy.xecu.net",
  }
);

my $root_path = $hosts{$server}{'path'};

for my $host (values %hosts) {
  $host->{'data'} = "$root_path/files/data";
  $host->{$_}     = $host->{'link'}."/files/$_" for qw(audio css images);
}

sub base_path {
  my ($host_key) = @_;
  return $hosts{$server}{$host_key};
}

1;
