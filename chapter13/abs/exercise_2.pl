#!/usr/bin/perl

use warnings;
use strict;

use feature qw( say );

say( "Enter directory path:" );

chomp( my $path = <STDIN> );
if ( $path eq '' ) {
	chdir() or die( "Error changing to home directory: $!" );
} else {
	chdir( $path ) or die( "Error changing to directory '$path': $!" );
}

say( join ( "\n", glob( '.* *' ) ) );

