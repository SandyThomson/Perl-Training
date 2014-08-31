#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use Getopt::Std;

use constant {
        MIN   => 1,
        MAX   => 100
};

our($opt_d);

getopts('d');

my $debug = $opt_d // 0;

# choose the random number
my $random_number = generate_random_number(MIN, MAX);

my $guess;
my $attempts = 0;

printf "I've 'thought' of a random number between %s and %s, can you guess it?\n", MIN, MAX;

if ( $debug ) {
	say "DEBUG: The number is $random_number.";
}

do {
	$attempts++;
	print "Please enter your number for guess $attempts: ";
    $guess = <STDIN>;
    if ( defined $guess && $guess =~ /^\d+$/ ) {
    	if ( $guess < MIN || $guess > MAX ) {
        	printf "Guess should be between %s and %s.\n", MIN, MAX;
        } elsif ( $guess < $random_number ) {
            say "Incorrect, try higher.";
        } elsif ($guess > $random_number) {
            say "Incorrect, try lower.";
        }
    } else {
    	say "Guess is not a number"
    }
} while ($guess !~ /^\d+$/ || $guess != $random_number);

say "Well done, the magic number was $random_number. You managed in $attempts guesses.";

# generate the random number
sub generate_random_number {
	my ($min, $max) = @_;
    my $result = int( rand( $max - $min + 1 ) ) + $min;
}