#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

sub greet {
  my ( $new_person ) = @_;

  state @persons;

  if ( scalar( @persons ) ) {
    print "Hi $new_person! I've seen: @persons\n";
  }
  else {
    print "Hi $new_person! You are the first one here!\n";
  }

  push @persons, $new_person;
}

greet( 'Fred' );
greet( 'Barney' );
greet( 'Wilma' );
greet( 'Betty' );
