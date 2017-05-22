#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Minimal;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities qw(encode_entities);
use Lingua::EN::Inflect qw(ORD NUMWORDS);

use lib '../../files/lib';
use Base::Page qw(page);
use HTML::Elements qw(section paragraph list form fieldset inputs);
use RolePlaying::CharacterMutation qw(random_mutations);

my $cgi        = CGI::Minimal->new();
my $iterations = $cgi->param('iterations') ? encode_entities($cgi->param('iterations'),'<>"') : 1;

my $file = "Character_mutations_generator.pl";
page( 'code' => sub {
  section(3, '
      The character mutations generator is a tool to use to make your PCs more interesting. The character could be the child of a powerful magic user who used spells too much, or the character may have been experimented on some time in life. This page is devoted to make your characters a little more unique. There are things on here that would make your character more powerful or much weaker.
      All effects are cumulative, and one can be cancelled out by another. There is also the chance nothing could happen.
      I am not particularly happy with some of the sentence structures, but in some cases, it can not be helped.
      If you are looking for a random name generator, please look into the ^Everchanging Book of Names^.
    ');
  form(3, sub {
    fieldset(4, sub {
      inputs(5, [
        { type => 'text',   name => 'iterations', placeholder => '# of characters or names?' },
        { type => 'submit', value => 'Mutate!' },
        { type => 'button', value => 'Start over', onclick => "location='$file'" }
      ]);
      paragraph(5, 'Please separate names by a comma (,) or a semicolon (;).', { style => 'font-size: smaller' })
    }, { legend => "How many chracters do you wish to mutate?" });
  }, { action => $file, method => 'get'});

  my @m_iterations = $iterations =~ /^\d+$/ ? (1..$iterations) : split(/(?:,|;)/,$iterations);

  for my $iteration (@m_iterations) {
    my $heading = $iteration !~ /^\d+$/ ? "$iteration mutated"  : @m_iterations == 1 ? 'A character mutated' :
                  ucfirst NUMWORDS(ORD($iteration)).' character mutated';

    section(3, sub {
      my $mutations = random_mutations;
      if (scalar @{$mutations} > 0) {
        list(5, 'u', $mutations);
      }
      else {
        paragraph(5, 'Your character is completely normal');
      }
    }, { 'heading' => [2, $heading] });
    ++$iteration;
  }
});
