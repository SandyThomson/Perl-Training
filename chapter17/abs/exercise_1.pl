#!/usr/bin/perl

use strict;
use warnings;

use feature qw( say );

my @lines = <>;

say( "Enter Pattern?" );
while( my $pattern = <STDIN> ne '' ) {
	say( "Enter Pattern?" );
	chomp( $pattern );
	chomp( my @matches = eval { grep { $_ =~ $pattern } @lines } );
	if ( $@ ) {
		say( "Bad RegEx: $@" );
	} else {
		my $num_of_matches = @matches;
		say( "Number of matches: $num_of_matches\n-" . join( "\n-", @matches ) );
	}
}