package HTML::Attributes;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(attributes);

my %string_eq = (
  area   => ['nohref'],
  form   => [qw[accept-charset action enctype method onreset onsubmit]],
  frame  => ['noresize'],
  head   => ['profile'],
  input  => [qw[checked maxlength]],
  label  => ['for'],
  object => [qw[archive classid codebase codetype data declare standby]],
  option => ['selected'],
  param  => ['valuetype'],
  select => ['multiple'],
  script => ['defer'],
  table  => [qw[border cellpadding cellspacing frame rules summary]],
);

my %regex = (
  qr/^(?:a|button|form|frame|iframe|img|input|object|map
    |param|meta|select|textarea)$/x                      => ['name'],
  qr/(?:a|area|base|link)/                               => ['href'],
  qr/(?:a|area|base|link|form)/                          => ['target'],
  qr/(?:a|area|button|input|label|legend|textarea)/      => ['accesskey'],
  qr/(?:a|area|button|input|object|select|textarea)/     => ['tabindex'],
  qr/(?:a|link|button|input|object|param|script|style)/  => ['type'],
  qr/(?:a|link|script)/                                  => ['charset'],
  qr/(?:col|colgroup)/                                   => ['span'],
  qr/(?:meta)/                                           => [qw[content http-equiv scheme]],
  qr/^(?:a|area)$/                                       => [qw[coords shape]],
  qr/^(?:a|area|button|input|label|select|textarea)$/    => [qw[onblur onfocus]],
  qr/^(?:a|link)$/                                       => [qw[hreflang rel rev]],
  qr/^(?:body|frameset)$/                                => [qw[onload onunload]],
  qr/^(?:button|input|optgroup|option|select|textarea)$/ => ['disabled'],
  qr/^(?:col|colgroup|tbody|td|tfoot|th|thead|tr)$/      => [qw[align char charoff valign]],
  qr/^(?:del|ins)$/                                      => [qw[cite datetime]],
  qr/^(?:form|input)$/                                   => ['accept'],
  qr/^(?:frameset|textarea)$/                            => [qw[cols rows]],
  qr/^(?:frame|iframe)$/                                 => [qw[frameborder longdesc marginheight marginwidth scrolling]],
  qr/^(?:iframe|img|object)$/                            => ['height'],
  qr/^(?:iframe|img|object|table|col|colgroup)$/         => ['width'],
  qr/^(?:image|area|input)$/                             => ['alt'],
  qr/^(?:img|input)$/                                    => ['ismap'],
  qr/^(?:img|input|object)$/                             => ['usemap'],
  qr/^(?:input|frame|iframe|img|script)$/                => ['src'],
  qr/^(?:input|option|param|button|li)$/                 => ['value'],
  qr/^(?:input|select)$/                                 => ['size'],
  qr/^(?:input|select|textarea)$/                        => ['onchange'],
  qr/^(?:input|textarea)$/                               => [qw[onselect readonly]],
  qr/^(?:option|optgroup:)$/                             => ['label'],
  qr/^(?:style|link|form)$/                              => ['media'],
  qr/^(?:td|th)$/                                        => [qw[abbr axis colspan headers rowspan scope]],
);

my %not_regex = (
  qr/^(?:applet|base|basefont|bdo|br|font
    |frame|frameset|head|html|iframe
    |isindex|meta|param|script|style|title)$/x    => [qw[onclick ondblclick onkeydown onkeypress onkeyup onmousedown
                                                      onmousemove onmouseout onmouseover onmouseup]],
  qr/^(?:base|basefont|head|html|meta|param
    |script|title|style)$/x                       => [qw[class style]],
  qr/^(?:applet|base|basefont|bdo|br|frame|iframe
    |frameset|param|script)$/x                    => ['dir'],
  qr/^(?:base|head|html|meta|script|style|title)$/ => ['id'],
  qr/^(?:applet|base|basefont|br|frame|frameset
    |iframe|param|script)$/x                      => ['lang'],
  qr/^(?:base|basefont|head|html|meta|param
    |script|title)$/x                             => ['title'],
);

sub attributes {
  my ($element) = @_;
  my @attributes;
  push @attributes, @{ $string_eq{$element} } if exists $string_eq{$element};
  for my $regex (keys %regex) {
    push @attributes, @{ $regex{$regex} } if $element =~ $regex;
  }
  for my $regex (keys %not_regex) {
    push @attributes, @{ $not_regex{$regex} } if $element !~ $regex;
  }
  return \@attributes;
}

1;
