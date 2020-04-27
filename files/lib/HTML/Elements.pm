package HTML::Elements;
use strict;
use warnings FATAL => qw( all );
use Exporter qw(import);
our @EXPORT_OK = qw(html style body main div section article nav header footer heading head pre
                 paragraph address anchor img object span blockquote list definition_list table
                 form fieldset selection datalist input inputs textarea figure noscript);

use Util::Line qw(line);

my @ics  = qw(id class style lang title);
my @java = qw(onclick ondblclick onkeypress onkeydown onkeyup onmouseover onmousedown onmouseup onmousemove onmouseout);
my $gen  = [@ics, @java];

my @boolean_attribute_list = qw(autofocus checked disabled multiple readonly required);
my %boolean_attributes;
$boolean_attributes{$_} = 1 for @boolean_attribute_list;

sub html_attributes {
  my ($valid, $opt) = @_;
  my @attributes;
  for (@{$valid}) {
    my $value = $opt->{$_};
    if ($boolean_attributes{$_}) {
      push @attributes, $_ if defined($opt->{$_});
    }
    else {
      push @attributes, qq($_="$value") if defined($opt->{$_});
    }
  }
  return join(' ', @attributes);
}

# start_tag is used in the following elements:
# plain_element, code_element, img,
# meta, base, links, style, head, paragraph, blockquote,
# item, list, definition, definition_list,
# col, cell, row, thead, tfoot, tbody, table,
# selection, input, fieldset, figure, html
sub start_tag {
  my ($tag, $attributes, $opt) = @_;
  my $tag_attributes = html_attributes($attributes, $opt);
  $tag .= " $tag_attributes" if $tag_attributes;
  $tag .= ' /' if ($opt->{'close'} && $opt->{'close'} =~ /^[yt1]/);
  return "<$tag>";
}

# end_tag is used in the following elements:
# plain_element, code_element, style, head, paragraph, blockquote,
# item, list, definition, definition_list,
# cell, row, thead, tfoot, tbody, table,
# selection, fieldset, figure, html
sub end_tag {
  my ($tag) = @_;
  return "</$tag>";
}

sub break {
  my ($value, $break) = @_;

  my $line = $value;
     $line =~ s/$break/<br>/g;

  return $line;
}

# plain_element is used in the following elements:
# code_element, anchor, span, title, scripts, term, caption, label, option, legend, figcaption, heading
sub plain_element {
  my ($tag, $attributes, $value, $opt) = @_;
  my $start = start_tag($tag, $attributes, $opt);
  my $end   = end_tag($tag);
  my $line  = join('', grep( defined, ($start, $value, $end)));
  return $line;
}

# code_element is used in the following elements:
# body, main, article, section, nav, aside, address, header, footer, div, noscript, form, pre
sub code_element {
  my ($tag, $attributes, $tab, $value, $opt) = @_;

  if (!$value) {
    line($tab, plain_element($tag, $attributes, $value, $opt));
  }
  else {
    line($tab, start_tag($tag, $attributes, $opt));

    $tab++;
    header ($tab, @{$opt->{'header'}})  if ($opt->{'header'}  && $tag !~ /(?:header|footer|address|pre)/);
    heading($tab, @{$opt->{'heading'}}) if ($opt->{'heading'} && $tag !~ /(?:address|pre)/);
    $tab++ if $opt->{'heading'};
    ref($value) eq 'CODE' ? &$value : paragraph($tab + 1, $value, { 'separator' => $opt->{'separator'} });
    $tab-- if $opt->{'heading'};
    footer ($tab, @{$opt->{'footer'}})  if ($opt->{'footer'}  && $tag !~ /(?:header|footer|address|pre)/);
    $tab--;

    line($tab, end_tag($tag));
  }
}

# Start elements

sub img {
  my ($opt) = @_;
  return start_tag('img', ['src', 'alt', @$gen, 'tabindex'], $opt);
}

sub anchor {
  plain_element('a', ['href', 'target', @$gen, 'tabindex'], @_);
}

sub span {
  plain_element('span', $gen, @_);
}

sub object {
  plain_element('object', ['type', 'data', 'width', 'height', @$gen], @_);
}

# Start elements for head.

sub title {
  my $tab = shift;
  line($tab, plain_element('title', undef, @_));
}

sub meta {
  my ($tab, $metas) = @_;
  for (@$metas) {
    line($tab, start_tag('meta', ['name', 'http-equiv', 'lang', 'content'], $_));
  }
}

sub base {
  my ($tab, $opt) = @_;
  line($tab, start_tag('base', ['href', 'target'], $opt));
}

sub links {
  my ($tab, $links) = @_;
  for (@$links) {
    line($tab, start_tag('link', ['rel', 'rev', 'type', 'href', 'title'], $_));
  }
}

sub scripts {
  my ($tab, $scripts) = @_;
  line($tab, plain_element('script', ['type', 'src'], '', $_)) for @$scripts;
}

sub noscript {
  code_element('noscript', $gen, @_);
}

