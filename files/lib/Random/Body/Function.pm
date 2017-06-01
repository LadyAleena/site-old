package Random::Body::Function;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(random_body_function random_body_functions);

use RolePlaying::Random qw(random);
use Fancy::Join::Grammatical qw(grammatical_join);

my %body_functions = (
  'sleep' => [
    'hardly ever wakes up',
    'needs to sleep twice as often',
    'needs to sleep half as often',
    'does not need to sleep',
    'is an insomniac',
    'is a narcoleptic',
    'must hibernate in the winter',
    'must estivate in the summer',
    'is unable to remember the past after sleeping'
  ],
  'bathe' => [
    'hardly stops bathing',
    'needs to bathe twice as often',
    'needs to bathe half as often',
    'does not need to bathe',
    'bathes only in frigid water',
    'bathes only in boiling water',
    'is hairless after bathing'
  ],
  'eat' => [
    'can not stop eating',
    'needs to eat twice as much food',
    'needs to eat half as much food',
    'does not need to eat food',
    'is carnivorous',
    'is herbivorous',
    'is lethargic after eating any amount of food'
  ],
  'drink' => [
    'can not stop drinking',
    'needs to drink twice as much liquid',
    'needs to drink half as much liquid',
    'does not need to drink liquids',
    'is an alcoholic',
    'can not get drunk',
    'is intoxicated after injesting any liquid'
  ],
  'other' => [
    'can not stop sneezing',
    'can not stop crying',
    'breaks into song',
    'runs in circles'
  ]
);

sub random_body_function {
  my ($user_function) = @_;
  
  my $body_function;
  if (ref($user_function)) {
    my @functions;
    for my $function (@$user_function) {
      push @functions, random(\%body_functions, $function, { additions => [map("is ${_}active after $user_function", qw(hypo hyper))] });
    }
    
    $body_function = grammatical_join('and',@functions);
  }
  else {
    $body_function = random(\%body_functions, $user_function, { 'caller' => (caller(0))[3] });
  }
  
  return $body_function;
}

sub random_body_functions {
  my @body_functions = (
    ['sleep'],
    ['bathe'],
    ['eat'],
    ['drink'],
    ['sleep','bathe'],
    ['sleep','eat'],
    ['sleep','drink'],
    ['bathe','eat'],
    ['bathe','drink'],
    ['eat','drink'],
    ['sleep','bathe','eat'],
    ['sleep','bathe','drink'],
    ['sleep','eat','drink'],
    ['bathe','eat','drink'],
    ['sleep','bathe','eat','drink']
  );
  my $functions = random_body_function($body_functions[rand @body_functions]);
  
  return $functions;
}

1;
