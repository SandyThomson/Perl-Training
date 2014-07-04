package ex5;

use strict;
use warnings;
use feature qw( say state );
use Exporter;
our @ISA = qw( Exporter );
our @EXPORT_OK = qw( greet );

sub greet {
  my ( $person ) = @_;
  state @previous_visitors;

  if ( !@previous_visitors ) {
    say "Hi $person! You are the first one here!";
  } else {
    say "Hi $person! I've seen: @previous_visitors";
  }

  push @previous_visitors, $person;

  return;
}
