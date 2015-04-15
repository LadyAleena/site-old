#!/usr/bin/perl
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Base::LineMagic qw($line_magic);
use HTML::Elements qw(list);
use People qw(get_people);

my $doc_magic = {
  'artists' => sub { list(3, 'u', [get_people('Artists.txt')], { 'class' => 'three' }) },
};

page( 'code' => sub { story(*DATA, { 'doc magic' => $doc_magic, 'line magic' => $line_magic }) });

__DATA__
This is my non-fiction collection of SPAN<hardcovers|^hardcovers^>, SPAN<trade paperbacks|^trades^>, and SPAN<mass market paperbacks|^massmarkets^>.
2 Animals
* I<"Is This The Place?"|^massmarket^> by D.E.L.T.A. Rescue Outreach Program
2 Art
* I<Ultra 3-D|^trade^>
* I<Dreamquests: The Art of Don Maitz|^trades^>
* I<The Art of Michael Whelan|^hardcovers^>
* I<Mind Fields: The Art of Jack Yerka, The Fiction of Harlan Ellison|^trades^>
3 TSR and Dungeons and Dragons
* I<The Art of Dragon Magazine|^trades^>
* I<The Art of the Dungeons & Dragons Fantasy Game|^trades^>
* I<The Worlds of TSR|^hardcovers^>
3 Boris Vallejo +
* I<The Fantastic Art of Boris Vallejo|^trades^> introduction by Lester Del Rey
* I<Fantasy Art Techniques|^hardcovers^> forward by Isaac Asimov
* I<Ladies: Retold Tales of Goddess and Heroines|^trades^> with Doris Vallejo
* I<Mirage|^trades^>
3 Artists I like
& artists
2 Astrology
* The 1997 Astrology Guide
* The Lost Zodiac (with deck) by Catherine Tennant
2 Biography
* DON'T PANIC: The Official Hitchhiker's Guide to the Galaxy Companion by Neil Gaiman
* Knee Deep in Paradise by Brett Butler
2 Business
* The Portable MBA by Eliza G. C. Collins/Mary Anne Devanna
3 Louis E. Boone and David L. Kurtz
* Contemporary Business Sixth Edition
* Contemporary Business Sixth Edition Learning Guide
3 Economics and finance
* Economics Fourth Edition by William P. Albrecht Jr.
* Cut Your Spending in Half: Without Settling for Less by Editors of Rodale Press
* Master Your Money Power	
2 Games
* The Exeter Book of Riddles by Kevin Crossley-Holland
* The Perma Quiz Book by Nathan Joseph Kane
* The Premiere Book of Crossword Puzzles No. 1	
2 Health
* The Doctors Book of Home Remedies by Prevention Magazine, ed.
* The Rescue 911 Family First Aid & Emergency Care Book by Julie Motz
* I<Complete Guide to Symptoms, Illness, and Surgery|^trades^> by H. Winter Griffith, M.D.
2 Humor
* Politically Correct Holiday Stories by James Finn Garner
* I<Bored of the Rings|^massmarket^> by Harvard Lampoon
* I<National Lampoon's Doon|^massmarket^> by Ellis Weiner
* Amphigory by Edward Gorey
* I<101 Uses for This Book|^trade^> by Paul Grescoe
* Life's Too Short Not To Live It As A Texan by Peg Hein and Kathryn Lewis
* I<What's So Funny About Being Catholic?|^trade^> by Karen Warner
3 Comedy
* I<My Point...And I Do Have One|^hardcover^> by Ellen Degeneres
* I<Naked Beneath My Clothes|^hardcover^> by Rita Rudner
* I<Sein Language|^hardcover^> by Jerry Seinfeld
4 Paul Reiser
* I<Babyhood|^hardcover^>
* I<Couplehood|^hardcover^>
2 Mathmatics
* Schaum's Outline Series:Theory and Problems of Trigomometry 2nd Ed. by Frank Ayers Jr./Robert E. Moyer
2 Military
* I<Cutting Edge: A History of Fort Detrick, Maryland 1943-1993|^hardcovers^> by Norman M. Covert
2 Politics
* I<Great Political Theories Volume 1|^massmarkets^> by Michael Curtis
* I<Great Political Theories Volume 2|^massmarkets^> by Michael Curtis
* I<The Rise and Fall of the Great Powers|^trades^> by Paul Kennedy
* American Government Fourth Edition by James Q. Wilson
* American Government: The Core by Peter Woll/Sidney E. Zimmerman
3 Law
* I<Ain't Nobody's Business If You Do|^hardcovers^> by Peter McWilliams
2 Reference and trivia
* I<Pictorial Atlas of the World|^hardcovers^>
* I<Webster's Encyclopdedic Unabridged Dictionary of the English Language|^hardcovers^>
3 Writing
* jargon watch by Gareth Branwyn
* I<The Little English Handbook|^trades^> by Edward P. J. Corbett
* I<A Writer's Reference|^trades^> by Diana Hacker
4 Intrepid Linguist Library
* I<It's Raining Cats and Dogs|^massmarket^> by Christine Ammer
* I<The Superior Person's Book of Words|^massmarket^> by Peter Bowler
* I<Just Ask Mr. WordWizard|^massmarket^> by David Grambs
* I<Anguished English|^massmarket^> by Richard Lederer
3 Trivia
* I<Isaac Asimov's Book of Facts|^hardcovers^> by Isaac Asimov
* I<Complete Guide to Prize Winning|^massmarkets^> by Linda Evanston
* I<When Did Wild Poodles Roam the Earth?|^trades^> by David Feldman
* Test Your Cultural Literacy by Diane Zahler and Kathy A. Zahler
* Yearbook by The Editors of Memories Magazine
4 Ripley's Believe It or Not! +
* Ripley's Giant Believe It or Not!
* I<Ripley's Believe It of Not! 3rd Series|^massmarket^>
* I<Ripley's Believe It of Not! 4th Series|^massmarket^>
* I<Ripley's Believe It of Not! 5th Series|^massmarket^>
* I<Ripley's Believe It of Not! 7th Series|^massmarket^>
* I<Ripley's Believe It of Not! 13th Series|^massmarket^>
* I<Ripley's Believe It of Not! 15th Series|^massmarket^>
* I<Ripley's Believe It of Not! 15th Series|^massmarket^>
* I<Ripley's Believe It of Not! 16th Series|^massmarket^>
* I<Ripley's Believe It of Not! 19th Series|^massmarket^>
* I<Ripley's Believe It of Not! 20th Series|^massmarket^>
* I<Ripley's Believe It of Not! 21st Series|^massmarket^>
* I<Ripley's Believe It of Not! 23rd Series|^massmarket^>
* I<Ripley's Believe It of Not! 29th Series|^massmarket^>
* I<Ripley's Believe It of Not! 30th Series|^massmarket^>
* Ripley's Believe It of Not! 50th Annivesary Edition
* Ripley's Believe It of Not! Anniversay Edition
* I<Ripley's Believe It of Not! Ghost Stories and Plays|^massmarket^>
* I<Ripley's Believe It of Not! Ghosts, Witches, and ESP|^massmarket^>
* I<Ripley's Believe It of Not! Reptiles, Amphibians, and Prehistoric Beasts|^massmarket^>
* I<Ripley's Believe It of Not! Stars, Space, UFOs|^massmarket^>
* Ripley's Blieive It or Not! Collection: A Guide by Ripley and Derek R. Copperthwaite
2 Science
3 Astronomy
* Extraterrestrial Civilizations by Isaac Asimov
* I<Communication|^massmarkets^> by Whitley Strieber
* Worlds in Collision by Immanuel Velikovsky
3 Chemistry
* Schaum's Outline Series: College Chemistry 7th Ed. by Jerome L. Rosenberg/Lawrence M. Epstein
3 Evolution
* The Dragons of Eden by Carl Sagan
3 Gemology
* Gemstones	
2 Sex
* I<The Illustrated Kama Sutra|^trades^> by Sir Richard Burton
* Pocket Sex Guide by Anne Hooper
* Erotica Art by Drs. Phyllis & Eberhard Kronhausen
* Erotica Universalis by Gilles Neret
* Sex Lives of Students by Jay Segal
* Kama Sutra: The Arts of Love
3 Sexual fantasy
* I<Joy of Sexual Fantasy|^trades^> by Dr. Andrew Stanway
4 Nancy Friday
* I<Forbidden Flowers|^massmarkets^>
* I<My Secret Garden|^massmarkets^>
2 Sociology
* Future Shock by Alvin Toffler
3 Religion
* The Druid Renaussance by Philip Carr-Gomm ed.
* I<Saints Preserve Us!|^trades^> by Sean Kelly/Rosemary Rogers
4 Mythology
* I<D'Aulaires Book of Greek Myths|^hardcovers^> by Ingri & Edgar Perin D'Aulaire
* I<Greek Gods & Heros|^massmarkets^> by Robert Graves
* Who's Who in Mythology by Alexander S. Murray
2 Self-Help
* Changing Bodies, Changing Lives by Ruth Bell
* Choices: A Teen Woman's Journal for Self-awareness and Personnal Planning by Mindy Bingham/Judy Edmondson/Sandy Stryker
* How to Survive the Loss of a Love by Melba Colgrove/Harold H. Bloomfield/Peter McWilliams
* You Can Heal Your Life by Louise L. Hay
* Growing Up Firstborn by Kevin Leman
3 Gregory Stock
* The Book of Questions
* The Book of Questions: Love & Sex
