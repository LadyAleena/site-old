#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Util::StoryMagic qw(program_magic);

my $magic = program_magic;
page( 'code' => sub { story(*DATA, { 'line magic' => $magic }) });

__DATA__
This is a list of B<programs> that I am using or have used. I can not account for I<all> the software we have had and used over the years. Some of it was so bad, we blanked it out of our heads. This list does not include a full list of hardware drivers either. So much software, so little time or in this case patience.
2 In use
*| two
* ^Debian^ (my computer)
* ^GNU Operating System^
* ^The Apache Software Foundation^ - ^HTTP Server^
* ^FileZilla^
* ^Geany^
* ^Gramps^
* ^GraphViz^
* ^HexChat^
* ^Inkscape^
* ^LibreOffice^
* ^Mozilla^ - ^Firefox^
* ^Nano^
* ^VideoLAN^ - ^VLC media player^
3 Desktop environments
*| two
* ^KDE^
* ^XFCE^
2 Previously used
Most of the software below was Windows based, so I do not use them anymore since I installed ^Debian^, a Linux distribution.
*| two
* ^Adobe^
** ^Flash Player^
** ^Reader^
* The Apache Software Foundation - ^OpenOffice^
* ^Avanquest software^ - System Commander
* Berkeley Systems
** After Dark
** More After Dark
** The Disney Collection Screen Saver
** Looney Tunes Animated Screen Saver
** Star Trek The Screen Saver
* Desktop Architect
* eyeClaxon - Find Junk Files
* ^Gene6^ - ^G6 Utilities^
* ^grepWin^
* Inc Alarm
* ^Ipswitch^ - ^WS_FTP Pro^
* ^mIRC^
* ^Oracle^ - ^Java^
* ^Piriform^
** ^CCleaner^
** ^Defraggler^
* ^PuTTY^
* ^RarLab^
* Spinner Plus
* ^Strawberry Perl^
* ^Vandyke Software^ - ^CRT^
* ^Wedge Software^ - ^WinHacker^
* ^WinZip^
* ^Xenu's Link Sleuth^
* ^XChat^
* ^xuMouse^
3 Browsers
*| three
* ^Apple^ - ^Safari^
* ^Google^ - ^Chrome^
* ^Opera^
3 Instant messengers
*| three
* ^Cerulean Studios TrillianAstra^
* ^ICQ.com^
* ^Yahoo!^ - ^Yahoo! Messenger^
3 Text editors
*| two
* ^JGSoft^ - ^EditPad Pro^
* ^Notepad++^
3 Games
*| two
* ^Maxis^
** SimCity 2000
** Simcity 3000
** SimCity 3000 Unlimited
* ^PopCap Games^
** Alchemy
** Atomica
** Bejeweled
** Big Money
** Bookworm
** Dynomite
** Mummy Maze
** Noah's Ark
** Rocket Mania
** Seven Seas
* ^Pyrogon^ - ^NingPo MahJong^
3 Gaming extensions
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
3 Media
*| two
* ^Apple^
** ^iTunes^
** ^QuickTime^
* ^DivX^ - ^DivX7 (free)^
* ^interActual^ - ^interActual Player^
* ^Photodex^ - ^CompuPic^
* ^real^ - ^realPlayer^
3 Security
*| two
* ^avast! Anitvirus^
* ^Comodo^ - ^Internet Security (free)^
* ^PopUp Smasher^
* ^Spyware Terminiator^
3 Microsoft
* ^Microsoft Silverlight^
4 Microsoft DOS
*| two
* MSDOS 6.0
* MSDOS 6.2
4 Microsoft Office
*| two
* Office 2000
* Office 2003
* Works
* Works Suite 2004
4 Microsoft Windows
*| two
* Windows 3.0
* Windows 3.1
* Windows 95
* Windows 98
* Windows XP (on 4 computers) with ^Microsoft PowerToys for Windows XP^
** ^Power Calculator^
** ^Tweak UI^
* Windows 7 (on 2 computers)
* Windows 10 (on 1 computer)