sub style {
  my ($tab, $value, $opt) = @_;
  my $tag = 'style';

  my $sep = $opt->{'separator'} ? $opt->{'separator'} : "\n";

  line($tab, start_tag($tag, ['type'], $opt));
  for (grep(length, split(/$sep/, $value))) {
    $_ =~ s/^\s+//;
    line($tab + 1, $_);
  }
  line($tab, end_tag($tag));
}

sub head {
  my ($tab, $opt) = @_;
  my $tag = 'head';

  line($tab, start_tag($tag, ['profile'], $opt));

  $tab++;
    title   ($tab,   $opt->{'title'});
    base    ($tab,   $opt->{'base'})     if $opt->{'base'};
    meta    ($tab,   $opt->{'meta'})     if $opt->{'meta'};
    links   ($tab,   $opt->{'links'})    if $opt->{'links'};
    scripts ($tab,   $opt->{'scripts'})  if $opt->{'scripts'};
    style   ($tab, @{$opt->{'style'}})   if $opt->{'style'};
    noscript($tab,   $opt->{'noscript'}) if $opt->{'noscript'};
  $tab--;

  line($tab, end_tag($tag));
}

# End elements for head.

# Begin elements for body.

# Begin paragraphs

sub paragraph {
  my ($tab, $value, $opt) = @_;
  my $tag = 'p';
  my $sep = $opt->{'separator'} ? $opt->{'separator'} : "\n";

  for (grep(length, split(/$sep/, $value))) {
    my $paragraph = $opt->{'break'} ? break($_, $opt->{'break'}) : $_;
       $paragraph =~ s/^\s+//;
    line($tab, start_tag($tag, $gen, $opt));
    line($tab + 1, $paragraph);
    line($tab, end_tag($tag));
  }
}

# End paragraphs

# Begin blockquotes

sub blockquote {
  my ($tab, $value, $opt) = @_;
  my $tag = 'blockquote';

  line($tab, start_tag($tag, ['value', @$gen], $opt));
  paragraph($tab + 1, $value);
  line($tab, end_tag($tag));
}

# End blockquotes

# Begin elements for ordered and unordered lists.

sub item {
  my ($tab, $value, $opt) = @_;
  my $tag = 'li';

  line($tab, start_tag($tag, ['value', @$gen], $opt));
  line($tab + 1, $value);
  if ($opt->{inlist}) {
    list($tab + 1, @{$opt->{'inlist'}});
  }
  line($tab, end_tag($tag));
}

sub list {
  my ($tab, $type, $list, $opt) = @_;
  my $tag = $type.'l';

  line($tab, start_tag($tag, [@$gen, 'start'], $opt));
  for my $item (@$list) {
    if (ref($item) eq 'ARRAY') {
      item($tab + 1, $item->[0], $item->[1]);
    }
    else {
      item($tab + 1, $item);
    }
  }
  line($tab, end_tag($tag));
}

# End elements for ordered and unordered lists.

# Begin elements for definition lists.

sub term {
  my $tab = shift;
  line($tab, plain_element('dt', $gen, @_));
}

sub definition {
  my ($tab, $value, $opt) = @_;
  my $tag = 'dd';

  line($tab, start_tag($tag, $gen, $opt));
  line($tab + 1, $value);
  line($tab, end_tag($tag));
}

sub definition_list {
  my ($tab, $definition_list, $opt) = @_;
  my $tag = 'dl';

  line($tab, start_tag($tag, $gen, $opt));
  for my $item (@$definition_list) {
    if ($item->{'term'}) {
      my $term = $item->{'term'};
      if (ref($term) eq 'ARRAY') {
        term($tab + 1, @$term);
      }
      else {
        term($tab + 1, $term);
      }
    }

    if ($item->{'terms'}) {
      my $terms = $item->{'terms'};
      for my $term (@{$terms}) {
        if (ref($term) eq 'ARRAY') {
          term($tab + 1, @$term);
        }
        else {
          term($tab + 1, $term);
        }
      }
    }

    if ($item->{'definition'}) {
      my $definition = $item->{'definition'};
      if (ref($definition) eq 'ARRAY') {
        definition($tab + 2, @$definition);
      }
      else {
        definition($tab + 2, $definition);
      }
    }

    if ($item->{'definitions'}) {
      my $definitions = $item->{'definitions'};
      for my $definition (@{$definitions}) {
        if (ref($definition) eq 'ARRAY') {
          definition($tab + 1, @$definition);
        }
        else {
          definition($tab + 1, $definition);
        }
      }
    }

    if ($opt->{'headings'}) {
      my $headings = $opt->{'headings'};
      for my $heading (@$headings) {
        my $upheading = ucfirst $heading;
        my $span_class = $opt->{'span class'} ? $opt->{'span class'} : undef;
        my $span = span("$upheading: ", { 'class' => $span_class });

        definition($tab + 2, $span.$item->{$heading});
      }
    }
  }
  line($tab, end_tag($tag));
}

# End elements for definition lists.

# Begin elements for tables.
# table elements to be added: tbody, thead, tfoot.

sub caption {
  my $tab = shift;
  line($tab, plain_element('caption', ['align', @$gen], @_));
}

sub col {
  my ($tab, $opt) = @_;
  line($tab, start_tag('col', ['span', @$gen], $opt));
}

