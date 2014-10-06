#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

my $secret_number = int(1 + rand 100);
while(1) {
  say "Please enter your guess (1-100):";
  chomp(my $guess = <STDIN>);

  given( $guess ) {
    when( /^(|exit|quit)$/i ) { 
      last;
    }
    when( $_ !~ /^[0-9]{1,3}$/ || $_ == 0 || $_ > 100 ) {
      say "You must enter a whole number between 1 and 100. Enter a blank line, 'exit' or 'quit' to terminate the program.";
    }
    when ( $secret_number ) {
      # Woohoo, they guessed correctly
      say "Congratulations, that is correct!";
      last;
    }
    when ( $_ < $secret_number ) {
      # The guess was less than the secret number
      say "Too low";
    }
    when ( $_ > $secret_number ) {
      # The guess was more than the secret number
      say "Too high";
    }
  }
}

say "Bye...."; 

