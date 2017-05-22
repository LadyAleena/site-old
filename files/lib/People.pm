package People;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(people_list);

use Base::Data qw(data_file);
use Util::Sort qw(name_sort);
use Util::Convert qw(filify searchify);
use Util::ExternalLinks;

sub people_list {
  my ($file) = @_;

  my $people_file = data_file('People', $file);
  my $people = undef;
  if (-f $people_file) {
    open(my $fh, '<', $people_file) || die "Can not open $people_file $!";
    my @people_lines = map { chomp $_; [ split(/\|/, $_) ] } <$fh>;
    
    for my $line (sort { name_sort($a->[0], $b->[0]) } @people_lines) {
      my $name = $line->[0];
         $name =~ s/^_//;
      my $article_name = $line->[1] ? $line->[1] : filify($name);
      my $link = external_links([['Wikipedia', $article_name, $name], ['Google', searchify($name), $name]]);
      push @$people, "$name $link";
    }
  }
  return $people;
}

1;
