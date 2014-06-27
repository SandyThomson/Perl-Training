#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

# Test code
greet( "Fred" );
greet( "Barney" );
greet( "Wilma" );
greet( "Betty" );

# Greetings version 2
sub greet {

  # Making up words
  my ( $greetee ) = @_; 
  state @greeted;

  # Greet them appropriately
  if ( scalar ( @greeted ) ) {
    print "Hello $greetee! I've seen: @greeted\n";
  }
  else {
    print "Hello $greetee! You are the first one here!\n";
  }
  
  # Remember who was last greeted
  push( @greeted, $greetee );
}
