#!/usr/bin/perl

use strict;
use warnings;
use v5.10.1;

# Calculate divisors if supplied with a number

given ( $ARGV[0] ) {
  # Check the input
  when ( undef ) { print "Specify a number\n" }
  when ( /\D/ )  { print "Some non-digit characters were present\n" }

  # It's a number, do the divisor thing
  default {
    my @divisors = divisors( $ARGV[0] );
    
    # Check the number of divisors and report
    given ( scalar @divisors ) {
      when ( 0 ) { print "$ARGV[0] is prime\n" }
      when ( 1 ) { print "The divisor of $ARGV[0] is: @divisors\n"}
      default { print "The divisors of $ARGV[0] are: @divisors\n"}
    }
  }
}

sub divisors {
  # slightly modified
  my ( $number ) = @_;
  my @divisors;

  foreach my $divisor ( 2 .. ( $number / 2 ) ) {
    if ( !($number % $divisor) ) {
      push ( @divisors, $divisor );
    }
  }
  return @divisors;
}

