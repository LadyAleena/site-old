#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
2 My Love Number One
stanza I love you|From the bottom of my heart|I love you|I don't know where to start.|I love you|I will always be true.|I love you|So I will say I do.
2 My Love Number Two
stanza I love you|with all my heart.|I love you|it tears my soul apart.|I love you|it clouds my mind.|I love you|It is love redefined.
2 Beacon
stanza Your love is a beacon|through blinding haze and fog.|You lifted me up from|an emotionally laden bog.|I was sinking into|the mire and muck.|I turned around and was hit|with incredible luck.|The light coming towards me|bringing me much joy and hope.|The heat surrounding me|and latched on like a stout rope.
2 Reasons
stanza I am the storm|You are the rock.|I am the flame|You are the fuel.|I am darkness|You are light.|I am compulsive.|You are steady-true.|I am the rain|You are the lake.|I am wildfire|You are the forest.|I am the moon|You are the sun.|I was shattered|Reassembled by you.
