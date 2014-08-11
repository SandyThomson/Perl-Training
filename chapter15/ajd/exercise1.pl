#!/usr/bin/perl

use strict;
use warnings;

use 5.010001;

# Pick a number, have them guess it
my $number = int( rand(100) + 1 );
my @exit = ('', 'quit', 'exit'); # Changing this to a list for some smart matching

print "I'm thinking of a number between 1 and 100, have a guess: ";

while ( my $guess = <STDIN> ) {

  chomp( $guess );

  # switches yay!
  given ( $guess ) {

    when ( @exit ) { 
      print "You're no fun\n";
      last;
    }
    when ( !/\A-??\d+(?:\.\d+)??\z/ ) {
      print "A number I said, try harder: ";
      next;
    }

    # Spaceship trickery doesn't work with a switch
    when ( $guess < $number ) {
      print "Too low, try again: ";
      next;
    }
    when ( $guess > $number ) {
      print "Too high, try again: ";
      next;
    }
    when ( $guess == $number ) {
      print "Correct!\n";
      last;
    }
    default {
      next;
    }
  }
}

