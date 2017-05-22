#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../../files/lib';
use Base::Data qw(file_list data_directory);
use Base::Page qw(page story);
use HTML::Elements qw(list anchor);
use Util::Sort qw(name_sort);
use Util::Convert qw(textify searchify);

my $directory = 'Role_playing/Player_characters/spellbooks';
my @spellbook_list = sort { name_sort(textify($a),textify($b)) } file_list(data_directory($directory));
my @spellbooks;
for my $spellbook (@spellbook_list) {
  my $text = textify($spellbook);
  my $search = searchify($text);
  push @spellbooks, anchor($text, { href => qq(../Player_characters/Spellbooks.pl?spellbook=$search) });
}

my $doc_magic = { 'spellbooks' => sub { list(4, 'u', \@spellbooks, { 'class' => 'three' }) } };

page('heading' => 'Magical books', 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic }) });

__DATA__
2 Spellbooks
These are the spellbooks of the characters played by me over the years. Most of the characters are still alive, so if you want your players to find one of these spellbooks; be warned, these people will want their spellbooks back.
& spellbooks
2 Tome of Death
The cover of this book is black iron containing 20 pages. Each page can steal all hit points of a person or creature. It will take from the victim the maximum amount of hit points for its hit dice without a constitution bonus. The first page can steal 1 hit dice or level from a person or creature; the second page can steal 2 hit dice from a person or creature; and so on. Each page only works once. If a page of higher hit dice is used on a lower hit dice creature, it will only steal as many hit points for that page.
This book can also create the undead. If a person or creature with the proper amount of hit dice for the page is hit with it, the person must make a saving throw versus death or become an undead of the level of hit dice of the page. This has to be exact. Page 5 will not create a 6 hit dice undead creature, nor will it create a 4 hit dice undead creature. If the saving throw is successful, the person will not rise as an undead creature no matter what spells have been cast upon death.
If a page from this book is laid on an undead creature, the creature will be Healed.
Any class or race can use this book though only one person at a time can make use of it, until that person dies normally. The first person to touch the book is the owner of the book. That person will also be healed to the maximum amount of hit points allowed for the person's race or class upon first touching it but nothing thereafter. The pages in the book will not work on the owner of the book.
When a page is used from the book it will return to the book, blank. When every page of the book is used, it becomes a Tome of Life.
2 Tome of Life
The cover of this book is pure gold containing 20 pages. Each page can heal all hit points of a person or creature. It will give the recipient the maximum amount of hit points for its hit dice without a constitution bonus. The first page can heal a 1 hit dice or level person or creature; the second page can heal a 2 hit dice person or creature; and so on. Each page only works once. If a page of higher hit dice is used on a lower hit dice creature, it will only heal and give as many hit points the creature should have; the rest of the magic is lost.
This book can also resurrect a person or creature of the proper amount of hit dice on a page. This has to be exact. Page 5 will not resurrect a 6 hit dice creature, nor will it resurrect a 4 hit dice creature. The book circumvents the constitution penalty for resurrection as well. The person or creature resurrected will have to make an immediate saving throw versus death. If the saving throw is failed, the person will rise as a corporeal undead creature of the same hit dice at the next death.
If a page from this book is laid on an undead creature, the creature will return to life. That will be considered an attack, so an attack roll is needed.
Any class or race can use this book, though only one person at a time can make use of it until that person dies normally. The first person to touch the book is the owner of the book. That person will also become an undead creature. The pages in the book will not work on the owner of the book.
When a page is used from the book it will return to the book, blank. When every page of the book is used, it becomes a Tome of Death.
