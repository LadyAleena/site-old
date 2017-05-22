#!/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);

use lib "../../../files/lib";
use Base::Page qw(page story passage);
use Base::LineMagic qw($line_magic);
use HTML::Elements qw(heading list);
use RolePlaying::SpellList qw(spell_data);

my $doc_magic = {
  'spells' => sub {
    for my $spell_in ('Find Beacon','Teleport Beacon','Secure Teleport') {
      my $spell = spell_data($spell_in);
      heading(4, 3, $spell->{'heading'});
      list(5, 'u', @{$spell->{'stats'}});
      passage(5, $spell->{'description'});
    }
  }
};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic, 'line magic' => $line_magic }) });

__DATA__
The Society of Divided Light is dedicated to the gathering of magic and helping new adventurers get a good start on the road to glory.
2 Background
The Society was founded by ^Drianna StrongOak-Guard^ after retiring from adventuring and marrying Grassguard and before becoming a goddess. Her friend A<Baroness Aegyn of Valachan|href="../#Aegyn_Valchae"> found the idea of such a society intriguing and joined with Drianna to expand on it by recruiting members. The Society's headquarters are on the grounds of Drianna's extensive estate. There is a subsidiary headquarters on the Isle of Valachan. As the group got larger, Drianna has faded from view; new Members not knowing who is really in charge.
The Society is loosely allied with the Churches of Mystra, Azuth, and Oghma. They will deny their involvement on the request of Drianna. Any unique items found by a Society member will be taken to an Azuthan church to be studied and then returned to the member. Society members are allowed to study within the Temples of Oghma, but only if they have something to add to their knowledge of the Realms.
They have no connections with any other group.
2 Entrance
The Society works in secret as not to attract attention. Current members are always on the lookout for new members. Once a person is tapped for membership, the person is watched either by scrying or spying until proven worthy of membership.
After an extensive review of the activities by the possible member by three or more Members of the Society, the person is offered a position in the Society and becomes an Initiate. The Initiate will be assigned to a mentor and taught all the rules of the Society.  After successful training the Initiate is sent out with another mentor on adventures.
After training with two mentors, there will be another review. Upon an unsatisfactory review, the Initiate will be brought in and spelled to forget everything about the Society. With a satisfactory review the Initiate will be considered a Member with all the responsibilities and rights thereto. The Member will receive a unique Amulet spelled with Teleport Beacon. This is a Member's way of communicating with the rest of the Society. The Member will also receive a number of spell scrolls with spells known only to the Society. If the new Member is able to cast such spells at that time, they will only receive one copy of the spells to add to a spellbook. Any Member unable to cast such spells normally will be given special spell scrolls from which they can cast the spells.
2 Responsibilities
* Members must help any adventurer in need as long as the need is of a good nature or against an evil threat. This does not mean that the member must drop everything.  The Member could help by giving advice, getting someone a room at an inn, or helping buy goods that would otherwise be out of reach.  An example of such could be a scruffy fighter who can't get a shopkeeper to sell him a nice shirt no matter how hard he tries to prove he has the money. The Member can help in a fight but is advised not to stay with a group for too long unless the group will not become dependent on the Member.
* When adventuring alone Members must always complete any task agreed to do. If the task cannot be completed, the Member must either give back any funds already paid for the task or appeal to the Society for aid.  The Member must have a real need, or the Society will not help.  The aid can come in many different forms, like above, or the Society may just send another Member depending on the situation.
* When a unique magical item is found, the Member must apprise the Society of it. The Member has to thoroughly study the item and send the findings and how the item was obtained to the Society.
* A Member must be willing to give other Members loans which could be money, supplies, and magic items currently not in use by the lender.  The need must be valid for the loan, for it will not be given out if a Member just happens to run out of cash.  A Member cannot directly ask for a loan of a magic item.  The loan of a magic item is only given if the Society feels it is necessary to the survival of the Member.
* A Member must warn the Society of any grave threats. The Society will decide how best to deal with it. They will allow the Member will deal with local threats with minimal, if any, intercession.  The Society will act to protect its interests in the case of a major threat which will also protect any innocents who may have unintentionally gotten involved.  If the Member is powerful enough or with a group powerful enough to handle the threat, the Society will first see if the Member resolves the issue before getting involved.
2 Prohibitions
Members must not...
* speak of the Society to non-Society Members.
* act outside the interests of the Society.
* call upon the Society for jailbreaks. Members must get out of their own messes. The only exception would be if the Member is incarcerated without known cause or is unjustly accused of a crime and is unable to clear their name without intercession.
* interfere with other Member's works or activities, unless the work or activity is against the interest of the Society.
2 Members
*| three
* ^Awnday Ar'iemay^
* ^Amelda Bacoulan^
* ^Sarria Bagada^
* ^Verago Brystar^
* ^Ryceva Derman^
* ^Myleara Disstar^
* ^Oalirya Disstar^
* ^Visilma Do'ranicy^
* ^Faerinna Escar^
* ^Matea Fi'nashari^
* ^Nemidia Ge'mardian^
* ^Niona Kilson^
* ^Myra Kyllia^
* ^Risa Kyllia^
* ^Sorack Linsandin'viniar^
* ^Desolenna Marder'bastiar^
* ^Driastan Marder'bastiar^
* ^Carri Notha^
* ^Alexana Olara^
* ^Eileen Olara^
* ^Lamaria Peacyle^
* ^Yenedra Peacyle^
* ^Bryzarlyn Qi'lanari^
* ^Hylene Serill^ (Co-founder)
* ^Ducolin StoneGrip^
* ^Drianna StrongOak-Guard^ (Founder)
* ^Amori Tamdenar^
* ^Aegyn Valchae^ (Co-founder)
* ^Handira Warnir^
* ^Kymaria Zendelic'tronyara^
2 Notable Non-Members
* Alvaris - lich, sometime acquaintance of ^Drianna StrongOak-Guard^: be cautious with him.
* Amatar - companion of Drianna StrongOak-Guard, then ^Alexana^ and ^Eileen Olara^.
* Solina Ca'vinia - mother of ^Sorack Linsandin'viniar^
* John Greenthumb - companion of ^Amori Tamdenar^, then ^Bryzarlyn Qi'lanari^.
* Ginger - companion of Bryzarlyn Qi'lanari.
* Evelyn Glander - owner of the Swanmay's Song, known to Amori Tamdenar.
* Grass Guard - husband of Drianna StrongOak-Guard, companion of Alexana and Eileen Olara.
* Decori La'bastiar - mother of ^Desolenna^ and ^Driastan Marder'bastiar^.
* Rechek Linsandin - father of ^Sorack Linsandin'viniar^.
* Irnian Marder - father of Desolenna and Driastan Marder.
* Kyone Me'tronyara - mother of ^Kymaria Zendelic'tronyara^.
* Little Cricket - companion of Bryzarlyn Qi'lanari, but not friendly.
* Raisa - companion of Amori Tamdenar, then Bryzarlyn Qi'lanari.
* Reylah - companion of Bryzarlyn Qi'lanari.
* Sasquach - companion of Amori Tamdenar, then Bryzarlyn Qi'lanari.
* Balthazar SilverLeaf - Chief of the SilverLeaf Tribe, friend of Drianna StrongOak-Guard.
* Brax StrongOak - husband of Drianna StrongOak-Guard.
* Janx Swifthand - companion of ^Ryceva Derman^.
* Torgin - one time companion to Drianna StrongOak-Guard, be cautious with him he is a god.
* Laird Yanick - mayor of Luskwald, known to Amori Tamdenar.
* Anri Zendelic - step-mother of Kymaria Zendelic.
* Miklovik Zendelic - father of Kymaria Zendelic.
2 Society Spells
& spells
