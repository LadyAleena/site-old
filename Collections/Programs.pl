#!/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib/';
use Base::Data qw(get_hash);
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);
use HTML::Elements qw(list anchor);
use Util::Sort qw(article_sort);

page( 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
This is a list of programs that I B<am using> or have used. I can not account for I<all> the software we have had and used over the years. Some of it was so bad, we blanked it out of our heads. This list does not include a full list of hardware drivers either. So much software, so little time or in this case patience.
2 General
*| two
* ^Adobe^
** B<^Flash Player^>
** ^Reader^
* B<^The Apache Software Foundation^>
** B<^HTTP Server^>
** ^OpenOffice^
* ^Avanquest software^ - System Commander
* Berkeley Systems
** After Dark
** The Disney Collection Screen Saver
** Looney Tunes Animated Screen Saver
** More After Dark
** Star Trek The Screen Saver
* B<^Debian^> (on 1 computer)
* ^Desktop Architect^
* ^eyeClaxon - Find Junk Files^
* B<^FileZilla^>
* ^Gene6^ - ^G6 Utilities^
* ^grepWin^
* Inc Alarm
* ^Ipswitch^ - ^WS_FTP Pro^
* ^JGSoft^ - ^EditPad Pro^
* B<^KDE^>
* B<^LibreOffice^>
* B<^Notepad++^>
* ^Oracle^ - ^Java^
* ^Piriform^
** B<^CCleaner^>
** B<^Defraggler^>
* ^PuTTY^
* ^RarLab^
* Spinner Plus
* ^Strawberry Perl^
* ^Vandyke Software^ - ^CRT^
* ^Wedge Software^ - ^WinHacker^
* ^WinZip^
* ^Xenu's Link Sleuth^
* B<^xuMouse^>

2 Browsers
*| two
* ^Apple^ - ^Safari^
* B<^Mozilla^> - B<^Firefox^>
* ^Google^ - ^Chrome^
* ^Opera^

2 Chat
*| two
* ^Cerulean Studios TrillianAstra^
* ^HexChat^
* ^ICQ.com^
* ^mIRC^
* B<^XChat^>
* ^Yahoo!^ - ^Yahoo! Messenger^

2 Games
*| two
* ^Maxis^
** SimCity 2000
** Simcity 3000
** SimCity 3000 Unlimited
* ^PopCap Games^
** ^Alchemy^
** ^Atomica^
** ^Bejeweled^
** ^Big Money^
** ^Bookworm^
** ^Dynomite^
** ^Mummy Maze^
** ^Noah's Ark^
** ^Rocket Mania^
** ^Seven Seas^
* ^Pyrogon^ - ^NingPo MahJong^

2 Gaming extensions
*| two
* Alan's Dungeon Master Tools -  disappeared, and I can't find them.
** Character Designer
** iz D & D Room Generator
** iz D & D Treasure Generator
** iz D & D Weather Generator
** iz Dice Bag
** iz Dungeon Mapper
** iz Guild Builder
** iz Inn Keeper
** iz Monster DB Manager
** iz Name Generator
** iz Quick NPC
** iz Spellbook
** Quick Dungeon
* ^Ever Changing Book of Names^
* Ice Mage's Treasure Hoard Generator
* ^MapMage^
** ^Artifact Mage^
** ^Book Mage^
** ^Dice Mage^
** ^Inn Mage^
** ^Name Mage^
* ^Mythosa^ - ^TableSmith^

2 Media
*| two
* ^Apple^
** ^iTunes^
** ^QuickTime^
* ^DivX^ - ^DivX7 (free)^
* ^interActual^ - ^interActual Player^
* ^Photodex^ - ^CompuPic^
* ^real^ - ^realPlayer^
* ^VideoLAN^ - B<^VLC media player^>

2 Security
*| two
* B<^avast! Anitvirus^>
* ^Comodo^ - ^Internet Security (free)^
* ^PopUp Smasher^
* ^Spyware Terminiator^

2 Microsoft
*| two
* Microsoft DOS
** MSDOS 6.0
** MSDOS 6.2
* ^Microsoft Office^
** Office 2000
** Office 2003
** Works
** Works Suite 2004
* B<^Microsoft Silverlight^>
* B<^Microsoft Windows^>
** Windows 3.0
** Windows 3.1
** Windows 95
** Windows 98
** B<Windows XP> (on 7 computers) with ^Microsoft PowerToys for Windows XP^
*** ^Power Calculator^
*** ^Tweak UI^
** Windows 7 (on 2 computers)
