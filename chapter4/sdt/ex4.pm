package ex4;

use strict;
use warnings;
use feature qw( say state );
use Exporter;
our @ISA = qw( Exporter );
our @EXPORT_OK = qw( greet );

sub greet {
  my ( $person ) = @_;
  state $last_person_greeted;

  if ( !defined $last_person_greeted ) {
    say "Hi $person! You are the first one here!";
  } else {
    say "Hi $person! $last_person_greeted is also here!";
  }

  $last_person_greeted = $person;

  return;
}
