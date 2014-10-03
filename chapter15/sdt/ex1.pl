#!/usr/bin/perl

use strict;
use warnings;
no warnings 'experimental::smartmatch';

use Scalar::Util qw( looks_like_number );
use 5.018;

my $magical_number = int(1 + rand 100);

print "Guess the number, from 1 to 100. (Type 'exit' / 'quit' or an empty line to stop)\n";

while( my $input = <STDIN> ){

  chomp $input;

  given( $input ){

    when( /^(quit|exit|)$/ ){
      print "Exiting by request\n";
      last;
    }
    when( !looks_like_number( $_ ) || int( $_ ) != $_ ){
      print "Please enter a valid integer, mkay!\n";
    }
    when( $_ < 1 || $_ > 100 ){
      print "Your guess is out of bounds, please try again!\n";
    }
    when( $_ == $magical_number ){
      print "CORRECT! Good guess!\n";
      last;
    } 
    when ( $_ > $magical_number ){
      print "Too high\n";
    }
    when ( $_ < $magical_number ){
      print "Too low\n";
    } 
    when ( 1 ){
      warn "Something odd happened, exiting with an error code.\n";
      exit 1
    }
  }
}
