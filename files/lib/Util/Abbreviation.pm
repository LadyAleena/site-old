package Util::Abbreviation;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(abbr initials);

sub abbr {
  my %opt = @_;
  die("Sorry, I can't return an abbreviation if you don't give me a name.") if !$opt{'name'};

  my $name = $opt{'name'};
     $name =~ s/^(?:The|An?) //i if $opt{'article'} && $opt{'article'} eq 'drop';

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

=head1 NAME

B<Util::Abbreviation> returns an abbreviation for a string.

=head1 SYNOPSIS

  use Util::Abbreviation qw(abbr initial);
  
  my $abbr = abbr(
    name    => 'The Lady Aleena',
    article => 'drop',
    periods => 'no',
    ALLCAPS => 'yes',
    HTML    => 'no'
  );
  
  print $abbr;

=head1 DESCRIPTION

In B<Util::Abbreviation> C<abbr> and C<initial> can be exported. C<initial> is an alias for C<abbr>.

=over

=item name

C<name> is the name to be abbreviated.

=item article

C<article> is the option to C<drop> the article from the abbreviation. The World Wide Web would drop the article "The".

=item periods

C<periods> is the option to add periods to the abbreviation with yes, true, or 1. With it on John Doe would be abbreviated J.D.

=item ALLCAPS

C<ALLCAPS> is the option to make the abbreviation all capital letters. The International House of Pancakes would be abbreviated IHOP.

=item HTML

C<HTML> is the option to add the HTML C<<abbr>> tag to the abbreviation. Plain Old Documentation would be returned as follows: 

  <abbr title="Plain Old Documentation">POD</abbr>

=back

=head1 AUTHOR

Lady Aleena

=cut

1;
