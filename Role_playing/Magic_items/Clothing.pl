#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);

page( 'heading' => 'Magical clothing', 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
2 Cloak of Darkness
by Nathan Brown
This is a black cloak. Once worn a Globe of Darkness surrounds the wearer with the diameter being one foot greater than the wearer's height.
2 Cloak of Safe Flying
The Cloak acts like a Ring of Flying with a bonus. It allows normal sight and hearing while in use not allowing the wind to get to the wearer's face. The Cloak will protect the wearer from attacks made by any flying creature with 2 Hit Dice or less and will give the wearer a +2 AC against other flying creatures. In addition anyone using the Cloak who is afraid of heights or suffers vertigo will be perfectly fine while the Cloak is in use. It only can be used for two cumulative hours of flight per day, or else the wearer will fall from the sky. Once per day a Feather Fall spell can be used just in case.
2 Cloak of Safe Swimming
The Cloak is like Cloak of Safe Flying but works underwater. When it touches a body of water, it adheres to the body of the wearer like a second skin giving the person gills. It allows normal sight and sonic hearing while in use, and the wearer swims equal to the movement rate on land. The Cloak will protect the wearer from attacks made by any underwater creature with 2 Hit Dice or less and will give the wearer a +2 AC against other underwater creatures. In addition anyone using the Cloak who is afraid of water or drowning will be perfectly fine while the Cloak is in use. It can only be used for two cumulative hours underwater per day, or the wearer will drown. Once per day a Feather Float spell can be used to get the wearer to the surface.
2 Cloak of the Yeti
by ^Frank Rizzo^
This cloak gives the wearer the AC of a Yeti. It allows the wearer to attack with a Yeti's THAC0 with 2 fist attacks each doing d6 points of damage. If both attacks hit then the wearer can Hug for 2d6 points of damage. Attacks with the fist can hit any creature immune to attacks with a plus 1 or lower. The wearer gains an immunity to cold as with Boots of the North.
2 Doublet of Divine Protection
by Joshua Moore
This item is an I<artifact>.
The Doublet of Divine Protection is a bright yellow velvet doublet with silver trim at the cuffs and collar and is heavier than most doublets.
The wearer of the Doublet must be a true believer in a god; it doesn't matter which one, so long as the person believes and is loyal. When the Doublet is donned, it draws the attention of the god of the wearer, and the god judges the wearer. If the wearer is a loyal servant, then the god empowers the Doublet's sole power, all damage of any sort is halved: physical damage, magic damage, poison damage; all damage. The person ages at half the normal rate while it is on because the wearer's body is breaking down at half the rate. The Doublet will only bond once with each wearer. If the wearer changes faith, the Doublet is useless.
The Doublet can only be destroyed if the person wearing it changes their faith radically and has a god opposite in alignment of their previous one try to bond it.
2 Garments of Versace
by ^Gabriel Elias^
These outfits, if the wearer can afford them, are rather flashy looking with a dramatic sense of style. Whether the clothes be all black leather or see-through silk, the wearer gets a +2 to Charisma/Comeliness.
* STRONG<Shirt:> 800 gp
* STRONG<Pants:> 600 gp
* STRONG<Shoes:> 500 gp
* STRONG<Dress:> 1500 gp
* STRONG<Custom outfit:> 3500 gp
These items are cursed and the wearer must make a wisdom check at -3 or only wear the outfit once. It will then be placed in the wearer's closet. The owner will complain that it is out of style and can never be worn again. If someone tries to purchase the outfit, the wearer must make an Intelligence check at 1/4. If the wearer makes the save, the outfit will be sold. If the wearer doesn't make it, the wearer "Can't bare to part with it...it IS a Versace".
2 Gown of Attraction
These gowns can be made of any material and can be any style. They add a +2 to the wearer's charisma reaction adjustment. They are highly jealous of any other charisma enhancing magic items, except books, and will constrict themselves on the wearer until the offending item is removed or the wearer is dead.
2 Tunic of the Eunuch
by ^Gabriel Elias^
This white silk shirt is cursed and was made by an female mage after she caught her husband cheating on her. Once the shirt is worn, the victim's manhood disappears, and he can never have sex with a woman again. Make save vs. paralyzation at some random point (DM's decision) to see if it happens. If the wearer makes the Save, it try again some other time (Dm's choice when). There is no pain involved, so the wearer does not know when it has been removed. There is a warning label along with proper washing instructions.
