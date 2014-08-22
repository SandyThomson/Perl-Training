#!/usr/bin/perl -w
use strict;
use 5.010;

use Scalar::Util qw( looks_like_number );

my $secret = int( 1 + rand 100 );
say "I'm thinking of a number between 1 and 100. Can you guess it?";

my @responses = (
  'You got it!',
  'Too high',
  'Too low'
);

while ( my $guess = <> ) {
  chomp $guess;
  my $result;
  if ( looks_like_number( $guess ) ) {
    # This operator will return -1 if $guess is less, 0 if it matches, or 1 if it's greater.
    # We use this return value as the index of the array above to get the right feedback - neat, huh?
    $result = $guess <=> $secret;
    say $responses[$result];
    # drop out of the loop if we got a match
    last if ( $result == 0 );
  }
  elsif ( ! $guess || $guess =~ /^(quit|exit)$/i ) {
    say "Goodbye!";
    last;
  }
  else {
    say "That didn't look like valid input - try again.";
  }
}

