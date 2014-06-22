#!/usr/bin/perl

use strict;
use warnings;

my @persons;

sub greet {
  my ( $new_person ) = @_;

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
