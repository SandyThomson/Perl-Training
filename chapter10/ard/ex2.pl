#!/usr/bin/perl -w
use strict;
use 5.010;

use Scalar::Util qw( looks_like_number );
use Getopt::Std;

our $opt_d = 0;  # debug flag
getopts( 'd' );

my $secret = int( 1 + rand 100 );
say "I'm thinking of a number between 1 and 100. Can you guess it?";
say "  (it's $secret)" if $opt_d;

# our comparison later on will return -1, 0, or 1 - we can use that to pull the
# value from the corresponding array index here to get the user feedback - neat, huh?
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
    $result = $guess <=> $secret;
    say $responses[$result];
    if ( $opt_d ) {
      ( $result )
        ? say "  (your guess was $guess but the secret is still $secret)"
        : say "  (we're done here - we have a winner)";
    }
    # drop out of the loop if we got a match
    last if ( $result == 0 );
  }
  elsif ( ! $guess || $guess =~ /^(quit|exit)$/i ) {
    say "  (we're done here - you're either ignoring me or chose to quit)" if $opt_d;
    say "Goodbye!";
    last;
  }
  else {
    say "  (you entered '$guess' but we want a number or /(|quit|exit)/i)" if $opt_d;
    say "That didn't look like valid input - try again.";
  }
}
