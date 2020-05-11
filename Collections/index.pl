#!/usr/bin/perl
# This is the index for Collections.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);
use Util::LineMagic qw($line_magic);

page( 'code' => sub { story(*DATA, { 'line magic' => $line_magic }) });

__DATA__
Welcome to Lady Aleena's B<collections>, which is lists of A<novels|href="Fiction.pl">, A<books|href="Non-fiction.pl">, A<music|href="Music_and_comedy.pl">, A<movies|href="Movies.pl">, A<tie-ins|href="Tie-ins.pl">, and A<programs|href="Programs.pl"> I am willing to admit I own or use. The list of movies here is just those movies I own and should not to be confused with my more general interst in A<movies|href="../Movies">. Tie-ins are books and music connected to movies or television series. I also share my A<fandom|href="../Fandom"> elsewhere.
Here is a key for the notations after each title with the exception of programs.
*| media_types
* Books
** SPAN<hardcover|^hardcovers^>
** SPAN<trade paperback|^trades^>
** SPAN<mass market paperback|^massmarkets^>
* Movies
** SPAN<Blu-Ray|^brds^>
** SPAN<DVD|^dvds^>
** SPAN<VHS|^vhss^>
** SPAN<Digital|^dgts^>
* Music
** SPAN<CD|^cds^>
** SPAN<cassette|^cassettes^>
** SPAN<LP|^lps^>
** SPAN<45|^ffs^>
* Programs
** B<Using>
