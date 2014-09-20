#!/usr/bin/perl

use warnings;
use strict;

use feature qw( say );

say( "Enter directory path:" );

chomp( my $path = <STDIN> );

if ( $path eq '' ) {
	$path = defined $ENV{HOME} ? $ENV{HOME} : '/';
}

opendir( DIR, $path ) or die( "Error changing to directory '$path': $!" );

say( join ( "\n", readdir( DIR ) ) );

closedir( DIR );
