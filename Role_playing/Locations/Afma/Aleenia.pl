#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(img);
use Util::Data qw(file_directory);
use Util::Line qw(line);

my $doc_magic;
$doc_magic->{'flag'} = sub {
  line(6, img({ 'src' => '../../../files/images/flag.jpg', 'alt' => 'Aleenia flag', 'class' => 'right' }))
};
page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
& flag
Aleenaia is the island residence of the goddess A<Aleena|href="Aleena.pl">. When she wants visitors, she will create a magical bridge between the Isle and the person she wants to visit. No matter how far away from the Isle the person is, a magical bridge will appear to transport those who are worthy to the Isle. There are no other bridges to the Isle and the currents are such that ships could not dock there without the blessing of the Goddess.
Most people who Aleena has allowed to live on her Isle is a member her faith.
The seat of the Isle's government is also the Temple to Aleena. The Isle's currency is diamonds. The Isle's national animal is the astrodragon.
2 Surroundings
There are three islands which are near the Isle of the Goddess: Vommisu's Isle, Kord's Isle, and Ranasp's Isle. Unfortunately the details about those islands have been lost.
2 Marriage and family
Marriage on Aleenia is a sacred event that involves four people coming together to form a quadrinostia. The titles of the four are as follows with their descriptions and appropriate insignia worn on a pendent:
* Superandromate is the dominant man who wears a sapphire over an emerald on his pendant.
* Supergynomate is the dominant woman who wears a ruby over an emerald on her pendant.
* Subandromate is the submissive man who wears a sapphire over an aquamarine on his pendant.
* Subgynomate is the submissive woman who wears a ruby over an aquamarine on her pendant.
The first part of the ceremony is the joining of the superandromate to the supergynomate. Then the submates are joined. After both couples are joined, the two couples are brought together and both couples are joined into the quadnostia.
The supermates are legally responsible for the quadnostia. Any children produced within the quadnostia mostly fall under the jurisdiction of the supermates. If the child is of both submates, the submates have limited jurisdiction of their issue. Normally, the supermates grant the submates all rights to their children. It is very rare that the supermates would deny submates their paternal rights.
There is a rare household called a hexanostia. This household has two additional members as follows:
* Metandromate is a man who can switch between dominant and submissive. He wears a sapphire over a helidor on his pendant.
* Metagynomate is a woman who can switch between dominat and submissive. She wears a ruby over a helidor on her pendant.
The metamates stand higher in the household than the submates, yet lower than the supermates. The supermates are still the heads of the household. Metamates have more freedoms than the submates. Children of metamates fall automatically under their jurisdiction if the child is the issue of the other metamate or of a submate. A metamate's child by a supermate falls under the jurisdiction of the supermate.
The widowed quadrinostia's or hexanostia's members wear a padparadscha attached to their pendents.
A person who the supermates of a nostia feel are mature enough to marry wear a single pink sapphire. A person who is engaged wears a single yellow sapphire.
Adultery is rare in Aleenia. With the diversity in each household, most people live the rest of their lives having sexual relations with those to whom they are married. Divorce is very rare since it is so complicated. Divorced people do not wear any insignia.
Very rare households are the xenonostias. These households are created by the rare Aleenir citizens who are not Aleenists. Their marriages are considered legal in Aleenia with the same complicated divorce proceedings. It is extremely rare for a person who is not an Aleenist to enter into a quadrinostia. There have been only a handful of cases where a non-Aleenist has entered into a hexanostia in the history of the Aleenan faith.
2 Note
This nation was initially created for the game A<NationStates|href="https://www.nationstates.net/nation=aleenia">, but I let the nation lapse every now and again.
