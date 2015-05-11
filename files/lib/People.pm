package People;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_people);

use Base::Data qw(data_file);
use Util::Sort qw(name_sort);
use Util::Convert qw(filify searchify);
use Util::ExternalLinks;

sub get_people {
  my ($file) = @_;

  open(my $data_file,'<',data_file('People',$file)) || return undef;
  my @base_people = map { chomp $_; [ split(/\|/, $_) ] } <$data_file>;
  
  my @people;
  for my $line (sort { name_sort($a->[0], $b->[0]) } @base_people) {
    my $name = $line->[0];
       $name =~ s/^_//;
    my $article_name = $line->[1] ? $line->[1] : filify($name);
    my $link = external_links([['Wikipedia', $article_name, $name], ['Google', searchify($name), $name]]);
    push @people, "$name $link";
  }
  
  return \@people;
}

1;
