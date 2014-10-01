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
  default {
    say determine_prime( $_ );
  }
}

sub determine_prime {
  my $num = shift;
  my @matches = ();

  for ( 2..( $num - 1 ) ) {
    when( $num % 2 ~~ 0 ) { }
    when( $num % $_ ~~ 0 ) { unshift @matches, $_; }
  }

  given( scalar @matches ) { 
    when ( 0 ) { return "The number is prime"; }
    default    { return "The number is divisible by " . join( ', ', @matches ); }
  }
}


