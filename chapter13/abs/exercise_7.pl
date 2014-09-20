#!/usr/bin/perl

use warnings;
use strict;

use Getopt::Std;
getopts( "s", my $opt = {} ) or die( "usage: $0: source_file [target_file]" );

if ( scalar( @ARGV ) < 1 ) {
	die( "usage: $0: source_file [target_file]" );
}

if ( $opt->{'s'} ) {
	symlink( $ARGV[0], defined $ARGV[1] ? $ARGV[1] : $ARGV[0] ) 
		or die( "$0: $ARGV[0]: $!" );
} else {
	link( $ARGV[0], defined $ARGV[1] ? $ARGV[1] : $ARGV[0] ) 
		or die( "$0: $ARGV[0]: $!" );
}