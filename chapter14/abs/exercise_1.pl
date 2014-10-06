#!/usr/bin/perl

use warnings;
use strict;

use Scalar::Util qw( looks_like_number );
use Table;

if ( scalar( @ARGV ) < 1 ) {
	die( 'Enter list of numeric values' );
}

my $tbl = new Table( 'Sorted Values' );
foreach my $arg ( sort by_numbers @ARGV ) {
	$tbl->add_row( $arg );
}
print( $tbl );

sub by_numbers {
	if ( !looks_like_number( $a ) ) {
		# doing this here as <=> will give us fugly warnings
		die( "Error: non-numeric value: '$a'" );
	}
	return $a <=> $b;
}
