package RolePlaying::CharacterBuilding::Story;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(print_participants);

use File::Basename;

use Base::Data qw(get_hash);
use HTML::Elements qw(list anchor);
use Util::Convert qw(textify idify);
use Util::Columns;

my %stories = get_hash( 'file' => ['Role_playing/Player_characters','Stories.txt'], 'headings' => ['+'] );

sub print_participants {
  my $story = textify(basename($0));

  my @participants = @{$stories{$story}};
  my $number = get_columns(3,scalar @participants);
  my @people;
  for my $participant (@participants) {
    my $participant_link = idify($participant);
    push @people, anchor($participant, { 'href' => "../#$participant_link"} );
  }

  list(4,'u',\@people, { 'class' => "$number" });
}

1;
