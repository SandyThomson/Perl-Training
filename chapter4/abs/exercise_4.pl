#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

sub greet {
  my ( $new_person ) = @_;

  state $person;

  if ( defined( $person ) ) {
    print "Hi $new_person! $person is also here!\n";
  }
  else {
    print "Hi $new_person! You are the first one here!\n";
  }

  $person = $new_person;
}

greet( 'Fred' );
greet( 'Barney' );
