#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;

use feature qw( say );

say( "Enter Input(CTRL-D when finish)?" ) if ( scalar( @ARGV ) == 0 );
my @lines = <>;

say( "Enter Pattern?" );
chomp( my $pattern = <STDIN> );

while( $pattern ne '' ) {
	my @matches = ();
	try {
		chomp( @matches = grep { $_ =~ $pattern } @lines );
	} catch {
		say( "Bad RegEx: $_" );
	} finally {
		if ( scalar( @matches ) == 0 ) {
			say( 'No Matches' );
		} else {
			my $num_of_matches = @matches;
			say( "Number of matches: $num_of_matches\n-" . join( "\n-", @matches ) );
		}
	};

	say( "Enter Pattern?" );
	chomp( $pattern = <STDIN> );
}
