#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);
use 5.014;

use constant {
        MIN   => 1,
        MAX   => 100
};

# choose the random number
my $random_number = generate_random_number(MIN, MAX);

my $guess;
my $attempts = 0;

printf "I've 'thought' of a random number between %s and %s, can you guess it?\n", MIN, MAX;

do {
	$attempts++;
	print "Guess $attempts: ";
	chomp( $guess = <STDIN> );
	given($guess) {
		when( !looks_like_number($_) ) { say "Guess is not a number"; continue; }
		when( $_ < MIN || $_ > MAX ) { printf "Guess should be between %s and %s.\n", MIN, MAX; continue; };
		when( $_ < $random_number ) { say "Incorrect, try higher."; continue; }
		when( $_ > $random_number ) { say "Incorrect, try lower."; continue; }
	}
} until ( looks_like_number($guess) && $guess == $random_number );

say "Well done, the magic number was $random_number. You managed in $attempts guesses.";

# generate the random number
sub generate_random_number {
	my ($min, $max) = @_;
    my $result = int( rand( $max - $min + 1 ) ) + $min;
}