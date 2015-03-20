package Fun::SoundofMusicSong;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(make_SoM_song get_SoM_def random_SoM_note random_SoM_song);

my @base_notes = qw(c d e f g a b);
my @SoM_notes  = qw(do re me fa so la te);

my %notes;
@notes{@base_notes} = @SoM_notes;

my $SoM = {
  'do' => 'a deer a female deer',
  're' => 'a drop of golden sun',
  'me' => 'a name I call myself',
  'fa' => 'a long long way to run',
  'so' => 'a needle pulling thread',
  'la' => 'a note to follow so',
  'te' => 'a drink with jam and bread',
};

sub make_SoM_song {
  my ($user_song) = @_;
  my @song_notes = split(/[ ,;]/, $user_song);
  my @new_song = map { $_ =~ /^[a-g]$/ ? $notes{$_} : 'not a note' } @song_notes;
  return \@new_song;
}

sub get_SoM_def {
  my ($user_song) = @_;
  my $notes = make_SoM_song($user_song);
  my @new_song = map { $SoM->{$_} ? $_.' '.$SoM->{$_} : 'not a note' } @$notes;
  return \@new_song;
}

sub random_SoM_note {
  my $note = $SoM_notes[rand @SoM_notes];
  return $note;
}

sub random_SoM_song {
  my ($number_of_notes) = @_;
  my $notes = $number_of_notes ? $number_of_notes : int(rand(100)) + 1;
  my @new_song;
  push @new_song, random_SoM_note for (1..$notes);
  return \@new_song;
}

1;
