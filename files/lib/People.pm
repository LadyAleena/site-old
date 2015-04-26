package People;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_people);

use Base::Data qw(data_file);
use Util::Sort qw(name_sort);
use Util::Convert qw(filify searchify);
use Util::ExternalLinks;

sub split_line {
  my ($raw_line) = @_;
  my ($name,$wikipage) = split(/\|/,$raw_line);
  return [$name,$wikipage];
}

sub get_people {
  my ($file) = @_;

  open(my $data_file,'<',data_file('People',$file));
  my @data = <$data_file>;
  chomp(@data);
  my @base_people = map { split_line($_) } @data;
  
  my @people;
  for my $line (sort { name_sort($a->[0],$b->[0]) } @base_people) {
    my $name = $line->[0];
       $name =~ s/^_//;
    my $article_name = $line->[1] ? $line->[1] : filify($name);
    my $link = external_links([['Wikipedia',$article_name],['Google',searchify($name)]]);
    push @people, "$name $link";
  }
  
  return @people ? \@people : undef;
}

1;
