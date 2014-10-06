#!/usr/bin/perl

use strict;
use warnings;
use 5.014;
use Scalar::Util qw( looks_like_number );

my $input_value = $ARGV[0] // undef;

given( $input_value ) {
  when( !looks_like_number( $_ ) ) { say "Input value is not a valid number"; }
  when( $_ % 3 == 0 ) {
    say "Fizz";
    continue;
  }
  when( $_ % 5 == 0 ) {
    say "Bin";
    continue;
  }
  when( $_ % 7 == 0 ) {
    say "Sausage";
  }
}

my $lowest = 0;
my $matches = 0;
while ( $matches != 3 ) {
  $lowest++;
  $matches = 0;

  given ( $lowest ) {
    when( $_ % 3 == 0 ) {
      $matches++;
      continue;
    }
    when( $_ % 5 == 0 ) {
      $matches++;
      continue;
    }
    when( $_ % 7 == 0 ) {
      $matches++;
    }
  }
}

say "Did you know that the lowest number that is divisible by 3, 5, and 7 is $lowest?";

