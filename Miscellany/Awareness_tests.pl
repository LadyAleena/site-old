#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);

my $line_magic = { 'hide' => qq(class="hide") };

page( 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
The answers are hidden on this page.
2 General questions
#| faq
# How many birthdays does the average man have? (A<Answer|class="toggle">SPAN<: One, we are born only once.|^hide^>)
# Take two apples from three apples and what do you have? (A<Answer|class="toggle">SPAN<: Two apples|^hide^>)
# Do they have a 4th of July in England? (A<Answer|class="toggle">SPAN<: Yes|^hide^>)
# Why can’t a man living in North Carolina be buried west of the Mississippi River? (A<Answer|class="toggle">SPAN<: He is still alive.|^hide^>)
# If you had only one match and entered a room, in which there was a kerosene lamp, an oil heater, and a wood burning stove, which would you light first? (A<Answer|class="toggle">SPAN<: The match|^hide^>)
# Some months have 30 days some have more or less. How many months have 28 days? (A<Answer|class="toggle">SPAN<: 12, all months have 28 days in them, at least.|^hide^>)
# I have in my hand only two U.S. coins, which total fifty-five cents. One is not a nickel. What are the two coins? (A<Answer|class="toggle">SPAN<: A half dollar and a nickel|^hide^>)
# A farmer had seventeen sheep. All but nine died. How many did he have left? (A<Answer|class="toggle">SPAN<: 9|^hide^>)
# Divide thirty by ½ and add ten. What is the answer? (A<Answer|class="toggle">SPAN<: 70, 30/½ = 60 + 10 = 70|^hide^>)
# How many animals of each species did Moses take aboard the Ark with him? (A<Answer|class="toggle">SPAN<: None, Noah took the animals onto the Ark.|^hide^>)
# Is it legal in California for a man to marry his widow’s sister?  Explain. (A<Answer|class="toggle">SPAN<: Yes, since there is no need for such a law against it, since the man is dead.|^hide^>)
# A woman gives a beggar fifty cents. The woman is the sister of the beggar, but the beggar is not the woman’s brother. How come? (A<Answer|class="toggle">SPAN<: The beggar is the woman’s sister.|^hide^>)
2 Narrative
The owner of the Adams Manufacturing Company entered the office of one of his foremen where he found three employees playing cards. One of them was Carl Young, brother-in-law of Foreman Henry Dilson. Dilson, incidentally, often worked late. Company rules did not specifically forbid gambling on the premises, but the president had spoken forcibly on the subject.
3 Statements
#| faq
# T F - The story is about a company owner who found three men playing cards. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - The president walked into the office of one of his foremen. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - Company rules forbade playing cards on the premises after hours. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - The card playing took place in Henry Dilson's office. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - Dilson never worked late. (A<Answer|class="toggle">SPAN<: false|^hide^>)
# T F - Gambling on the premises of the Adams Manufacturing Company was not punished. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - Carl Young was not playing cards when the president walked in. (A<Answer|class="toggle">SPAN<: false|^hide^>)
# T F - Company rules forbade gambling on the premises. (A<Answer|class="toggle">SPAN<: false|^hide^>)
# T F - Three employees were gambling in a foreman's office. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - The card players were surprised when the owner walked in the foreman's office. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - Henry Dilson is Carl Young's brother-in-law. (A<Answer|class="toggle">SPAN<: true|^hide^>)
# T F - The president is opposed to gambling on the company premises. (A<Answer|class="toggle">SPAN<: uncertain|^hide^>)
# T F - A corporation owner found three employees playing cards. (A<Answer|class="toggle">SPAN<: true|^hide^>)
# T F - Henry Dilson is a foreman at Adams Manufacturing Company. (A<Answer|class="toggle">SPAN<: true|^hide^>)
# T F - The president did not allow card playing at his company. (A<Answer|class="toggle">SPAN<: false|^hide^>)
