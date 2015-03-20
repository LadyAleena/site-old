package Util::Abbreviation;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(abbr initials);

sub abbr {
  my %opt = @_;
  die("Sorry, I can't return an abbreviation if you don't give me a name.") if !$opt{'name'};

  my $name = $opt{'name'};
     $name =~ s/^(?:The|An?) //i;

  if ($name !~ /[ _-]/) {
    return $opt{'name'};
  }
  else {
    my @abbr;
    for my $word (split(/[ _-]/,$name)) {
      push @abbr, substr($word,0,1);
    }
    
    my $raw_abbr = $opt{'periods'} && $opt{'periods'} =~ /^[yt1]/i ? join('.',@abbr).'.' : join('',@abbr);
    my $final_abbr = $opt{'ALLCAPS'} && $opt{'ALLCAPS'} =~ /^[yt1]/i ? uc $raw_abbr : $raw_abbr;
    
    if ($opt{'HTML'} && $opt{'HTML'} =~ /^[yt1]/i) {
      return qq(<abbr title="$opt{name}">$final_abbr</abbr>);
    }
    else {
      return $final_abbr;
    }
  }
}

sub initials {
  abbr(@_);
}

1;
