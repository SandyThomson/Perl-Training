#!/usr/bin/perl

use strict;
use warnings;
use 5.014;
use Scalar::Util qw( looks_like_number );

my $input_value = $ARGV[0] // undef;

given( $input_value ) {
  when( !looks_like_number( $_ ) ) { 
    say "Input value is not a valid number";
  }
  when( $_ <= 1 ) {
    say "Input value is not a positive number greater than 1";
  }
  when( $_ % 2 ~~ 0 ) {
    say "The number $input_value is even";
    continue;
  }
  when( $_ % 2 ~~ 1 ) {
    say "The number $input_value is odd";
    continue;
  }
  default {
    say determine_prime( $_ );
  }
}

sub determine_prime {
  my $num = shift;
  my @matches = divisors( $num );
  my $retval = "";

  given ( scalar @matches ) {
    when( 0 ) { $retval = "The number $num is prime"; }
    default { $retval = "The number $num is divisible by " . join( ", ", @matches ); }
  }

  return $retval;
}

sub divisors {
  my $number = shift;

  my @divisors = ();
  foreach my $divisor ( 2 .. ( $number/2 ) ) {
    push @divisors, $divisor unless $number % $divisor;
  }

  return @divisors;
}

