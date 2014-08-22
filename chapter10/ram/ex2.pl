#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use Getopt::Long;

my $verbose;
GetOptions("verbose" => \$verbose)
or die("Error in command line arguments\n");
printf "\$verbose: %s\n", $verbose // 'undef';

my $secret_number = int(1 + rand 100);
say "DEBUG: Generated secret number is $secret_number" if $verbose;

while(1) {
  say "Please enter your guess (1-100):";
  chomp(my $guess = <STDIN>);

  if (!defined $guess || $guess =~ /^(|exit|quit)$/i) {
    # User requested to terminate program early
    last;
  }
  elsif ($guess !~ /^[0-9]{1,3}$/ || $guess == 0 || $guess > 100) {
    # Invalid data entered, give the user a more thorough prompt
    say "You must enter a whole number between 1 and 100. Enter a blank line, 'exit' or 'quit' to terminate the program.";

    # Not strictly required as all further processing is via elsifs but cleaner
    next;
  }
  elsif ($guess == $secret_number) {
    # Woohoo, they guessed correctly
    say "Congratulations, that is correct!";
    last;
  }
  elsif ($guess < $secret_number) {
    # The guess was less than the secret number
    say "Too low";

    # Not strictly required
    next;
  }
  elsif ($guess > $secret_number) {
    # The guess was more than the secret number
    say "Too high";

    # Not strictly required
    next;
  }

}

say "Bye...."; 