sub cell {
  my ($tab, $type, $value, $opt) = @_;
  $type = $opt->{'type_override'} ? $opt->{'type_override'} : $type;
  my $tag = 't'.$type;
  my $start_tag = start_tag($tag, ['colspan', 'rowspan', @$gen], $opt);
  my $end_tag   = end_tag($tag);
  $value = '&nbsp' if !$value;

  if ($value eq 'list') {
    line($tab, $start_tag);
    list($tab + 1, @{$opt->{'list'}});
    line($tab, $end_tag);
  }
  else {
    line($tab + 1, $start_tag.$value.$end_tag);
  }
}

sub row {
  my ($tab, $type, $cells, $opt) = @_;
  my $tag = 'tr';

  my %types = (
    'header' => 'h',
    'data'   => 'd',
    'whead'  => 'd'
  );

  line($tab, start_tag($tag, $gen, $opt));

  if ($type eq 'whead') {
    my $cell = shift @{$cells};
    if (ref($cell) eq 'ARRAY') {
      cell($tab + 1, 'h', ucfirst $cell->[0], { 'class' => 'row_header', %{$cell->[1]} });
    }
    else {
      cell($tab + 1, 'h' , ucfirst $cell, { 'class' => 'row_header' });
    }
  }

  my $cell_type = $types{$type};
  for my $cell (@{$cells}) {
    if (ref($cell) eq 'ARRAY') {
      cell($tab + 1, $cell_type, $cell->[0], $cell->[1]);
    }
    else {
      cell($tab + 1, $cell_type, $cell);
    }
  }

  line($tab, end_tag($tag));
}

sub rows {
  my ($tab, $rows) = @_;
  for my $rowgroup (@$rows) {
    my $type = $rowgroup->[0];
    my @rows = $rowgroup->[1];
    my $attributes = $rowgroup->[2];

    for my $row (@rows) {
      row($tab, $type , $_, $attributes) for @$row;
    }
  }
}

sub thead {
  my ($tab, $opt) = @_;
  my $tag = 'thead';

  return if !$opt->{'rows'};

  line($tab, start_tag($tag, $gen, $opt));
  rows($tab + 1, $opt->{'rows'});
  line($tab, end_tag($tag));
}

sub tfoot {
  my ($tab, $opt) = @_;
  my $tag = 'tfoot';

  return if !$opt->{'rows'};

  line($tab, start_tag($tag, $gen, $opt));
  rows($tab + 1, $opt->{'rows'});
  line($tab, end_tag($tag));
}

sub tbody {
  my ($tab, $opt) = @_;
  my $tag = 'tbody';

  return if !$opt->{'rows'};

  line($tab, start_tag($tag, $gen, $opt));
  rows($tab + 1, $opt->{'rows'});
  line($tab, end_tag($tag));
}

sub table {
  my ($tab, $opt) = @_;
  my $tag = 'table';

  line($tab, start_tag($tag, $gen, $opt));

  $tab++;
  if ($opt->{'caption'}) {
    if (ref($opt->{'caption'}) eq 'ARRAY') {
      caption($tab, $opt->{'caption'}->[0], $opt->{'caption'}->[1]);
    }
    else {
      caption($tab, $opt->{'caption'});
    }
  }

  if ($opt->{'cols'}) {
    col($tab, $_) for @{$opt->{'cols'}};
  }

  thead($tab, $opt->{'thead'}) if $opt->{'thead'};
  tfoot($tab, $opt->{'tfoot'}) if $opt->{'tfoot'};
  if ($opt->{'tbody'}) {
    tbody($tab, $_) for @{$opt->{'tbody'}};
  }
  else {
    tbody($tab, { 'rows' => $opt->{'rows'} });
  }
  $tab--;

  line($tab, end_tag($tag));
}

# End elements for tables.

# Begin elements for forms.

sub label {
  my $tab = shift;
  line($tab, plain_element('label', ['for', @$gen], @_));
}

sub option {
  my $tab = shift;
  line($tab, plain_element('option', ['value', @$gen], @_));
}

sub selection {
  my ($tab, $options, $opt) = @_;
  my $tag = 'select';

  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'before');
  line($tab, start_tag($tag, ['name', 'multiple', @$gen, 'tabindex'], $opt));
  for (@$options) {
    option($tab + 1, @$_);
  }
  line($tab, end_tag($tag));
  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'after');
}

sub datalist {
  my ($tab, $options, $opt) = @_;
  my $tag = 'datalist';

  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'before');
  line($tab, start_tag($tag, ['name', 'multiple', @$gen, 'tabindex'], $opt));
  for (@$options) {
    option($tab + 1, @$_);
  }
  line($tab, end_tag($tag));
  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'after');
}

sub textarea {
  my ($tab, $value, $opt) = @_;

  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'before');
  line($tab, plain_element('textarea', ['name', 'rows', 'cols', @$gen, 'tabindex'], ($value, $opt)));
  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'after');
}

