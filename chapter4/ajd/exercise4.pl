#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

# Test code
greet( "Fred" );
greet( "Barney" );

# Greetings
sub greet {

  # Making up words
  my ( $greetee ) = @_; 
  state $last_greeted;

  # Greet them appropriately
  if ( $last_greeted ) {
    print "Hello $greetee! $last_greeted is also here!\n";
  }
  else {
    print "Hello $greetee! You are the first one here!\n";
  }
  
  # Remember who was last greeted
  $last_greeted = $greetee;
}
