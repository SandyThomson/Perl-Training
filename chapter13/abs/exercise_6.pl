#!/usr/bin/perl

use warnings;
use strict;

if ( scalar( @ARGV ) < 1 ) {
	die( "usage: $0: source_file [target_file]" );
}

link( $ARGV[0], defined $ARGV[1] ? $ARGV[1] : $ARGV[0] ) or die( "$0: $ARGV[0]: $!" );
