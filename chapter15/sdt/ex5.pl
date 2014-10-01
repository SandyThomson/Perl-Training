#!/usr/bin/perl

use strict;
use warnings;
no warnings 'experimental::smartmatch';

use Scalar::Util qw( looks_like_number );
use 5.018;
use feature 'say';

my $favorite_number = 13;

say "Type a number";

# How the fuck do you only do this just using smart matching?

given( <STDIN> ){
  chomp $_;
    
  when( !looks_like_number( $_ ) || int( $_ ) != $_ ){
    say "Please enter a valid integer, mkay!";
  }

  my @divisors = divisors( $_ );

  when( $_ % 2 == 0 ){
    say "Even!"; continue;
  }
  when( $_ % 2 != 0 ){
    say "Odd!"; continue;
  }
  when( @divisors == 0 ){
    say "$_ is prime";
  }
  when( $favorite_number ~~ @divisors ){
    say "Divisable by favorite number";
  }
  when( 1 == 1 ) {
    say "$_ is divisable by @divisors";
  }
}

sub divisors {
  my $number = shift;
  my @divisors = ();
  foreach my $divisor ( 2 .. ( $number/2 ) ) {
    push @divisors, $divisor unless $number % $divisor;
  }
  return @divisors;
}

