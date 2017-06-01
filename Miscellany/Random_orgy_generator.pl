#!/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);
use Lingua::EN::Inflect qw(A NUMWORDS);

use lib "../files/lib";
use Base::Page qw(page story);
use Random::Body::Modification qw(random_body_modification);
use Random::Color qw(random_color);
use Random::Descriptor qw(random_descriptor);
use Random::Misc qw(random_sexual_orientation random_relationship);

my $participants = (3..10)[rand 8];

sub age {
  my @ages = (18..75);
  return $ages[rand @ages];
}

sub participant {
  my $relationship = random_relationship;
  my $age          = NUMWORDS(age);
  my $gender       = qw(man woman)[rand 2];
  my $orientation  = random_sexual_orientation;
  my $somatotype   = random_body_modification('somatotype');
  my $quality      = A(random_descriptor('quality'));
  my $hair_color   = random_color('hair');
  my $eye_color    = random_color('eye');

  return ucfirst A("$relationship $age year old $somatotype $gender with $hair_color hair and $eye_color eyes who is $orientation and $quality lover.");
}

my @participants;
push @participants, participant for (3..$participants);

my $magic = { 'participants' => join("\n", @participants)."\n" };

page( 'code' => sub { story(*DATA, { 'line magic' => $magic }) });

__DATA__
If you are writing an orgy scene and need inspiration on who is there, here you go!
2 Orgy participants
^participants^
