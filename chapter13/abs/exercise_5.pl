#!/usr/bin/perl

use warnings;
use strict;

if ( scalar( @ARGV ) != 2 ) {
	die( "usage: $0: source target" );
} 
rename( $ARGV[0], $ARGV[1] ) or die( "$0: rename $ARGV[0] to $ARGV[1] :$!" );