#!/usr/bin/perl -w
use strict;
use 5.0100;


greet( 'Fred' );
greet( 'Barney' );


sub greet {
  my ( $name ) = @_;
  $name //= 'Anonymous';

  state $last_visitor;
  
  print "Hi $name! ";
  
  if ( defined $last_visitor ) {
    say "$last_visitor is also here!";
  }
  else {
    say "You are the first one here!"
  }
  $last_visitor = $name;
}
