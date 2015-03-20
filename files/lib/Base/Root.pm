package Base::Root;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT = qw(get_root);

my $server = $ENV{SERVER_NAME} ? $ENV{SERVER_NAME} : 'localhost';

my %hosts = (
  'localhost' => {
    'path' => q(/home/me/Documents/fantasy),
    'link' => q(http://localhost),
  },
  'www.xecu.net' => {
    'path' => q(/ftp/pub/www/fantasy),
    'link' => q(http://www.xecu.net/fantasy),
  },
  'fantasy.xecu.net' => {
    'path' => q(/www/fantasy/public_html),
    'link' => q(http://fantasy.xecu.net),
  }
);

my $root_path = $hosts{$server}{'path'};

for my $host (keys %hosts) {
  $hosts{$host}{$_} = 'Lady Aleena' for qw(user name);
  $hosts{$host}{'mail'} = 'fantasy@xecu.net';
  $hosts{$host}{'data'} = "$root_path/files/data";
  $hosts{$host}{$_}     = $hosts{$host}{'link'}."/files/$_" for qw(audio css images);
}

sub get_root {
  my ($host_key) = @_;
  return $hosts{$server}{$host_key};
}

1;
