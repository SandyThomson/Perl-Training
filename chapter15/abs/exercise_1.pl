#!/usr/bin/perl

use warnings;
use strict;

use feature qw( say switch );
use Scalar::Util qw( looks_like_number );

# this purely to create some readability
use constant {
	LOW => -1,
	MATCH => 0,
	HIGH => 1,
	EXIT => 2,
	UNKNOWN => 3,
};

# allow the program to exit if the user
# gets a match or attempts to exit
use constant EXIT_PATTERN => '[' . MATCH . ',' . EXIT . ']';

# potential feedback for user
my %responses = (
	&LOW => 'Too Low!',
	&MATCH => 'Boom, you got it!',
	&HIGH => 'Too High!',
	&EXIT => 'See ya!',
	&UNKNOWN => "Unknown Attempt! Remember you're guessing a number\n" . 
		"\tor type 'quit', 'exit' or empty string to quit. Keep trying..."
);
# potential exit values
my %exit = map { $_, undef } ( 'quit', 'exit', '' );

say( "Guess the secret number which is between 1 and 100..." );
my $rand = int( 1 + rand( 100 ) );

while( chomp( my $guess = <> ) ) {
	my $response;
	given( $guess ) {
		when( looks_like_number( $guess ) ) {
			$response = $guess <=> $rand;
		} when ( $guess ~~ %exit ) {
			$response = EXIT;
		} default {
			$response = UNKNOWN;
		}
	}
	
	say( $responses{$response} );
	$response =~ EXIT_PATTERN ? last : next;
}
