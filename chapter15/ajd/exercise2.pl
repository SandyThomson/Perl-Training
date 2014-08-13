#!/usr/bin/perl

use strict;
use warnings;

use 5.010001;

# Implement FizzBuzz, except with Bin instead of Buzz
# and Sausage instead of 7.
# Weird.

print "Type numbers:\n";

while ( my $number = <> ) {
  chomp ( $number );
  print ( ( fizz_bin_sausage( $number ) || $number ) , "\n" ) ;
}

sub fizz_bin_sausage {

  my ( $number ) = @_;
  my @return; # For stashing the return values

  given ( $number ) {
    when ( '' ) {
      break; # explicit, to catch empty lines
    }
    when ( /\D/ ) {
      break; # explicit, to catch non numbers
    }
    when ( $number % 3 == 0 ) {
      push ( @return, 'Fizz' );
      continue;
    }
    when ( $number % 5 == 0 ) {
      push ( @return, 'Bin' );
      continue;
    }
    when ( $number % 7 == 0 ) {
      push ( @return, 'Sausage' );
      continue;
    }
    default {
      # nothing
    }
  }
  # Return a string
  return join ( ' ', @return );
}
