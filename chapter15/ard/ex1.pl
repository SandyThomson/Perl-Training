#!/usr/bin/perl -w
use strict;
use 5.010001;

use Scalar::Util qw( looks_like_number );

my $secret = int( 1 + rand 100 );
my $guesses = 0;
say "I'm thinking of a number between 1 and 100. Can you guess it?";

while ( chomp( my $guess = <> ) ) {
  $guesses++;
  given ( $guess ) {
    when ( /^quit$/i ) { say 'Goodbye'; last }
    when ( ! looks_like_number( $_ ) ) { say "That didn't look like valid input - try again, or 'quit' to finish." }
    when ( $_ < $secret ) { say 'Too low' }
    when ( $_ > $secret ) { say 'Too high' }
    when ( $_ == $secret ) { say "You got it in $guesses guesses"; last }
  }
}
