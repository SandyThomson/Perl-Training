#!/usr/bin/perl

use strict;
use warnings;
use v5.10.1;

# Calculate divisors if supplied with a number, with DVD extras

my ( $number ) = @ARGV;

given ( $number ) {
  # Check the input
  when ( undef ) { print "Specify a number\n" }
  when ( /\D/ )  { print "Some non-digit characters were present\n" }

  # It's a number, do the divisor thing
  default {
    my @divisors = divisors( $number );

    # Favourite number part
    print "What's your favourite number?: ";
    my $favourite = <STDIN>;
    given ( $favourite ) {
      when ( /\D/ ) { break } # ignoring you
      when ( @divisors ) { print "$number is divisible by your favourite number\n" }
      default { "$number doesn't divide by that\n" }
    }

    # odd or even
    given ( $number % 2 ) {
      when ( 1 ) { print "$number is odd\n" } 
      default { print "$number is even\n" }
    }
    
    # Check the number of divisors and report
    given ( scalar @divisors ) {
      when ( 0 ) { print "$number is prime\n" }
      when ( 1 ) { print "The divisor of $number is: @divisors\n"}
      default { print "The divisors of $number are: @divisors\n"}
    }

  }
  # ugh, bored of switches now
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

