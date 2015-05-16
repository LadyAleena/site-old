#!/usr/bin/perl
#This is the Movies index.
use strict;
use warnings FATAL => qw( all );

use CGI::Carp qw(fatalsToBrowser);

use lib '../files/lib';
use Base::Page qw(page story);

page( 'code' => sub { story(*DATA) });

__DATA__
Hello and welcome to my lists of movies.
2 What is a movie?
A movie is any motion picture no matter its length. A film is a movie which is normally 88 to 120 minutes long (without commercials). A miniseries is a movie shown in two or more parts with each part as long as a film, though not always. A television series is an episodic movie with each episode being under 50 minutes in length (again without commercials). A commercial is a movie which advertises a product or service. There are plenty of other movie forms such as music videos, webisodes, full web series (which I include in television series for now), and more. So if the picture is in motion on your screen, it is a movie.
2 Movies by alpha
A<Movies by alpha|href="Movies_by_alpha.pl"> started as simply a list of my or my fiancé's favorites movies. Over time I have been adding movies which were on various lists of movies I have collated over the years. At one time I collected as many movies with A<disasters|href="Movies_by_genre.pl?genre=disaster"> and A<monsters|href="Movies_by_genre.pl?genre=monster">, so I added all of them to my list. I also collated A<movie series|href="Movies_by_series.pl">, my favorites at first. I then became interested in all of the horror series I could find, so I added a lot of horror movies to my list so I could present the series. I do not even like A<horror movies|href="#Horror_movies"> much.
So now my or my fiancé's favorites movies are mixed in with others I have collected. You can see what we really like by what we A<own|href="../Collections/Movies.pl">.
2 Movies by genre
3 Family and children's movies
I do not consider family or children a genre so movies which would be categorized as such elsewhere are not listed in those categories here. Those films will be mixed in with more adult movies.
3 Horror movies
You will see a lot of horror movies in this list. I like to read the stories in horror movies but don't watch many. My fiancé has watched more horror movies than I could handle. I prefer to just read the story lines especially in series of horror movies. You can read more about horror and monster movies and me A<here|href="Movie_opinions.pl#The_horror_genre_and_me">.
3 Monster movies
I have created a genre for just monster movies. Monsters are in so many speculative fiction genres, it is hard to say a monster is purely horror or fantasy or science fiction, with some monsters as super heroes. The monster genre is a mix of any paranormal or supernatural creatures from angels to zombies.
3 Reality television series
I do not like most of the reality television series today. My fiancé does, so I have added those he likes to my lists here. In my opinion most reality series today should be considered soap operas. Some of them started as a special on one channel or another, and they should have stayed that way. A once-off special of some of these subjects would interest me, however, a series of the same thing week after week gets old quickly especially if the series strays from the topic and focuses more on the people and their antics.
2 Movies by series
A<Movies by series|href="Movies_by_series.pl"> is a mix of film series and stand alone television series. Some series include films, miniseries, and television series.
3 Night of the Living Dead
I feel the need to make a special note about the I<Night of the Living Dead>. With the original I<Night of the Living Dead> being public domain, many have tried to connect their films with it. Using the work of others, I have attempted to just make lists of the various series. Only three series are connected to the original I<Night of the Living Dead>. I collated my I<Night of the Living Dead> from the following sources: "A<Genealogy of the Living Dead: UPDATED!|href="http://horror-movies.livejournal.com/2106870.html">", "A<The Zombification Family Tree: Legacy of the Living Dead|href="www.popmatters.com/column/159439-legacy-of-the-living-dead/">", and "A<Zombi series|http://en.wikipedia.org/wiki/Zombi_series>" on Wikipedia.
3 Remakes
If a film is a remake of a film in a series, it is not added to the series since it does not share the same cosmology. A remake will be in a series if the remake has its own sequel or prequel. I may one day add lists of whole franchises I am interested in in the future.
