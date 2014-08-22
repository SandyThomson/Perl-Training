#!/usr/bin/perl

use strict;
use warnings;
use Scalar::Util qw( looks_like_number );

my $magical_number = int(1 + rand 100);

print "Guess the number, from 1 to 100. (Type 'exit' / 'quit' or an empty line to stop)\n";

while( my $input = <STDIN> ){

  chomp $input;

  if( $input =~ /^(quit|exit|)$/ ){
    print "Exiting by request\n";
    last;
  }

  if( !looks_like_number( $input ) || int( $input ) != $input ){
    print "Please enter a valid integer, mkay!\n";
    next;
  }
  
  if( $input < 1 || $input > 100 ){
    print "Your guess is out of bounds, please try again!\n";
    next;
  }

  if( $input == $magical_number ){
    print "CORRECT! Good guess!\n";
    last;
  } 
  elsif ( $input > $magical_number ){
    print "Too high\n";
  } elsif ( $input < $magical_number ){
    print "Too low\n";
  } else {
    warn "Something odd happened, exiting with an error code.\n";
    exit 1;
  }
}
