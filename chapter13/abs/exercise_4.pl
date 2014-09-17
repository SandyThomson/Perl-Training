#!/usr/bin/perl

use warnings;
use strict;

use feature qw( say );

use Getopt::Std;
getopts( "d", my $opt = {} ) or die( "usage: $0 [-d] file ..." );

foreach my $arg ( @ARGV ) {
	if ( !-e $arg ) {
		say( "$0: $arg: No such file or directory" );
	} elsif ( -f _ ) {
		unlink( $arg ) or say( "failed to rm $arg" );
	} elsif ( -d _ ) {
		if ( !$opt->{d} ) {
			say( "$0: $arg: is a directory" );
			next;
		}
		my @glob = glob "$arg/*";
		if ( scalar( @glob ) != 0 ) {
			say( "$0: $arg: Directory not empty" );
			next;
		}
		rmdir( $arg ) or say( "failed to rm $arg" );
	}
}