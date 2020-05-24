package Util::StoryMagic;
use strict;
use warnings FATAL => ('all');
use Exporter qw(import);
our @EXPORT_OK = qw(program_magic pc_magic story_magic);

use File::Spec;

use Base::Path qw(base_path);
use Util::Convert qw(idify);
use Util::Data qw(data_file make_hash);

sub program_magic {
  my $program_urls = make_hash( 'file' => ['Collections','programs.txt'] );
  my $program_links;
  for my $link (keys %$program_urls) {
    my $link_dest = $program_urls->{$link};
    $program_links->{$link} = qq(A<$link|href="http://$link_dest" target="ex_tab">);
  }

  return $program_links;
}

# End Program links
# Start Player character magic
# to be used on any story involving my player characters

sub pc_magic {
  open(my $pc_fh, '<', data_file('Role_playing','Player_characters_list.txt')) || die $!;
  my @pcs = <$pc_fh>;
  chomp @pcs;

  my $pc_links;
  for my $pc (@pcs) {
    my $root = base_path('path');
    my $id   = idify($pc);
    my $path = File::Spec->abs2rel("$root/Role_playing/Player_characters/index.pl#$id");
    $pc_links->{$pc} = qq(A<$pc|href="$path">);

    my ($first, $last) = split(' ', $pc, 2);
    $pc_links->{$first} = qq(A<$first|href="$path">);
  }

  return $pc_links;
}

# End Player character magic
# Bring the magic!

sub story_magic {
  my $magic = {
    %{&program_magic},
    %{&pc_magic}
  };
  return $magic;
}

1;