#!/usr/bin/perl
use strict;
use warnings;

use lib "../files/lib";
use Base::HTML qw(html);
use Base::HTML::Element qw(form fieldset textarea);

html( code => sub {
  form(3, sub {
    fieldset(4, sub {
      textarea(5,'', { name => 'the_text', rows => 25, cols => 0, style => 'margin:0; border-width:1px 2px; padding:0; width:99%; height:100%;' });
    });
  }, { action => 'Textbox.pl', method => 'post', style => 'width:100%;margin-left:0;'});
});
