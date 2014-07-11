#!/usr/bin/perl -w
use strict;
use 5.0100;


greet( 'Fred' );
greet( 'Barney' );
greet( 'Wilma' );
greet( 'Betty' );


sub greet {
  my ( $name ) = @_;
  $name //= 'Anonymous';

  state @visitors;
  
  print "Hi $name! ";
  
  if ( scalar @visitors ) {
    say "I've seen: @visitors";
  }
  else {
    say "You are the first one here!"
  }
  push @visitors, $name;
}