sub input {
  my ($tab, $opt) = @_;
  my $tag = 'input';
  my @input_attributes = qw(type name value placeholder list form accept alt capture files
                            min max minlength maxlength size width height
                            multiple namepattern pattern
                            spellcheck src step inputmode
                            formaction formenctype formmethod formnovalidate formtarget
                            selectionDirection selectionStart selectionEnd
                            valueAsDate valueAsNumber
                            autocomplete autofocus accesskey
                            disabled readonly required checked);
  my $start = start_tag($tag, [@input_attributes, @$gen, 'tabindex'], $opt);
  my $text = $opt->{text} ? "$opt->{text} " : '';

  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'before');
  line($tab, $text.$start);
  label($tab, @{$opt->{'label'}}) if ($opt->{'label'} && $opt->{'place label'} eq 'after');
}

sub inputs {
  my ($tab, $inputs) = @_;
  input($tab, $_) for @$inputs;
}

sub legend {
  my $tab = shift;
  line($tab, plain_element('legend', $gen, @_));
}

sub fieldset {
  my ($tab, $code, $opt) = @_;
  my $tag = 'fieldset';

  line($tab, start_tag($tag, $gen, $opt));
    legend($tab, $opt->{'legend'}) if $opt->{'legend'};
    &$code;
  line($tab, end_tag($tag));
}

sub form {
  code_element('form', ['action', 'method', @$gen], @_);
}

# End elements for forms.

# Start figure elements.

sub figcaption {
  my $tab = shift;
  line($tab, plain_element('figcaption', $gen, @_));
}

sub figure {
  my ($tab, $code, $opt) = @_;
  my $tag = 'figure';

  line($tab, start_tag($tag, $gen, $opt));
  figcaption($tab + 1, @{$opt->{'figcaption'}}) if ($opt->{'figcaption'} && $opt->{'place caption'} eq 'before');
  &$code;
  figcaption($tab + 1, @{$opt->{'figcaption'}}) if ($opt->{'figcaption'} && $opt->{'place caption'} eq 'after');
  line($tab, end_tag($tag));
}


# End figure elements.

sub heading {
  my ($tab, $level, $value, $opt) = @_;
  my $tag = 'h'.$level;
  line($tab, plain_element($tag, $gen, $value, $opt));
}

sub pre     { code_element('pre',     $gen, @_) }
sub div     { code_element('div',     $gen, @_) }
sub header  { code_element('header',  $gen, @_) }
sub footer  { code_element('footer',  $gen, @_) }
sub address { code_element('address', $gen, @_) }
sub aside   { code_element('aside',   $gen, @_) }
sub nav     { code_element('nav',     $gen, @_) }
sub section { code_element('section', $gen, @_) }
sub article { code_element('article', $gen, @_) }
sub main    { code_element('main',    $gen, @_) }
sub body    { code_element('body',    $gen, @_) }

# End elements for body.

sub html {
  my ($tab, $opt) = @_;
  my $tag = 'html';

  print "content-type: text/html \n\n";
  line(0, $opt->{'doctype'} ? $opt->{'doctype'} : '<!DOCTYPE html>');
  line($tab, start_tag($tag, $gen, $opt));
  head($tab + 1, $opt->{'head'})    if $opt->{'head'};
  body($tab + 1, @{$opt->{'body'}}) if $opt->{'body'};
  line($tab, end_tag($tag));
}

# End elements

=head1 NAME

B<HTML::Element> generates HTML tags for most of the HTML elements.

=head1 SYNOPSIS

