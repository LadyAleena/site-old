#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use HTML::Elements qw(definition_list);
use Util::Data qw(make_array);

my $directory = 'Role_playing/Locations/Olakeen';
my $headings  = ['term','definition'];

my %definition_lists = (
  'Holidays' => make_array( 'file' => [$directory, 'Holidays.txt'], 'headings' => [qw(term date celebrations)]),
);
$definition_lists{$_} = make_array( 'file' => [$directory, "$_.txt"], 'headings' => $headings) for qw(Inns Crime Arena);

for my $bare_term (@{$definition_lists{'Holidays'}}) {
  my $term = $bare_term->{'term'};
  $bare_term->{'term'} = [$term, { 'class' => 'holiday' }];
}

my $doc_magic = {
  'Inns'     => sub { definition_list(5, $definition_lists{'Inns'}) },
  'Crime'    => sub { definition_list(5, $definition_lists{'Crime'}) },
  'Arena'    => sub { definition_list(6, $definition_lists{'Arena'}) },
  'Holidays' => sub { definition_list(5, $definition_lists{'Holidays'},
                      { 'headings' => [qw(date celebrations)], 'span class' => 'definition_heading' }
                    )},
};

page( 'heading' => 'Olakeen - The City of Money and Magic', 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
The city of Olakeen is a vast city of commerce. Built around the Temple of Waukeen and the School of Sorcery, it has spread out for miles in all directions. It is located on Toril. Tantras is to the north, Procampur is to the south, and the Dragon Reach in the Sea of Fallen Stars is to the east.
The massive gates open to the Market which lies between the Temple and the School. Behind the Temple and the School is the Military District. There are four major commercial districts, and the Garden of Shrines. The main gate faces the Dragon Reach, but there is a smaller gate that leads directly to the Garden. Both gates are tightly guarded.
The sisters Eileen and Alexana Olara rule the city jointly. Holycoin Eileen rules from The Temple of Waukeen while Arch-Sorceress Alexana rules from The School of Sorcery. The military is shared by the sisters, as are all the expenses of running the city. When they are absent, the A<Assembly|href="#Assembly"> rules the city.
2 The Temple of Waukeen
The Temple of Waukeen is one of two massive structures in the city of Olakeen. It was built by Holycoin Eileen Olara after Waukeen\'s rescue from the Abyss. The towers of the Temple soar over the city, which can be seen five miles out from the city.
2 The School of Sorcery
The School of Sorcery is the other massive structure in the city of Olakeen. It was built by Arch-Sorceress Alexana Olara after she helped her sister Eileen rescue Waukeen from the Abyss. The towers reach the same height as the towers of the Temple and are just as lovely to behold.
2 The Assembly
|| right
|! Assembly terms
|+ Magistrate | 5 years
|+ Prefect | 5 years
|+ Guild Master | varies
|+ Captain | retirement
|+ Shrine Priest | retirement
The Assembly is the voice of the city. Alexana and Eileen created the Assembly so that they could hear the complaints and suggestions of their residents. The Assembly votes on issues that affect the city, but Alexana and Eileen have the final say on any matter if they choose to intervene at all. The Assembly is also the voice to the city. They are the ones who have to inform their constituents of any changes in the law or new laws.
The Assembly is made up of the Magistrates, the Guild Masters, Prefects, Captains in the Military, and the Priests of the Garden. The Assembly meets on the last day of every month alternatively at the Temple or the School. Alexana or Eileen presides over these meetings depending on where it is being held. These meetings can get heated and last all day. At the end of the day, they have to come to a consensus. If a consensus has not been reached, Alexana or Eileen will make a decision without their vote. Some of the Assembly members are amazed at how fast news travels between the sisters. Every once in a while one or the other has been seen acting as if some private internal battle is taking place. Though strange most ignore this since the Ladies are very powerful in magic lore.
If the sisters are not in the city, the Assembly can pass temporary laws in their absence. These laws will have to be ratified by Alexana and Eileen upon their return, but most of the time they show full confidence in the Assembly.
No one can hold two offices at the same time.
2 The Market and Bazaar
The Market and Bazaar are very crowded places and are the first things a visitor will see upon entering Olakeen. The Market boarders a grand Bazaar. The Bazaar is a vast open area where almost anything can be bought or sold. You should not be surprised if you sell something to one vendor and then see it being sold by another vendor on the other side of the Market a few hours later. That is normal for the Bazaar.
Before going 50 feet into the area, visitors must stable their animals. No large animals will be allowed into the area unless it is being loaded or unloaded. Stalls can be rented in the Olakeen Stables for 10 gp a day per animal. The animals are carefully tended, and visitors belongings will be stored in a secure locker by the stalls. The storage comes with the stall rental.
On the outskirts of the Bazaar is the Market where more wealthy traveling merchants sell their wares. The Market is a little quieter than the Bazaar. The closer to the center of the Bazaar; the louder and more crowded it will become. The poorer traveling merchants are in the middle. Some of these poor merchants do not have any way to divide their merchandise from their neighbors', unless a neighbor has such a divider. Most of the middle is a muddle of assorted goods and services. The riot of color and sound, it is said, is enough to blind and deafen a person who is not used to it.
Throughout the Bazaar there are members of various A<Guilds|href="#Guilds">. These guilds are primarily for the appraisal of items bought. If a customer thinks feels cheated, the item can be taken to an Appraiser. The normal fee for services rendered is 1 gp per item appraised. Most of the Appraisers are reformed thieves. A person can take a magic item to a Market Mage to have the dweomers checked. This can cost 100 gp or more per item. If either of these guilds finds a flaw in the product or finds that the item was not sold fairly, the Appraiser or the Market Mage has the authority to shut down the operation of the merchant involved and launch an investigation. If the merchant is found at fault, his merchandise, money, and the rest of his property in Olakeen will be confiscated. The merchant will be able to resume trade the day after the investigation is complete after being found innocent of willful deceit.
The Clergy of Waukeen walk the Market every day making sure that the merchants and the customers are treating each other fairly. If a merchant is not doing well, a cleric will stop by the stand and look over the goods to see if there is a good reason that the person is not selling anything. If the merchandise is of at least good quality and the merchant is amiable, the cleric will hang a non-magical coin of Waukeen on the stand. Seeing this others will be made aware of the fact that this merchant should be approached. Rarely some merchants are not so well favored. A merchant who is selling sub-standard goods or treating customers unfairly may get a curse from a cleric. Woe to the merchants who have this happen to them!
At the end of the week, the western quadrant of the Market will be cleared for trials of the more greivous crimes that occured that week. (See A<Crime and Punishment|href="#Crime_and_punishment">)
On special occasions the Market, Bazaar, or both are shut down for the celebrations of city holidays, either a full day or a half day. If a holiday happens to fall on the last day of the week, the trials are held the next day.  (See A<Holidays|href="#Holidays">)
2 Districts
The districts form a minor political division in the city. The northern districts are ruled primarily by Eileen, the southern districts are ruled primarily by Alexana.
3 Commercial Districts
There are four Commercial Districts in Olakeen. Each is subtly different from the rest. The districts have magistrates who report to Alexana and Eileen. Each Magistrate has one vote in the A<Assembly|href="#Assembly">.
4 North Market District
This district is to the north of the Market beside the Temple of Waukeen. This is where nearly anything can be bought from something as simple as housekeeping tools to as dangerous as weapons. There are many shops where repair work can be done on anything from arrows to waterskins. There are very few shops that sell anything magical in this district.
4 South Market District
This district is south of the Market next to the School of Sorcery. This is where you can buy foodstuffs and medicinal herbs. There are many magic shops here which sell minor magic items. Some of the shops are run by students of the School.
4 North Garden District
This district is to the north of the Military District and the Garden of Shrines. High quality items are sold here such as jewelry and fine tapestries. This district is a relatively quiet one. Some inexpensive magic items can be found here. Taverns are not allowed in this district.
4 South Garden District
This district is to the south of the Military District and the Garden of Shrines. The more spectacular magic items are sold here. The shops are almost exclusively run by magic users. There are some non-magical shops which sell high quality items such as grand furniture and artwork. This district is a quiet one since most of the people who work here prefer quiet contemplative serenity. Taverns are not allowed in this District.
3 Residential Districts
There are ten residential districts in Olakeen. Each has an elected Prefect to represent it in the A<Assembly|href="#Assembly"> with one vote. Each district has approximately 2,500 people living in it. Residential districts do have some shops mostly for the convenience of the residents. Scattered inns are in these areas and are slightly less expensive from the ones in the Commercial Districts. They are usually bed and breakfasts catering to long term stays.
The district names are very simplistic. The northern districts are Copper, Silver, Electrum, Gold, and Platinum. The southern districts are Scrolls, Rings, Wands, Rods, and Staves.
3 The Military District
This is where the soldiers live and train. The Arena is part of this District, and sections can be rented by adventuring parties for non-lethal combat. The fee is 50gp for an hour in the Arena per group. The military routinely patrols the borders of Olakeen and watches the walls of the city. They rarely get into the way of the city police force. There are 18 Companies each with a Captain. Captains have one vote in the A<Assembly|href="#Assembly">. There are 6 Companies in Olakeen at any given time.
2 Guilds
There are many guilds in Olakeen that were set up by Alexana and Eileen to insure that quality goods would be sold within the city. Some guilds have people everywhere; some just give quick looks at the merchandise. You can register with a guild upon entry into the Market. All of them have offices near the entrance, and each has a Guildhall. A traveler who registers with a guild will be sent work while in the city. The inn where they are staying will become their address. If there is no guild that covers your specialty, you can apply in either the Temple or School for a permit to create one that will.
Guilds are excellent places to go for accurate directions within the city and can also recommend other guilds if you have a problem that needs to be solved.
Each guild has a Guild Master. Each Guild Master has one vote in the A<Assembly|href="#Assembly">.
3 City Guilds
4 Appraisers' Guild
This guild regulates all the appraisers within the city. It was created by the sisters so that no one will be cheated within the city. Second opinions can be sought here.
4 Mages of the Market Guild
This guild regulates the mages that check the dweomers of magic items bought within the city. Its purpose is the same as the Appraisers' Guild.
3 Independent Guilds
4 Agricultural Guild
This guild regulates farmers, foresters, hunters, and trappers. This is the only guild that truly appreciates the natural world. The abuse of animals is not tolerated by them since it lowers the animal's value and appeal. Many of the Guild members grow unusual crops or raise exotic animals for the School.
4 Guild of Arms
This guild tightly regulates armorers, bowyers and fletchers, and weaponsmiths. If this guild finds a person selling inferior armor or weapons, they will first offer assistance with training. If the merchant refuses, they will inform the Temple or School. The Guild has exclusive contracts with the military.
4 Guild of Artists
This guild loosely regulates painters, musicians, and writers. Traveling bards should register with them before performing within the city as a courtesy. Once registered a bard does not have to register again and will get good treatment by the Guild. They will help find venues for the weary traveler to make enough money to stay in a good inn at least. Some fortunate Bard may called to appear in front of Sorceress Alexana or Holycoin Eileen or both.
4 Guild of Carpentry
This guild regulates carpenters and foresters though their authority over Foresters is only over the quality of wood brought inside the city.
4 Guild of the Cloth
This guild regulates tailors, weavers, furriers, and coppers; and they have some authority over hunters, but only in how hides are handled.
4 Guild of Healers
This guild regulates all forms of healing within the city with the exception of clerical magics. When registered with this guild, a person will be sent medical cases. Most people will not want to go to a temple for a simple ailment.
4 Guild of the Sea
This guild regulates fishermen and shipwrights, but have no authority over the city's small navy, though they do conduct business with them. A person can go to them with pirate reports and get paid a small sum when the report is verified.
4 Stones and Gems Guild
This guild regulates masons, jewelers, and miners. Though there are no mines within the city, what the miners sell is under the auspices of the Stones and Gems Guild. Every stone laid and statue created in the city has been placed by a guild member. The guild is always looking for exotic gems and metals. They pay good money for these.
3 Thieves' Guild
The thieves' guild in Olakeen is closely watched by the Olaras. They will come to you if they feel you would do their little organization any good. They have been known to abduct possible members from inn rooms. They also watch for any assasins' guilds that move in. They are known to inform the Ladies if there is any threat to the city. The watch will not hesitate to arrest a bumbling member, yet if the same member came with news of trouble, the watch will listen.
3 Notable Inns
& Inns
2 Garden of Shrines
There is a smaller entrance to central Olakeen. This entrance leads to a quiet and contemplative garden. This is the Garden of Shrines. The garden is dedicated to the various gods that have had some impact on the Church of Waukeen or the Olara sisters personally. Each Shrine is elaborately decorated in honor of the god. These shrines are the size of small temples; some are more ornate than the temples built by the clergies of the deities themselves to the consternation of some. The High Priest who resides on the grounds of each Shrine has one vote in the A<Assembly|href="#Assembly">.
3 The Shrines
*| two
* Shrine of the Lady of Joy (Lliira)
* Shrine of Luck (Tymora)
* Shrine of Wonder (Gond)
* Shrine of the Wise God (Oghma)
* Shrine of the Brave (Torm)
* Shrine of Justice (Tyr)
* Shrine of the Morning Light (Lathander)
* Shrine of the Tree Father (Silvanus)
* Shrine of the Forest Lady (Mielikki)
* Shrine of the Great Mother (Chauntea)
* Shrine of Mysteries (Mystra)
* Shrine of the Hand of Sorcery (Azuth)
* Shrine of the Unsleeping Eyes (Helm)
* Shrine of the Wind Rider (Shaundakul)
* Shrine of Winds (Akadi)
* Shrine of Waves (Istishia)
* Shrine of Wings (Aedrie Faeyna)
* Shrine of the Undersea (Deep Sashelas)
2 Holidays
& Holidays
2 Crime and punishment
Presiding at the weekly trials are a magistrate, prefect, guild master, priest, and military captain who are all randomly selected. The trials are very short, but the consequences of committing a crime can be devastating. Most trials are handled on the local level in the residential and commercial districts with only a prefect or magistrate presiding. The military handles all infractions by members internally. In all cases of crime, the criminal, once found guilty, forfeits all property owned within the city limits.
& Crime
3 The Arena
& Arena
2 Olaranor
Olaranor is located in Myth Drannor and is where the Olara's have build their summer residences. Since Myth Drannor is not safe for the occassional traveler, not much is known about it.
