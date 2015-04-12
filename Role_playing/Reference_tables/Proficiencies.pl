#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);

use lib "../../files/lib";
use Base::Page qw(page);
use Base::HTML::Element qw(section paragraph table anchor);
use Base::Data qw(get_hash);
use HTML::Forms qw(tiny_select);
use Util::Convert qw(idify);

my $cgi = CGI->new;
my $alpha   = $cgi->param('alpha') ? encode_entities($cgi->param('alpha'),'<>"') : '';
my @classes = $cgi->param('class') ? $cgi->param('class') : ''; # can't encode entities or array won't work.
my $slots   = $cgi->param('slots') ? encode_entities($cgi->param('slots'),'<>"') : '';
my $ability = $cgi->param('rel_ability') ? encode_entities($cgi->param('rel_ability'),'<>"') : '';

my @headings = ('Proficiency', 'Slots', 'RA', 'CM', 'Class(es)', 'Source(s)');

my %proficiencies = get_hash(
  'file' => ['Role_playing/Reference_tables','Proficiencies.txt'],
  'headings' => \@headings
);

my %books = get_hash( 
  'file' => ['Role_playing/Reference_tables','References.txt'],
);

sub markupbooks { 
  my ($abbr) = @_;
  my $title = $books{$abbr};
  return qq{<abbr title="$title">$abbr</abbr>};
}

my @rows;
my $class = join('|',@classes);
for my $proficiency (sort { $a->{'Proficiency'} cmp $b->{'Proficiency'} } values %proficiencies) {
  next if $alpha   && $proficiency->{'Proficiency'} !~ /^$alpha/;
  next if $class   && $proficiency->{'Class(es)'}   !~ /(?:$class|all)/;
  next if $ability && ($proficiency->{'RA'} && $proficiency->{'RA'} ne $ability);
  next if $slots   && $proficiency->{'Slots'}       ne $slots;
  
  my $id = idify($proficiency->{'Proficiency'});
  my $contents = {
    'Proficiency' => $proficiency->{'Proficiency'} , # anchor($proficiency->{'Proficiency'}, { href => "proficiency_descriptions.pl#$id" }),
    'Source(s)' => join(', ',map(markupbooks($_),split(/;/,$proficiency->{'Source(s)'}))),
    'Class(es)' => join(', ',split(/;/,$proficiency->{'Class(es)'})),
  };
  
  my @row;
  for my $heading (@headings) {
    my $content = $contents->{$heading} ? $contents->{$heading} : $proficiency->{$heading};
    push @row, $content ? $content : '';
  }
  
  push @rows, \@row;
}

page( 'code' => sub {
  section(3, sub {
    paragraph(4,qq{These proficiencies are from Advanced Dungeons and Dragons, 2nd edition. You can select the proficiencies you wish to view. Please see the source books for the descriptions. If you know of more, please email me.});
    tiny_select(4, { 'location' => 'Proficiencies.pl', 'file' => ['Role_playing/Reference_tables','Proficiences_select.txt'] });
    table(4, { 'class' => 'proficiency', 'rows' => [['header',\@headings],['data',\@rows]] });
  });
});