To use B<HTML::Element> to print HTML tags, use the following. All functions are exported only upon request.

  use Base::HTML::Element qw(
    title heading script anchor paragraph list definition_list table
    form fieldset selection input textarea div pre html
  );

  my @list = (
    'white',
    ['red,    { style => 'color:#ff0000' }],
    ['green', { style => 'color:#00ff00' }],
    ['blue',  { style => 'color:#0000ff' }],
    'black'
  );

  $tab = 0;
  html($tab, {
    'head' => {
      'title'   => 'My page title',
      'links'   => [{ rel  => 'stylesheet', type => 'text/css', href => 'css/style.css' }],
      'scripts' => [{ type => 'text/javascript', src => 'javascript/script.js' }],
    },
    'body' => [
      sub {
        $tab++;

        nav($tab,
          sub {
            list($tab + 2, 'u', \@nav_array);
          }, {
            'heading' => [1, 'Nav heading'],
            'id' => 'nav_id',
            'class' => 'nav_class',
            'style' => 'nav_style'
          }
        );

        article($tab,
          sub {
            $tab++;
            section($tab,
              sub {
                paragraph($tab + 2, 'I did not give this section a header or footer for my sanity.');
                aside($tab + 2,
                  sub {
                    paragraph($tab + 1, 'And now for a ramble on something tangential.');
                  }
                );
              }, {
                'heading' => [2, 'Section 1 heading'],
                'id' => 'section_1',
                'class' => 'section',
                'style' => 'section_1_style'
              }
            );

            section($tab,
              sub {
                paragraph($tab + 2, 'I did not give this section a header or footer either for my sanity.');
                list($tab + 2, 'u', \@list);
              }, {
                'heading' => [2, 'Section 2 has a list of colors'],
                'id' => 'section_2',
                'class' => 'section',
                'style' => 'section_2_style'
              }
            );
            $tab--;
          }, {
            'id' => 'article_id',
            'class' => 'article_class',
            'style' => 'article_class',
            'header' => [sub {
              paragraph($tab + 2, 'Opening remarks in article.', {
                'id' => 'article_open_remarks',
                'class' => 'remarks',
                'style' => 'article_open_style'
              });
            }, {
              'heading' => [1, 'Article heading'],
              'id' => 'article_header_id',
              'class' => 'article_header_class',
              'style' => 'article_header_style'
            }],
            'footer' => [sub {
              $tab++;
              paragraph($tab, 'Closing remarks in article', {
                'id' => 'article_close_remarks',
                'class' => 'remarks',
                'style' => 'article_close_style'
              });
              address($tab, anchor('return to top', { href => '#body_header_id' }));
              $tab--;
            }, {
              'id' => 'body_footer_id',
              'class' => 'body_footer_class',
              'style' => 'body_footer_style'
            }]
          }
        );
        $tab--;
      }, {
        'id' => 'body_id',
        'class' => 'body_class',
        'style' => 'body_style'
        'header' => [sub {
          $tab++;
          paragraph($tab + 2, 'Opening remarks in body.', {
            'id' => 'body_open_remarks',
            'class' => 'remarks',
            'style' => 'font-weight:bold'
          });
          $tab--;
        }, {
          'heading' => [1, 'Body heading'],
          'id' => 'body_header_id',
          'class' => 'body_header_class',
          'style' => 'body_header_style'
        }],
        'footer' => [sub {
          $tab++;
          paragraph($tab, 'Closing remarks in body', {
            'id' => 'body_close_remarks',
            'class' => 'remarks',
            'style' => 'font-size:bigger'
          });
          address($tab, anchor('My email', { href => 'mailto:my@email.com' }));
          $tab--;
        }, {
          'id' => 'body_footer_id',
          'class' => 'body_footer_class',
          'style' => 'body_footer_style'
        }]
      }
    ],
  });

=head1 ELEMENTS

All of the functions C<print> the elements with the exception of C<anchor> and C<img>, which return an anchor or img.

As with the Perl community, the HTML community expects some indentation so tabs, the first parameter of every function, are included with each element except where noted.

The last parameter of every element is a hash reference with named options except where noted. Most elements have the C<id>, C<class>, C<style>, C<lang>, and scripting options (such as C<onclick>). Only the options specific to the element will be noted.

=head2 C<html>

B<C<html>> has the tab and several optional parameters C<head> and C<body>. C<head> is a hash reference with the same optional parameters of C<L<head|/head>> below. C<body> is an array reference with the same values as C<L<body|/body>> below. B<Do not> include the C<$tab> parameters in either.

  html($tab, {
    'head' => {  },
    'body' => [  ],
  });

See the L<synopsis|/SYNOPSIS> for how B<C<html>> could be used.

=head2 C<head>

B<C<head>> is available in case you do not want to use the C<L<html|/html>> function. It has the required parameter C<title> and optional parameters C<base>, C<meta>, C<links>, C<scripts>, C<style>, and C<noscript>.

  head($tab, {
    'title'   => 'My page title',
    'base'    => { href => 'www.mysite.com', target => '_self' },
    'meta'    => \@array_of_meta_hashes,
    'links'   => \@array_of_link_hashes,
    'scripts' => \@array_of_script_hashes,
    'style'   => \@array_of_style_data,
  });

=head3 Setting up C<base>

The base can have a C<href>, C<target>, or both.

  base => { href => 'www.mysite.com', target => '_blank' }

=head3 Setting up C<meta>

Each meta hash would look mostly like the following. The optional parameters are C<name>, C<content>, C<http-equiv>, and C<lang>.

  meta => [
    {
      'http-equiv' => 'Content-Type',
      'content'    => 'text/html; charset=windows-1252'
    },
    {
      'name'    => 'author',
      'content' => 'My name,
      'lang'    => 'en'
    }
  ],

=head3 Setting up C<links>

Each link hash would look mostly like the following. Since there is a conflict between the perl funcion C<link>, this function takes a list of them.

  links => [{
    href => 'css/css.css',
    title => 'title',
    rel  => 'stylesheet,
    type => 'text/css'
  }],

=head3 Setting up C<scripts>

Each script hash would look mostly like the following.

  scripts => [{
    type => 'text/javascript',
    src  => 'javascript/javascript.js'
  }],

=head3 Setting up C<style>

The style array would look mostly like the following.

  style => [
    '
      p { font-size: 10pt; }
      ul { list-style-type: disc; }
    ',
    { type => 'text/css' }
  ],

=head2 C<body>, C<main>, C<section>, C<article>, C<nav>, C<aside>, C<div>, C<noscript>, and C<pre>

=head3 C<body>

B<C<body>> is available in case you do not want to use the C<L<html|/html>> function. It has code and optional parameters.

  body($tab, sub {
    paragraph($tab, 'I have something to say.');
    definition_list($tab, @definition_list_items);
    table($tab, {
      'caption' => 'Table caption',
      'rows'    => \@rows
    });
  }, {
    'id'    => 'body_id',
    'class' => 'body_classes',
    'style' => 'body_styles'
    'heading' => [$heading_level, 'My body heading'],
    'header'  => [sub {
      paragraph($tab + 2, 'A paragraph in the body header.');
    }, {
      'id'    => 'body_header_id',
      'class' => 'body_header_classes',
      'style' => 'body_header_styles',
      'heading' => [$heading_level + 1, 'My body header heading.'],
    }],
    'footer'  => [sub {
      paragraph($tab + 2, 'A paragraph in the body footer.');
      address($tab + 2, anchor('My email', {
        'href' => 'mailto:my@email.com'
      }));
    }, {
      'id'    => 'body_footer_id',
      'class' => 'body_footer_classes',
      'style' => 'body_footer_styles',
      'heading' => [$heading_level + 1, 'My body footer heading.'],
    }],
  });

=head3 C<main>, C<section>, C<article>, C<nav>, and C<aside>

B<C<main>>, B<C<section>>, B<C<article>>, B<C<nav>>, and B<C<aside>> have code and optional parameters like L<body|/body>.

=head4 C<main> example

  main($tab, sub {
    paragraph($tab, 1, 'This is an main I wrote.')
  }, {
    'id'    => 'main_id',
    'class' => 'main_classes',
    'style' => 'main_styles'
    'heading' => [$heading_level, 'My aticle heading'],
    'header'  => [sub {
      paragraph($tab + 2, 'A paragraph in the main header.');
    }, {
      'id'    => 'main_header_id',
      'class' => 'main_header_classes',
      'style' => 'main_header_styles',
      'heading' => [$heading_level + 1, 'My main header heading.'],
    }],
    'footer'  => [sub {
      paragraph($tab + 2, 'A paragraph in the main footer.');
    }, {
      'id'    => 'main_footer_id',
      'class' => 'main_footer_classes',
      'style' => 'main_footer_styles',
      'heading' => [$heading_level + 1, 'My main footer heading.'],
    }],
  });

=head4 C<section> example

  section($tab, sub {
    paragraph($tab, 'My section contents.')
  }, {
    'id'    => 'section_id',
    'class' => 'section_classes',
    'style' => 'section_styles'
    'heading' => [$heading_level, 'My section heading'],
    'header'  => [sub {
      paragraph($tab + 2, 'A paragraph in the section header.');
    }, {
      'id'    => 'section_header_id',
      'class' => 'section_header_classes',
      'style' => 'section_header_styles',
      'heading' => [$heading_level + 1, 'My section header heading.'],
    }],
    'footer'  => [sub {
      paragraph($tab + 2, 'A paragraph in the section footer.');
    }, {
      'id'    => 'section_footer_id',
      'class' => 'section_footer_classes',
      'style' => 'section_footer_styles',
      'heading' => [$heading_level + 1, 'My section footer heading.'],
    }],
  });

=head4 C<article> example

  article($tab, sub {
    paragraph($tab, 1, 'This is an article I wrote.')
  }, {
    'id'    => 'article_id',
    'class' => 'article_classes',
    'style' => 'article_styles'
    'heading' => [$heading_level, 'My aticle heading'],
    'header'  => [sub {
      paragraph($tab + 2, 'A paragraph in the article header.');
    }, {
      'id'    => 'article_header_id',
      'class' => 'article_header_classes',
      'style' => 'article_header_styles',
      'heading' => [$heading_level + 1, 'My article header heading.'],
    }],
    'footer'  => [sub {
      paragraph($tab + 2, 'A paragraph in the article footer.');
    }, {
      'id'    => 'article_footer_id',
      'class' => 'article_footer_classes',
      'style' => 'article_footer_styles',
      'heading' => [$heading_level + 1, 'My article footer heading.'],
    }],
  });

=head4 C<nav> example

  nav($tab, sub {
    heading($tab, 1, 'My page navigation'); # a subheading
    list($tab, 'o', \@my_page_sections);
    heading($tab, 1, 'My site navigation'); # a subheading
    list($tab, 'u', \@my_site_pages);
  }, {
    'id'    => 'nav_id',
    'class' => 'nav_classes',
    'style' => 'nav_styles'
    'heading' => [$heading_level, 'My navigation heading'],
    'header'  => [sub {
      paragraph($tab + 2, 'A paragraph in the nav header.');
    }, {
      'id'    => 'nav_header_id',
      'class' => 'nav_header_classes',
      'style' => 'nav_header_styles',
      'heading' => [$heading_level + 1, 'My nav header heading.'],
    }],
    'footer'  => [sub {
      paragraph($tab + 2, 'A paragraph in the nav footer.');
    }, {
      'id'    => 'nav_footer_id',
      'class' => 'nav_footer_classes',
      'style' => 'nav_footer_styles',
      'heading' => [$heading_level + 1, 'My nav footer heading.'],
    }],
  });

=head4 C<aside> example

  aside($tab, sub {
    paragraph($tab, 'Here are my tangential thoughts about the subject of the article or section.')
  }, {
    'id'    => 'aside_id',
    'class' => 'aside_classes',
    'style' => 'aside_styles'
    'heading' => [$heading_level, 'My aside heading'],
    'header'  => [sub {
      paragraph($tab + 2, 'A paragraph in the aside header.');
    }, {
      'id'    => 'aside_header_id',
      'class' => 'aside_header_classes',
      'style' => 'aside_header_styles',
      'heading' => [$heading_level + 1, 'My aside header heading.'],
    }],
    'footer'  => [sub {
      paragraph($tab + 2, 'A paragraph in the aside footer.');
    }, {
      'id'    => 'aside_footer_id',
      'class' => 'aside_footer_classes',
      'style' => 'aside_footer_styles',
      'heading' => [$heading_level + 1, 'My aside footer heading.'],
    }],
  });

=head3 C<header> and C<footer>

B<C<header>> and B<C<footer>> are available if you do not want to position the C<header> at the beginning of the element and C<footer> at the end of the element. They have code and optional parameters. Both have been built into the C<body>, C<article>, C<section>, C<nav>, and C<aside> functions, but they can be used independently of them.

=head4 C<header> example

  header($tab, sub {
    paragraph($tab, 'This is the header.');
  }, {
    'id'    => 'header_id',
    'class' => 'header_classes',
    'style' => 'header_styles'
    'heading' => [$heading_level, 'My header heading'],
  });

=head4 C<footer> example

  footer($tab, sub {
    paragraph($tab, 'This is the footer.');
  }, {
    'id'    => 'footer_id',
    'class' => 'footer_classes',
    'style' => 'footer_styles'
    'heading' => [$heading_level, 'My footer heading'],
  });

=head3 C<div>

B<C<div>> has code and optional parameters.

  div($tab, sub {
    print "Text with formatting."
  }, {
    heading => [$heading_level, 'My div heading'],
    id    => 'div_id',
    class => 'div_class',
    style => 'div_style'
  });

=head3 C<noscript>

=head3 C<pre>

B<C<pre>> has code but no optional parameters. The C<tab> will be ignored.

  pre($tab, sub {
  print "Text without any formatting, great for data dumping to view in a browser."
  });

=head2 C<heading>

B<C<heading>> has the heading level, value, and optional parameters. This has been built into the C<body>, C<article>, C<section>, C<nav>, C<aside>, C<header>, and C<footer> functions but can be used independently of them.

  heading($tab, 2, 'My second level heading', {
    'id'    => 'heading_id',
    'class' => 'heading_classes',
    'style' => 'heading_styles'
  });

=head2 paragraphs

B<C<paragraph>> has a value and the optional parameter C<separator>.

=head3 C<paragraph>

B<C<paragraph>> prints the paragraph(s). The C<separator> option allows you to input more than one paragraph per use of this function.

  paragraph($tab, 'My paragraph(s)', {
    id    => 'paragraph_id',
    class => 'paragraph_classes',
    style => 'paragraph_styles'
    separator => 'paragraph_separator'
  });

=head2 C<list>

B<C<list>> has type, list, and the optional parameters.

C<type> is C<u> for an unordered list or C<o> for an ordered list. The C<list> parameter is an array reference.

  list($tab, 'u', \@list, {
    id    => 'list_id',
    class => 'list_class'
    style => 'list_style,
  });

=head3 Setting up the list items

If you do not want your list items formatted, you can pass your array as is. If you want your list items formatted, the formatted items are also array references with the optional parameter C<inlist>.

  'unformatted value',
  ['formatted value', {
    id    => 'item_id',
    class => 'item_class',
    style => 'item_style',
    inlist => ['u', \@inner_list, { list options }]
  }],
  'another unformatted value'

=head2 C<definition_list>

B<C<definition_list>> has a definition list and optional parameters.

  definition_list($tab, \@definitions, {
    id => 'definition_list_id',
    class => 'definition_list_class',
    style => 'definition_list_style',
  });

=head3 Setting up the definition list

The definition list array refernce is arrayrefs with the definition terms and definitions.

  my @definitions = (
    ['definition term one','definition for term one'],
    ['definition term two','definition for term two'],
    ['definition term foo','definition for term foo'],
  );

=head2 C<table>

Before you go any further, if you plan on using a table for layout, B<I<STOP!>> Tables are for tabular data, use L<div|/div> elements to lay out your webpage.

B<C<table>> has the optional parameters of C<caption>, C<cols>, and C<rows>.

C<cols> and C<rows> are array references.

  table($tab, {
    id      => 'table_id',
    class   => 'table_class',
    style   => 'table_style',
    caption => 'table caption',
    cols    => \@cols,
    rows    => \@rows,
  });

=head3 Setting up the caption

C<caption> is a value, as seen above, or an array refernce. The C<caption> has the optional parameter C<align>.

  ['table caption', {
    id    => 'caption_id',
    class => 'caption_class',
    style => 'caption_style',
    align => 'caption_align'
  }],

=head3 Setting up the columns

Each C<column> is an array reference of hash references and each has the optional parameter C<span>.

  {
    id    => 'col_id',
    class => 'col_class',
    style => 'col_style'
    span  => 2,
  },

=head3 Setting up the rows

Each C<row> is an array reference with C<type>, C<cells>, and optional parameters. You need to know type of cells are in the row.

=over

=item *

C<header> is a row with only headings. There is only one row allowed in C<header>.

=item *

C<data> is a group of rows with only data.

=item *

C<whead> is a group of rows with a heading then data.

=back

  rows => [
    ['header', \@headings, {
      id    => 'header_row_id',
      class => 'header_row_class',
      style => 'header_row_style'
    }],
    ['data', \@data, {
      id    => 'data_row_id',
      class => 'data_row_class',
      style => 'data_row_style'
    }],
    ['whead', \@data_with_heading],
  ],

=head4 Setting up the cells

If you do not want your cells formatted, you can pass your array as is. If you want your cells formatted, the formatted cells are also array references with optional parameters C<list> and C<type_override>. The C<list> option is the same as the C<inlist> option for L<list items|/Setting up the list items>. If you need to override the row type, use C<type_override>.

  'unformatted value',
  ['formatted value', {
    id    => 'cell_id',
    class => 'cell_class',
    style => 'cell_style',
  }],
  ['list', {
    id    => 'cell_with_list_id',
    class => 'cell_class',
    style => 'cell_style',
    list => ['u', \@list_in_cell, { list options }]
  }],
  ['formatted value', {
    id    => 'cell_id',
    class => 'cell_class',
    style => 'cell_style',
    type_override => 'h',
  }],
  'another unformatted value'

=head2 forms

=head3 C<form>

B<C<form>> has code and the optional paramters C<action> and C<method>.

  form($tab, sub {
    ... form elements ...
  }, {
    action => 'form_action',
    method => 'form_method',
    id     => 'form_id',
    class  => 'form_class',
    style  => 'form_style'
  });

=head3 C<fieldset>

B<C<fieldset>> has code and the optional paramter C<legend>.

  fieldset($tab, sub {
    ... fieldset elements ...
  }, {
    legend => 'legend_text',
    id     => 'fieldset_id',
    class  => 'fieldset_class',
    style  => 'fieldset_style'
  });

=head4 Setting up the legend

The legend can be unformatted as above or formatted as below in an array reference with the optional parameter C<align>.

  legend => ['legend_text', {
    id    => 'legend_id',
    class => 'legend_class',
    style => 'legend_style,
    align => 'legened_align'
  }],

=head3 C<selection>

B<C<selection>> has options and the optional parameters C<name>, C<multiple>, C<label>, and C<tabindex>.

  selection($tab, \@options, {
    name     => 'select_name',
    multiple => 'multiple',
    label    => ['label text', {
      for   => 'select_name',
      id    => 'label_id',
      class => 'label_class',
      style => 'label_style'
    }
    id       => 'select_id',
    class    => 'select_class',
    style    => 'select_style'
  });

=head4 Setting up the options

If you do not want your options formatted, all you need to do is pass the text and C<value> of the option. If you want formatting, you need to pass the other optional parameters.

  ['unformatted option', {
    value => 'unformatted'
  }],
  ['formatted option', {
    value => 'formatted',
    id => 'option_id',
    class => 'option_class',
    style => 'option_style'
  }]

=head3 C<input>

B<C<input>> has the optional parameters C<type>, C<value>, C<name>, C<label>, and C<tabindex>.

=head3 C<inputs>

B<C<inputs>> takes a list of parameters to print many instances of C<input>.

=head3 C<textarea>

B<C<textarea>> has a value and the optional parameters C<name>, C<rows>, C<cols>, C<label>, and C<tabindex>.

  textarea($tab, 'text in the textarea box', {
    name     => 'textarea_name',
    rows     => 100,
    cols     => 100,
    label    => ['label text', {
      for   => 'textarea_name',
      id    => 'label_id',
      class => 'label_class',
      style => 'label_style'
    }
    id       => 'textarea_id',
    class    => 'textarea_class',
    style    => 'textarea_style'
  });

=head2 C<figure>

B<C<figure>> has a value and the optional parameters C<figcaption> and C<place caption>.

  figure($tab, {
    print img({
      src => 'image1.jpg',
      alt => 'image one'
    })
  }, {
    figcaption => ['figure caption text', {
      id    => 'figcaption_id',
      class => 'figcaption_class',
      style => 'figcaption_style'
    }],
    'place caption' => 'after',
    id    => 'figure_id',
    class => 'figure_class',
    style => 'figure_style'
  });

=head2 C<script>

B<C<script>> has optional parameters C<type> and C<src>.

  script($tab, {
    type => 'text/javascript', # or other type
    src => 'script.ext'
  });

=head2 C<anchor>

B<C<anchor>> has a value and the optional parameters C<href>, C<target>, and C<title>. C<anchor> does not not get a C<tab>.

  anchor('Anchor text', {
    href   => 'link location',
    target => 'where the link opens',
    title  => 'alternate text',
    id     => 'anchor_id',
    class  => 'anchor_classes',
    style  => 'anchor_styles'
  });

=head1 SEE ALSO

L<CGI> can do all of the above with objects. Where an HTML element matches a Perl function, they just uppercased the element which feels very wrong to me.

L<HTML::Element> can also do all of the above with objects, but you have to build each element yourself.

L<HTML::HTML5::Builder> and L<Template::Declare::Tags> also build HTML elements.

There are many other modules out there which can build HTML elements, but most are object oriented. I find it easier to deal with functions over objects when printing.

=head1 AUTHOR

Lady Aleena with a lot of help from the L<PerlMonks|http://www.perlmonks.org>.

=cut

1;
