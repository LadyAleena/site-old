package HTML::Forms;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(tiny_select top_select);

use Lingua::EN::Inflect qw(A PL_N);

use HTML::Elements qw(form fieldset input selection);
use Util::Convert qw(textify);
use Util::Data qw(make_hash);

sub top_select {
  my ($tab, $opt) = @_;
  my $location = $opt->{'location'};
  my $legend = A($opt->{'name'});
  my $select_name = $opt->{'name'};
  my $submit_value = $opt->{'button'} ? $opt->{'button'} : "List $select_name";
  my @options;
  for my $option (undef,@{$opt->{'list'}}) {
    my $option_text  = $option ? ucfirst textify($option) : '&nbsp;';
    my $option_value = $option ? $option : '';
    push @options, [$option_text, { 'value' => $option_value }];
  }
  
  form($tab, sub {
    fieldset($tab + 1, sub {
      selection($tab + 2,\@options, { 'name' => $select_name });
      input($tab + 2, { 'type' => 'submit', 'value' => "$submit_value" });
      input($tab + 2, { 'type' => 'button', 'value' => 'Start over', 'onclick' => "location='$location'" });
    }, { 'legend' => "Select $legend" });
  }, { 'class' => 'top', 'action' => $location, 'method' => 'get', 'style' => 'clear:both' });
}

sub tiny_select {
  my ($tab, $opt) = @_;
  my $location = $opt->{'location'};

  my $selections = make_hash( 'file' => $opt->{'file'}, 'headings' => [qw(value multiple_choice options+)] );

  my @selections;
  for my $selection (sort { $a->{'value'} cmp $b->{'value'} } values %$selections) {
    my $select_name = $selection->{'value'};

    my @options = $select_name =~ /^alpha/i ? ("A".."Z") : @{$selection->{'options'}};
    unshift @options, '';

    my %select_attr = ( 'name' => $select_name );
    if ($selection->{'multiple_choice'}) {
      $select_attr{'multiple'} = 'multiple';
      $select_attr{'class'} = 'multiple';
    }

    my @select_options;
    for my $option (@options) {
      if ($option) {
        push @select_options, [ucfirst textify($option), { 'value' => $option }];
      }
      else {
        (my $label = ucfirst $select_name) =~ s/_/ /;
        push @select_options, [$label, { 'value' => '' }];
      }
    }
    push @selections, [\@select_options,\%select_attr];
  }

  form($tab, sub {
    fieldset($tab + 1, sub {
      selection($tab + 2, @$_) for @selections;
      input($tab + 2, { 'type' => 'submit', 'value' => 'Search', 'class' => 'search' });
      input($tab + 2, { 'type' => 'button', 'value' => 'Start over', 'onclick' => "location='$location'" });
    }, { 'legend' => 'Display only&#8230;' });
  }, { 'action' => $location, 'method' => 'get', 'class' => $opt->{'class'} });
}

# something I am keeping though not using so not exporting
sub checkboxes {
  my ($title) = @_;
  my $id_title = idify("title $title");
  my $display_title = textify($title);
  return { type => 'checkbox', value => '1', name => $title, id => $id_title, 'place label' => 'after',
          label => ["<i>$display_title</i>", { for => $id_title, class => 'specfic' }] }
}

1;
